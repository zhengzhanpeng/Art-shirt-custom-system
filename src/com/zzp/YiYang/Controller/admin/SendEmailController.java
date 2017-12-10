package com.zzp.YiYang.Controller.admin;

import com.zzp.YiYang.Dao.SendEmailDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author ho
 * @create 2017-12-10 16:52
 */
@Controller
@RequestMapping("/admin")
public class SendEmailController {
    private SendEmailDao sendEmailDao;

    @Resource
    public void setSendEmailDao(SendEmailDao sendEmailDao) {
        this.sendEmailDao = sendEmailDao;
    }

    @RequestMapping("/sendEmail")
    public String sendEmail() {
        return "/admin/send_email";
    }
    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    @ResponseBody
    public String sendEmailPost(String content, String object) {
        return sendEmailDao.sendEmail(content, object);
    }
}
