
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Logins As Customer</title>
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
* Template Name: NiceAdmin - v2.2.2
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->
</head>

<body>

<main>
   <%@include file="HomeNavbar.jsp"%>
   <div class="container">

       <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
           <div class="container">
               <div class="row justify-content-center">
                   <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                       <div class="d-flex justify-content-center py-4">
                           <a href="index.jsp" class="logo d-flex align-items-center w-auto">
                  
                               <span class="d-none d-lg-block">Man Laptop</span>
                           </a>
                       </div><!-- End Logo -->

                       <div class="card mb-3">

                           <div class="card-body">

                               <div class="pt-4 pb-2">
                                   <h5 class="card-title text-center pb-0 fs-4">Staff Account</h5>
                                   <p class="text-center small">Enter staff username &  staff password to login</p>
                               </div>

                               <form class="row g-3 needs-validation" action="StaffLoginServlet" method="post" id="loginForm" novalidate>

                                   <div class="col-12">
                                       <label for="yourUsername" class="form-label">Staff Username</label>
                                       <div class="input-group has-validation">
                                           <span class="input-group-text" id="inputGroupPrepend">@</span>
                                           <input type="text"name="staffUsername"  required class="form-control" id="yourUsername" required>
                                           <div class="invalid-feedback">Please enter your Username.</div>
                                       </div>
                                   </div>

                                   <div class="col-12">
                                       <label for="yourPassword" class="form-label">Password</label>
                                       <input type="password" name="staffPassword"  required class="form-control" id="yourPassword" required>
                                              <div class="invalid-feedback">Please enter your password!</div>
                                   </div>

                                   <div class="col-12">
                                       <button class="btn btn-primary w-100" type="submit">Login</button>
                                   </div>
                                   
                               </form>

                           </div>
                       </div>

                       <div class="credits">
                           <!-- All the links in the footer should remain intact. -->
                           <!-- You can delete the links only if you purchased the pro version. -->
                           <!-- Licensing information: https://bootstrapmade.com/license/ -->
                           <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                           
                       </div>

                   </div>
               </div>
           </div>

       </section>

   </div>
</main><!-- End #main -->


</body>

</html>