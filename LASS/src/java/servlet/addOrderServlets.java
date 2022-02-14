/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.orderBean;
import dao.orderDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hakim
 */
public class addOrderServlets extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        String date = request.getParameter("dateSendDevice");
        String problem = request.getParameter("problem");
        String trackingNum = request.getParameter("trackingNum");
        String serialNum = request.getParameter("serialNumber");
        int custID = Integer.parseInt(request.getParameter("custID"));
        int statusID = 1;
        
        System.out.println(date);
        System.out.println(trackingNum);
        System.out.println(problem);
        System.out.println(serialNum);
        System.out.println(statusID);
        System.out.println(custID);
        
        orderBean order = new orderBean();
        orderDao orderdao = new orderDao();
        
        order.setDateSendDevice(date);
        order.setProblem(problem);
        order.setTrackingNum(trackingNum);
        order.setSerialNum(serialNum);
        order.setCustID(custID);
        order.setstatusID(statusID);
        
        String addOrder = orderdao.addOrder(order);
        out.println(addOrder);
        if(addOrder.equals("SUCCESS")){
            request.getRequestDispatcher("viewOrderCust.jsp").forward(request,response);
        }
        else{
            request.setAttribute("errMsg", addOrder);
            request.getRequestDispatcher("addOrder-1.jsp").forward(request, response);
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
