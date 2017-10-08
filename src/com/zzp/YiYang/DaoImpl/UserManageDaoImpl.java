package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.DTO.UserMessageDTO;
import com.zzp.YiYang.Dao.UserManageDao;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.User;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author ho
 * @create 2017-10-06 9:22
 */
public class UserManageDaoImpl implements UserManageDao {
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<UserMessageDTO> getUsers() {
        List<UserMessageDTO> list = userMapper.getUsers();
        return list;
    }

    @Override
    public String deleteUser(String userName) {
        int result = userMapper.delete(userName);
        if (result == 0) {
            return MessageUtil.USER_NOT_EXIST;
        }
        return "1";
    }

    @Override
    public String setUserPassword(String userName, String password) {
        User user = new User();
        user.setPassword(MainUtil.hashpw(password));
        user.setUserName(userName);
        int result = userMapper.setPassword(user);
        if (result == 0) {
            return MessageUtil.USER_NOT_EXIST;
        }
        return "1";
    }

    @Override
    public String addUser(UserDTO userDTO) {
        return UserDaoImpl.addUser(userDTO, userMapper);
    }

    @Override
    public String setUser(UserDTO userDTO) {
        userMapper.setUser(userDTO);
        return "1";
    }
}
