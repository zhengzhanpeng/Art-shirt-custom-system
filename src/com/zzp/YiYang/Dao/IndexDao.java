package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Icon;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-26 15:23
 */
public interface IndexDao {
    List<Clothes> getRecommendClothes();
    List<Icon> getRecommendIcon();
}
