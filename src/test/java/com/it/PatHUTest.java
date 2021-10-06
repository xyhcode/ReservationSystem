package com.it;

import com.dao.PayTestDao;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class PatHUTest {
    SqlSession session;
    PayTestDao he;

    @Before
    public void init() throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        session=sqlSessionFactory.openSession();
        he=session.getMapper(PayTestDao.class);
    }

    @After
    public void ends(){
        session.commit();
        session.close();
    }

    @Test
    public void test01(){
      List lis=he.seall();
      System.out.println(lis);
    }
}
