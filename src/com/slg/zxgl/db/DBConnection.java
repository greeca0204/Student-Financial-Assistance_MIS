package com.slg.zxgl.db;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class DBConnection {
	public static Connection getConnection(){
		Connection con = null; //定义一个MYSQL链接对象
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con =DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/slgzzgldb","root","");
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return con;
	}
	@Test
	public void testCon(){
		System.out.println(DBConnection.getConnection());
	}
}
