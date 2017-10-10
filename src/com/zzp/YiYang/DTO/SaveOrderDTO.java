package com.zzp.YiYang.DTO;

/**
 * 用于保存用户修改的订单信息
 *
 * @author ho
 * @create 2017-09-30 16:08
 */
public class SaveOrderDTO {
    private int id;
    private int sendAddressId;
    private int sendTime;
    private int invoice;
    private String desc1;

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

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1;
    }
}
