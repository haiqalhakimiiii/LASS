/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import bean.orderBean;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author Acer
 */
public class orderDao {
    public String addOrder(orderBean order){
        Connection conn = null;
        
        String dateSendDevice = order.getDateSendDevice();
        String trackingNum = order.getTrackingNum();
        String problem = order.getProblem();
        String serialNum = order.getSerialNum();
        String statusID = Integer.toString(order.getStatusID());
        String custID = Integer.toString(order.getCustID());
        
        
        try{
            
            conn = DBConnection.createConnection();
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO REPAIR_JOB" +
                                                            "(DATESENDDEVICE,TRACKINGNUM,PROBLEM,STATUSID,SERIALNUM,CUSTID,STATUSDATE,PAYMENTID)" +
                                                            "VALUES" +
                                                            "(?,?,?,?,?,?,CURRENT_DATE()," +
                                                            "		(SELECT AUTO_INCREMENT " +
                                                            "		FROM information_schema.TABLES" +
                                                            "		WHERE TABLE_SCHEMA = 'lass'" +
                                                            "		AND TABLE_NAME = 'payment')" +
                                                            ")");
            pstmt.setString(1,dateSendDevice);
            pstmt.setString(2,trackingNum);
            pstmt.setString(3,problem);
            pstmt.setString(4,statusID);
            pstmt.setString(5,serialNum);
            pstmt.setString(6,custID);
            
            int i = pstmt.executeUpdate();
            
            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO PAYMENT (TOTALPRICE,DEPOSIT,DATEPAYMENT) VALUES (NULL,NULL,NULL)");
            int j = pstmt2.executeUpdate();
            if(i>0 && j>0){
                return "SUCCESS";
            }
            else{
                return "FAIL";
            }
            
        
        }catch(SQLException e){
            return e.getMessage();
      
        }
    }
}
