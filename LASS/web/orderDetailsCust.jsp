
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

    String job_id = request.getParameter("job_id");
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
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Order Details</title>
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

        <header id="header" class="header fixed-top d-flex align-items-center">
            <jsp:include page="CustNavbar.jsp" />
        </header><!-- End Header -->

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Order Details</h1>

            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Details</button>
                                    </li>
                                </ul>

                                <%
                                    try {
                                        connection = DriverManager.getConnection(url, username, password);
                                        statement = connection.createStatement();
                                        String sql = "SELECT r.statusDate, s.statusDescription, r.jobID, c.custID, c.custName, c.custAddress, c.custPhone, r.dateSendDevice, r.problem, r.trackingNum, t.staffID, t.staffName, r.serialNum, d.brand, d.model, p.totalPrice, p.deposit, p.datePayment FROM repair_job r JOIN status s ON r.statusID = s.statusID JOIN device d ON r.serialNum = d.serialNum JOIN staff t ON r.staffID = t.staffID JOIN customer c ON r.custID = c.custID JOIN payment p ON r.paymentID = p.paymentID WHERE r.jobID=" + job_id;
                                        resultSet = statement.executeQuery(sql);
                                        int i = 0;
                                        while (resultSet.next()) {
                                %>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <h5 class="card-title">Status</h5>
                                        <p class="small fst-italic"><%=resultSet.getString("r.statusDate")%></p>
                                        <p class="small fst-italic"><%=resultSet.getString("s.statusDescription")%></p>

                                        <h5 class="card-title">Customer Details</h5>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Customer ID</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custID")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Name</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custName")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone Number</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custPhone")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Address</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custAddress")%></div>
                                        </div>


                                        <h5 class="card-title">Job Details</h5>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Job ID</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.jobID")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Date Device Sent</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.dateSendDevice")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Problem</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.problem")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Tracking Number</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.trackingNum")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Serial Number</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.serialNum")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Brand</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("d.brand")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Model</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("d.model")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Total Price</div>
                                            <div class="col-lg-9 col-md-8">RM <%=resultSet.getString("p.totalPrice")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Deposit</div>
                                            <div class="col-lg-9 col-md-8">RM <%=resultSet.getString("p.deposit")%></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Date Payment</div>
                                            <div class="col-lg-9 col-md-8"><%=resultSet.getString("p.datePayment")%></div>
                                        </div>

                                    </div>
                                    <%
                                                i++;
                                            }
                                            connection.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                </div><!-- End Bordered Tabs -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>
<button onclick="history.back()" class="btn btn-info">Back</button>
        </main><!-- End #main -->


    </body>

</html>