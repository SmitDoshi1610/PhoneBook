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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");
        
        User user = new User(name,email,password);
        
        UserDAO dao = new UserDAO(DBConnect.getConnection());
        
        boolean f = dao.userRegister(user);
        
        HttpSession session = req.getSession();
        
        
        if(f){
            session.setAttribute("successMsg","User Registered Succssfully");
            resp.sendRedirect("Register.jsp");
        }
        else{
             session.setAttribute("errorMsg","Something went wrong!!");
             resp.sendRedirect("Register.jsp");
        }
        
    }
    
    
}
