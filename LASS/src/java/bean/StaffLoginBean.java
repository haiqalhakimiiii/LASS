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
public class StaffLoginBean {
    
    public String staffUsername;
    public String staffPassword;

    public StaffLoginBean(String staffUsername, String stafPassword) {
        this.staffUsername = staffUsername;
        this.staffPassword = stafPassword;
    }

    public String getStaffUsername() {
        return staffUsername;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffUsername(String staffUsername) {
        this.staffUsername = staffUsername;
    }

    public void setStaffPassword(String stafPassword) {
        this.staffPassword = stafPassword;
    }
    
    
}
