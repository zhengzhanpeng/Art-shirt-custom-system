package com.zzp.YiYang.listener;

import com.zzp.YiYang.util.CloseOrderThread;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import javax.annotation.Resource;

/**
 * spring启动完成后的监听器
 *
 * @author ho
 * @create 2017-12-05 17:48
 */
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {
    private CloseOrderThread closeOrderThread;

    @Resource
    public void setCloseOrderThread(CloseOrderThread closeOrderThread) {
        this.closeOrderThread = closeOrderThread;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        if (contextRefreshedEvent.getApplicationContext().getParent() == null) {
            init();
        }
    }

    private void init() {
//        closeOrderThread.start();
    }
}
