package com.zzp.YiYang.Controller.sender;

import com.zzp.YiYang.pojo.ExpressMessage;
import com.zzp.YiYang.Dao.SendDao;
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
    private SendDao sendDao;

    @Resource
    public void setSendDao(SendDao sendDao) {
        this.sendDao = sendDao;
    }

    @RequestMapping("/expressMessageModel")
    public String expressMessageModel() {
        return "/sender/express_message_model";
    }

    @RequestMapping("/send")
    public String orderManage() {
        return "/sender/send";
    }

    @RequestMapping(value = "/getOrders", method = RequestMethod.POST)
    @ResponseBody
    public String getOrders() {
        String result = sendDao.getOrders();
        return result;
    }

    @RequestMapping(value = "addExpressMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addExpressMessage(ExpressMessage expressMessage) {
        return sendDao.addExpressMessage(expressMessage);
    }
}
