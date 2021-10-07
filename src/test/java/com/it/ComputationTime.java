package com.it;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import org.junit.Test;

import java.util.Date;

public class ComputationTime {
    @Test
    public void comtime(){
        String dateStr1 = "2017-03-01 22:33:23";
        Date date1 = DateUtil.parse(dateStr1);

        String dateStr2 = "2017-04-01 23:33:23";
        Date date2 = DateUtil.parse(dateStr2);

        //相差一个月，31天
        long betweenDay = DateUtil.between(date1, date2, DateUnit.DAY);
        System.out.println(betweenDay);
    }


    @Test
    public  void tes2(){
        Date da=new Date();
        String formatTime = DateUtil.formatTime(da);
        System.out.println(formatTime);
    }

    @Test
    public void test3(){
        String today= DateUtil.today();
        Date date = DateUtil.parse(today);

        String oldday="2020-10-05";
        Date olddate = DateUtil.parse(oldday);
        if(date.getTime()>olddate.getTime()){
            System.out.println("date大");
        }else{
            System.out.println("date小");
        }
    }
}
