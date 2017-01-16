package com.hisoft.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conn {
	static Connection conn;
	static Statement sql;
	public static Connection getConnection(){
		// 1锟斤拷锟斤拷JDBC锟斤拷锟斤拷锟�
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("锟斤拷菘锟斤拷锟斤拷锟截成癸拷");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 2锟结供JDBC锟斤拷锟接碉拷url
		String url = "jdbc:mysql://localhost:3306/test?useSSL=false" ;    
		String username = "root" ;   
	    String password = "1234" ;   
		try {
			conn=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("锟斤拷菘锟斤拷锟斤拷映晒锟�);
		return conn;
	}
}
