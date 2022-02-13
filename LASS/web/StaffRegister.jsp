<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Staff Registration Form</title>
    </head>
    <body>
        <%@include file="StaffNavbar.jsp"%>

        <main id="main" class="main">

        <div class="pagetitle">
            <h1>Register New Staff </h1>
        </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Insert Staff Information</h5>

                        <!-- General Form Elements -->
                        <form action="StaffRegServlet" method="POST">

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Staff Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="staffName" required >
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Staff Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="staffUsername" required >
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="staffPassword" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Staff Phone Number </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="staffPhone" required>
                                </div>
                            </div>
                            <input type="hidden" name="staffID" value="">


                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>

                        </form><!-- End General Form Elements -->
                        </body>
                        </html>