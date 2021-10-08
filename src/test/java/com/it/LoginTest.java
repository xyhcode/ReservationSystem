package com.it;

import com.dao.LoginDao;
import com.entity.UserInfo;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class LoginTest {

    @Test
    public void t1() throws IOException {

        SqlSession session = GetSqlSession.getsSession();
        LoginDao dao = session.getMapper(LoginDao.class);

        UserInfo userInfo = new UserInfo();
        userInfo.setAccount("lisi");
        userInfo.setPassword("123");
        List l = dao.sign(userInfo);

        System.out.println(l);

    }


}
