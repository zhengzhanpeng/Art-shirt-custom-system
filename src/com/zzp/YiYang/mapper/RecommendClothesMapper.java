package com.zzp.YiYang.mapper;

/**
 * @author ho
 * @create 2017-10-18 15:37
 */
public interface RecommendClothesMapper {
    int add(int clothesId);

    Integer isExist(int clothesId);

    int delete(int clothesId);
}
