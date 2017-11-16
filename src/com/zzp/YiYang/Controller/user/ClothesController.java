package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.BuyAtOnceDTO;
import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.Dao.ClothesDao;
import com.zzp.YiYang.Dao.IconDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.util.List;

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

    @RequestMapping("/clothes_make")
    public String clothes(ModelMap model) {
        List clothesList = clothesDao.getClothes();
        List recommendClothesList = clothesDao.getRecommendClothes();
        model.addAttribute("clothesList", clothesList);
        model.addAttribute("recommendClothesList", recommendClothesList);
        return "/user/clothes_make";
    }

    @RequestMapping(value = "/getCollectIcon", method = RequestMethod.GET)
    @ResponseBody
    public String getCollectIcon(int page, int num) {
        String result = iconDao.getCollectIcon(page, num);
        return result;
    }

    @RequestMapping(value = "/getRecommendIcon", method = RequestMethod.GET)
    @ResponseBody
    public String getRecommend(int page, int num) {
        String result = iconDao.getRecommendIcon(page, num);
        return result;
    }

    @RequestMapping(value = "/getCollectMaxIcon", method = RequestMethod.GET)
    @ResponseBody
    public String getCollectMax(int page, int num) {
        String result = iconDao.getCollectMaxIcon(page, num);
        return result;
    }

    @RequestMapping(value = "addNewToCart", method = RequestMethod.POST)
    @ResponseBody
    public String addNewToCar(@ModelAttribute CartDTO cartDTO, CommonsMultipartFile file) {
        String result = clothesDao.addNewToCart(cartDTO, file);
        return result;
    }

    @RequestMapping(value = "/createOrderAndUploadImg", method = RequestMethod.POST)
    @ResponseBody
    public String createOrderAndUploadImg(CommonsMultipartFile file, BuyAtOnceDTO buyAtOnceDTO) {
        String resultOrOrderId = clothesDao.createOrderAndUploadImg(file, buyAtOnceDTO);
        return resultOrOrderId;
    }
}
