package com.zzp.YiYang.util;

import java.util.ResourceBundle;

/**
 * 用于生成验证用户邮箱时的邮件信息
 * STR为发送邮件的模板，每个str间的间隔都插入指定信息。
 * 其顺序依次为：companyURL、logo、name、companyName、URL、URL、companyName、companyEmail、companyName、
 * QQ、companyURL、companyURL
 * @author ho
 * @create 2017-11-09 10:16
 */
public class RegisterMail {
    private static final String STR1 = "<table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"border: 0;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><tbody><tr style=\"background-color: #7cb228;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;height: 50px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: middle;text-align: left;\"><a href=\"";
    private static final String STR2 = "\" target=\"_blank\"><img src=\"";
    private static final String STR3 = "\" style=\"display: block;width: 128px;height: 30px;border: 0;\"></a></td></tr></tbody></table><table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #fff;border-width: 1px;border-style: solid;border-color: #cccccc;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><tbody><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td><td style=\"border: 0;height: 40px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 18px;color: #666666;\"><span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" data=\"\">尊敬的客户 ";
    private static final String STR4 = "</span>，您好：</td><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td><td style=\"border: 0;height: 35px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 14px;color: #666666;\">感谢您注册";
    private static final String STR5 = "，请点击以下链接激活您的邮箱地址：</td><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td colspan=\"3\" style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td><td style=\"border: 0;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;\"><a href=\"";
    private static final String STR6 = "\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 14px;color: #0066cc;text-decoration: underline;word-wrap:break-word; word-break: break-all;\" target=\"_blank\">";
    private static final String STR7 = "</a></td><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td><td style=\"border: 0;height: 35px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 14px;color: #999999;\">如果以上链接无法访问，请将该网址复制并粘贴至浏览器窗口中直接访问。</td><td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td colspan=\"3\" style=\"border: 0;height: 130px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td></tr><table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"border: 0;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><tbody><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;\">为确保我们发送给您的信息不被当做垃圾邮件，请把";
    private static final String STR8 = "<a href=\"\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #0066cc;text-decoration: none;vertical-aling: bottom;\">&nbsp;";
    private static final String STR9 = "</a>添加为您的联系人</td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;\">本邮件由";
    private static final String STR10 = "系统自动发出，请勿直接回复！ 如果您有任何疑问或建议，请联系我们，QQ：";
    private static final String STR11 = "。</td></tr><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"><td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;vertical-align: bottom;\">公司网址：<a href=\"";
    private static final String STR12 = "\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #0066cc;text-decoration: none;\" target=\"_blank\">";
    private static final String STR13 = "</a></td></tr></tbody></table></tbody></table>";

    private static final ResourceBundle bundle = ResourceBundle.getBundle("config.register");
    private static final String logo = bundle.getString("logo");
    private static final String companyName = bundle.getString("companyName");
    private static final String companyURL = bundle.getString("companyURL");
    private static final String QQ = bundle.getString("QQ");
    private static final String companyEmail = bundle.getString("companyEmail");

    private static String s1;  //用于连接用户名和验证邮箱的URL的拼接字符串
    private static String s2;  //s1后跟name; s2、s3后跟URL；
    private static String s3;
    private static String s4;

    static {
        s1 = STR1 + companyURL + STR2 + logo + STR3;
        s2 = STR4 + companyName + STR5;
        s3 = STR6;
        s4 = STR7 + companyName + STR8 + companyEmail + STR9 + companyName + STR10 + QQ + STR11 + companyURL + STR12 + companyURL + STR13;
    }

    public static String getRegisterMailMessage(String name, String URL) {
        return s1 + name + s2 + URL + s3 + URL + s4;
    }
}
