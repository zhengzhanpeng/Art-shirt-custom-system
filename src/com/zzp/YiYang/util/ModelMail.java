package com.zzp.YiYang.util;

/**
 * 通用的邮件发送格式
 *
 * @author ho
 * @create 2017-12-10 14:25
 */
public class ModelMail {
    private static String str1 = "<!DOCTYPE html>\n" +
            "<html lang=\"en\">\n" +
            "<head>\n" +
            "    <meta charset=\"GBK2312\">\n" +
            "    <title>Title</title>\n" +
            "</head>\n" +
            "<body>\n" +
            "<table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"border: 0;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "    <tbody><tr style=\"background-color: #7cb228;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;height: 50px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: middle;text-align: left;\"></td>\n" +
            "    </tr>\n" +
            "</tbody></table>\n" +
            "<table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #fff;border-width: 1px;border-style: solid;border-color: #cccccc;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "    <tbody><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "        <td style=\"border: 0;height: 40px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 18px;color: #666666;\"><span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" data=\"714586750\">尊敬的客户</span>，您好：</td>\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "    </tr>\n" +
            "\n" +
            "    <tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "        <td style=\"border: 0;height: 35px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 14px;color: #666666;\">";
    private static String str2 = "</td>\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "    </tr>\n" +
            "\n" +
            "    \n" +
            "\n" +
            "    <tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "        <td style=\"border: 0;height: 35px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 14px;color: #999999;\"> </td>\n" +
            "        <td style=\"border: 0;width: 18px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "    </tr>\n" +
            "\n" +
            "    <tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td colspan=\"3\" style=\"border: 0;height: 130px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\"></td>\n" +
            "    </tr>\n" +
            "<table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"border: 0;margin-top: 0;margin-right: auto;margin-bottom: 0;margin-left: auto;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "    <tbody><tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;\">\n" +
            "            为确保我们发送给您的信息不被当做垃圾邮件，请把艺扬网<a href=\"\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #0066cc;text-decoration: none;vertical-aling: bottom;\">\n" +
            "            &nbsp;support@service.yiyang.com </a>添加为您的联系人\n" +
            "        </td>\n" +
            "    </tr>\n" +
            "    <tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;\">\n" +
            "            本邮件由艺扬网系统自动发出，请勿直接回复！ 如果您有任何疑问或建议，请<a href=\"javascript:void(0);\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #0066cc;text-decoration: none;vertical-align: bottom;\" target=\"_blank\">联系我们</a>。\n" +
            "        </td>\n" +
            "    </tr>\n" +
            "    <tr style=\"margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;\">\n" +
            "        <td style=\"border: 0;height: 20px;margin-top: 0;margin-right: 0;margin-bottom: 0;margin-left: 0;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;vertical-align: bottom;font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #999999;text-align: center;vertical-align: bottom;\">公司网址：<a href=\"\" style=\"font-family: Arial,STHeiti, Microsoft YaHei, simsun, Helvetica, sans-serif;color: #999999;font-size: 12px;color: #0066cc;text-decoration: none;\" target=\"_blank\">www.yiyang.com</a></td>\n" +
            "    </tr>\n" +
            "</tbody></table>\n" +
            "</tbody></table>\n" +
            "</body>";

    public static String getContent(String content) {
        return str1 + content + str2;
    }
}
