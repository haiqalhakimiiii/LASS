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

            <%@include file="CustNavbar.jsp"%>

        </header><!-- End Header -->
        <main id="main" class="main">

            <section class="section">
                <div class="row">
                    <div class="col-lg-6">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"> Dashboard</h5>



                            </div>
                        </div>

                    </div>

                </div>
            </section>

        </main><!-- End #main -->
     

    </body>

</html>