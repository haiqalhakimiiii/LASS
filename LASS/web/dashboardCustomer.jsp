<!DOCTYPE html>
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
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Customer Dashboard</title>
    </head>

    <body>

        <!--< ======= Header ======= -->
        <header>

        </header><!-- End Header -->
        <%@include file="CustNavbar.jsp"%>
        <main id="main" class="main">
            <div class="pagetitle">
                <h1>Customer Info</h1>

            </div><!-- End Page Title -->

            <section class="section profile">

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
                                String custPhone = (String) session.getAttribute("custPhone");
                                String sql = "SELECT * FROM CUSTOMER WHERE CUSTPHONE LIKE '" + custPhone + "'";
                                resultSet = statement.executeQuery(sql);
                                int i = 0;
                                while (resultSet.next()) {
                        %>
                        <div class="tab-content pt-2">

                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                <h5 class="card-title">Phone Number</h5>
                                <p class="small fst-italic"><b><%=resultSet.getString("custPhone")%></b></p>

                                <h5 class="card-title">Customer Details</h5>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Name</div>
                                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("custName")%></div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Username</div>
                                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("custUsername")%></div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Email</div>
                                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("custEmail")%></div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Address</div>
                                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("custAddress")%></div>
                                </div>


                                <h5 class="card-title">Date Registered</h5>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">Date</div>
                                    <div class="col-lg-9 col-md-8"><%=resultSet.getString("registerDate")%></div>
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

        </main><!-- End #main -->


    </body>

</html>