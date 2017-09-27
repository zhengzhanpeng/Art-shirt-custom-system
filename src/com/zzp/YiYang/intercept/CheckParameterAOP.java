package com.zzp.YiYang.intercept;

import com.zzp.YiYang.DTO.UserDTO;

/**
 * 抽象类的实现
 *
 * @author ho
 * @create 2017-09-26 14:58
 */
public class CheckParameterAOP extends CheckParameterAbstractAOP {
    @Override
    public String checkObject(Object object, String str) {
        if (str.equals("user")) {
            checkUser(object);
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

    public boolean checkStr(String str) {
        return str == null || str.equals("");
    }

    public boolean checkLong(Long value) {
        return value == null || value == 0;
    }
}
