package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.UserDTO;

/**
 * 管理用户模块
 *
 * @author ho
 * @create 2017-09-28 10:22
 */
public interface UserDao {
    String registerC(UserDTO userDTO);

    boolean checkRegister(String userName, String msg);
}
