package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.Dao.IconDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 游客访问图标的页面
 *
 * @author ho
 * @create 2017-09-27 16:13
 */
@Controller
public class IconController {
    private IconDao iconDao;

    @Resource
    public void setIconDao(IconDao iconDao) {
        this.iconDao = iconDao;
    }

    @RequestMapping("/icons")
    public String icon(ModelMap model) {
//        List iconList = iconDao.getIcon();
//        model.addAttribute("iconList", iconList);
        return "/icons";
    }
}
