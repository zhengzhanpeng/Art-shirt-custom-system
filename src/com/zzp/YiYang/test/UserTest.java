package com.zzp.YiYang.test;

import com.zzp.YiYang.DTO.UserDTO;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author ho
 * @create 2017-10-04 19:48
 */
public class UserTest {
    public static void main(String[] args) {
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("classpath:config/spring/spring-applicationContext.xml");
        addUser(beanFactory);
    }

    public static void addUser(BeanFactory beanFactory) {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserName("admin");
        userDTO.setPassword(MainUtil.hashpw("dengni"));
        userDTO.setAuthority("ROLE_SUPER_ADMIN");
        userDTO.setName("郑占鹏");
        userDTO.setPhone(15512778965L);
        UserMapper userMapper = (UserMapper) beanFactory.getBean("userMapper");
        userMapper.addUser(userDTO);
    }

}
