package com.zzp.YiYang.DTO;

/**
 * 仅存放访问icon页面访问用到的类的信息
 *
 * @author ho
 * @create 2017-09-27 16:25
 */
public class IconDTO {
    private int id;
    private String name;
    private String desc;
    private String imgAddress;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImgAddress() {
        return imgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress;
    }
}
