package com.zzp.YiYang.Controller.admin;

import com.zzp.YiYang.Dao.IconManageDao;
import com.zzp.YiYang.Dao.OperationDao;
import com.zzp.YiYang.pojo.IconProperty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ho
 * @create 2017-10-06 15:43
 */
@Controller
@RequestMapping("/admin")
public class IconManageController {
    private OperationDao operationDao;
    private IconManageDao iconManageDao;

    @Resource
    public void setIconManageDao(IconManageDao iconManageDao) {
        this.iconManageDao = iconManageDao;
    }

    @Resource
    public void setOperationDao(OperationDao operationDao) {
        this.operationDao = operationDao;
    }

    @RequestMapping("/iconManage")
    public String iconManage() {
        return "/admin/icon_manage";
    }

    @RequestMapping("/getIcons")
    @ResponseBody
    public String getIcons() {
        return null;
    }

    @RequestMapping("/addIconModel")
    public String addIconModel(ModelMap model) {
        List<IconProperty> list = iconManageDao.getIconPro();
        model.addAttribute("list", list);
        return "/admin/add_icon_model";
    }

    @RequestMapping(value = "/uploadIcon")
    @ResponseBody
    public Map uploadIcon(@RequestParam CommonsMultipartFile file) {
        String result = operationDao.uploadImg(file, "icon");
        Map<String, String> map = new HashMap<>();
        map.put("address", result);
        return map;
    }

    @RequestMapping(value = "addIconPro", method = RequestMethod.POST)
    @ResponseBody
    public String addIconPro(String value) {
        return iconManageDao.addIconPro(value);
    }
}
