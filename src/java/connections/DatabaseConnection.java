package connections;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author USER
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseConnection {
       public static Connection initializeDatabase()
        throws SQLException, ClassNotFoundException
    {
        // Initialize all the information regarding
        // Database Connection
        String dbDriver = "org.postgresql.Driver";
        String dbURL = "jdbc:postgresql://drona.db.elephantsql.com/ckuzazqf";
        // Database name to access
        String dbUsername = "ckuzazqf";
        String dbPassword = "uwbSrBS8zlWD_Ek2D5fydULd_5cL0Emk";
  
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL,
                                                     dbUsername, 
                                                     dbPassword);
        return con;
    }
}
