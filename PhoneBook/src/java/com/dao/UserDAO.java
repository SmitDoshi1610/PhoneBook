/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entity.User;
import java.sql.*;

/**
 *
 * @author INTEL
 */
public class UserDAO {

    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean userRegister(User user) {

        boolean f = false;

        try {

            String query = "INSERT INTO USER(NAME,EMAIL,PASSWORD) VALUES(?,?,?)";

            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());

            int check = st.executeUpdate();

            if (check == 1) {
                f = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return f;
    }

    public User loginUser(String email, String password) {

        User user = null;
        try {

            String query = "SELECT * FROM USER WHERE EMAIL=? AND PASSWORD=?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
