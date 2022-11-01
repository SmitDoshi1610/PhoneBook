/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnect;
import com.dao.ContactDAO;
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
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int cid = Integer.parseInt(req.getParameter("cid"));
        ContactDAO dao = new ContactDAO(DBConnect.getConnection());
        
        boolean check = dao.deleteContactById(cid);
        HttpSession session = req.getSession();
        if(check){
            
            session.setAttribute("successMsg", "Contact Deleted Successfully");
            resp.sendRedirect("viewContact.jsp");
        }
        else{
            
            session.setAttribute("failedMsg", "Something Went Wrong...");
            resp.sendRedirect("viewContact.jsp");
        }
    }
    
}
