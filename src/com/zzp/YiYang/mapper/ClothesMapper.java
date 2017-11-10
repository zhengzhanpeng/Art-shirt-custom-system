package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.ClothesDTO;
import com.zzp.YiYang.pojo.Clothes;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-18 15:21
 */
public interface ClothesMapper {
    int add(Clothes clothes);

    int update(Clothes clothes);

    int get(int id);

    int delete(int clothesId);

    List<ClothesDTO> getRecoClothes();
}
