package com.zzp.YiYang.DaoImpl;

import com.sun.javaws.Main;
import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.DTO.ToPayDTO;
import com.zzp.YiYang.Dao.OrderDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.mapper.SendAddressMapper;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.*;

import javax.annotation.Resource;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/**
 * @author ho
 * @create 2017-10-01 16:21
 */
public class OrderDaoImpl implements OrderDao {
    private final int HOUR = 1000 * 60 * 60;
    private final int MINUTE = 1000 * 60;

    private OrderMapper orderMapper;
    private SendAddressMapper sendAddressMapper;
    private CloseOrderThread closeOrderThread;
    private ExecutorService executorService;
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Resource
    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    @Resource
    public void setCloseOrderThread(CloseOrderThread closeOrderThread) {
        this.closeOrderThread = closeOrderThread;
    }

    @Resource
    public void setSendAddressMapper(SendAddressMapper sendAddressMapper) {
        this.sendAddressMapper = sendAddressMapper;
    }

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public OrderDTO getOrder(int orderId) {
        OrderDTO orderDTO = orderMapper.getOrderDTO(orderId, MainUtil.getUserName());
        return orderDTO;
    }

    @Override
    public String saveOrder(Order saveOrder) {
        int result = orderMapper.set(saveOrder);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        return "1";
    }

    @Override
    public String payFinished(int id) {
        String userName = MainUtil.getUserName();
        boolean isFinished = orderMapper.isFinished(id);
        int state;
        if (isFinished) {
            state = 3;
        } else {
            state = 2;
        }
        int result = orderMapper.setStatePayFinished(id, userName, state);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        String userMail = userMapper.getMail(MainUtil.getUserName());
        executorService.execute(() -> {
            String content = ModelMail.getContent(MessageUtil.PAY_FINISHED_EMAIL_CONTENT);
            EmailHelper.sendEmail(userMail, MessageUtil.PAY_FINISHED_TITLE, content);
        });
        return "1";
    }

    @Override
    public boolean toPay(ToPayDTO toPayDTO) {
        Order order = new Order(); //根据用户名和orderId修改对应的订单
        order.setId(toPayDTO.getId());
        order.setDesc1(toPayDTO.getDesc1());
        order.setUserName(MainUtil.getUserName());
        order.setSendType(toPayDTO.getSendType());
        order.setSendAddressId(toPayDTO.getSendAddressId());
        order.setState(1);
        int result = orderMapper.set(order);
        if(result == 0) return false;
        CloseOrderDelayed c = new CloseOrderDelayed(order.getId(), 1 * HOUR);
        closeOrderThread.offer(c);
        return true;
    }

    @Override
    public String deleteAddress(int id) {
        sendAddressMapper.delete(id, MainUtil.getUserName());
        return "1";
    }

    /**
     * 没有检验传参
     * @param sendAddress
     * @return
     */
    @Override
    public String saveSendAddress(SendAddress sendAddress) {
        sendAddress.setUserName(MainUtil.getUserName());
        int result = sendAddressMapper.insert(sendAddress);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        return "" + sendAddress.getId();
    }
}
