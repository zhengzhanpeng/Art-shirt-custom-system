package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.Dao.OperationDao;
import com.zzp.YiYang.mapper.CarMapper;
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
import java.util.Date;
import java.util.Map;

/**
 * @author ho
 * @create 2017-10-03 14:48
 */
@Service
public class OperationDaoImpl implements OperationDao {
    private GoodsMapper goodsMapper;
    private CarMapper carMapper;
    private Map<String, String> returnMessage;
    private IconMapper iconMapper;
    private CollectMapper collectMapper;
    private Map<String, Integer> indexPro;

    @Resource
    public void setIndexPro(Map<String, Integer> indexPro) {
        this.indexPro = indexPro;
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
    public void setCarMapper(CarMapper carMapper) {
        this.carMapper = carMapper;
    }

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    @Transactional
    public String addToCart(CartDTO cartDTO) {
        Goods goods = goodsMapper.getGoodsIdAndNumber(cartDTO.getClothesId(), cartDTO.getSize());
        Cart cart = new Cart();
        cart.setUserName(SecurityUtil.getUserName());
        cart.setGoodsId(goods.getId());
        cart.setImgAddress(cartDTO.getImgAddress());
        cart.setNumber(cartDTO.getNumber());
        int result = carMapper.insert(cart);
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

    public String getDir(String name) {
        String result = null;
        if (name.equals("user")) {
            result = returnMessage.get("USER_CLOTHES_DIR") + SecurityUtil.getUserName() + "/";
        } else if (name.equals("icon")) {
            result = returnMessage.get("ICON_DIR");
        } else if (name.equals("index_clothes")) {
            result = returnMessage.get("CLOTHES_INDEX_DIR");
        } else if (name.equals("finished_clothes")) {
            result = returnMessage.get("CLOTHES_FINISHED_DIR");
        }
        return result;
    }

    @Override
    @Transactional
    public String AddToCollect(int iconId) {
        Collect collect = new Collect();
        collect.setUserName(SecurityUtil.getUserName());
        collect.setIconId(iconId);
        int result = collectMapper.insert(collect);
        int infoId = iconMapper.getInfoId(iconId, indexPro.get("iconCollect"));
        if (infoId == 0) {
            synchronized (iconMapper) {
                infoId = iconMapper.getInfoId(iconId, indexPro.get("iconCollect"));
                if (infoId == 0) {
                    iconMapper.insertCollectNumber(iconId, indexPro.get("iconCollect"));
                }
            }
        }
        int upResult = 0;
        int value;
        while (upResult == 0) {
            value = iconMapper.getCollectNumber(iconId);
            upResult = iconMapper.addCollectNumber(iconId, value);
        }
        return "1";
    }
}
