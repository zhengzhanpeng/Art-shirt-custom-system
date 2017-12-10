package com.zzp.YiYang.pojo;

/**
 * 确认收货时，接收前台的快递订单信息
 *
 * @author ho
 * @create 2017-12-10 11:12
 */
public class ExpressMessage {
    private int id;
    private int orderId;
    private String name;
    private String number;
    private String pcd;

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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getPcd() {
        return pcd;
    }

    public void setPcd(String pcd) {
        this.pcd = pcd;
    }
}
