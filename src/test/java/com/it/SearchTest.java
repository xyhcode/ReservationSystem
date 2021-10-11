package com.it;

import cn.hutool.core.date.DateUtil;
import com.dao.SearchTicketDao;
import com.entity.FlightInfo;
import com.entity.OrderInfo;
import com.entity.UsinfoFlig;
import com.tools.GetSqlSession;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class SearchTest {
    SqlSession session;
    SearchTicketDao her;

    @Before
    public void init() throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        session=sqlSessionFactory.openSession();
        her=session.getMapper(SearchTicketDao.class);
    }

    @After
    public void ends(){
        session.commit();
        session.close();
    }

    @Test
    public void sealll(){
        String dateStr = "2021-10-05";
        Date date = DateUtil.parse(dateStr);
        FlightInfo fh=new FlightInfo();
        fh.setLeavecity("长沙");
        fh.setArrivecity("上海");
        fh.setDepartdate(date);
        List lis=her.seall(fh);
        System.out.println(lis);
    }




    @Test
    public void atest(){
        OrderInfo or=new OrderInfo();
        or.setUserid(2);
        or.setFligid(15);
        List lis=her.seuserorderinfo(or);
        System.out.println(lis);
    }



    @Test
    public  void tes01(){
        List info = her.seorderflig(2);

        for(int i=0;i<info.size();i++){
            UsinfoFlig fo = (UsinfoFlig)info.get(i);
            List list =  fo.flg;
            FlightInfo fli = (FlightInfo)list.get(0);
            System.out.println(fo);
        }

    }


    @Test
    public void tes1(){
        Date da=new Date();
        System.out.println(da);
        String dateStr = "2021-10-11 17:44:23";
        Date date = DateUtil.parse(dateStr);
        if(da.getTime()>date.getTime()){
            System.out.println("当前大");
        }else{
            System.out.println("2");
        }
    }
}
