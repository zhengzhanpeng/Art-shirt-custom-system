package com.zzp.YiYang.pojo;

import java.util.Date;

/**
 * @author ho
 * @create 2017-10-01 15:31
 */
public class Order {
    private int id;
    private String userName;
    private int sendAddressId;
    private float realityPrice;
    private String desc1;
    private int state;
    private Date buyTime;
    private Date sendTime;
    private int sendType;  // 1.不限送货时间，周一至周日 2.工作日送货，周一至周五 3.双休日、假日送货，周六至周日

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getSendAddressId() {
        return sendAddressId;
    }

    public void setSendAddressId(int sendAddressId) {
        this.sendAddressId = sendAddressId;
    }

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
    }

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public int getSendType() {
        return sendType;
    }

    public void setSendType(int sendType) {
        this.sendType = sendType;
    }
}
