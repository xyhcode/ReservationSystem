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
    /**
     * 电话
     */
    public String phone;
    /**
     * 密码
     */
    public String passwordone;
    /**
     * 验证码
     */
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
        //实例化
        UserInfo usin=new UserInfo(phone,passwordone,null,phone, null);
        //执行添加数据
        int cg=re.useradd(usin);
        //提交
        session.commit();
        session.close();
        return SUCCESS;
    }
}
