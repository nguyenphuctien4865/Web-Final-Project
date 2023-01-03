package com.newspaper.app.utils;

/*
import org.sql2o.Connection;
*/
import org.sql2o.Sql2o;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtils {
  /*static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/newspaper_webiste", "root", "4865");
  public static Connection getConnection() {
    return sql2o.open();
  }*/
  public static Connection initializeDatabase() throws SQLException, ClassNotFoundException{
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newspaper_webiste", "root", "4865");
      return conn;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }
}
