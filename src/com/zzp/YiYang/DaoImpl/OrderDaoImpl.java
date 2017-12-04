package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.Dao.OrderDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.mapper.SendAddressMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author ho
 * @create 2017-10-01 16:21
 */
public class OrderDaoImpl implements OrderDao {

    private OrderMapper orderMapper;
    private SendAddressMapper sendAddressMapper;

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
