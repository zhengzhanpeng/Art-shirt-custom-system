package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.Dao.ClothesDao;
import com.zzp.YiYang.Dao.IconDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

import static javafx.scene.input.KeyCode.L;

/**
 * 制作个性衣服界面
 *
 * @author ho
 * @create 2017-09-27 16:47
 */
@Controller
@RequestMapping("/user")
public class ClothesController {
    private ClothesDao clothesDao;
    private IconDao iconDao;

    @Resource
    public void setIconDao(IconDao iconDao) {
        this.iconDao = iconDao;
    }

    @Resource
    public void setClothesDao(ClothesDao clothesDao) {
        this.clothesDao = clothesDao;
    }

    @RequestMapping("/clothes")
    public String clothes(ModelMap model) {
        List clothesList = clothesDao.getClothes();
        List recommendClothesList = clothesDao.getRecommendClothes();
        int collectNum = iconDao.getCollectNum();
        int recommendNum = iconDao.getRecommendNum();
        model.addAttribute("clothesList", clothesList);
        model.addAttribute("recommendClothesList", recommendClothesList);
        model.addAttribute("collectNum", collectNum);
        model.addAttribute("recommendNum", recommendNum);
        return "/user/clothes";
    }

    @RequestMapping(value = "/getCollectIcon", method = RequestMethod.POST)
    @ResponseBody
    public List getCollect(int page, int num) {
        List list = iconDao.getCollectIcon(page, num);
        return list;
    }

    @RequestMapping(value = "/getRecommendIcon", method = RequestMethod.POST)
    @ResponseBody
    public List getRecommend(int page, int num) {
        List list = iconDao.getRecommendIcon(page, num);
        return list;
    }

    @RequestMapping(value = "/getCollectMaxIcon", method = RequestMethod.POST)
    @ResponseBody
    public List getCollectMax(int page, int num) {
        List list = iconDao.getCollectMaxIcon(page, num);
        return list;
    }
}
