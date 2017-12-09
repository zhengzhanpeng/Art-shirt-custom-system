package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.CartShowDTO;
import com.zzp.YiYang.DTO.GetCartDTO;
import com.zzp.YiYang.DTO.GetGoodsDTO;
import com.zzp.YiYang.Dao.CartDao;
import com.zzp.YiYang.mapper.*;
import com.zzp.YiYang.pojo.BoughtItem;
import com.zzp.YiYang.pojo.Goods;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ho
 * @create 2017-11-29 9:26
 */
@Service
public class CartDaoImpl implements CartDao{
    private CartMapper cartMapper;
    private GoodsMapper goodsMapper;
    private OrderMapper orderMapper;
    private ClothesMapper clothesMapper;
    private BoughtItemMapper boughtItemMapper;

    @Resource
    public void setBoughtItemMapper(BoughtItemMapper boughtItemMapper) {
        this.boughtItemMapper = boughtItemMapper;
    }

    @Resource
    public void setClothesMapper(ClothesMapper clothesMapper) {
        this.clothesMapper = clothesMapper;
    }

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Resource
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Override
    public List<CartShowDTO> getCartShow() {
        List list = cartMapper.getCarts(MainUtil.getUserName());
        return list;
    }

    @Override
    public String buy(GetCartDTO get) {
        List<GetCartDTO> list = new ArrayList<>(1);
        list.add(get);
        return createOrder(list);
    }

    @Override
    public String deleteCart(int id) {
        if (id == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        int result = cartMapper.delete(id);
        if (result == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        return "1";
    }

    @Override
    public String createOrder(List<GetCartDTO> getCartDTOs) {
        Order order = new Order();
        order.setUserName(MainUtil.getUserName());
        order.setDesc1("");   //desc不能为空，故初始存“”
        orderMapper.addOrder(order);   //首先创建order订单，获取订单ID，以便添加bought_item时传入orderId
        GetCartDTO getCartDTO;
        Goods g;
        BoughtItem b;
        int j;
        int result = 0;
        double realityPrice;  //每件商品的价格
        double priceAll = 0;
        for(int i = 0; i < getCartDTOs.size(); i++) {
            getCartDTO = getCartDTOs.get(i);
            realityPrice = clothesMapper.getRealityPrice(getCartDTO.getClothesId());
            result = 0;
            for(j = 0; result == 0 && j < 100; j++) {   //通过乐观锁的方式保证数据安全，若本次循环执行无误则result = true；并跳出循环
                g = goodsMapper.getGoodsIdAndNumber(getCartDTO.getClothesId(), getCartDTO.getSize());
                if (g.getNumber() <= 0) {
                    MainUtil.rollBack();
                    return "对不起，您所购买的" + clothesMapper.getName(getCartDTO.getClothesId()) + "数量不足，请见谅";
                }
                b = new BoughtItem();
                b.setGoodsId(g.getId());
                b.setOrderId(order.getId());
                b.setImgAddress(getCartDTO.getImgAddress());
                b.setBackImgAddress(getCartDTO.getBackImgAddress());
                b.setNumber(getCartDTO.getNumber());
                b.setRealityPrice(realityPrice);
                boughtItemMapper.addBoughtItem(b);
                result = goodsMapper.plusNumber(g.getId(), g.getNumber(), getCartDTO.getNumber());
                cartMapper.delete(getCartDTO.getId());
            }
            if (result == 0) {
                MainUtil.rollBack();
                return MessageUtil.SYSTEM_BUSY;
            }
            priceAll += realityPrice * getCartDTO.getNumber();
        }
        orderMapper.setRealityPrice(order.getId(), priceAll);
        return order.getId() + "";
    }
}
