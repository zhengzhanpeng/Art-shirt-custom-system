package com.zzp.YiYang.Controller.visitor;

import com.zzp.YiYang.DTO.ClothesDTO;
import com.zzp.YiYang.Dao.ClothesDao;
import com.zzp.YiYang.Dao.IconDao;
import com.zzp.YiYang.mapper.RecommendIconMapper;
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
    private ClothesDao clothesDao;
    private IconDao iconDao;
    private RecommendIconMapper recommendIconMapper;

    @Resource
    public void setRecommendIconMapper(RecommendIconMapper recommendIconMapper) {
        this.recommendIconMapper = recommendIconMapper;
    }

    @Resource
    public void setClothesDao(ClothesDao clothesDao) {
        this.clothesDao = clothesDao;
    }

    @Resource
    public void setIconDao(IconDao iconDao) {
        this.iconDao = iconDao;
    }

    @RequestMapping("/index")
    public String index(ModelMap model) {
        List<ClothesDTO> clothesList = clothesDao.getRecommendClothes();
        List<Icon> iconList = recommendIconMapper.getRecommendIcon(-1, 0);
        model.addAttribute("clothesList", clothesList);
        model.addAttribute("iconList", iconList);
        return "/index";
    }
}
