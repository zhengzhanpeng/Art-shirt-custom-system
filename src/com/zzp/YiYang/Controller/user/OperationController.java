package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.Dao.OperationDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/addToCar", method = RequestMethod.POST)
    @ResponseBody
    public String addToCar(int goodsId, String imgAddress) {
        String result = operationDao.addToCar(goodsId, imgAddress);
        return result;
    }
    
}
