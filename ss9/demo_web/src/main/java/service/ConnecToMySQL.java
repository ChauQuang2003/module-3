package service;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class ConnecToMySQL {
    private static final String URL = "jdbc:mysql://localhost:3306/room";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            return null;
        }
    }
}
