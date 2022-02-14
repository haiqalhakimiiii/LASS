/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.CustLoginBean;
import dao.CustLoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class CustLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String custPhone = request.getParameter("custPhone");
        String custPassword = request.getParameter("custPassword");

        CustLoginBean custbean = new CustLoginBean(custPhone, custPassword);
        CustLoginDao custloginDao = new CustLoginDao();

        custbean.setCustPhone(custPhone);
        custbean.setCustPassword(custPassword);

        String userValidate = custloginDao.CustLogin(custbean);

        if (userValidate.equalsIgnoreCase("SUCCESS")) {
            request.setAttribute("custPhone", custPhone);
            HttpSession session = request.getSession();
            session.setAttribute("custPhone", custPhone);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login Succesfully');");
            out.println("location='dashboardCustomer.jsp';");
            out.println("</script>");
          
        } else {
            request.setAttribute("errMessage", userValidate);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login Unsuccesfully,Phone Number or password incorrec');");
            out.println("location='CustLogin.jsp';");
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
