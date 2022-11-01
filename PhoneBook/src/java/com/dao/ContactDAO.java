/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author INTEL
 */
public class ContactDAO {
    
    private Connection conn;

    public ContactDAO(Connection conn) {
        this.conn = conn;
    }
    
    public boolean saveContact(Contact c){
        
        boolean f = false;
        
        try{
            
            String query = "INSERT INTO CONTACT(NAME,EMAIL,phoneNo,about,USERID) VALUES(?,?,?,?,?)";
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1,c.getName());
            st.setString(2, c.getEmail());
            st.setString(3, c.getPhone());
            st.setString(4, c.getAbout());
            st.setInt(5, c.getUserId());
            
            int check = st.executeUpdate();
            
            if(check == 1){
                
                f = true;
            }
            
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Contact> getAllContact(int userId){
        
        List<Contact> list = new ArrayList<Contact>();
        Contact c = null;
        try{
            
            String query = "SELECT * FROM CONTACT WHERE userId=?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, userId);
            
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                
                c = new Contact();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setAbout(rs.getString(5));
                
                list.add(c);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Contact getContactById(int cid){
        
        Contact c = new Contact();
        try{
            
            String query = "SELECT * FROM CONTACT WHERE ID = ?";
            PreparedStatement st = conn.prepareStatement(query);
             st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setAbout(rs.getString(5));
                
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return c;
    }
    
    public boolean updateContact(Contact c){
        
        boolean f = false;
        
        try{
            
            String query = "UPDATE CONTACT SET NAME=?,EMAIL=?,PHONENO=?,ABOUT=? WHERE ID=?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1,c.getName());
            st.setString(2, c.getEmail());
            st.setString(3, c.getPhone());
            st.setString(4, c.getAbout());
            st.setInt(5, c.getId());
            
            int check = st.executeUpdate();
            
            if(check == 1){
                
                f = true;
            }
            
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean deleteContactById(int id){
        
        boolean check = false;
        try{
            
            String query = "DELETE FROM CONTACT WHERE ID=?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1,id);
            int i = st.executeUpdate();
            
            if(i==1)
            {
                check = true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return check;
    }
    
}
