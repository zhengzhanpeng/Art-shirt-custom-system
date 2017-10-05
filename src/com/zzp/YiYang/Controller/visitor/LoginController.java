package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.Dao.UserDao;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/**
 * @author ho
 * @create 2017-09-24 19:43
 */
@Controller
public class LoginController {
    private UserDao userDao;
    private Map<String, String> returnMessage;

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    @RequestMapping("/login")
    public String login() {
        return "/login";
    }
    @RequestMapping(value = "/login/{msg}")
    public String login(@PathVariable("msg") int msg, ModelMap model) {
        System.out.println(111);
        if (msg == 1) {
            model.addAttribute("msg", returnMessage.get("USER_NAME_OR_PASSWORD_WRONG"));
        }
        return "login";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGet() {
        return "/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String registerPost(@ModelAttribute UserDTO userDTO) {
        return userDao.registerC(userDTO);
    }

    @RequestMapping("/success")
    public String success(ModelMap model) {
        Authentication authentication = (Authentication) SecurityContextHolder.getContext()
                .getAuthentication();
        Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) authentication.getAuthorities();
        Iterator<SimpleGrantedAuthority> iterator = authorities.iterator();
        SimpleGrantedAuthority s;
        if (iterator.hasNext()) {
            s = iterator.next();
            String authority = s.getAuthority();
            if (authority.equals("ROLE_ADMIN")) {
                return "redirect:/admin/index";
            } else if (authority.equals("ROLE_USER")) {
                return "redirect:/index";
            } else if (authority.equals("ROLE_SUPER_ADMIN")) {
                return "redirect:/superAdmin/index";
            }
        }
        model.addAttribute("msg", returnMessage.get("LOGIN_ERROR"));
        return "login";
    }
}
