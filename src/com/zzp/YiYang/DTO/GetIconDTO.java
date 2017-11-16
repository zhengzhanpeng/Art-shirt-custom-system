package com.zzp.YiYang.DTO;

import com.zzp.YiYang.pojo.IconProperty;

import java.util.List;

/**
 * 管理员获取ICON时用到的bean
 * @author ho
 * @create 2017-10-10 19:18
 */
public class GetIconDTO {
    private int id;
    private String name;
    private String desc1;
    private String imgAddress;
    private boolean reco;
    private List<IconProperty> types;
    private int number;
    private String recoStr;
    private String typesStr;

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

    public boolean isReco() {
        return reco;
    }

    public void setReco(boolean reco) {
        this.reco = reco;
    }

    public List<IconProperty> getTypes() {
        return types;
    }

    public void setTypes(List<IconProperty> types) {
        this.types = types;
    }

    public String getRecoStr() {
        return recoStr;
    }

    public void setRecoStr(String recoStr) {
        this.recoStr = recoStr;
    }

    public String getTypesStr() {
        return typesStr;
    }

    public void setTypesStr(String typesStr) {
        this.typesStr = typesStr;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
