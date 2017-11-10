package com.zzp.YiYang.mapper;


import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.DTO.UserMessageDTO;
import com.zzp.YiYang.pojo.User;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-24 14:52
 */
public interface UserMapper {
    int addUser(UserDTO userDTO);

    User getUser(String userName);

    UserDTO getUserDTO(String userName);

    List<UserMessageDTO> getUsers();

    int delete(String userName);

    int setPassword(User user);

    void setUser(UserDTO userDTO);

    void setEnabled(User user);
}
