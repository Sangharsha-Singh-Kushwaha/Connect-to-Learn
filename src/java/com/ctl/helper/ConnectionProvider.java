package com.ctl.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                //create the connection 
                String url = "jdbc:mysql://localhost:3307/ctl?autoReconnect=true&useSSL=false";
                String user = "root";
                String password = "123";
                con = DriverManager.getConnection(url, user, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
