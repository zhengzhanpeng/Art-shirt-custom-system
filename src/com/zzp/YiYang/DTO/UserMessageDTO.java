package com.zzp.YiYang.DTO;

/**
 * 超级管理员获取用户信息用类
 *
 * @author ho
 * @create 2017-10-04 19:32
 */
public class UserMessageDTO {
    private String name;
    private Long phone;
    private String userName;
    private String authority;

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

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }
}
