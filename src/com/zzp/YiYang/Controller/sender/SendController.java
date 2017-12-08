package com.zzp.YiYang.Controller.sender;

import com.zzp.YiYang.Dao.OrderManageDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author ho
 * @create 2017-12-07 16:39
 */
@Controller
@RequestMapping("/sender")
public class SendController {
    private OrderManageDao orderManageDao;

    @Resource
    public void setOrderManageDao(OrderManageDao orderManageDao) {
        this.orderManageDao = orderManageDao;
    }

    @RequestMapping("/orderManage")
    public String orderManage() {
        return "/sender/send";
    }

    @RequestMapping(value = "/getOrders", method = RequestMethod.POST)
    @ResponseBody
    public String getOrders() {
        String result = orderManageDao.getOrders();
        return result;
    }
}
