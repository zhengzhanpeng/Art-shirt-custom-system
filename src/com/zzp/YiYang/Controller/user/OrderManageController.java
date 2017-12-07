package com.zzp.YiYang.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ho
 * @create 2017-12-07 16:39
 */
@Controller
@RequestMapping("/admin")
public class OrderManageController {
    @RequestMapping("/orderManage")
    public String orderManage() {
        return "/admin/order_manage";
    }
}
