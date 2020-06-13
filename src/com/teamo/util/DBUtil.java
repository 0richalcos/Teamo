package com.teamo.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库连接管理类
 * 
 * 获取配置文件加载、加载Mysql数据库驱动、获取数据库连接
 */
public class DBUtil {

    // 定义属性存储配置信息
    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    // 通过静态块加载配置文件
    static {
	// 创建配置文件对象
	Properties p = new Properties();
	try {
	    // 通过配置文件对象的load方式将本地化配置文件信息读取到内存中
	    p.load(DBUtil.class.getClassLoader().getResourceAsStream("jdbc.properties"));
	    // 通过getPropety方法获取value
	    driver = p.getProperty("driver");
	    url = p.getProperty("url");
	    username = p.getProperty("username");
	    password = p.getProperty("password");

	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

    // 定义一个获取数据库连接方法
    public static Connection getCon() {
	Connection con = null;
	try {
	    // 通过反射方式加载Mysql数据库驱动类
	    Class.forName(driver);
	    // 通过驱动管理类获取连接对象
	    con = DriverManager.getConnection(url, username, password);
	    System.out.println("数据库连接成功");
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	return con;
    }

    public static void main(String[] args) {
	DBUtil.getCon();
    }

}
