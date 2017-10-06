package com.zzp.YiYang.Controller.admin;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.User;
import com.zzp.YiYang.util.SecurityUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author ho
 * @create 2017-10-04 19:01
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @RequestMapping("/index")
    public String index(ModelMap model) {
        UserDTO user = userMapper.getUserDTO(SecurityUtil.getUserName());
        model.addAttribute("user", user);
        return "/admin/index";
    }
}
