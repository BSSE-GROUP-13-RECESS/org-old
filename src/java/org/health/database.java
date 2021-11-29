package org.health;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Joshua
 */
public class database {
        protected static Connection initializeDatabase()
            throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/org","root","");
            return con;
        }
}