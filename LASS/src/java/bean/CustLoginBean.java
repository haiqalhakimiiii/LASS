/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author USER
 */
public class CustLoginBean {
    
    public String custPhone;
    public String custPassword;

    public CustLoginBean(String custPhone, String custPassword) {
        this.custPhone = custPhone;
        this.custPassword = custPassword;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }
    
    
}
