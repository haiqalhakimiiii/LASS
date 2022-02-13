/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.StaffLoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author USER
 */
public class StaffLoginDao {
     public String StaffLogin(StaffLoginBean stafflogin) {
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String staffUsername = stafflogin.getStaffUsername();
        String staffPassword = stafflogin.getStaffPassword();

        String staffUsernameDB = "";
        String staffPasswordDB = "";

          try{
            conn = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT STAFFUSERNAME,STAFFPASSWORD FROM STAFF");
            while(resultSet.next()){
                staffUsernameDB = resultSet.getString("STAFFUSERNAME");
                staffPasswordDB = resultSet.getString("STAFFPASSWORD");
                if(staffUsername.equals(staffUsernameDB) && staffPassword.equals(staffPasswordDB)){
                    return "SUCCESS";
                }
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return "Invalid user credentials";

    }
}
