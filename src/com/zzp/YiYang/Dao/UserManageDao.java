package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.DTO.UserMessageDTO;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-04 19:30
 */
public interface UserManageDao {
    List<UserMessageDTO> getUsers();

    String deleteUser(String userName);

    String setUserPassword(String userName, String password);

    String addUser(UserDTO userDTO);

    String setUser(UserDTO userDTO);
}
