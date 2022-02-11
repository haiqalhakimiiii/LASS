<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Guru Registration Form</title>
    </head>
    <body>
        <h1>Register Form</h1>
        <form action="CustRegister" method="post">
            <table style="with: 50%">
                <tr>
                    <td>Phone Number</td>
                    <td><input type="text" name="custPhone" /></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><input type="text" name="custName" /></td>
                </tr>
                <tr>
                    <td>UserName :</td>
                    <td><input type="text" name="custUsername" /></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="custPassword" /></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><input type="text" name="custAddress" /></td>
                </tr>
                <tr>
                    <td>Email :</td>
                    <td><input type="text" name="custEmail" /></td>
                </tr>
                <tr>
                    <td>Date Register:</td>
                    <td><input type="Date" name="custEmail" /></td>
                </tr></table>
            <input type="submit" value="Submit" /></form>
    </body>
</html>