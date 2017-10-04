package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;

/**
 * @author ho
 * @create 2017-09-29 20:07
 */
public interface OrderDao {
    OrderDTO getOrder(int orderId);

    String saveOrder(Order order);

    String saveSendAddress(SendAddress sendAddress);
}
