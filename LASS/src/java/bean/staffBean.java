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
public class staffBean {

    public String staffName;
    public String staffUsename;
    public String staffPassword;
    public String staffPhone;

    public staffBean(String staffName, String staffUsename, String staffPassword, String staffPhone) {

        this.staffName = staffName;
        this.staffUsename = staffUsename;
        this.staffPassword = staffPassword;
        this.staffPhone = staffPhone;
    }
//Getter


    public String getStaffName() {
        return staffName;
    }

    public String getStaffUsename() {
        return staffUsename;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public String getStaffPhone() {
        return staffPhone;
    }
//Setter

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public void setStaffUsename(String staffUsename) {
        this.staffUsename = staffUsename;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

}
