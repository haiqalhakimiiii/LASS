/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.staffBean;
import dao.StaffRegDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class StaffRegServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

        }
    }

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

        String staffName = request.getParameter("staffName");
        String staffUsername = request.getParameter("staffUsername");
        String staffPassword = request.getParameter("staffPassword");
        String staffPhone = request.getParameter("staffPhone");

        staffBean staffbean = new staffBean(staffName, staffUsername, staffPassword, staffPhone);
        StaffRegDao staffregdao = new StaffRegDao();

        staffbean.setStaffName(staffName);
        staffbean.setStaffUsename(staffUsername);
        staffbean.setStaffPassword(staffPassword);
        staffbean.setStaffPhone(staffPhone);

        String register = staffregdao.StaffRegister(staffbean);

        if (register.equals("SUCCESS")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Staff Registration Successfull!!');");
            request.getRequestDispatcher("dashboardStaff.jsp").forward(request, response);

        } else {
            request.setAttribute("errMsg", register);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            out.println("alert('Staff Registration Fail!!');");
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
