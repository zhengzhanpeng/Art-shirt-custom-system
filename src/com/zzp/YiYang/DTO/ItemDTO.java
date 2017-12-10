package com.zzp.YiYang.DTO;

/**
 * OrderDTO内使用
 *
 * @author ho
 * @create 2017-09-30 15:39
 */
public class ItemDTO {
    private int id;
    private String imgAddress;
    private String backImgAddress;
    private int number;
    private String size;
    private String name;
    private String type;
    private float realityPrice;
    private boolean isFinished;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
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

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
    }

    public boolean isFinished() {
        return isFinished;
    }

    public void setFinished(boolean finished) {
        isFinished = finished;
    }
}
