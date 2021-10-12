//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.action;


import com.dao.RegisterDao;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;


/**
 * @author 羡羡
 */
public class RegisterAction extends ActionSupport {

    public String phone;
    public String passwordone;

    public String yzm;

    public String getYzm() {
        return yzm;
    }

    public void setYzm(String yzm) {
        this.yzm = yzm;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPasswordone() {
        return passwordone;
    }

    public void setPasswordone(String passwordone) {
        this.passwordone = passwordone;
    }

    @Override
    public String execute() throws IOException {
        SqlSession session = GetSqlSession.getsSession();
        RegisterDao re=session.getMapper(RegisterDao.class);
        UserInfo usin=new UserInfo(phone,passwordone,null,phone, null);
        int cg=re.useradd(usin);
        session.commit();
        session.close();
        return SUCCESS;
    }
}
