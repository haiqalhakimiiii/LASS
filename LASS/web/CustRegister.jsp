<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Register As Customer</title>
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


        <style>
            .div2 {
                width: 830px;
                height: 90px;  
                padding: 20px;
            }
            .h1{
                text-align: center;

            }
            .div3{
                position: fixed;
                top: 25%;
                left: 35%;
                margin-top: 1px;
                margin-left: 10px;
                align-content: center;
            }
            .div{
                width: 530px;
                height: 90px;  
                padding: 30px;
            }
            .card{
                width: 39%;
                height: 70%;
                position: fixed;
                top: 25%;
                left: 35%;
                margin-top: 1px;
                margin-left: 10px;
                align-content: center;
            }
            .form-control{
                width: 50%;
                text-align: right;
            }
            input {
                display:block;
                margin:0 auto;
            }
        </style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Register As Customer</title>
    </head>
    <body>
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="index.jsp" class="logo d-flex align-items-center">
                    <span class="d-none d-lg-block">Man Laptop</span>
                </a>

            </div><!-- End Logo -->


        </aside><!-- End Sidebar-->
        <main id="main" class="main">

            <br><br><br><br><br><br><br>
            <h1>Register As New Customer </h1>
            </div><!-- End Page Title -->
            <div class="div3">    
                <div class ="div2">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Please Insert Your Information</h5>

                            <!-- General Form Elements -->
                            <form action="CustRegServlet" method="POST">

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Phone Number</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="custPhone" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Full Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="custName" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Username</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="custUsername" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="custPassword" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Address</label>
                                    <div class="col-sm-10">
                                        <input type="textarea" class="form-control" name="custAddress" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="custEmail" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label">Registration Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" name="registerDate" required>
                                    </div>
                                </div>
                                <input type="hidden" name="custID" value="">


                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                                </div>
                                <br><br><br>
                            </form><!-- End General Form Elements -->
                        </div>                   
                    </div>                   
                </div>                   
            </div>
            <script>
                function validateForm() {
                alert("User Registered Successfully");
                return true;
                }
            </script>
            <script>
                function validateForm() {

                var x = document.forms["register"]["username"].value;
                if (x == null || x == "") {
                alert("Use
                        rname cannot be empty..!!!");
                        return false;
                }

            </script>
            </body>
            </html>