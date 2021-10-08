//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.action;


import com.dao.LoginDao;
import com.entity.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

/**
 * @author 羡羡
 */
public class LoginAction extends ActionSupport {

//    账户
    String account;
//    密码
    String password;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//    登录
    public String login() throws Exception {
        SqlSession session = GetSqlSession.getsSession();
        LoginDao dao = session.getMapper(LoginDao.class);

        UserInfo userInfo = new UserInfo();
        userInfo.setAccount(account);
        userInfo.setPassword(password);
        List l = dao.sign(userInfo);

        /*设置用户session*/
        ActionContext.getContext().getSession().put("userSession",l);

        if(l.size() == 0){
            return "error";
        }

        return SUCCESS;
    }

//    退出
    public String exit() throws Exception {

//        ActionContext.getContext().getSession().remove("userSession");
        ActionContext.getContext().getSession().clear();

        return SUCCESS;
    }

}
