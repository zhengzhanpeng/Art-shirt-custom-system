package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.util.EmailHelper;
import com.zzp.YiYang.util.EncryptionUtil;
import com.zzp.YiYang.util.RegisterMail;

import java.util.ResourceBundle;

/**
 * 与邮箱有关的基本操作
 *
 * @author ho
 * @create 2017-11-09 15:46
 */
public class EmailOperation {
    private static final String salt = EncryptionUtil.getRandom(); //用于用户验证邮箱的盐
    private static final ResourceBundle bundle = ResourceBundle.getBundle("config.register");

    public static void sendRegister(String name, String userName, String email) {
        String msg = EncryptionUtil.getHash(userName + salt, "MD5");
        String URL = bundle.getString("companyURL") + "/checkRegister/" + userName + "/" + msg;
        String content = RegisterMail.getRegisterMailMessage(name, URL);
        EmailHelper.sendEmail(email, "艺扬网注册验证", content);
    }

    public static boolean checkRegister(String userName, String msg) {
        String msg2 = EncryptionUtil.getHash(userName + salt, "MD5");
        return msg.equals(msg2) ? true : false;
    }
}
