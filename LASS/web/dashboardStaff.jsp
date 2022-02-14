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



            <section class="section">
                <div class="row">
                    <div class="col-lg-6">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Dashboard</h5>



                            </div>
                        </div>

                    </div>

                </div>
            </section>



        </main><!-- End #main -->
     
    </body>

</html>