package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.Dao.UserDao;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.User;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author ho
 * @create 2017-09-30 16:36
 */
public class UserDaoImpl implements UserDao {
    private UserMapper userMapper;
    private Map<String, String> returnMessage;

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public String registerC(UserDTO userDTO) {
        String password = BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt());
        userDTO.setPassword(password);
        User user = userMapper.getUser(userDTO.getUserName());
        int result = 0;
        if (user == null) {
            synchronized (this) {
                if (user == null) {
                    result = userMapper.addUser(userDTO);
                }
            }
        }
        if (result == 0) {
            return returnMessage.get("USER_NAME_EXIST");
        }
        return "1";
    }
}
