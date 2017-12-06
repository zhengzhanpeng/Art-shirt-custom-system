package com.zzp.YiYang.util;

import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.pojo.Order;

import javax.annotation.Resource;
import java.util.concurrent.DelayQueue;

/**
 * 通过DelayQueue实现延迟取消订单任务
 *
 * @author ho
 * @create 2017-12-05 17:52
 */
public class CloseOrderThread extends Thread {
    private DelayQueue<CloseOrderDelayed> queue = new DelayQueue<CloseOrderDelayed>();
    private OrderMapper orderMapper;
    private volatile boolean run = true;

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public void run() {
        super.run();
        while (run) {
            try {
                CloseOrderDelayed c = queue.take();
                int state = orderMapper.getState(c.getOrderId());
                if(state != 1) continue;
                Order order = new Order();
                order.setState(-1);
                order.setId(c.getOrderId());
                orderMapper.set(order);
                System.out.println("-------------close order " + order.getId());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean offer(CloseOrderDelayed c) {
        return queue.offer(c);
    }

    public void toStart() {
        if (!this.isAlive()) {
            synchronized (this) {
                if (!this.isAlive()) {
                    System.out.println("---------closeOrderThread-----start----");
                    this.start();
                }
            }
        }
    }

    public void toDestroy() {
        System.out.println("---------closeOrderThread-----destroy----");
    }
}
