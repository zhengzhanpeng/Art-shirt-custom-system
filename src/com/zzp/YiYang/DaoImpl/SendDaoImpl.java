package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.mapper.OrderLogMapper;
import com.zzp.YiYang.mapper.SendAddressMapper;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.ExpressMessage;
import com.zzp.YiYang.DTO.ItemDTO;
import com.zzp.YiYang.DTO.OrderManageDTO;
import com.zzp.YiYang.Dao.SendDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.pojo.OrderLog;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;

/**
 * @author ho
 * @create 2017-12-08 9:00
 */
public class SendDaoImpl implements SendDao {
    private OrderMapper orderMapper;
    private ExecutorService executorService;
    private OrderLogMapper orderLogMapper;
    private SendAddressMapper sendAddressMapper;
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Resource
    public void setSendAddressMapper(SendAddressMapper sendAddressMapper) {
        this.sendAddressMapper = sendAddressMapper;
    }

    @Resource
    public void setOrderLogMapper(OrderLogMapper orderLogMapper) {
        this.orderLogMapper = orderLogMapper;
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
    public String addExpressMessage(ExpressMessage expressMessage) {
        int result = orderMapper.setStateSent(expressMessage.getOrderId());
        int id = expressMessage.getOrderId();
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        result = orderMapper.addExpressMessage(expressMessage);
        if (result == 0) {
            MainUtil.rollBack();
            return MessageUtil.SYSTEM_ERROR;
        }
        UserDTO userDTO = userMapper.getUserInfo(MainUtil.getUserName()); //在外部是因为否则无法获取username
        executorService.execute(() -> {
            SendAddress sendAddress = sendAddressMapper.get(id);
            String logStr = "<span style='color:#01AAED;'>已发货</span> &nbsp;&nbsp;订单编号:" + id + "; 收货人:" + sendAddress.getReceiveName() + "; 联系电话:"
                    + sendAddress.getPhone() + "<br>送至:" + expressMessage.getPcd();
            OrderLog orderLog = new OrderLog();
            orderLog.setContent(logStr);
            orderLog.setLogTime(new Date());
            orderLog.setName(userDTO.getName());
            orderLog.setPhone(userDTO.getPhone());
            orderLogMapper.insert(orderLog);
        });
        return "1";
    }

    @Override
    public String getOrders() {
        List<OrderManageDTO> list = orderMapper.getOrdersBySender();
        list.stream().forEach(e -> {  //修改返回信息
            String str = "";
            ItemDTO item;
            List<ItemDTO> itemDTOs = e.getItemDTOs();
            for(int i = 0; i < itemDTOs.size(); i++) {
                item = itemDTOs.get(i);
                str += item.getName() + " " + item.getSize() + " " + item.getNumber() + "件";
                if (i != itemDTOs.size() - 1) {
                    str += "<br>";
                }
            }
            e.setDetails(str);
            if (e.getSendType() == 1) {
                e.setSendTypeStr("不限送货时间");
            } else if (e.getSendType() == 2) {
                e.setSendTypeStr("工作日送货");
            } else {
                e.setSendTypeStr("双休日、假日送货");
            }
        });
        String result = MainUtil.getJsonToTable(list);
        return result;
    }
}
