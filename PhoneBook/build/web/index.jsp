<%-- 
    Document   : index
    Created on : May 31, 2022, 10:20:04 PM
    Author     : INTEL
--%>

<%@page import="com.entity.User"%>
<%@page import="com.connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/CommonStyle.jsp" %>
        
        <style>
            .back-img{
                background: url("img/phone3.jpg");
                width: 100%;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        
       
        
        <div class="container-fluid back-img text-center text-danger">
            <h1 class="font p-3">WELCOME TO PHONE BOOK</h1>
        </div>
        
        <div style="margin-top: 2px">
        <%@include file="Component/Footer.jsp" %>
        </div>
    </body>
</html>
