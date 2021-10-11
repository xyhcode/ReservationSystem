package com.it;

import cn.hutool.core.util.DesensitizedUtil;
import org.junit.Test;

public class JmTest {

    @Test
    public void t1(){

        String dd = DesensitizedUtil.mobilePhone("17507328304");
        String dd2 = DesensitizedUtil.idCardNum("431024200405264230",1,2);
        System.out.println(dd);
        System.out.println(dd2);

    }
}
