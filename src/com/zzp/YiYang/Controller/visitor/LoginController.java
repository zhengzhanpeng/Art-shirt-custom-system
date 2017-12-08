package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.Dao.UserDao;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Iterator;

/**
 * @author ho
 * @create 2017-09-24 19:43
 */
@Controller
public class LoginController {
    private UserDao userDao;
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        if (MainUtil.isAjax(httpServletRequest)) {
            return "redirect: /ajaxToLogin";
        }
        return "/login";
    }

    @RequestMapping("/ajaxToLogin")
    @ResponseBody
    public String ajaxToLogin() {
        return MessageUtil.DO_NOT_LOGIN;
    }

    @RequestMapping(value = "/login/{msg}")
    public String login(@PathVariable("msg") int msg, ModelMap model) {
        if (msg == 1) {
            model.addAttribute("msg", MessageUtil.USER_NAME_OR_PASSWORD_OR_EMAIL_WRONG);
        }
        return "login";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGet() {
        return "/register";
    }

    @RequestMapping(value = "/registerSubmit")
    public String registerPost(@ModelAttribute UserDTO userDTO, ModelMap model) {
        userDTO.setAuthority("ROLE_USER");
        String result = userDao.registerC(userDTO);
        if (result.equals("1")) {
            return "/register_check";
        } else {
            model.addAttribute("msg", result);
            return "/register";
        }
    }

    /**
     * 用户验证邮箱时点击的网址
     * @param userName
     * @param msg
     * @param model
     * @return
     */
    @RequestMapping("/checkRegister/{userName}/{msg}")
    public String checkRegister(@PathVariable("userName") String userName, @PathVariable("msg") String msg, ModelMap model) {
        boolean result = userDao.checkRegister(userName, msg);
        if (result) {
            model.addAttribute("msg", MessageUtil.EMAIL_SUCCEED);
        } else {
            model.addAttribute("msg", MessageUtil.EMAIL_DEFEATED);
        }
        return "/check_result";
    }

    @RequestMapping("/checkEmail")
    public String checkEmail() {
        return "/check_email";
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
    public String checkEmailPost(String userName, String password, ModelMap model) {
        boolean result = userDao.checkUserAndSendEmail(userName, password);
        if (result) {
            return "/register_check";
        } else {
            model.addAttribute("msg", MessageUtil.USER_NAME_OR_PASSWORD_WRONG);
            return "/check_email";
        }
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
            } else if (authority.equals("ROLE_MAKER")) {
                return "redirect:/maker/index";
            } else if (authority.equals("ROLE_SENDER")) {
                return "redirect:/sender/index";
            }
        }
        model.addAttribute("msg", MessageUtil.LOGIN_ERROR);
        return "login";
    }
}
