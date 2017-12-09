package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.Dao.OperationDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;

/**
 * 用于存放用户的基本操作
 *
 * @author ho
 * @create 2017-09-27 9:25
 */
@Controller
@RequestMapping("/user")
public class OperationController {
    private OperationDao operationDao;

    @Resource
    public void setOperationDao(OperationDao operationDao) {
        this.operationDao = operationDao;
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    @ResponseBody
    public String addToCar(@ModelAttribute CartDTO cartDTO) {
        String result = operationDao.addToCart(cartDTO);
        return result;
    }

    @RequestMapping(value = "addToCartFinished", method = RequestMethod.POST)
    @ResponseBody
    public String addToCartFinished(int id) {
        return operationDao.addToCartFinished(id);
    }

    @RequestMapping(value = "/addToCollect", method = RequestMethod.POST)
    @ResponseBody
    public String addToCollect(int iconId) {
        String result = operationDao.AddToCollect(iconId);
        return result;
    }

    @RequestMapping(value = "/uploadImg")
    @ResponseBody
    public String uploadImg(@RequestParam(value = "file") CommonsMultipartFile file) {
        String imgAddress = operationDao.uploadImg(file, "user");
        return imgAddress;
    }


    

}
