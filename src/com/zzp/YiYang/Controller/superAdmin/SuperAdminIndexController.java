package com.zzp.YiYang.Controller.superAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ho
 * @create 2017-10-04 19:03
 */
@Controller
@RequestMapping("/superAdmin")
public class SuperAdminIndexController {
    @RequestMapping("/index")
    public String index() {
        return "/superAdmin/index";
    }
}
