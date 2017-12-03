package com.zzp.YiYang.Controller.user;

import com.zzp.YiYang.DTO.OrderDTO;
import com.zzp.YiYang.Dao.OrderDao;
import com.zzp.YiYang.mapper.OrderMapper;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

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

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Resource
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @RequestMapping("/order/{orderId}")
    public String order(@PathVariable int orderId, ModelMap model) {
        String username = orderMapper.getUserName(orderId);
        if (!username.equals(MainUtil.getUserName())) {
            return "/login";
        }
        OrderDTO orderDTO = orderDao.getOrder(orderId);
        model.addAttribute("orderDTO", orderDTO);
        return "/user/order";
    }

    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
    @ResponseBody
    public String saveOrder(Order order) {
        String result = orderDao.saveOrder(order);
        return result;
    }

    @RequestMapping(value = "/addSendAddress", method = RequestMethod.POST)
    @ResponseBody
    public String addSendAddress(SendAddress sendAddress) {
        String result = orderDao.saveSendAddress(sendAddress);
        return result;
    }
}
