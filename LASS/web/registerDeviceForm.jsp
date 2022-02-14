<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    if (session != null) {
        if (session.getAttribute("custPhone") != null) {
            String custPhone = (String) session.getAttribute("custPhone");
            
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

  <title>Register Device</title>
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

    <%@include file="CustNavbar.jsp"%>


  </header><!-- End Header -->

  

      <main id="main" class="main">

    <div class="pagetitle">
      <h1>Register Device</h1>
    </div><!-- End Page Title -->

    <section class="section">
  <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Register your device here!</h5>

              <!-- General Form Elements -->
              <form action="registerDeviceServlet" method="POST">
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Device Type</label>
                  <div class="col-sm-10">
                      <select class="form-select" aria-label="Default select example" name="typeName">
                      <option selected value="Laptop">Laptop</option>
                      <option value="Printer">Printer</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Serial Number</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" name="serialNum">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Brand</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" name="brand">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Model</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" name="model">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Color</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" name="color">
                  </div>
                </div>
                <div class="row mb-3">
                  
                    <%
                        try{
                          
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();

                        String custPhone = (String) session.getAttribute("custPhone");
                        String sql = "SELECT * FROM CUSTOMER WHERE CUSTPHONE LIKE '%"+custPhone+"%'";
                        resultSet = statement.executeQuery(sql);
                      
                         int i=0;
                        
                        while(resultSet.next()){
                            
                        %>  
                        <input type="hidden" name="customerID" value="<%=resultSet.getString("custID")%>" >
                        <%
                        i++;
                        }
                    
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                    %> 
                  
                       
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Register</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>

      </div>
    </section>

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