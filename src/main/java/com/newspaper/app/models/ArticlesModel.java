package com.newspaper.app.models;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.utils.DbUtils;
/*
import org.sql2o.Connection;
*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ArticlesModel {
    public static List<Articles> findAll() throws SQLException, ClassNotFoundException {
/*
        final String query = "select * from articles";
*/
       /* try (Connection con = DbUtils.getConnection()) {
            String query = "select * from articles";
            return con.createQuery(query)
                    .executeAndFetch(Articles.class);
        }*/
        List<Articles> list = new ArrayList<>();
         try (Connection con = DbUtils.initializeDatabase() ){
             String query = "select * from articles";
             PreparedStatement statement = con.prepareStatement(query);
             ResultSet rs = statement.executeQuery();
             while (rs.next()) {
                 list.add(new Articles(rs.getString(1), rs.getString(2),(rs.getTimestamp(3)),rs.getInt(4),rs.getString(5),
                         rs.getString(6),rs.getNString(7), rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11)));
             }
         }
         catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

		return list;
    }
    public static List<Articles> findbyStatus(int status) {
        /*final String query = "select * from articles where status= :status";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("status", status)
                    .executeAndFetch(Articles.class);
        }*/
        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from articles where status = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,status);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Articles(rs.getString(1), rs.getString(2),(rs.getTimestamp(3)),rs.getInt(4),rs.getString(5),
                        rs.getString(6),rs.getString(7), rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Articles findbyID(int ID) {
        /*final String query = "select * from articles where status= :status";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("status", status)
                    .executeAndFetch(Articles.class);
        }*/
        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from articles where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Articles(rs.getString(1), rs.getString(2),(rs.getTimestamp(3)),rs.getInt(4),rs.getString(5),
                        rs.getString(6),rs.getString(7), rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }

}

