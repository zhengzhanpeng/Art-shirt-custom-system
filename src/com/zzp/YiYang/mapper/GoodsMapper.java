package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Goods;
import org.apache.ibatis.annotations.Param;

/**
 * @author ho
 * @create 2017-10-03 14:53
 */
public interface GoodsMapper {
    Goods getGoodsIdAndNumber(@Param("clothesId") int clothesId, @Param("size") String size );
}
