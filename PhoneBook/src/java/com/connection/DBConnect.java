/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connection;

import java.sql.*;

/**
 *
 * @author INTEL
 */
public class DBConnect {
    
    private static Connection conn;
    
    public static Connection getConnection(){
        
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","Smit@123");
            
            
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        return conn;
    }
}
