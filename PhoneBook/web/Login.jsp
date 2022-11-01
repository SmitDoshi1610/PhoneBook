<%-- 
    Document   : Register
    Created on : May 31, 2022, 10:20:19 PM
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
    <body style="background-color: #f7faf8;">
        <%@include file="Component/Navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Login Page</h4>
                            
                            <%
                                String msg = (String)session.getAttribute("invalidMsg");
                                if(msg != null){
                                %>
                                <p class="text-center text-danger"><%=msg%></p>
                                <%
                                    session.removeAttribute("invalidMsg");}
                            %>
                            
                            <%
                                String logMsg = (String)session.getAttribute("logMsg");
                                if(logMsg != null){
                                %>
                                <p class="text-center text-success"><%=logMsg%></p>
                                <%
                                    session.removeAttribute("logMsg");}
                            %>
                            
                            <form action="login" method="post">
                        
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 200px">
        <%@include file="Component/Footer.jsp" %>
        </div>
    </body>
</html>
