package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.BuyAtOnceDTO;
import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Icon;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-27 16:50
 */
public interface ClothesDao {
    /**
     * 商品页面返回所有衣服款式
     * @return
     */
    List<Clothes> getClothes();
    List<Icon> getCollect(int page, int num);
    int getCollectNum();
    List<Clothes> getRecommendClothes();

    /**
     * 自定义的商品添加购物车方式。方法
     * @param cartDTO
     * @param file
     * @return
     */
    String addNewToCart(CartDTO cartDTO, CommonsMultipartFile file);

    /**
     * 1.先上传图片返回图片地址
     * 2.找出goodsID 判断商品数量，正常则进行第三步
     * 3.生成order订单并返回order的ID,生成boughtItem项目
     * 4.开启计时器，三十分钟后判断订单状态，若还为0则修改为-1；
     * @param file
     * @param buyAtOnceDTO
     * @return 返回生成订单的ID；
     */
    String createOrderAndUploadImg(CommonsMultipartFile file, BuyAtOnceDTO buyAtOnceDTO);
}
