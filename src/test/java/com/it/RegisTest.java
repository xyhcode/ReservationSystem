package com.it;

import com.dao.RegisterDao;
import com.entity.UserInfo;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.io.IOException;

public class RegisTest {
    @Test
   public void set() throws IOException {
        SqlSession session = GetSqlSession.getsSession();
        RegisterDao re=session.getMapper(RegisterDao.class);
        UserInfo usin=new UserInfo("182","123","张三","123", "12121212");
       int a= re.useradd(usin);
       System.out.println(a);
   }
}
