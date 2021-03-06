
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
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Customer Homepage</title>
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

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="dashboardCustomer.jsp" class="logo d-flex align-items-center">
                    <span class="d-none d-lg-block">Man Laptop</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <nav class="header-nav ms-auto">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    
                    
                    <%
                        try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        String custPhone = (String) session.getAttribute("custPhone");
                        String sql ="SELECT * FROM CUSTOMER WHERE CUSTPHONE LIKE '"+custPhone+"'";
                        resultSet = statement.executeQuery(sql);
                        int i=0;
                        while(resultSet.next()){
                    %>
                    <span class="d-none d-md-block dropdown-toggle ps-2"><%=resultSet.getString("custName")%></span>
                    <%
                        i++;
                        }
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                    %>
                    
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

                        <li>
                            <a class="dropdown-header d-flex align-items-center" href="CustlogoutServlet">
                                <i class="bi bi-box-arrow-right"></i>
                                <span>Log Out</span>
                            </a>
                        </li>

                    </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                    </ul>
            </nav><!-- End Icons Navigation -->


        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="dashboardCustomer.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#orders-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>Orders</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="orders-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="addOrder-1.jsp">
              <i class="bi bi-circle"></i><span>Add Order</span>
            </a>
          </li>
          <li>
            <a href="viewOrderCust.jsp">
              <i class="bi bi-circle"></i><span>View Order</span>
            </a>
          </li>
        </ul>
      </li><!-- End Order Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#device-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-display"></i><span>Devices</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="device-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="registerDeviceForm.jsp">
              <i class="bi bi-circle"></i><span>Register Device</span>
            </a>
          </li>
          <li>
            <a href="viewDevice.jsp">
              <i class="bi bi-circle"></i><span>View Device</span>
            </a>
          </li>
        </ul>
      </li><!-- End Device Nav -->
      
  </aside><!-- End Sidebar-->

        <main id="main" class="main">

           
           

        </main><!-- End #main -->


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.min.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>