package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.PasswordDTO;
import com.zzp.YiYang.Dao.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author ho
 * @create 2017-08-16 17:05
 */
@Controller
@RequestMapping("/user")
public class PasswordController {
    private UserDao userDao;
    @RequestMapping(value = "/setPassword", method = RequestMethod.GET)
    public String setPassword() {
        return "user/set_password";
    }

    @RequestMapping(value = "/setPassword", method = RequestMethod.POST)
    @ResponseBody
    public String setPassword(PasswordDTO passwordDTO) {
        return userDao.setPasswordC(passwordDTO);
    }

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
