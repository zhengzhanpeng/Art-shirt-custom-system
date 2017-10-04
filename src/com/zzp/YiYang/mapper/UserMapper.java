package com.zzp.YiYang.mapper;


import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.pojo.User;

/**
 * @author ho
 * @create 2017-09-24 14:52
 */
public interface UserMapper {
    int addUser(UserDTO userDTO);

    User getUser(String userName);
}
