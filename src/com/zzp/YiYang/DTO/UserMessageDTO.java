package com.zzp.YiYang.DTO;

/**
 * 超级管理员获取用户信息用类
 *
 * @author ho
 * @create 2017-10-04 19:32
 */
public class UserMessageDTO {
    private String name;
    private String userName;
    private String authority;
    private long phone;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }
}
