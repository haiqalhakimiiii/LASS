/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
public class payment2Servlet extends HttpServlet {
    
    public static Connection getConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/lass";
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
        } catch (Exception e) {
            System.out.print(e);
        }    
        return con;
    }
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
       /* try (PrintWriter out = response.getWriter()) {
             TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet payment2Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment2Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
        
        PrintWriter out = response.getWriter();
        String paymentID = request.getParameter("paymentID");
        String totalPrice = request.getParameter("totalPrice");
        String deposit = request.getParameter("deposit");
        //out.println(paymentID);
        //out.println(totalPrice);
         try{  
            //create statement to update data in the database
            Connection con = orderServlet.getConnection();  
            PreparedStatement pstmt =con.prepareStatement( 
            "UPDATE payment SET totalPrice = ?, deposit = ? WHERE paymentID = ?");

            pstmt.setFloat(1, Float.parseFloat(totalPrice));
            pstmt.setFloat(2, Float.parseFloat(deposit));
            pstmt.setInt(3, Integer.parseInt(paymentID));
            pstmt.executeUpdate();
            //request.getRequestDispatcher("viewOrderStaff.jsp").forward(request, response);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Payment has successfully updated in the system');");
            out.println("location='viewOrderStaff.jsp';");
            out.println("</script>");

         } catch(Exception ex){
            ex.printStackTrace();
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
