package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.ItemDTO;
import com.zzp.YiYang.DTO.OrderManageDTO;
import com.zzp.YiYang.Dao.SendDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.util.MainUtil;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-12-08 9:00
 */
public class SendDaoImpl implements SendDao {
    private OrderMapper orderMapper;

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
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
