package com.zzp.YiYang.Controller.admin;

import com.zzp.YiYang.DTO.AddGoodsDTO;
import com.zzp.YiYang.Dao.GoodsDao;
import com.zzp.YiYang.Dao.OperationDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ho
 * @create 2017-10-12 15:30
 */
@Controller
@RequestMapping("/admin")
public class GoodsManageController {
    private OperationDao operationDao;
    private GoodsDao goodsDao;

    @Resource
    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    @Resource
    public void setOperationDao(OperationDao operationDao) {
        this.operationDao = operationDao;
    }

    @RequestMapping("/goodsManage")
    public String clothesManage(ModelMap modelMap) {
        modelMap.addAttribute("sizeList", goodsDao.getSizeList());
        return "admin/goods_manage";
    }

    @RequestMapping(value = "/getGoods", method = RequestMethod.POST)
    @ResponseBody
    public String getGoods() {
        String result = goodsDao.getGoods();
        return result;
    }

    @RequestMapping("/addGoodsModel")
    public String addGoodsModel(ModelMap model) {
        return "/admin/add_goods_model";
    }

    @RequestMapping(value = "/uploadGoods")
    @ResponseBody
    public Map uploadIcon(@RequestParam CommonsMultipartFile file) {
        String result = operationDao.uploadImg(file, "clothes");
        Map<String, String> map = new HashMap<>();
        map.put("address", result);
        return map;
    }

    @RequestMapping(value = "/addGoods", method = RequestMethod.POST)
    @ResponseBody
    public String addIcon(AddGoodsDTO addGoodsDTO, @RequestParam("sizeNumberArr[]") int[] sizeNumberArr) {
        addGoodsDTO.setSizeNumber(sizeNumberArr);
        String result = goodsDao.addGoods(addGoodsDTO);
        return result;
    }

    @RequestMapping(value = "/saveGoods", method = RequestMethod.POST)
    @ResponseBody
    public String saveGoods(AddGoodsDTO addGoodsDTO, @RequestParam("sizeNumberArr[]") int[] sizeNumber) {
        addGoodsDTO.setSizeNumber(sizeNumber);
        return goodsDao.saveGoods(addGoodsDTO);
    }

    @RequestMapping(value = "/deleteClothes", method = RequestMethod.POST)
    @ResponseBody
    public String deleteIcon(int clothesId) {
        return goodsDao.deleteClothes(clothesId);
    }
}
