package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.AddGoodsDTO;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-18 15:04
 */
public interface GoodsDao {
    /**
     * 添加clothes与对应的goods信息。
     *
     * @param addGoodsDTO
     * @return
     */
    String addGoods(AddGoodsDTO addGoodsDTO);

    String getGoods();

    String saveGoods(AddGoodsDTO addGoodsDTO);

    List getSizeList();

    String deleteClothes(int clothesId);
}
