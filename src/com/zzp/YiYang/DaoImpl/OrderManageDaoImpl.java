package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.ItemDTO;
import com.zzp.YiYang.DTO.OrderManageDTO;
import com.zzp.YiYang.Dao.OrderManageDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-12-08 9:00
 */
public class OrderManageDaoImpl implements OrderManageDao {
    private OrderMapper orderMapper;

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public String setPrice(int id, float price) {
        Order order = new Order();
        order.setId(id);
        order.setRealityPrice(price);
        int result = orderMapper.set(order);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
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
                e.setStateStr("待付款");
            } else if (e.getState() == 2) {
                e.setStateStr("已付款");
            } else if (e.getState() == 3) {
                e.setStateStr("已制作完成");
            }
        });
        String result = MainUtil.getJsonToTable(list);
        return result;
    }
}
