package com.zzp.YiYang.Controller.superAdmin;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.DTO.UserMessageDTO;
import com.zzp.YiYang.Dao.UserManageDao;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-04 19:20
 */
//@Controller
@RequestMapping("/superAdmin")
public class UserManageController {
    private UserManageDao userManageDao;

    @Resource
    public void setUserManageDao(UserManageDao userManageDao) {
        this.userManageDao = userManageDao;
    }

    @RequestMapping("/userManage")
    public String userManage() {
        return "/superAdmin/userManage";
    }

    @RequestMapping(value = "getUsers", method = RequestMethod.POST)
    @ResponseBody
    public String getUsers() {
        List<UserMessageDTO> list = userManageDao.getUsers();
        String result = MainUtil.getJsonToTable(list);
        return result;
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public String deleteUser(String userName) {
        return userManageDao.deleteUser(userName);
    }

    @RequestMapping(value = "/setUserPassword")
    @ResponseBody
    public String setUserPassword(String userName, String password) {
        return userManageDao.setUserPassword(userName, password);
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public String addUser(UserDTO userDTO) {
        return userManageDao.addUser(userDTO);
    }
}
