package com.hisoft.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by jh on 2017/1/12.
 */
public class BaseDao {


    public Connection getConnection() {
        Connection con = null;
        //加载驱动
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "1234");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }

    public int doUpdate(String sql, Object[] arr) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = this.getConnection();
            pst = con.prepareStatement(sql);
            int i = 1;
            for (Object a : arr) {
                pst.setObject(i, a);
                i++;
            }
            int counter = pst.executeUpdate();
            return counter;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


}
