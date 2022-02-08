<%-- 
    Document   : test
    Created on : Feb 8, 2022, 8:29:23 PM
    Author     : hakim
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/lass";
        String username = "root";
        String password = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");   
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            conn = DriverManager.getConnection(url,username,password);
             System.out.println("Printing connection object" + conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Connection</title>
    </head>
    <body>
        <h1>Hi Testing!!</h1>
        <%
            try{
            connection = DriverManager.getConnection(url, username, password);
            statement=connection.createStatement();
            String sql ="SELECT * FROM STATUS";
            resultSet = statement.executeQuery(sql);
            int i=0;
            while(resultSet.next()){
        %>
        <p><%=resultSet.getString("statusID") %></p>
        <p><%=resultSet.getString("statusDescription") %></p>
        <%
            i++;
            }
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
        %>
    </body>
</html>
