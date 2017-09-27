package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.Dao.IndexDao;
import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Icon;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 首页面
 *
 * @author ho
 * @create 2017-09-26 15:20
 */
@Controller
public class IndexController {
    private IndexDao indexDao;

    @Resource
    public void setIndexDao(IndexDao indexDao) {
        this.indexDao = indexDao;
    }

    @RequestMapping("/index")
    public String index(ModelMap model) {
        List<Clothes> clothesList = indexDao.getRecommendClothes();
        List<Icon> iconList = indexDao.getRecommendIcon();
        model.addAttribute("clothesList", clothesList);
        model.addAttribute("iconList", iconList);
        return "/index";
    }
}
