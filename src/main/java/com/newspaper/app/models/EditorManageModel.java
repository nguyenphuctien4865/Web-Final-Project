package com.newspaper.app.models;

import com.newspaper.app.beans.EditorManage;
import com.newspaper.app.beans.TagsArticles;
import com.newspaper.app.utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EditorManageModel {
    public static List<EditorManage> findAll()  {
        List<EditorManage> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from editor_manage_categories";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new EditorManage(rs.getInt(1), rs.getInt(2),rs.getInt(3)));
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /*public static List<Integer> findbyID(int ID)  {

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
    }*/

    public static void delete(int  id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM editor_manage_categories WHERE editor_id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insert(int userID, int catID) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "INSERT INTO editor_manage_categories (`editor_id`, `category_id`) VALUES (?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, userID);
            statement.setInt(2, catID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
