package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.OrderLog;

import java.util.List;

/**
 * @author ho
 * @create 2017-12-09 10:09
 */
public interface OrderLogMapper {
    int insert(OrderLog orderLog);
    List<OrderLog> gets();
}
