package com.zzp.YiYang.pojo;

/**
 * @author ho
 * @create 2017-09-27 9:05
 */
public class Clothes {
    private int id;
    private String name;
    private String type;
    private float price;
    private float realityPrice;
    private String imgAddress;
    private String backImgAddress;
    private String desc1;
    private boolean isFinished;

    public Clothes() {
    }

    public Clothes(String name, String type, float price, float realityPrice, String imgAddress, String desc1, boolean isFinished) {
        this.name = name;
        this.type = type;
        this.price = price;
        this.realityPrice = realityPrice;
        this.imgAddress = imgAddress;
        this.desc1 = desc1;
        this.isFinished = isFinished;
    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
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

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1;
    }

    public boolean isFinished() {
        return isFinished;
    }

    public void setFinished(boolean finished) {
        isFinished = finished;
    }
}
