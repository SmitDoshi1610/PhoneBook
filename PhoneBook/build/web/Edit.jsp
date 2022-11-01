<%-- 
    Document   : Edit
    Created on : Jun 3, 2022, 11:04:56 PM
    Author     : INTEL
--%>

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
    </head>
    <body>

        <%@include file="Component/Navbar.jsp" %>

        <%             if (u == null) {
                session.setAttribute("invalidMsg", "Login Please...");
                response.sendRedirect("Login.jsp");
            }%>

        <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Add Contact Page</h4>

                            <%
                                String successMsg = (String) session.getAttribute("successMsg");
                                String failedMsg = (String) session.getAttribute("failedMsg");
                                if (successMsg != null) {
                            %>
                            <p class="text-success text-center"><%= successMsg%></p>
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
                            <form action="EditContact" method="post">
                                <%
                                   int cid = Integer.parseInt(request.getParameter("cid"));
     
                                   ContactDAO dao = new ContactDAO(DBConnect.getConnection());
                                   Contact c =  dao.getContactById(cid);
                                   
                                %>
                                <input type="hidden" value="<%=cid%>" name="cid"/>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input type="text" value="<%=c.getName()%>" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" value="<%=c.getEmail()%>" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label>
                                    <input type="number" name="phone" value="<%=c.getPhone()%>"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone No">

                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" placeholder="Enter About"><%=c.getAbout()%></textarea>
                                </div>

                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-success">Update Contact</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
