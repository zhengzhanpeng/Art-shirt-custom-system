package com.zzp.YiYang.pojo;

/**
 * @author ho
 * @create 2017-09-30 18:48
 */
public class User {
    private String userName;
    private String password;
    private boolean enabled;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
