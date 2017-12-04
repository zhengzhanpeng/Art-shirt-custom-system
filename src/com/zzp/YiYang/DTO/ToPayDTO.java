package com.zzp.YiYang.DTO;

/**
 * @author ho
 * @create 2017-12-04 17:48
 */
public class ToPayDTO {
    private int id;
    private int sendAddressId;
    private String desc1;
    private int sendType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSendAddressId() {
        return sendAddressId;
    }

    public void setSendAddressId(int sendAddressId) {
        this.sendAddressId = sendAddressId;
    }

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1;
    }

    public int getSendType() {
        return sendType;
    }

    public void setSendType(int sendType) {
        this.sendType = sendType;
    }
}
