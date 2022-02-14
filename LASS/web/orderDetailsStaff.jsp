
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

 <header><jsp:include page="StaffNavbar.jsp" /></header>

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
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#order-details">Details</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#update-order">Update Status</button>
                </li>
                
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#assign-staff">Assign Staff</button>
                </li>
                
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#update-payment">Update Payment Details</button>
                </li>

              </ul>
              
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement=connection.createStatement();
String sql ="SELECT r.statusDate, s.statusDescription, r.jobID, c.custAddress, c.custID, c.custName, c.custPhone, r.dateSendDevice, r.problem, r.trackingNum, t.staffID, t.staffName, r.serialNum, d.brand, d.model, p.totalPrice, p.deposit, p.datePayment FROM repair_job r JOIN status s ON r.statusID = s.statusID JOIN device d ON r.serialNum = d.serialNum JOIN staff t ON r.staffID = t.staffID JOIN customer c ON r.custID = c.custID JOIN payment p ON r.paymentID = p.paymentID WHERE r.jobID=" + job_id;
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="order-details">
                  <h5 class="card-title">Status</h5>
                  <p class="small fst-italic"><%=resultSet.getString("r.statusDate") %></p>
                  <p class="small fst-italic"><%=resultSet.getString("s.statusDescription") %></p>
                  
                  <h5 class="card-title">Staff Assigned</h5>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Staff ID</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("t.staffID") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Name</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("t.staffName") %></div>
                  </div>
                  
                  <h5 class="card-title">Customer Details</h5>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Customer ID</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custID") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Name</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custName") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Phone Number</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custPhone") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Address</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("c.custAddress") %></div>
                  </div>
                  

                  <h5 class="card-title">Job Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Job ID</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.jobID") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Date Device Sent</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.dateSendDevice") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Problem</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.problem") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Tracking Number</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.trackingNum") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Serial Number</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("r.serialNum") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Brand</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("d.brand") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Model</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("d.model") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Total Price</div>
                    <div class="col-lg-9 col-md-8">RM <%=resultSet.getString("p.totalPrice") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Deposit</div>
                    <div class="col-lg-9 col-md-8">RM <%=resultSet.getString("p.deposit") %></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Date Payment</div>
                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("p.datePayment") %></div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="update-order">

                  <!-- Edit Status -->
                  <form action="orderServlet" method="post">
                      <input type="hidden" name="jobID" value="<%=resultSet.getString("r.jobID") %>">

                    <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Status Date</label>
                  <div class="col-sm-10">
                    <input type="date" name = "statusDate" class="form-control">
                  </div>
                </div>

                    <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Status</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" name="statusID">
                      <option selected>Select Status</option>
                      <option value="1">Troubleshooting</option>
                      <option value="2">Repairing</option>
                      <option value="3">Completed</option>
                    </select>
                  </div>
                </div>
                      
                      <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Tracking Number</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" name = "trackingNum" placeholder="<%=resultSet.getString("r.trackingNum") %>">
                  </div>
                </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Update Status</button>
                    </div>
                  </form><!-- End Edit Order -->

                </div>
                  
                  <div class="tab-pane fade profile-edit pt-3" id="assign-staff">

                  <!-- Assign Staff -->
                  <form  action="assignStaffServlet" method="post">
                      <input type="hidden" name="jobID" value="<%=resultSet.getString("r.jobID") %>">

<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Staff</label>
                  <div class="col-sm-10">
                      <select class="form-select" aria-label="Default select example" name="staffID">
                          <option selected>Select Staff</option>
                      
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement=connection.createStatement();
String sql ="SELECT staffID, staffName FROM staff";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
                    
                      <option value="<%=resultSet.getString("staffID") %>"><%=resultSet.getString("staffName") %></option>
                    
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    </select>
                  </div>
                </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Assign Staff</button>
                    </div>
                  </form><!-- End Assign Staff -->

                </div>
<%
try{
connection = DriverManager.getConnection(url, username, password);
statement=connection.createStatement();
String sql ="SELECT r.jobID, r.paymentID, p.totalPrice, p.deposit FROM repair_job r JOIN payment p ON r.paymentID = p.paymentID WHERE r.jobID=" + job_id;
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
                    <div class="tab-pane fade profile-edit pt-3" id="update-payment">

                  <!-- Edit Status -->
                  <form action="paymentServlet" method="post">
                      <input type="hidden" name="paymentID" value="<%=resultSet.getString("r.paymentID") %>">


                    <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Total Price</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name = "totalPrice" placeholder="RM <%=resultSet.getString("p.totalPrice") %>">
                  </div>
                </div>
                      
                      <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Deposit</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control"  name = "deposit" placeholder = "RM <%=resultSet.getString("p.deposit") %>">
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

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Update Payment</button>
                    </div>
                  </form><!-- End Edit Order -->

                </div>
              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>



</body>

</html>