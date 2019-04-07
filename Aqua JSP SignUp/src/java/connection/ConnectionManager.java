/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.*;
import java.util.*;
/**
 *
 * @author user
 */
public class ConnectionManager {
    static Connection con;
    static String url;
            
    public static Connection getConnection(){
        try {
            //String url = "jdbc:odbc:" + "DataSource"; 
            // assuming "DataSource" is your DataSource name
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Class.forName("com.mysql.jdbc.Driver");
            //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
            //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
            String url = "jdbc:mysql://localhost:3305/bookstore?useSSL=false";
            try {            	
               // connecting to the database, with the username: "root", password: "bird&2018" 
               con = DriverManager.getConnection(url, "root", "bird&2018"); 
                								
            // assuming your SQL Server's	username is "username"               
            // and password is "password"
                 
            }
            
            catch (SQLException ex) {
               ex.printStackTrace();
            }
        }

        catch(ClassNotFoundException e)
        {
            System.out.println(e);
        }

        return con;
    }
}
    

