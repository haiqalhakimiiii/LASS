/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.CustLoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author USER
 */
public class CustLoginDao {

    public String CustLogin(CustLoginBean custlogin) {
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String custPhone = custlogin.getCustPhone();
        String custPassword = custlogin.getCustPassword();

        String custPhoneDB = "";
        String custPasswordDB = "";

          try{
            conn = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT CUSTPHONE,CUSTPASSWORD FROM CUSTOMER");
            while(resultSet.next()){
                custPhoneDB = resultSet.getString("CUSTPHONE");
                custPasswordDB = resultSet.getString("CUSTPASSWORD");
                if(custPhone.equals(custPhoneDB) && custPassword.equals(custPasswordDB)){
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
