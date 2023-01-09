package com.newspaper.app.models;

import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Tags;
import com.newspaper.app.utils.DbUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TagsModel {
    public static List<Tags> findAll()  {

        List<Tags> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from tags";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Tags(rs.getInt(1), rs.getString(2)));
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public static Tags findbyID(int ID) {

        List<Tags> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from tags where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add( new Tags(rs.getInt(1),rs.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }

    public static void update(Tags c) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "UPDATE tags set value=? WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1,c.getValue());
            statement.setInt(2,c.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void delete(int id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM tags WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1,id);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void add(Tags c) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "INSERT INTO tags (value) VALUES (?)";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1,c.getValue());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
