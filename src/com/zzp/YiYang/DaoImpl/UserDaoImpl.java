package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.Dao.UserDao;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.pojo.User;
import com.zzp.YiYang.util.EmailHelper;
import com.zzp.YiYang.util.EncryptionUtil;
import com.zzp.YiYang.util.MessageUtil;
import com.zzp.YiYang.util.RegisterMail;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.annotation.Resource;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * @author ho
 * @create 2017-09-30 16:36
 */
public class UserDaoImpl implements UserDao {
    private UserMapper userMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 检验用户名密码是否正确，若正确则发送验证邮箱
     * @param userName
     * @param password
     * @return
     */
    @Override
    public boolean checkUserAndSendEmail(String userName, String password) {
        if (userName == null || password == null) {
            return false;
        }
        UserDTO userDTO = userMapper.getUserAll(userName);
        String hashPassword = userDTO.getPassword();
        boolean result;
        if (hashPassword == null) {
            return false;
        }
        result = BCrypt.checkpw(password, hashPassword);
        if (result) {
            EmailOperation.sendRegister(userDTO.getName(), userDTO.getUserName(), userDTO.getEmail());
        }
        return result;
    }

    @Override
    public boolean checkRegister(String userName, String msg) {
        boolean result = EmailOperation.checkRegister(userName, msg);  //检验信息是否正确
        if (result) {
            User user = new User();
            user.setUserName(userName);
            user.setEnabled(true);
            userMapper.setEnabled(user);
        }
        return result;
    }

    @Override
    public String registerC(UserDTO userDTO) {
        String result = addUser(userDTO, userMapper);
        if (result.equals("1")) {
            EmailOperation.sendRegister(userDTO.getName(), userDTO.getUserName(), userDTO.getEmail());
        }
        return result;
    }

    public static String addUser(UserDTO userDTO, UserMapper userMapper) {
        String password = BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt());
        userDTO.setPassword(password);
        User user = userMapper.getUser(userDTO.getUserName());
        int result = 0;
        if (user == null) {
            synchronized (userMapper) {
                user = userMapper.getUser(userDTO.getUserName());
                if (user == null) {
                    result = userMapper.addUser(userDTO);
                }
            }
        }
        if (result == 0) {
            return MessageUtil.USER_NAME_EXIST;
        }
        return "1";
    }
}
