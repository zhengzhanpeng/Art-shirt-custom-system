package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.CartShowDTO;
import com.zzp.YiYang.pojo.Cart;

import java.util.List;

/**
 * @author ho
 * @create 2017-11-29 9:32
 */
public interface CartMapper {
    int insert(Cart cart);
    List<CartShowDTO> getCarts(String userName);

    int delete(int id);
}
