package com.zzp.YiYang.intercept;

import com.zzp.YiYang.DTO.AddGoodsDTO;
import com.zzp.YiYang.DTO.AddIconDTO;
import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.pojo.Order;
import com.zzp.YiYang.pojo.SendAddress;
import com.zzp.YiYang.util.MessageUtil;

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
        } else if (str.equals("addIconDTO")) {
            return checkAddIconDTO(object);
        } else if (str.equals("saveIcon")) {
            return checkSaveIcon(object);
        } else if (str.equals("sendAddress")) {
            return checkSendAddress(object);
        } else if (str.equals("addGoodsDTO")) {
            return checkAddGoodsDTO(object);
        }
        return null;
    }

    private String checkAddGoodsDTO(Object object) {
        if (object instanceof AddGoodsDTO) {
            AddGoodsDTO addGoodsDTO = (AddGoodsDTO) object;
            if (checkStr(addGoodsDTO.getName())) {
                return MessageUtil.CLOTHES_NAME_NOT_NULL;
            }
            if (checkStr(addGoodsDTO.getType())) {
                return MessageUtil.CLOTHES_TYPE_NOT_NULL;
            }
            if (addGoodsDTO.getPrice() == 0) {
                return MessageUtil.PRICE_ERROR;
            }
            if (addGoodsDTO.getRealityPrice() == 0) {
                return MessageUtil.REALITY_PRICE_ERROR;
            }
            if (checkStr(addGoodsDTO.getImgAddress())) {
                return MessageUtil.PROPERTY_NOT_NULL;
            }
            if (addGoodsDTO.getSizeNumber() == null) {
                return MessageUtil.SYSTEM_ERROR;
            }
        }
        return null;
    }

    private String checkSendAddress(Object object) {
        if (object instanceof SendAddress) {

        }
        return null;
    }

    private String checkSaveIcon(Object object) {
        if (object instanceof AddIconDTO) {
            String result = null;
            AddIconDTO addIconDTO = (AddIconDTO) object;
            result = checkAddIconDTO(object);
            if (result != null) {
                return result;
            }
            if (checkInt(addIconDTO.getId())) {
                return MessageUtil.SYSTEM_ERROR;
            }
        }
        return null;
    }

    private String checkAddIconDTO(Object object) {
        if (object instanceof AddIconDTO) {
            AddIconDTO addIconDTO = (AddIconDTO) object;
            if (checkStr(addIconDTO.getName())) {
                return MessageUtil.ICON_NOT_NULL;
            }
            if (checkStr(addIconDTO.getImgAddress())) {
                return MessageUtil.IMG_NOT_NULL;
            }
            if (addIconDTO.getTypes().length == 0) {
                return MessageUtil.TYPES_NOT_NULL;
            }
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
