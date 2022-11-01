/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author INTEL
 */
@WebServlet("/addContact")
public class AddContact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phoneno = req.getParameter("phone");
        String about = req.getParameter("about");

        Contact c = new Contact(name, email, phoneno, about, userId);

        ContactDAO dao = new ContactDAO(DBConnect.getConnection());

        boolean check = dao.saveContact(c);
        HttpSession session = req.getSession();
        if (check) {

            session.setAttribute("successMsg", "Your Contact Saved Successfully..");
            resp.sendRedirect("addContact.jsp");

        }else{
            
            session.setAttribute("failedMsg", "Something Went Wrong..");
            resp.sendRedirect("addContact.jsp");
        }

    }

}
