package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Icon;

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
}
