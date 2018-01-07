package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.ItemDTO;
import com.zzp.YiYang.DTO.OrderManageDTO;
import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.Dao.OrderManageDao;
import com.zzp.YiYang.mapper.OrderLogMapper;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.OrderLog;
import com.zzp.YiYang.util.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;

/**
 * @author ho
 * @create 2017-12-08 9:00
 */
public class OrderManageDaoImpl implements OrderManageDao {
    private OrderMapper orderMapper;
    private ExecutorService executorService;
    private UserMapper userMapper;
    private OrderLogMapper orderLogMapper;

    @Resource
    public void setOrderLogMapper(OrderLogMapper orderLogMapper) {
        this.orderLogMapper = orderLogMapper;
    }

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Resource
    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public String finish(int id) {
        int result = orderMapper.setStateFinished(id);
        if (result == 0) {
            return MessageUtil.FINISH_DEFAULT;
        }
        executorService.execute(() -> {
            String userMail = userMapper.getMailByOrderId(id);
            String content = ModelMail.getContent(MessageUtil.MAKE_FINISHED_EMAIL_CONTENT);
            EmailHelper.sendEmail(userMail, MessageUtil.MAKE_FINISHED_TITLE, content);
        });
        return "1";
    }

    @Override
    public String setPrice(int id, float price, String reason) {
        Order order = new Order();
        order.setId(id);
        order.setRealityPrice(price);
        int result = orderMapper.set(order);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        UserDTO userDTO = userMapper.getUserInfo(MainUtil.getUserName());  //在外部是因为否则无法获取username
        executorService.execute(() -> {
            float realityPrice = orderMapper.getPrice(id);
            String logStr = "<span style='color:#FF5722;'>修改价格</span> &nbsp;&nbsp;订单编号:" + id + "; 原价:" + realityPrice + "元; 修改后:"
                    + price + "元<br>原因:" + reason;
            OrderLog orderLog = new OrderLog();
            orderLog.setContent(logStr);
            orderLog.setLogTime(new Date());
            orderLog.setName(userDTO.getName());
            orderLog.setPhone(userDTO.getPhone());
            orderLogMapper.insert(orderLog);
        });
        executorService.execute(() -> {
            String userMail = userMapper.getMailByOrderId(id);
            String content = ModelMail.getContent(MessageUtil.PRICE_EMAIL_CONTENT);
            EmailHelper.sendEmail(userMail, MessageUtil.PRICE_TITLE, content);
        });
        return "1";
    }

    @Override
    public String getOrders() {
        List<OrderManageDTO> list = orderMapper.getOrdersByMaker();
        list.stream().forEach(e -> {  //修改返回信息
            String str = "";
            ItemDTO item;
            List<ItemDTO> itemDTOs = e.getItemDTOs();
            for(int i = 0; i < itemDTOs.size(); i++) {
                item = itemDTOs.get(i);
                str += item.getName() + " " + item.getSize() + " " + item.getNumber() + "件";
                if (i != itemDTOs.size() - 1) {
                    str += "<hr style='margin: 5px 0'>";
                }
            }
            e.setDetails(str);
            if (e.getState() == -1) {
                e.setStateStr("已取消");
            } else if (e.getState() == 0) {
                e.setStateStr("待填写收货信息");
            } else if (e.getState() == 1) {
                e.setStateStr("<span style='color:#FFB800;'>未付款</span>");
            } else if (e.getState() == 2) {
                e.setStateStr("<span style='color:#01AAED;'>已付款</span>");
            } else if (e.getState() == 3) {
                e.setStateStr("已制作完成");
            }
        });
        String result = MainUtil.getJsonToTable(list);
        return result;
    }
}
