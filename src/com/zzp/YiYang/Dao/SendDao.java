package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.ExpressMessage;

/**
 * @author ho
 * @create 2017-12-08 8:59
 */
public interface SendDao {
    String getOrders();

    String addExpressMessage(ExpressMessage expressMessage);

    String getOrderMessage();

}
