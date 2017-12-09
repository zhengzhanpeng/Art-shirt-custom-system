package com.zzp.YiYang.Controller.maker;

import com.zzp.YiYang.Dao.OrderManageDao;
import com.zzp.YiYang.util.FileManageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author ho
 * @create 2017-12-07 16:39
 */
@Controller
@RequestMapping("/maker")
public class OrderManageController {
    private OrderManageDao orderManageDao;
    private FileManageUtils fileManageUtils;

    @Resource
    public void setFileManageUtils(FileManageUtils fileManageUtils) {
        this.fileManageUtils = fileManageUtils;
    }

    @Resource
    public void setOrderManageDao(OrderManageDao orderManageDao) {
        this.orderManageDao = orderManageDao;
    }

    @RequestMapping("/orderManage")
    public String orderManage() {
        return "/maker/order_manage";
    }

    @RequestMapping(value = "/getOrders", method = RequestMethod.POST)
    @ResponseBody
    public String getOrders() {
        String result = orderManageDao.getOrders();
        return result;
    }
    
    @RequestMapping(value = "/setPrice", method = RequestMethod.POST)
    @ResponseBody
    public String setPrice(int id, float price, String reason) {
        return orderManageDao.setPrice(id, price, reason);
    }

    @RequestMapping("/downByPath")
    public void downLoadImagesByPath(String paths,String fileName,HttpServletResponse response) throws IOException{

        //设置浏览器显示的内容类型为Zip  (很重要,欺骗浏览器下载的是zip文件,就不会自己打开了)
        response.setContentType("application/zip");
        //设置内容作为附件下载  fileName有后缀,比如1.jpg
        response.setHeader("Content-Disposition", "attachment; filename="+ new String( fileName.getBytes("utf-8"), "ISO8859-1" ));
        ServletOutputStream out = null;
        try {
            // 通过文件路径获得File对象(假如此路径中有一个download.pdf文件)
            InputStream inputStream = fileManageUtils.downLoadFile(paths);//此处是为了获得输出流
            // 3.通过response获取ServletOutputStream对象(out)
            out = response.getOutputStream();
            int b = 0;
            byte[] buffer = new byte[512];
            while (b != -1) {
                b = inputStream.read(buffer);
                // 4.写到输出流(out)中
                if (b == -1) {
                    break;
                }
                out.write(buffer, 0, b);
            }
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null)
                    out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (out != null)
                    out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/finish")
    @ResponseBody
    public String finish(int id) {
        return orderManageDao.finish(id);
    }
}
