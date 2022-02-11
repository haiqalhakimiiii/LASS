
package servlet;

import bean.orderBean;
import dao.orderDao;
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
 * @author Naqib
 */
public class orderServlet extends HttpServlet {

    
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
        /* TODO output your page here. You may use following sample code. 
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } */
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
        
        PrintWriter out = response.getWriter();
        String order_id = request.getParameter("order_id");
        String order_detail = request.getParameter("order_detail");
        String order_date = request.getParameter("order_date");
        String order_time = request.getParameter("order_time");
        String Package = request.getParameter("Package");
        int cust_id = Integer.parseInt(request.getParameter("cust_id"));
        int staff_id = Integer.parseInt(request.getParameter("staff_id"));
        int status_id = Integer.parseInt(request.getParameter("status_id"));
        
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
        String jobID = request.getParameter("jobID");
        String statusDate = request.getParameter("statusDate");
        String statusID = request.getParameter("statusID");
        String trackingNum = request.getParameter("trackingNum");
        
        
         try{  
            //create statement to update data in the database
            Connection con = orderServlet.getConnection();  
            PreparedStatement pstmt =con.prepareStatement( 
            "UPDATE repair_job SET statusDate = ?, statusID = ?, trackingNum = ? WHERE jobID = ?");

            pstmt.setString(1, statusDate);
            pstmt.setInt(2, Integer.parseInt(statusID));
            pstmt.setString(3, trackingNum);
            pstmt.setInt(4, Integer.parseInt(jobID));
            pstmt.executeUpdate();
                    
            out.println(statusDate);
            request.getRequestDispatcher("viewOrderStaff.jsp").forward(request, response);

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
