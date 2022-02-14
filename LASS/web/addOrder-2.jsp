<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/lass";
        String username = "root";
        String password = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");   
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            conn = DriverManager.getConnection(url,username,password);
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

  <title>Add Order</title>
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
      <h1>Add Order</h1>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Add Order Form</h5>
              <%
                String serialNum = request.getParameter("serialNum");
                System.out.println(serialNum);
              %>
              <!-- General Form Elements -->
              <form action="addOrderServlets" method="POST">
                <div class="row mb-3">
                <label for="custID" class="col-sm-2 col-form-label">Name</label>
                <div class="col-sm-10">
                    <%
                    try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        
                        //To get custID
                        String custPhone = (String) session.getAttribute("custPhone");
                        String sqlCustID = "SELECT * FROM CUSTOMER WHERE CUSTPHONE LIKE '%"+custPhone+"%'";
                        resultSet = statement.executeQuery(sqlCustID);
                        resultSet.next();
                        String custID = resultSet.getString("custID");
                        String custName = resultSet.getString("custName");
                    %>
                    <input type="text" class="form-control" name="custName" value="<%=custName%>" disabled>
                    <input type="hidden" name="custID" value="<%=custID%>">
                    <input type="hidden" name="serialNumber" value="<%=serialNum%>">
                    <%
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                    %>
                </div>
              </div>
                <div class="row mb-3">
                <label for="serialNum" class="col-sm-2 col-form-label">Serial Num</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="serialNum" value="<%=serialNum%>" disabled>
                </div>
              </div>
              <div class="row mb-3">
                <label for="dateSendDevice" class="col-sm-2 col-form-label">Date Send Device</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" name="dateSendDevice">
                </div>
              </div>
              <div class="row mb-3">
                <label for="problem" class="col-sm-2 col-form-label">Problem</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="problem">
                </div>
              </div>
              <div class="row mb-3">
                <label for="trackingNum" class="col-sm-2 col-form-label">Tracking Number</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="trackingNum">
                </div>
              </div>

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                  <button type="submit" class="btn btn-primary">Add Order</button>
                </div>
              </div>

            </form>
              <!-- End General Form Elements -->

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