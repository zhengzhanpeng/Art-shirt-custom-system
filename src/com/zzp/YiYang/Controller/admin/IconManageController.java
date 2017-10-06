package com.zzp.YiYang.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ho
 * @create 2017-10-06 15:43
 */
@Controller
@RequestMapping("/admin")
public class IconManageController {
    @RequestMapping("/iconManage")
    public String iconManage() {
        return "/admin/icon_manage";
    }

    @RequestMapping("/getIcons")
    @ResponseBody
    public String getIcons() {
        return null;
    }
}
