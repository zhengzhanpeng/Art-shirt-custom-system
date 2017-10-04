package com.zzp.YiYang.DTO;

/**
 * 用于用户自定义商品立即购买时，接收前台数据
 *
 * @author ho
 * @create 2017-09-29 19:20
 */
public class BuyAtOnceDTO {
    private int clothesId;
    private String size;
    private float realityPrice;
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

    public float getRealityPrice() {
        return realityPrice;
    }

    public void setRealityPrice(float realityPrice) {
        this.realityPrice = realityPrice;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
