/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.CustLogin;
import java.sql.*;
import util.DBConnection;

/**
 *
 * /**
 *
 * @author USER
 */
public class CustRegDao {

    public String CustRegister(CustLogin custLogin) {

        Connection conn = null;
        Statement statement = null;

        int custID = custLogin.custID;
        String custPhone = custLogin.custPhone;
        String custName = custLogin.custName;
        String custUsername = custLogin.custUsername;
        String custPassword = custLogin.custPassword;
        String custAddress = custLogin.custAddress;
        String custEmail = custLogin.custEmail;
        String registerDate = custLogin.registerDate;

        try {

            conn = DBConnection.createConnection();

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO CUSTOMER (CUSTID,CUSTNAME,CUSTNAME,CUSTUSERNAME,CUSTPASSWORD"
                    + ",CUSTADDRESS,CUSTEMAIL,REGISTERDATE) VALUES (?,?,?,?,?,?,?,?)");

            pstmt.setInt(1, custID);
            pstmt.setString(2, custPhone);
            pstmt.setString(3, custName);
            pstmt.setString(4, custUsername);
            pstmt.setString(5, custPassword);
            pstmt.setString(6, custAddress);
            pstmt.setString(7, custEmail);
            pstmt.setString(8, registerDate);

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
