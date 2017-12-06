package com.zzp.YiYang.DTO;

import com.zzp.YiYang.pojo.SendAddress;

import java.util.Date;
import java.util.List;

/**
 * 用户查看自己的订单时，返回的数据
 * @author ho
 * @create 2017-10-04 18:51
 */
public class MyOrderDTO {
    private int id;
    private SendAddress sendAddress;
    private float realityPrice;
    private int state;
    private Date sendTime;
    private String postNumber;
    private int sendType;
    private List<ItemDTO> itemDTOs;

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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getPostNumber() {
        return postNumber;
    }

    public void setPostNumber(String postNumber) {
        this.postNumber = postNumber;
    }

    public int getSendType() {
        return sendType;
    }

    public void setSendType(int sendType) {
        this.sendType = sendType;
    }

    public List<ItemDTO> getItemDTOs() {
        return itemDTOs;
    }

    public void setItemDTOs(List<ItemDTO> itemDTOs) {
        this.itemDTOs = itemDTOs;
    }
}
