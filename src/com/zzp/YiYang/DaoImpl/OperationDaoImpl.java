package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.Dao.OperationDao;
import com.zzp.YiYang.mapper.CartMapper;
import com.zzp.YiYang.mapper.CollectMapper;
import com.zzp.YiYang.mapper.GoodsMapper;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.pojo.Cart;
import com.zzp.YiYang.pojo.Collect;
import com.zzp.YiYang.pojo.Goods;
import com.zzp.YiYang.util.MessageUtil;
import com.zzp.YiYang.util.SecurityUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/**
 * @author ho
 * @create 2017-10-03 14:48
 */
@Service
public class OperationDaoImpl implements OperationDao {
    private GoodsMapper goodsMapper;
    private CartMapper cartMapper;
    private Map<String, String> returnMessage;
    private IconMapper iconMapper;
    private CollectMapper collectMapper;
    private ExecutorService executorService;

    @Resource
    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    @Resource
    public void setCollectMapper(CollectMapper collectMapper) {
        this.collectMapper = collectMapper;
    }

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    @Resource
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    @Transactional
    public String addToCart(CartDTO cartDTO) {
        String size = cartDTO.getSize();
        byte[] bs = size.getBytes();  //将utf-8的字符编码转为iso-8859-1
        size = new String(bs);
        System.out.println(size);
        Goods goods = goodsMapper.getGoodsIdAndNumber(cartDTO.getClothesId(), size);
        Cart cart = new Cart();
        cart.setUserName(SecurityUtil.getUserName());
        cart.setGoodsId(goods.getId());
        cart.setImgAddress(cartDTO.getImgAddress());
        cart.setBackImgAddress(cartDTO.getBackImgAddress());
        cart.setNumber(cartDTO.getNumber());
        int result = cartMapper.insert(cart);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        return "1";
    }

    @Override
    public String uploadImg(CommonsMultipartFile file, String name) {
        String userDir = getDir(name);
        String root = returnMessage.get("ROOT");
        String imgName = new Date().getTime() + returnMessage.get("FILE");
        File f = new File(root + userDir);
        if (!f.exists()) {
            f.mkdirs();
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(root + userDir + imgName);
            fileOutputStream.write(file.getBytes());
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userDir + imgName;
    }

    /**
     * 通过配置文件读取上传图片的绝对路径
     * @param name
     * @return
     */
    public String getDir(String name) {
        String result = null;
        if (name.equals("user")) {
            result = returnMessage.get("USER_CLOTHES_DIR") + SecurityUtil.getUserName() + "/";
        } else if (name.equals("icon")) {
            result = returnMessage.get("ICON_DIR");
        } else if (name.equals("clothes")) {
            result = returnMessage.get("CLOTHES_DIR");
        }
        return result;
    }

    @Override
    public String AddToCollect(int iconId) {
        Collect collect = new Collect();
        collect.setUserName(SecurityUtil.getUserName());
        collect.setIconId(iconId);
        int result = collectMapper.isExistCollect(collect);
        if (result != 0) {   //若已收藏返回信息
            return MessageUtil.ICON_HAD_COLLECT;
        }
        if (collect.getIconId() == 0) {  //若ID异常 返回信息
            return MessageUtil.SYSTEM_ERROR;
        }
        collectMapper.insert(collect);
        executorService.execute(() -> {   //在新的线程内采用CAS添加图标收藏
            int upResult = 0;
            int value;
            int i = 0;
            while (upResult == 0 || i > 100) {  //增加图标的收藏数量
                value = iconMapper.getCollectNumber(iconId);
                upResult = iconMapper.addCollectNumber(iconId, value);
                i++;
            }
        });
        return "1";
    }
}
