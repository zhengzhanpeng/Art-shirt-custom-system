package com.zzp.YiYang.util;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Map;

/**
 * @author ho
 * @create 2017-12-09 10:41
 */
public class FileManageUtils {
    private Map<String, String> returnMessage;

    @Resource
    public void setReturnMessage(Map<String, String> returnMessage) {
        this.returnMessage = returnMessage;
    }

    public InputStream downLoadFile(String paths) {

        File file = new File(returnMessage.get("ROOT") + paths);
        try {
            return new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
