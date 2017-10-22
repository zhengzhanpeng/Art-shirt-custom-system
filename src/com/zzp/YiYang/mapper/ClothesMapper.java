package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Clothes;

/**
 * @author ho
 * @create 2017-10-18 15:21
 */
public interface ClothesMapper {
    int add(Clothes clothes);

    int update(Clothes clothes);

    int get(int id);

    int delete(int clothesId);
}
