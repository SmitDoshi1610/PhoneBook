<%-- 
    Document   : viewContact
    Created on : May 31, 2022, 10:21:00 PM
    Author     : INTEL
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.connection.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/CommonStyle.jsp" %>
        <style>
            .card-hover:hover{
                background-color: #f7f7f7;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>


        <%             if (u == null) {
                session.setAttribute("invalidMsg", "Login Please...");
                response.sendRedirect("Login.jsp");
            }%>

        <%
            String successMsg = (String) session.getAttribute("successMsg");
            String failedMsg = (String) session.getAttribute("failedMsg");
            if (successMsg != null) {%>
        <div class="alert alert-success mt-2 text-center" role="alert"><%=successMsg%></div>
        <%
                session.removeAttribute("successMsg");
            }

            if (failedMsg != null) {
        %>
        <p class="text-danger text-center"><%=failedMsg%></p>
        <%
                session.removeAttribute("failedMsg");
            }
        %>



        <div class="container-fluid">
            <div class="row p-4">


                <%
                    if (u != null) {

                        ContactDAO dao = new ContactDAO(DBConnect.getConnection());
                        List<Contact> list = dao.getAllContact(u.getId());

                        for (Contact c : list) {%>
                <div class="col-md-3">
                    <div class="card card-hover">
                        <div class="card-body">
                            <h5>Name: <%=c.getName()%></h5>
                            <p>Phone: <%=c.getPhone()%></p>
                            <p>Email: <%=c.getEmail()%></p>
                            <p>About: <%=c.getAbout()%></p>

                            <div class="text-center text-white">
                               
                                <a href="Edit.jsp?cid=<%=c.getId()%>" class="btn btn-success btn-sm">Edit</a>
                                <a href="delete?cid=<%=c.getId()%>" class="btn btn-danger btn-sm">Delete</a>

                            </div>
                        </div>
                    </div>
                </div>
                <%}
                    }
                %>         


            </div>
        </div>
                <div style="margin-top: 250px">
        <%@include file="Component/Footer.jsp" %>
        </div>
    </body>
</html>
