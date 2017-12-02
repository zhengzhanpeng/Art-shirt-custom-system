package com.zzp.YiYang.DTO;

/**
 * 用于接收购物车页面发送的要生成订单的信息
 *
 * @author ho
 * @create 2017-12-01 9:19
 */
public class GetCartDTO {
    private int id;
    private int clothesId;
    private String imgAddress;
    private String backImgAddress;
    private int number;
    private String size;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClothesId() {
        return clothesId;
    }

    public void setClothesId(int clothesId) {
        this.clothesId = clothesId;
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
}
