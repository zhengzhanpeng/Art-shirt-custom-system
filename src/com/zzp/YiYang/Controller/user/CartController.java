package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.Dao.CartDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-09-29 16:11
 */
@Controller
@RequestMapping("/user")
public class CartController {
    private CartDao cartDao;

    @Resource
    public void setCartDao(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    @RequestMapping("/cart")
    public String cart(ModelMap model) {
        List list = cartDao.getCartShow();
        model.addAttribute("cartShowList", list);
        return "/user/cart";
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    public String createOrder(@RequestParam("cartIdList[]") List<Integer> cartIdList) {
        String resultOrOrderId = cartDao.createOrder(cartIdList);
        return resultOrOrderId;
    }
}
