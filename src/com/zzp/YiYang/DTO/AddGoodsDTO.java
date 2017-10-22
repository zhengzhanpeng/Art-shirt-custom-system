package com.zzp.YiYang.DTO;

/**
 * 添加Clothes时接收前台的数据
 *
 * @author ho
 * @create 2017-10-09 19:37
 */
public class AddGoodsDTO {
    private int id;
    private String name;
    private String type;
    private float price;
    private float realityPrice;
    private String desc1;
    private String imgAddress;
    private String backImgAddress;
    private boolean finished;
    private String finishedStr;
    private boolean reco;
    private String recoStr;
    private int[] sizeNumber;


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

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1;
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

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public int[] getSizeNumber() {
        return sizeNumber;
    }

    public void setSizeNumber(int[] sizeNumber) {
        this.sizeNumber = sizeNumber;
    }

    public String getFinishedStr() {
        return finishedStr;
    }

    public void setFinishedStr(String finishedStr) {
        this.finishedStr = finishedStr;
    }

    public boolean isReco() {
        return reco;
    }

    public void setReco(boolean reco) {
        this.reco = reco;
    }

    public String getRecoStr() {
        return recoStr;
    }

    public void setRecoStr(String recoStr) {
        this.recoStr = recoStr;
    }
}
