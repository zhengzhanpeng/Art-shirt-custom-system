package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.Dao.SendDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author ho
 * @create 2017-12-10 16:19
 */
@Controller
@RequestMapping("/manager")
public class OrderMessageController {
    private SendDao sendDao;

    @Resource
    public void setSendDao(SendDao sendDao) {
        this.sendDao = sendDao;
    }

    @RequestMapping("/orderMessage")
    public String orderMessage() {
        return "manager/order_message";
    }

    @RequestMapping(value = "/getOrderMessage", method = RequestMethod.POST)
    @ResponseBody
    public String getOrderMessage() {
        return sendDao.getOrderMessage();
    }
}
