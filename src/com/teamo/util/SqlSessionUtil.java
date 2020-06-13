package com.teamo.util;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 获取SqlSession的工具类
 * 
 * @author Orichalcos
 *
 */
public class SqlSessionUtil {
    public static SqlSessionFactory build = null;

    static {
	try {
	    build = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("com/teamo/conf/mybatis.xml"));
	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

    public static SqlSession getSqlSession() {
	return build.openSession(true);
    }
}
