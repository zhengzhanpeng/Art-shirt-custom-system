package com.zzp.YiYang.intercept;

import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.pojo.Order;

/**
 * 抽象类的实现
 *
 * @author ho
 * @create 2017-09-26 14:58
 */
public class CheckParameterAOP extends CheckParameterAbstractAOP {
    @Override
    public String checkObject(Object object, String str) {
        if (str.equals("userDTO")) {
            return checkUser(object);
        } else if (str.equals("saveOrder")) {
            return checkSaveOrder(object);
        } else if (str.equals("cartDTO")) {
            return checkCartDTO(object);
        }
        return null;
    }

    public String checkUser(Object object) {
        String result = null;
        if (object instanceof UserDTO) {
            UserDTO userDTO = (UserDTO) object;
            if (checkStr(userDTO.getUserName())) {
                result = returnMessage.get("USER_NAME_NOT_NULL");
            } else if (checkStr(userDTO.getPassword())) {
                result = returnMessage.get("PASSWORD_NOT_NULL");
            } else if (checkStr(userDTO.getName())) {
                result = returnMessage.get("NAME_NOT_NULL");
            } else if (checkLong(userDTO.getPhone())) {
                result = returnMessage.get("PHONE_NOT_NULL");
            }
        }
        return result;
    }

    String checkSaveOrder(Object object) {
        String result = null;
        if (object instanceof Order) {
            Order order = (Order) object;
            if (checkInt(order.getSendAddressId())) {
                result = returnMessage.get("SYSTEM_ERROR");
            }
        }
        return result;
    }

    String checkCartDTO(Object object) {
        String result = null;
        if (object instanceof CartDTO) {
            CartDTO cartDTO = (CartDTO) object;
            if (cartDTO.getClothesId() == 0) {
                result = returnMessage.get("SYSTEM_ERROR");
            } else if (checkStr(cartDTO.getSize())) {
                result = returnMessage.get("SIZE_NOT_NULL");
            } else if (checkStr(cartDTO.getImgAddress())) {
                result = returnMessage.get("SYSTEM_ERROR");
            } else if (cartDTO.getNumber() == 0) {
                result = returnMessage.get("NUMBER_NOT_NULL");
            }
        }
        return result;
    }

    public boolean checkStr(String str) {
        return str == null || str.equals("");
    }

    public boolean checkLong(Long value) {
        return value == null || value == 0;
    }

    public boolean checkInt(Integer value) {
        return value == null || value == 0;
    }
}
