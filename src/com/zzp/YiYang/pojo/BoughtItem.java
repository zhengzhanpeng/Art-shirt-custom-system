package com.zzp.YiYang.pojo;

/**
 * @author ho
 * @create 2017-12-01 11:18
 */
public class BoughtItem {
    private int id;
    private int orderId;
    private int goodsId;
    private String imgAddress;
    private String backImgAddress;
    private int number;
    private double realityPrice;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getImgAddress() {
        return imgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress;
    }

    public String getBackImgAddress() {
        return backImgAddress;
    }

    public void setBackImgAddress(String backImgAddress) {
        this.backImgAddress = backImgAddress;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(double realityPrice) {
        this.realityPrice = realityPrice;
    }
}
