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
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class RegisterAction extends ActionSupport {

    public RegisterAction() {
    }

    public String register() throws Exception {
        SqlSession session = GetSqlSession.getsSession();
        RegisterDao dao = (RegisterDao)session.getMapper(RegisterDao.class);

        HttpServletRequest Request = ServletActionContext.getRequest();
        String password = Request.getParameter("passwordone");
        String name = Request.getParameter("name");
        String phone = Request.getParameter("phone");
        String card = Request.getParameter("card");
        UserInfo userInfo = new UserInfo();
        userInfo.setPassword(password);
        userInfo.setName(name);
        userInfo.setIdCard(card);
        userInfo.setPhone(phone);
        int n = dao.registeradd(userInfo);
        session.commit();
        session.close();
        return n > 0 ? "success" : "error";
    }
}
