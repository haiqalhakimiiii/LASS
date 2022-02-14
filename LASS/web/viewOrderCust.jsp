
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/lass";
    String username = "root";
    String password = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        conn = DriverManager.getConnection(url, username, password);
        System.out.println("Printing connection object" + conn);
    } catch (Exception ex) {
        ex.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%> 
<%
    if (session != null) {
        if (session.getAttribute("custPhone") != null) {
            String name = (String) session.getAttribute("custPhone");
            
            out.print("Hello, " + name + ".  Welcome!");
        } else {
            response.sendRedirect("CustLogin.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Order </title>
    
    </head>

    <body>
        
        <header><jsp:include page="CustNavbar.jsp" /></header>

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>List of Orders</h1>

            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"></h5>

                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th scope="col">Job ID</th>
                                            <th scope="col">Serial Number</th>
                                            <th scope="col">Date Send Device</th>
                                            <th scope="col">Status Date</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Payment ID</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>


                                        <%
                                            try {
                                                connection = DriverManager.getConnection(url, username, password);
                                                statement = connection.createStatement();
                                                String sql = "SELECT r.statusDate, s.statusDescription, r.jobID, c.custID, c.custPhone, r.dateSendDevice, r.staffID, r.serialNum, r.paymentID FROM repair_job r JOIN status s ON r.statusID = s.statusID JOIN customer c ON r.custID = c.custID";
                                                resultSet = statement.executeQuery(sql);
                                                int i = 0;
                                                while (resultSet.next()) {
                                        %>
                                        <tr>
                                            <th scope="row"><%=resultSet.getString("r.jobID")%></th>
                                            <td><%=resultSet.getString("r.serialNum")%></td>
                                            <td><%=resultSet.getString("r.dateSendDevice")%></td>
                                            <td><%=resultSet.getString("r.statusDate")%></td>
                                            <td><%=resultSet.getString("s.statusDescription")%></td>
                                            <td><%=resultSet.getString("r.paymentID")%></td>
                                            <td><a href="orderDetailsCust.jsp?job_id=<%=resultSet.getString("r.jobID")%>"><button type="button" class="btn btn-primary">Details</button></a></td>
                                        </tr>

                                        <%
                                                    i++;
                                                }
                                                connection.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>

                                    </tbody>
                                </table>
                                <!-- End Table with stripped rows -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->


   
    </body>

</html>