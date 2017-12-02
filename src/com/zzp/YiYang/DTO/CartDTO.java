package com.zzp.YiYang.DTO;

/**
 * 用于添加商品至购物车时接收前台的数据
 *
 * @author ho
 * @create 2017-09-28 21:18
 */
public class CartDTO {
    private int clothesId;
    private String size;
    private String imgAddress;
    private String backImgAddress;
    private int number;

    public int getClothesId() {
        return clothesId;
    }

    public void setClothesId(int clothesId) {
        this.clothesId = clothesId;
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

    public String getBackImgAddress() {
        return backImgAddress;
    }

    public void setBackImgAddress(String backImgAddress) {

        this.backImgAddress = backImgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress;

    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
