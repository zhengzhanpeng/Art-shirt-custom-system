package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.AnOrderDTO;
import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.DTO.ToPayDTO;
import com.zzp.YiYang.Dao.ClothesDao;
import com.zzp.YiYang.Dao.OrderDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 购买页面
 *
 * @author ho
 * @create 2017-09-29 20:04
 */
@Controller
@RequestMapping("/user")
public class OrderController {
    private OrderDao orderDao;
    private OrderMapper orderMapper;
    private ClothesDao clothesDao;

    @Resource
    public void setClothesDao(ClothesDao clothesDao) {
        this.clothesDao = clothesDao;
    }

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Resource
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @RequestMapping("/order")
    public String myOrder(ModelMap model) {
        List orderList = orderMapper.getOrders(MainUtil.getUserName());
        List recommendClothesList = clothesDao.getRecommendClothes();
        model.addAttribute("recommendClothesList", recommendClothesList);
        model.addAttribute("orderList", orderList);
        return "/user/my_order";
    }
    @RequestMapping("/order/{orderId}")
    public String order(@PathVariable int orderId, ModelMap model) {
        Integer state = orderMapper.getStateByUserName(orderId, MainUtil.getUserName());
        if (state == null) {
            return "/login";   //如果state不为上述情况，则可能为null或其他情况，则返回登录
        } else if (state == 0) {
            OrderDTO orderDTO = orderDao.getOrder(orderId);
            model.addAttribute("orderDTO", orderDTO);
            return "/user/order";
        } else if (state == 1) {
            AnOrderDTO order = orderMapper.getAnOrderDTO(orderId);
            model.addAttribute("order", order);
            return "/user/pay";
        } else if (state == 2 || state == 3 || state == 4) {
            return "/user/pay_finished";
        }
        return "/login";  //如果state不为上述情况，则可能为null或其他情况，则返回登录
    }

    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
    @ResponseBody
    public String saveOrder(Order order) {
        String result = orderDao.saveOrder(order);
        return result;
    }
    @RequestMapping("/pay")
    public String pay() {
        return "/user/pay";
    }

    @RequestMapping(value = "/payFinished", method = RequestMethod.GET)
    public String payFinished() {
        return "/user/pay_finished";
    }

    @RequestMapping(value = "/payFinished", method = RequestMethod.POST)
    @ResponseBody
    public String payFinishedPost(int id) {
        String result = orderDao.payFinished(id);
       return result;
    }

    @RequestMapping(value = "/addSendAddress", method = RequestMethod.POST)
    @ResponseBody
    public String addSendAddress(SendAddress sendAddress) {
        String result = orderDao.saveSendAddress(sendAddress);
        return result;
    }
    @RequestMapping(value = "/deleteAddress", method = RequestMethod.POST)
    @ResponseBody
    public String deleteAddress(int id) {
        return orderDao.deleteAddress(id);
    }
    @RequestMapping(value = "/toPay", method = RequestMethod.POST)
    public String toPay(ToPayDTO toPayDTO) {
        boolean result = orderDao.toPay(toPayDTO);
        if (result)
            return "redirect: order/" + toPayDTO.getId();
        else
            return "/login";
    }
}
