package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.GetCartDTO;
import com.zzp.YiYang.Dao.CartDao;
import com.zzp.YiYang.Dao.ClothesDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    private ClothesDao clothesDao;

    @Resource
    public void setClothesDao(ClothesDao clothesDao) {
        this.clothesDao = clothesDao;
    }

        @Resource
    public void setCartDao(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    @RequestMapping("/cart")
    public String cart(ModelMap model) {
        List list = cartDao.getCartShow();
        List recommendClothesList = clothesDao.getRecommendClothes();
        model.addAttribute("recommendClothesList", recommendClothesList);
        model.addAttribute("cartShowList", list);
        return "/user/cart";
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    public String createOrder(@RequestBody List<GetCartDTO> cartList) {
        String resultOrOrderId = cartDao.createOrder(cartList);
        return resultOrOrderId;
    }

    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
    @ResponseBody
    public String deleteCart(int id) {
        return cartDao.deleteCart(id);
    }
}
