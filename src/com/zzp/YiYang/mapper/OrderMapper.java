package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.pojo.Order;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-01 16:22
 */
public interface OrderMapper {
    OrderDTO getOrderDTO(int orderId);

    int set(Order order);

    List<Order> getOrder(String userName);
}
