package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.CartShowDTO;
import com.zzp.YiYang.DTO.GetCartDTO;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-28 21:07
 */
public interface CartDao {
    List<CartShowDTO> getCartShow();

    /**
     * 1.找出goodsId并判断商品数量
     * 2.生成order订单并返回order的ID,生成多个boughtItem项目
     * 3.开启计时器，三十分钟后判断订单状态，若还为0则修改为-1；
     * @param cartIdList 购物车ID
     * @return 返回生成订单的ID；
     */
    String createOrder(List<GetCartDTO> cartIdList);

    String deleteCart(int id);
}
