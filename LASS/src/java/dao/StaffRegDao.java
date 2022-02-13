/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.staffBean;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author USER
 */
public class StaffRegDao {

    public String StaffRegister(staffBean staffbean) {

        Connection conn = null;
        Statement statement = null;
 
        String staffName = staffbean.staffName;
        String staffUsername = staffbean.staffUsename;
        String staffPassword = staffbean.staffPassword;
        String staffPhone = staffbean.staffPhone;

        try {

            conn = DBConnection.createConnection();

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO STAFF (STAFFNAME,STAFFUSERNAME,STAFFPASSWORD,STAFFPHONE) "
                    + "VALUES (?,?,?,?)");

            pstmt.setString(1, staffName);
            pstmt.setString(2, staffUsername);
            pstmt.setString(3, staffPassword);
            pstmt.setString(4, staffPhone);

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
