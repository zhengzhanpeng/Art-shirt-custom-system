package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.mapper.OrderLogMapper;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-12-10 9:03
 */
@Controller
@RequestMapping("/manager")
public class OrderLogController {
    private OrderLogMapper orderLogMapper;

    @Resource
    public void setOrderLogMapper(OrderLogMapper orderLogMapper) {
        this.orderLogMapper = orderLogMapper;
    }

    @RequestMapping("/orderLog")
    public String orderLog() {
        return "/manager/order_log";
    }

    @RequestMapping(value = "/getLogs", method = RequestMethod.POST)
    @ResponseBody
    public String getLogs() {
        List list = orderLogMapper.gets();
        return MainUtil.getJsonToTable(list);
    }
}
