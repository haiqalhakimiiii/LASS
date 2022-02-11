/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author hakim
 */
public class deviceBean {
    String serialNum;
    String brand;
    String model;
    String typeName;
    String color;
    int custID;
    
    public deviceBean(){}
    public deviceBean(String serial, String Brand, String Model, String type, String Color, int cust){
        serialNum = serial;
        brand = Brand;
        model = Model;
        typeName = type;
        color = Color;
        custID = cust;
    }
    public void setSerialNum(String serial){
        serialNum = serial;
    }
    public void setBrand(String Brand){
        brand = Brand;
    }
    public void setModel(String Model){
        model = Model;
    }
    public void setTypeName(String type){
        typeName = type;
    }
    public void setColor(String Color){
        color = Color;
    }
    public void setCustID(int cust){
        custID = cust;
    }
    
    public String getSerialNum(){return serialNum;}
    public String getBrand(){return brand;}
    public String getModel(){return model;}
    public String getTypeName(){return typeName;}
    public String getColor(){return color;}
    public int getCustID(){return custID;}
}
