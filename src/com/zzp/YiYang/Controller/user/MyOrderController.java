package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.MyOrderDTO;
import com.zzp.YiYang.Dao.MyOrderDao;
import com.zzp.YiYang.pojo.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-01 15:34
 */
@Controller
@RequestMapping("/user")
public class MyOrderController {
    private MyOrderDao myOrderDao;

    @Resource
    public void setMyOrderDao(MyOrderDao myOrderDao) {
        this.myOrderDao = myOrderDao;
    }

    @RequestMapping("/myOrder")
    public String myOrder(ModelMap model) {
        List<MyOrderDTO> list = myOrderDao.getMyOrders();
        model.addAttribute("list", list);
        return "/user/myOrder";
    }
}
