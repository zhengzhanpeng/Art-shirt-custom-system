package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.AddGoodsDTO;
import com.zzp.YiYang.DTO.GetGoodsDTO;
import com.zzp.YiYang.DTO.GoodsDTO;
import com.zzp.YiYang.Dao.GoodsDao;
import com.zzp.YiYang.mapper.ClothesMapper;
import com.zzp.YiYang.mapper.GoodsMapper;
import com.zzp.YiYang.mapper.RecommendClothesMapper;
import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Goods;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author ho
 * @create 2017-10-18 15:12
 */
public class GoodsDaoImpl implements GoodsDao {
    private GoodsMapper goodsMapper;
    private ClothesMapper clothesMapper;
    private RecommendClothesMapper recommendClothesMapper;
    private Map<String, Integer> sizeMessage;
    private Map<String, String> returnMessage;
    private final String[] strs = {"S", "M", "L", "XL", "XXL", "XXXL"}; //衣服的尺码
    private ExecutorService executorService;

    @Resource
    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    @Resource
    public void setSizeMessage(Map<String, Integer> sizeMessage) {
        this.sizeMessage = sizeMessage;
    }

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    @Resource
    public void setRecommendClothesMapper(RecommendClothesMapper recommendClothesMapper) {
        this.recommendClothesMapper = recommendClothesMapper;
    }

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Resource
    public void setClothesMapper(ClothesMapper clothesMapper) {
        this.clothesMapper = clothesMapper;
    }

    @Override
    public String saveGoods(AddGoodsDTO addGoodsDTO) {
        Clothes clothes = new Clothes(addGoodsDTO.getName(), addGoodsDTO.getType(), addGoodsDTO.getPrice(),
                addGoodsDTO.getRealityPrice(), addGoodsDTO.getImgAddress(), addGoodsDTO.getDesc1(), addGoodsDTO.isFinished());
        clothes.setId(addGoodsDTO.getId());
        clothes.setBackImgAddress(addGoodsDTO.getBackImgAddress());
        clothesMapper.update(clothes);
        if (strs.length != addGoodsDTO.getSizeNumber().length) {
            return MessageUtil.SIZE_NUMBER_ERROR;
        }
        GoodsDTO g;
        Goods goods;
        int i = -1;  //strs[i]与 sizeNumber[i]向对应
        int result = 0;
        for (int x : addGoodsDTO.getSizeNumber()) {
            i++;
            if (x == 0) {
                continue;
            }
            g = new GoodsDTO();
            g.setAddNumber(x);
            for(int j = 0; j < 5; j++) {  //共循环尝试更新五次
                goods = goodsMapper.getGoodsIdAndNumber(addGoodsDTO.getId(), strs[i]);
                g.setId(goods.getId());
                g.setNumber(goods.getNumber());
                result = goodsMapper.updateById(g);
                if (result != 0) {
                    break;
                }
            }
            if (result == 0) {
                throw new RuntimeException();
            }
        }
        boolean exist = recommendClothesMapper.isExist(addGoodsDTO.getId()) == null ? false : true;
        if (exist != addGoodsDTO.isReco()) {  //判断reco是否应当添加或删除。若应该，存在则删除，不存在则添加
            if (addGoodsDTO.isReco()) {
                recommendClothesMapper.add(addGoodsDTO.getId());
            } else {
                recommendClothesMapper.delete(addGoodsDTO.getId());
            }
        }
        return "1";
    }

    @Override
    public String deleteClothes(int clothesId) {
        if (clothesId == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        int result = clothesMapper.delete(clothesId);
        if (result == 0) {
            return MessageUtil.CLOTHES_NOT_EXIST;
        }
        executorService.execute(() -> {  //删除图片所在路径的文件;
            Clothes clothes = clothesMapper.getImgAddress(clothesId);
            String imgAddress = clothes.getImgAddress();
            String backImgAddress = clothes.getBackImgAddress();
            String root = returnMessage.get("ROOT");
            String clothesDir = returnMessage.get("CLOTHES_DIR");
            String file = returnMessage.get("FILE");
            if (imgAddress == null || backImgAddress == null || root == null || clothesDir == null || file == null) {
                return;
            }
            String fileAddress =  root + clothesDir + imgAddress + file;
            String backFileAddress = root + clothesDir + backImgAddress + file;
            File file1 = new File(fileAddress);
            file1.delete();
            file1 = new File(backFileAddress);
            file1.delete();
        });
        return "1";
    }

    @Override
    public List<Integer> getSizeList() {
        List<Integer> list = new ArrayList<>();
        list.add(sizeMessage.get("S"));
        list.add(sizeMessage.get("M"));
        list.add(sizeMessage.get("L"));
        list.add(sizeMessage.get("XL"));
        list.add(sizeMessage.get("XXL"));
        list.add(sizeMessage.get("XXXL"));
        return list;
    }

    @Override
    public String getGoods() {
        List<GetGoodsDTO> list = goodsMapper.get();
        list.forEach(e -> {
            boolean b;
            e.setRecoStr(e.isReco() ? "是" : "否");
            e.setFinishedStr(e.isFinished() ? "是" : "否");
            for (Goods g : e.getGoods()) {  //检验商品是否存在缺货，若有一项存在缺货则修改为缺货状态
                if (g.getNumber() <= sizeMessage.get(g.getSize())) { //通过spring-bean.xml配置的对应尺码的最低数量进行校验
                    e.setState("缺货");
                    break;
                }
            }
            if (e.getState() == null) {
                e.setState("正常");
            }
        });
        String str = MainUtil.getJsonToTable(list);
        return str;
    }

    @Override
    public String addGoods(AddGoodsDTO addGoodsDTO) {
       Clothes clothes = new Clothes(addGoodsDTO.getName(), addGoodsDTO.getType(), addGoodsDTO.getPrice(),
                addGoodsDTO.getRealityPrice(), addGoodsDTO.getImgAddress(), addGoodsDTO.getDesc1(), addGoodsDTO.isFinished());
        clothes.setBackImgAddress(addGoodsDTO.getBackImgAddress());
        clothesMapper.add(clothes);
        int id = clothes.getId();
        if (addGoodsDTO.isReco()) {
            recommendClothesMapper.add(id);
        }
        if (strs.length != addGoodsDTO.getSizeNumber().length) {
            return MessageUtil.SIZE_NUMBER_ERROR;
        }
        int i = 0;
        Goods goods = new Goods();
        goods.setClothesId(id);
        for (int x : addGoodsDTO.getSizeNumber()) {
            goods.setNumber(x);
            goods.setSize(strs[i]);
            i++;
            goodsMapper.add(goods);
        }
        return "1";
    }
}
