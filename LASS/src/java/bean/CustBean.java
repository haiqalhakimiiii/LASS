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
public class CustBean {

    public String custPhone;
    public String custName;
    public String custUsername;
    public String custPassword;
    public String custAddress;
    public String custEmail;
    public String registerDate;

    public CustBean(String custPhone, String custName, String custUsername, String custPassword, String custAddress, String custEmail, String registerDate) {

        this.custPhone = custPhone;
        this.custName = custName;
        this.custUsername = custUsername;
        this.custPassword = custPassword;
        this.custAddress = custAddress;
        this.custEmail = custEmail;
        this.registerDate = registerDate;
    }

    //Get
    public String getCustPhone() {
        return custPhone;
    }

    public String getCustName() {
        return custName;
    }

    public String getCustUsername() {
        return custUsername;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public String getCustAddress() {
        return custAddress;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    //Setter
    public String getCustEmail() {
        return custEmail;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public void setCustUsername(String custUsername) {
        this.custUsername = custUsername;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public void setCustAddress(String custAdress) {
        this.custAddress = custAdress;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

}
