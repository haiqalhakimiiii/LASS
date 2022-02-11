/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import bean.deviceBean;
import java.sql.*;
import util.DBConnection;
/**
 *
 * @author hakim
 */
public class deviceDAO {
    public String registerDevice(deviceBean device){
        Connection conn = null;
        Statement statement = null;
        
        String serialNum = device.getSerialNum();
        String brand = device.getBrand();
        String model = device.getModel();
        String typeName = device.getTypeName();
        String color = device.getColor();
        int custID = device.getCustID();
                
        try{
            
            conn = DBConnection.createConnection();
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO DEVICE (SERIALNUM,BRAND,MODEL,TYPENAME,COLOR,CUSTID) VALUES (?,?,?,?,?,?)");
            pstmt.setString(1,serialNum);
            pstmt.setString(2,brand);
            pstmt.setString(3,model);
            pstmt.setString(4,typeName);
            pstmt.setString(5,color);
            pstmt.setInt(6,custID);
            
            int i = pstmt.executeUpdate();
            if(i>0){
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
