package com.it;

import org.junit.Test;

public class ARateTest {
    //满座率=乘坐人数/位置个数
    //保存率
    @Test
    public void testara(){
        int cz=15;
        int jk=300;
        double ara=((double)cz / (double)jk)*100;
        System.out.println(ara);
    }
}
