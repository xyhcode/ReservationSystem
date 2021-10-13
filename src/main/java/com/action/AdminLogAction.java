package com.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 羡羡
 */
public class AdminLogAction extends ActionSupport {
    /**
     * 用户账号
     */
    public String name;
    /**
     * 用户密码
     */
    public String pass;

    public int sta;

    public int getSta() {
        return sta;
    }

    public void setSta(int sta) {
        this.sta = sta;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String execute(){
        if("admin".equals(name) && "admin".equals(pass)){
            return SUCCESS;
        }else{
            sta=1;
            return ERROR;
        }
    }
}
