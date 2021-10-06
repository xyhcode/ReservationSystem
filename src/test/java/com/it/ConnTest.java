package com.it;

import com.tools.AliPool;
import org.junit.Test;

import java.sql.Connection;


public class ConnTest {
    @Test
    public void conn(){
        Connection conn= AliPool.getConn();
        System.out.println(conn);
    }
}
