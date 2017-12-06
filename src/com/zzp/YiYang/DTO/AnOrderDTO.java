package com.zzp.YiYang.DTO;

import com.zzp.YiYang.pojo.SendAddress;

/**
 * @author ho
 * @create 2017-12-06 15:26
 */
public class AnOrderDTO {
    private int id;
    private SendAddress sendAddress;
    private float realityPrice;
    private int sendType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SendAddress getSendAddress() {
        return sendAddress;
    }

    public void setSendAddress(SendAddress sendAddress) {
        this.sendAddress = sendAddress;
    }

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
    }

    public int getSendType() {
        return sendType;
    }

    public void setSendType(int sendType) {
        this.sendType = sendType;
    }
}
