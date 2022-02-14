<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
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
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Staff</title>
        
        
    </head>

    <body>

        <%@include file="StaffNavbar.jsp"%>

        <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title">Order <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                        <%
                        try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        
                        
                        String sql ="SELECT COUNT(jobID) FROM REPAIR_JOB";
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        int count = resultSet.getInt(1);
                        %>
                        <h6><%=count%></h6>
                        <%
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                        %>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">Sales <span>| Total</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <%
                        try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        
                        
                        String sql ="SELECT SUM(totalPrice) FROM PAYMENT";
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        int totalSales = resultSet.getInt(1);
                        %>
                        <h6>RM<%=totalSales%></h6>
                        <%
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                        %>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Revenue Card -->

            

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Customers <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <%
                        try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        
                        
                        String sql ="SELECT COUNT(custID) FROM CUSTOMER";
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        int count = resultSet.getInt(1);
                        %>
                        <h6><%=count%></h6>
                        <%
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                        %>
                    </div>
                  </div>
                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- Devices Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Devices Registered <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-gear"></i>
                    </div>
                    <div class="ps-3">
                      <%
                        try{
                        connection = DriverManager.getConnection(url, username, password);
                        statement=connection.createStatement();
                        
                        
                        String sql ="SELECT COUNT(serialNum) FROM DEVICE";
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        int count = resultSet.getInt(1);
                        %>
                        <h6><%=count%></h6>
                        <%
                        connection.close();
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                        %>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Devices Card -->

        </div><!-- End Right side columns -->
      </div>
    </section>

  </main><!-- End #main -->
     
    </body>

</html>