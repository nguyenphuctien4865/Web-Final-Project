package com.newspaper.app.models;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Users;
import com.newspaper.app.utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersModel {
    public static List<Users> findAll() {

        List<Users> list = new ArrayList<>();
         try (Connection con = DbUtils.initializeDatabase() ){
             String query = "select * from users";
             PreparedStatement statement = con.prepareStatement(query);
             ResultSet rs = statement.executeQuery();
             while (rs.next()) {
                 list.add(new Users(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getInt(6),rs.getInt(7),rs.getString(8),rs.getDate(9),rs.getString(10),rs.getString(11),rs.getTimestamp(12)));
             }
         }
         catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

		return list;
    }


    public static Users findbyID(int ID) {
        List<Users> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from users where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getInt(6),rs.getInt(7),rs.getString(8),rs.getDate(9),rs.getString(10),rs.getString(11),rs.getTimestamp(12)));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }




    public static void update(Users user) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "UPDATE users SET password=?, name=?, issue_at=?, expiration=?, role=?, second_name=?, dob=?, email=?,otp=?, otp_exp=? where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, user.getPassword());
            statement.setString(2, user.getName());
            statement.setTimestamp(3, user.getIssue_at());
            statement.setInt(4, user.getExpiration());
            statement.setInt(5, user.getRole());
            statement.setString(6, user.getSecond_name());
            statement.setDate(7, user.getDob());
            statement.setString(8, user.getEmail());
            statement.setString(9, user.getOtp());
            statement.setTimestamp(10, user.getOtp_Exp());
            statement.setInt(11, user.getUserID());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM users WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1,id);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void add(Users c) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "INSERT INTO users (username, password, name, issue_at, expiration, role,second_name, dob, email) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1,c.getUsername());
            statement.setString(2,c.getPassword());
            statement.setString(3,c.getName());
            statement.setTimestamp(4,c.getIssue_at());
            statement.setInt(5,c.getExpiration());
            statement.setInt(6,c.getRole());
            statement.setString(7,c.getSecond_name());
            statement.setDate(8,c.getDob());
            statement.setString(9,c.getEmail());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    public static Users findByUsername(String username) {
        List<Users> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from users where username = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1,username);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getInt(6),rs.getInt(7),rs.getString(8),rs.getDate(9),rs.getString(10),rs.getString(11),rs.getTimestamp(12)));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }
}

