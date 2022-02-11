/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Acer
 */
public class orderBean implements java.io.Serializable{
    String dateSendDevice;
    String trackingNum;
    String problem;
    String statusDate;
    String serialNum;
    int paymentID;
    int custID;
    int staffID;
    int statusID;
    
    
    public orderBean(){
        
    }
    
    public orderBean(String dateSendDevice, String trackingNum, String problem, String statusDate, String serialNum, int paymentID, int custID, int staffID, int statusID){
        this.dateSendDevice = dateSendDevice;
        this.trackingNum = trackingNum;
        this.problem = problem;
        this.statusDate = statusDate;
        this.serialNum = serialNum;
        this.paymentID = paymentID;
        this.custID = custID;
        this.staffID = staffID;
        this.statusID = statusID;
    }
    
    public String getDateSendDevice(){
        return dateSendDevice;
    }
    
    public String getTrackingNum(){
        return trackingNum;
    }
    
    public String getProblem(){
        return problem;
    }
    
    public String getStatusDate(){
        return statusDate;
    }
    
    public String getSerialNum(){
        return serialNum;
    }
    
    public int getPaymentID(){
        return paymentID;
    }
    
    public int getCustID(){
        return custID;
    }
    public int getStaffID(){
        return staffID;
    }
    public int getStatusID(){
        return statusID;
    }
    
    
    public void setDateSendDevice(String dateSendDevice){
        this.dateSendDevice = dateSendDevice;
    }
    
    public void setTrackingNum(String trackingNum){
        this.trackingNum = trackingNum;
    }
    
    public void setProblem(String problem){
        this.problem = problem;
    }
    
    public void setStatusDate( String statusDate){
        this.statusDate = statusDate;
    }
    
    public void setSerialNum(String serialNum){
        this.serialNum = serialNum;
    }
    
    public void setPaymentID(int paymentID){
        this.paymentID = paymentID;
    }
    
    public void setCustID(int custID){
        this.custID = custID;
    }
    
    public void setstaffID(int staffID){
        this.staffID = staffID;
    }
    
    public void setstatusID(int statusID){
        this.statusID = statusID;
    }

    public void setJobID(int jobID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
