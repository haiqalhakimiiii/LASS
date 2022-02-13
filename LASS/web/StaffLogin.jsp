
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Login As Staff</title>
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
        <style>
            .div{
                width: 530px;
                height: 90px;  
                padding: 30px;
            }
            .card{
                width: 30%;
                height: 45%;
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
        <title>Training Management System</title>
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script type="text/javascript" 
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    </head>
    <body>

        <%@include file="HomeNavbar.jsp"%>

        <div class="absoluteCenter">

            <div style="text-align: center"><br><br><br><br><br>
                <h1>Staff Login</h1><br>
                <div class="div2">
                    <div class="card">
                        <div class="card-body">
                            <form action="StaffLoginServlet" method="post" id="loginForm">
                                <br><label for="staffUsername">Phone Number:</label><br><br>
                                <input type= "text" style="text-align: center" class="form-control" name="staffUsername" size="30" required/>
                                <br>
                                <label for="staffPassword">Password:</label><br><br>
                                <input type="password"  style="text-align: center" class="form-control" name="staffPassword" size="30" required/>
                                <br>${message}<br>		
                                <button type="submit" class="btn btn-primary">Login</button><br><br>
                                <a href="index.jsp">Back to Home</a>
                            </form>
                        </div>
                    </div>
                </div>

                </body>


                <script type="text/javascript"></script>







                </html>