/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.CustBean;
import java.sql.*;
import util.DBConnection;

/**
 *
 * /**
 *
 * @author USER
 */
public class CustRegDao {

    public String CustRegister(CustBean custLogin) {

        Connection conn = null;
        Statement statement = null;

        String custPhone = custLogin.custPhone;
        String custName = custLogin.custName;
        String custUsername = custLogin.custUsername;
        String custPassword = custLogin.custPassword;
        String custAddress = custLogin.custAddress;
        String custEmail = custLogin.custEmail;
        String registerDate = custLogin.registerDate;

        try {

            conn = DBConnection.createConnection();

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO CUSTOMER (CUSTPHONE,CUSTNAME,CUSTUSERNAME,CUSTPASSWORD"
                    + ",CUSTADDRESS,CUSTEMAIL,REGISTERDATE) VALUES (?,?,?,?,?,?,?)");
            
            pstmt.setString(1, custPhone);
            pstmt.setString(2, custName);
            pstmt.setString(3, custUsername);
            pstmt.setString(4, custPassword);
            pstmt.setString(5, custAddress);
            pstmt.setString(6, custEmail);
            pstmt.setString(7, registerDate);

            int i = pstmt.executeUpdate();
            if (i > 0) {
                return "SUCCESS";
            } else {
                return "FAIL";
            }
        
            
        } catch (SQLException e) {
            return e.getMessage();

        }

    }

}
