package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.MyOrderDTO;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-01 15:34
 */
public interface MyOrderDao {
    List<MyOrderDTO> getMyOrders();
}
