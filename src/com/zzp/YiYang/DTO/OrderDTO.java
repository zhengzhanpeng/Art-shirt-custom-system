package com.zzp.YiYang.DTO;

import com.zzp.YiYang.pojo.SendAddress;

import java.util.List;

/**
 * 用于用户支付页面查看订单信息时返回给前台数据
 * @author ho
 * @create 2017-09-30 15:32
 */
public class OrderDTO {
    private int id;
    private List<SendAddress> sendAddresses;
    private float realityPrice;
    private int sendTime;
    private int invoice;
    private List<ItemDTO> itemDTOs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<SendAddress> getSendAddresses() {
        return sendAddresses;
    }

    public void setSendAddresses(List<SendAddress> sendAddresses) {
        this.sendAddresses = sendAddresses;
    }

    public int getSendTime() {
        return sendTime;
    }

    public void setSendTime(int sendTime) {
        this.sendTime = sendTime;
    }

    public int getInvoice() {
        return invoice;
    }

    public void setInvoice(int invoice) {
        this.invoice = invoice;
    }

    public List<ItemDTO> getItemDTOs() {
        return itemDTOs;
    }

    public void setItemDTOs(List<ItemDTO> itemDTOs) {
        this.itemDTOs = itemDTOs;
    }

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
    }
}
