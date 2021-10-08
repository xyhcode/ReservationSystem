//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.entity;

public class UserInfo {
    int usId;
    String account;
    String password;
    String name;
    String phone;
    String idCard;

    public UserInfo() {
    }

    public UserInfo(String account, String password, String name, String phone, String idCard) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.idCard = idCard;
    }

    public String toString() {
        return "\nUserInfo{usId=" + this.usId + ", account='" + this.account + '\'' + ", password='" + this.password + '\'' + ", name='" + this.name + '\'' + ", phone='" + this.phone + '\'' + ", idCard='" + this.idCard + '\'' + '}';
    }

    public int getUsId() {
        return this.usId;
    }

    public void setUsId(int usId) {
        this.usId = usId;
    }

    public String getAccount() {
        return this.account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCard() {
        return this.idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }
}
