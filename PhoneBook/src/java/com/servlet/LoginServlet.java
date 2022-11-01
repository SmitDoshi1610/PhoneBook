/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnect;
import com.dao.UserDAO;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author INTEL
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");

        UserDAO dao = new UserDAO(DBConnect.getConnection());
        User u = dao.loginUser(email, password);
        HttpSession session = req.getSession();
        if (u != null) {
            session.setAttribute("user",u);
            resp.sendRedirect("index.jsp");
       
        } else {

            session.setAttribute("invalidMsg","Invalid Email And Password");
            resp.sendRedirect("Login.jsp");
        }
    }

}
