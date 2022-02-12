<%-- 
    Document   : CustLogin
    Created on : Feb 11, 2022, 7:17:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Login </title>
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script type="text/javascript" 
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    </head>
    <body>
        <div class="absoluteCenter">

            <div style="text-align: center">
                <h1>Login</h1>
                <form action="login" method="post" id="loginForm">
                    <label for="email">Phone Number:</label><br>
                    <input type= "text" name="Phone" size="30" />
                    <br><br>
                    <label for="password">Password:</label><br>
                    <input type="password" name="password" size="30" />
                    <br>${message}
                    <br><br>			
                    <button type="submit">Login</button><br>
                    <a href="index.html">Back to Home</a>
                </form>
            </div>
        </div>
    </body>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#loginForm").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },

                    password: "required",
                },

                messages: {
                    email: {
                        required: "Please enter email",
                        email: "Please enter a valid email address"
                    },

                    password: "Please enter password"
                }
            });

        });
    </script>
</html>
