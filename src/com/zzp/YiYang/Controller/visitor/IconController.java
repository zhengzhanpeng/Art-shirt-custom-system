package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.Dao.IconDao;
import com.zzp.YiYang.mapper.IconMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 游客访问图标的页面
 *
 * @author ho
 * @create 2017-09-27 16:13
 */
@Controller
public class IconController {
    private IconDao iconDao;
    private IconMapper iconMapper;

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Resource
    public void setIconDao(IconDao iconDao) {
        this.iconDao = iconDao;
    }

    @RequestMapping("/icons")
    public String icon(ModelMap model) {
        List iconList = iconDao.getIcon();
        List propertyList = iconMapper.getIconPros();
        model.addAttribute("iconList", iconList);
        model.addAttribute("propertyList", propertyList);
        model.addAttribute("newIcon", 50);
        model.addAttribute("hotIcon", 100);
        return "/icons";
    }
}
