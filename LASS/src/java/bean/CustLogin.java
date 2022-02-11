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
public class CustLogin {

    public int custID;
    public String custPhone;
    public String custName;
    public String custUsername;
    public String custPassword;
    public String custAddress;
    public String custEmail;
    public String registerDate;

    public CustLogin(int custID, String custPhone, String custName, String custUsername, String custPassword, String custAddress, String custEmail, String registerDate) {
        this.custID = custID;
        this.custPhone = custPhone;
        this.custName = custName;
        this.custUsername = custUsername;
        this.custPassword = custPassword;
        this.custAddress = custAddress;
        this.custEmail = custEmail;
        this.registerDate = registerDate;
    }

    public int getCustID() {
        return custID;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustUsername() {
        return custUsername;
    }

    public void setCustUsername(String custUsername) {
        this.custUsername = custUsername;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public String getCustAdress() {
        return custAddress;
    }

    public void setCustAdress(String custAdress) {
        this.custAddress = custAdress;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

}
