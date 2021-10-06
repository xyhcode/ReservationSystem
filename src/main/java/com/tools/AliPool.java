package com.tools;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import com.alibaba.druid.pool.DruidDataSource;

/**
 * 阿里连接池
 * @author sanzang
 *
 */
public class AliPool {

    static DruidDataSource ds;
    //只会运行一次
    static {
        String fname ="druid.properties";
        InputStream file= AliPool.class.getClassLoader().getResourceAsStream(fname);
        Properties prop = new Properties();
        try {
            prop.load(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //读取文件
        String driver =prop.getProperty("driver");
        String url =prop.getProperty("url");
        String name =prop.getProperty("username");
        String pass =prop.getProperty("password");
        // 配置连接池
        ds = new DruidDataSource();
        ds.setDriverClassName(driver);
        ds.setUrl( url );
        ds.setUsername( name);
        ds.setPassword( pass);
    }

    // 池里取连接
    public static Connection getConn() {
        Connection conn = null;
        try {
            conn= ds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

}

