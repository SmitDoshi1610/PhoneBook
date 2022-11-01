



<%-- 
    Document   : addContact
    Created on : May 31, 2022, 10:20:47 PM
    Author     : INTEL
--%>

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
                            <form action="addContact" method="post">
                                <%
                                   if (u != null) {%>
                                <input type="hidden" value="<%= u.getId()%>" name="userid"/>
                                <%}
                                %>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label>
                                    <input type="number" name="phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone No">

                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" placeholder="Enter About"></textarea>
                                </div>

                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-success">Save Contact</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
             <div style="margin-top: 30px">
        <%@include file="Component/Footer.jsp" %>
        </div>                    
    </body>
</html>
