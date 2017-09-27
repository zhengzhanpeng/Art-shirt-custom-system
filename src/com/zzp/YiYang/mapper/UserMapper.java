package com.zzp.YiYang.mapper;


import com.zzp.YiYang.DTO.UserDTO;

/**
 * @author ho
 * @create 2017-09-24 14:52
 */
public interface UserMapper {
    int addUser(UserDTO userDTO);

    int deleteUser(UserDTO userDTO);

    int setUser(UserDTO userDTO);
}
