
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
        if (session.getAttribute("staffUsername") != null) {
            String name = (String) session.getAttribute("staffUsername");
            out.print("Hello, " + name + ".  Welcome!");
        } else {
            response.sendRedirect("StaffLogin.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>View Order</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: NiceAdmin - v2.2.0
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <jsp:include page="StaffNavbar.jsp" />

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
                                            <th scope="col">Customer ID</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Serial Number</th>
                                            <th scope="col">Staff Assigned</th>
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
                                            <td><%=resultSet.getString("c.custID")%></td>
                                            <td><%=resultSet.getString("c.custPhone")%></td>
                                            <td><%=resultSet.getString("r.serialNum")%></td>
                                            <td><%=resultSet.getString("r.staffID")%></td>
                                            <td><%=resultSet.getString("r.dateSendDevice")%></td>
                                            <td><%=resultSet.getString("r.statusDate")%></td>
                                            <td><%=resultSet.getString("s.statusDescription")%></td>
                                            <td><%=resultSet.getString("r.paymentID")%></td>
                                            <td><a href="orderDetailsStaff.jsp?job_id=<%=resultSet.getString("r.jobID")%>"><button type="button" class="btn btn-primary">Details</button></a></td>
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


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>



    </body>

</html>