/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.deviceBean;
import dao.deviceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hakim
 */
public class registerDeviceServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        
        String serialNum = request.getParameter("serialNum");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String typeName = request.getParameter("typeName");
        String color = request.getParameter("color");
        
        int custID = Integer.parseInt(request.getParameter("customerID"));
        
        deviceBean device = new deviceBean();
        deviceDAO devicedao = new deviceDAO();
        
        device.setSerialNum(serialNum);
        device.setBrand(brand);
        device.setModel(model);
        device.setTypeName(typeName);
        device.setColor(color);
        device.setCustID(custID);
        
        String register = devicedao.registerDevice(device);
        
        if(register.equals("SUCCESS")){
            request.getRequestDispatcher("viewDevice.jsp").forward(request,response);
        }
        else{
            request.setAttribute("errMsg", register);
            //request.getRequestDispatcher("registerDeviceForm.jsp").forward(request, response);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Serial number already existed, please use another serial number or contact admin');");
            out.println("location='registerDeviceForm.jsp';");
            out.println("</script>");
            }
            
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
