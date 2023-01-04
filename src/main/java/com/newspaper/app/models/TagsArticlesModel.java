package com.newspaper.app.models;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.TagsArticles;
import com.newspaper.app.utils.DbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TagsArticlesModel {
    public static List<TagsArticles> findAll()  {
        List<TagsArticles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from tags_has_articles";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new TagsArticles(rs.getInt(1), rs.getInt(2)));
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Integer> findbyID(int ID)  {

        List<Integer> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from tags_has_articles where articles_id = ?";

            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void delete(int  id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM tags_has_articles WHERE id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insert(int tagID, int artiID) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "INSERT INTO tags_has_articles VALUES (?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, tagID);
            statement.setInt(2, artiID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
