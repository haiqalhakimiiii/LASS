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
public class paymentBean implements java.io.Serializable{
    float totalPrice;
    float deposit;
    String datePayment;
    
    
    public paymentBean(){
        
    }
    
    public paymentBean(float totalPrice, float deposit, String datePayment){
        this.totalPrice = totalPrice;
        this.deposit = deposit;
        this.datePayment = datePayment;
    }
    
    public String getDatePayment(){
        return datePayment;
    }
    
    public float getTotalPrice(){
        return totalPrice;
    }
    
    public float getDeposit(){
        return deposit;
    }
   
    public void setDatePayment(String datePayment){
        this.datePayment = datePayment;
    }
    
    public void setTotalPrice(float totalPrice){
        this.totalPrice = totalPrice;
    }
    
    public void setDeposit(float deposit){
        this.deposit = deposit;
    }
    
    public void setPaymentID(int paymentID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
