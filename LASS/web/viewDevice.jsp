
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
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Device</title>
    
    </head>

    <body>
        
        <header><jsp:include page="CustNavbar.jsp" /></header>

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>List of Devices</h1>

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
                                            <th scope="col">Serial Number</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Type</th>
                                        </tr>
                                    </thead>

                                    <tbody>


                                        <%
                                            try {
                                                connection = DriverManager.getConnection(url, username, password);
                                                statement = connection.createStatement();
                                                
                                                //To get custID
                                                String custPhone = (String) session.getAttribute("custPhone");
                                                String sqlCustID = "SELECT * FROM CUSTOMER WHERE CUSTPHONE LIKE '%"+custPhone+"%'";
                                                resultSet = statement.executeQuery(sqlCustID);
                                                resultSet.next();
                                                String custID = resultSet.getString("custID");
                                                
                                                //int custID = (Integer)session.getAttribute ("custID");
                                                String sql = "SELECT * FROM device where custID = " + custID;
                                                resultSet = statement.executeQuery(sql);
                                                int i = 0;
                                                while (resultSet.next()) {
                                        %>
                                        <tr>
                                            <th scope="row"><%=resultSet.getString("serialNum")%></th>
                                            <td><%=resultSet.getString("brand")%></td>
                                            <td><%=resultSet.getString("model")%></td>
                                            <td><%=resultSet.getString("color")%></td>
                                            <td><%=resultSet.getString("typeName")%></td>
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