/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.sql.*;
/**
 *
 * @author hakim
 */
public class DBConnection {
    public static Connection createConnection(){
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/lass?zeroDateTimeBehavior=convertToNull;create=true";
        String username = "root";
        String password = "";
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");   
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            conn = DriverManager.getConnection(url,username,password);
             System.out.println("Printing connection object" + conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       return conn;
    }
}
