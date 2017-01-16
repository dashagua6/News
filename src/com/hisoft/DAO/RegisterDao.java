package com.hisoft.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hisoft.db.Conn;

public class RegisterDao {
    private Connection con;

	/**
     * @return зЂВс
     */
    public boolean reg(String name,String pwd){
    	con = Conn.getConnection();
    	String sql="insert into userinfo(name,password) values(?,?))";
    	try {
			PreparedStatement prepareStatement = con.prepareStatement(sql);
			prepareStatement.setString(1, name);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return false;
    	
    }
}
