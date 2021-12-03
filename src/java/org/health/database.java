//package org.health;
//
//import java.sql.*;
//
//public class database {
//    //for sqlite
//    protected static Connection initSqliteDb(String dbPath) throws SQLException, ClassNotFoundException {
//        Class.forName("org.sqlite.JDBC");
//        dbPath = dbPath.substring(0,dbPath.indexOf("org"))+"org/database.sqlite";
//        return DriverManager.getConnection("jdbc:sqlite:"+dbPath);
//    }
//
//    public static ResultSet executeQuery(String query, String dbPath) throws SQLException, ClassNotFoundException {
//        Connection connection = initSqliteDb(dbPath);
//        Statement statement = connection.createStatement();
//        return statement.executeQuery(query);
//    }
//
//    public static int executeUpdate(String query, String dbPath) throws SQLException, ClassNotFoundException {
//        Connection connection = initSqliteDb(dbPath);
//        Statement statement = connection.createStatement();
//        return statement.executeUpdate(query);
//    }
//
//    //for mysql
//    protected static Connection initializeDatabase() throws SQLException, ClassNotFoundException{
//        Class.forName("com.mysql.jdbc.Driver");
//        return DriverManager.getConnection("jdbc:mysql://localhost:3306/org","root","");
//    }
//
//    public static ResultSet executeQuery(String query) throws SQLException, ClassNotFoundException {
//        Connection connection = initializeDatabase();
//        Statement statement = connection.createStatement();
//        return statement.executeQuery(query);
//    }
//
//    public static int executeUpdate(String query) throws SQLException, ClassNotFoundException {
//        Connection connection = initializeDatabase();
//        Statement statement = connection.createStatement();
//        return statement.executeUpdate(query);
//    }
//}