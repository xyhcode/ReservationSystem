//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.action;


import com.dao.LoginDao;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.ServletActionContext;

/**
 * @author 羡羡
 */
public class LoginAction extends ActionSupport {


    public String login() throws Exception {
        SqlSession session = GetSqlSession.getsSession();
        LoginDao dao = (LoginDao)session.getMapper(LoginDao.class);
        HttpServletRequest Request = ServletActionContext.getRequest();
        String account = Request.getParameter("username");
        String password = Request.getParameter("password");
        UserInfo userInfo = new UserInfo();
        userInfo.setAccount(account);
        userInfo.setPassword(password);
        List l = dao.sign(userInfo);
        int n = l.size();
        return n > 0 ? "success" : "error";
    }
}
