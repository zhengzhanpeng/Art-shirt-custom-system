package com.zzp.YiYang.util;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * 线程调度执行类
 *
 * @author ho
 * @create 2017-11-16 10:50
 */
public class ExecutorUtil {
    private static final int THREAD_NUM = 100;
    public Executor createExecutor() {
        return Executors.newFixedThreadPool(THREAD_NUM);
    }
}
