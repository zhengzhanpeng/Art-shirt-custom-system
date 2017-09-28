package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.pojo.Icon;

import java.util.List;

/**
 * 管理用户模块
 *
 * @author ho
 * @create 2017-09-28 10:22
 */
public interface UserDao {
    List<Icon> getRecommendIcon();
    String registerC(UserDTO userDTO);
}
