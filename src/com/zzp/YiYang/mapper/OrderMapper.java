package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.AnOrderDTO;
import com.zzp.YiYang.DTO.MyOrderDTO;
import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.DTO.OrderManageDTO;
import com.zzp.YiYang.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-01 16:22
 */
public interface OrderMapper {
    OrderDTO getOrderDTO(@Param("orderId") int orderId, @Param("userName") String userName);

    int set(Order order);

    List<MyOrderDTO> getOrders(String userName);

    List<OrderManageDTO> getOrdersByMaker();

    List<OrderManageDTO> getOrdersBySender();

    int addOrder(Order order);

    int setRealityPrice(@Param("id") int id, @Param("realityPrice") double realityPrice);

    /**
     * 根据OrderId获取username，用于验证用户身份
     * @param id
     * @return
     */
    String getUserName(int id);

    int getState(int id);

    int setStateFinished(int id);

    Integer getStateByUserName(@Param("id") int id, @Param("userName") String userName);

    AnOrderDTO getAnOrderDTO(int id);

    float getPrice(int id);
}
