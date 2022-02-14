<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Pages / Register - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

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
        <br> <br> <br>
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                
                  <span class="d-none d-lg-block">Man Laptop</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                    <p class="text-center small">Enter your personal details to create account</p>
                  </div>

                  <form class="row g-3 needs-validation" action="CustRegServlet" method="POST" novalidate>
                    <div class="col-12">
                      <label for="yourName" class="form-label">Phone Number</label>
                      <input type="text" name="custPhone" class="form-control" id="yourName" required>
                      <div class="invalid-feedback">Please, enter your Phone Number!</div>
                    </div>

                    <form class="row g-3 needs-validation" novalidate>
                      <div class="col-12">
                        <label for="yourName" class="form-label">Full Name</label>
                        <input type="text" name="custName" class="form-control" id="yourName" required>
                        <div class="invalid-feedback">Please, enter your name!</div>
                      </div>

                      <form class="row g-3 needs-validation" novalidate>
                        <div class="col-12">
                          <label for="yourName" class="form-label">Username</label>
                          <input type="text" name="custUsername" class="form-control" id="yourName" required>
                          <div class="invalid-feedback">Please, enter Username!</div>
                        </div>

                        <form class="row g-3 needs-validation" novalidate>
                          <div class="col-12">
                            <label for="yourName" class="form-label">Password</label>
                            <input type="password" name="custPassword" class="form-control" id="yourName" required>
                            <div class="invalid-feedback">Please, enter password!</div>
                          </div>

                          <form class="row g-3 needs-validation" novalidate>
                            <div class="col-12">
                              <label for="yourName" class="form-label">Address</label>
                              <input type="textarea" name="custAddress" class="form-control" id="yourName" required>
                              <div class="invalid-feedback">Please, enter your Address!</div>
                            </div>

                            <div class="col-12">
                              <label for="yourEmail" class="form-label">Email</label>
                              <input type="email" name="custEmail" class="form-control" id="yourEmail" required>
                              <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                            </div>

                            <form class="row g-3 needs-validation" novalidate>
                              <div class="col-12">
                                <label for="yourName" class="form-label">Registration Date</label>
                                <input type="date" name="registerDate" class="form-control" id="yourName" required>
                                <div class="invalid-feedback">Please, enter Username!</div>
                              </div>

                          
                            <div class="col-12">
                              <button class="btn btn-primary w-100" type="submit">Create Account</button>
                            </div>
                            <div class="col-12">
                              <p class="small mb-0">Already have an account? <a href="CustLogin.jsp">Log in</a></p>
                            </div>
                          </form>

                </div>
              </div>

              

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->



</body>

</html>