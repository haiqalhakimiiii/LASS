/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.StaffLoginBean;
import dao.StaffLoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//SESSION
import javax.servlet.http.HttpSession;

/**
 *
 * @author hakim
 */
public class StaffLoginServlet extends HttpServlet {
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
        response.setContentType("text/html");
        
        String staffUsername = request.getParameter("staffUsername");
        String staffPassword = request.getParameter("staffPassword");
        
        StaffLoginBean loginBean = new StaffLoginBean(staffUsername,staffPassword);
        StaffLoginDao loginDao = new StaffLoginDao();
        
        loginBean.setStaffUsername(staffUsername);
        loginBean.setStaffPassword(staffPassword);
        
        String userValidate = loginDao.StaffLogin(loginBean);
        if(userValidate.equalsIgnoreCase("SUCCESS")){
            request.setAttribute("staffUsername",staffUsername);
            //START SESSION
            HttpSession session = request.getSession();
            //SET SESSION EMAIL
            session.setAttribute("staffUsername",staffUsername);
            request.getRequestDispatcher("dashboardStaff.jsp").forward(request,response);
        }
        else{
            request.setAttribute("errMessage",userValidate);
            request.getRequestDispatcher("StaffLogin.jsp").forward(request,response);
        }
    }

}
