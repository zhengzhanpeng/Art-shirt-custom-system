package com.zzp.YiYang.util;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

/**
 * 通过DelayQueue定时关闭新订单的集成了Delayed的类
 *
 * @author ho
 * @create 2017-12-05 16:56
 */
public class CloseOrderDelayed implements Delayed {
    private int orderId;
    private long executeTime;

    public CloseOrderDelayed(int orderId, long delayTime) {
        this.orderId = orderId;
        this.executeTime = TimeUnit.NANOSECONDS.convert(delayTime, TimeUnit.MILLISECONDS) + System.nanoTime();;
    }

    public int getOrderId() {
        return orderId;
    }

    @Override
    public long getDelay(TimeUnit unit) {
        return unit.convert(this.executeTime - System.nanoTime(), TimeUnit.NANOSECONDS);
    }

    @Override
    public int compareTo(Delayed o) {
        if (o == this) // compare zero ONLY if same object
            return 0;
        if (o instanceof CloseOrderDelayed) {
            CloseOrderDelayed x = (CloseOrderDelayed) o;
            long diff = executeTime - x.executeTime;
            if (diff < 0)
                return -1;
            else if (diff > 0)
                return 1;
            else
                return 1;
        }
        long d = (getDelay(TimeUnit.NANOSECONDS) - o.getDelay(TimeUnit.NANOSECONDS));
        return (d == 0) ? 0 : ((d < 0) ? -1 : 1);
    }
}
