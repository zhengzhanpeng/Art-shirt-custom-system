package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.GetGoodsDTO;
import com.zzp.YiYang.DTO.GoodsDTO;
import com.zzp.YiYang.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-03 14:53
 */
public interface GoodsMapper {
    Goods getGoodsIdAndNumber(@Param("clothesId") int clothesId, @Param("size") String size );

    int add(Goods goods);

    List<GetGoodsDTO> get();

    int updateById(GoodsDTO goodsDTO);
}
