package com.it;

import com.dao.SearchTicketDao;
import com.tools.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class BookTicketTest {
    //测试订票
    @Test
    public void tes1() throws IOException {
        SqlSession session= GetSqlSession.getsSession();
        SearchTicketDao se=session.getMapper(SearchTicketDao.class);
        List lis=se.findoneflight(1);
        System.out.println(lis);
    }
}
