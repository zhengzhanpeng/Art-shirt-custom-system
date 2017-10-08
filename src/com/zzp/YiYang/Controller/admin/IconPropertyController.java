package com.zzp.YiYang.Controller.admin;

import com.zzp.YiYang.Dao.IconPropertyDao;
import com.zzp.YiYang.pojo.IconProperty;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-08 16:06
 */
@Controller
@RequestMapping("/admin")
public class IconPropertyController {
    private IconPropertyDao iconPropertyDao;

    @Resource
    public void setIconPropertyDao(IconPropertyDao iconPropertyDao) {
        this.iconPropertyDao = iconPropertyDao;
    }

    @RequestMapping("/iconProperty")
    public String iconProperty() {
        return "admin/icon_property";
    }

    @RequestMapping(value = "getIconPros", method = RequestMethod.POST)
    @ResponseBody
    public String getIconPro() {
        List<IconProperty> list = iconPropertyDao.getIconPro();
        return MainUtil.getJsonToTable(list);
    }

    @RequestMapping(value = "deleteIconPro", method = RequestMethod.POST)
    @ResponseBody
    public String deleteIconPro(int iconProId) {
        return iconPropertyDao.deleteIconPro(iconProId);
    }

    @RequestMapping(value = "saveIconPro", method = RequestMethod.POST)
    @ResponseBody
    public String saveIconPro(IconProperty i) {
        return iconPropertyDao.saveIconPro(i);
    }
}
