/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FPTStudentBlog";
       // String url = "jdbc:sqlserver://LAPTOP-ADMKH3M5\\ENDY:1433;databaseName=FPTStudentBlog";
        Connection conn = DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
//    String url = "jdbc:sqlserver://localhost:1433;databaseName=FPTStudentBlog";
    //  public static void main(String[] args) throws ClassNotFoundException, SQLException {
    //      System.out.println(new DBUtils().getConnection());
    //  }
   
}
