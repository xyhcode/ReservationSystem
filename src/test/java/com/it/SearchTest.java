package com.it;

import cn.hutool.core.date.DateUtil;
import com.dao.SearchTicketDao;
import com.tools.GetSqlSession;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class SearchTest {

    @Test
    public void searchtes() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao seatick=session.getMapper(SearchTicketDao.class);
        String dateStr = "2021-10-05";
        Date date = DateUtil.parse(dateStr, "yyyy-MM-dd");
        List lis=seatick.searchTicket("长沙","上海",date);
        System.out.println(lis);
    }

    @Test
    public void sea() throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        List lis=se.seall("长沙");
        System.out.println(lis);
    }
}
