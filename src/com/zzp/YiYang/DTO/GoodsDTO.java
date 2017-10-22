package com.zzp.YiYang.DTO;

/**
 * 用于更新商品时传参，验证修改前是否与商品一致
 *
 * @author ho
 * @create 2017-10-20 16:46
 */
public class GoodsDTO {
    private int id;
    private int number;
    private int addNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getAddNumber() {
        return addNumber;
    }

    public void setAddNumber(int addNumber) {
        this.addNumber = addNumber;
    }
}
