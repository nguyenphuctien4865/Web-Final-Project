package com.newspaper.app.models;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryModel {

   /* public static List<Categories> findAll() {
        final String query = "select c1.id, c1.name, c1.parent_id, c2.name as parentName from categories c1 join categories c2 on c1.id = c2.id";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Categories.class);
        }
    }*/

    public static List<Categories> findParentCat(int temp) {

        List<Categories> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query;
            if (temp==0 ){
                query = "select * from categories where parent_id is null";
            }else {
                query = "select * from categories where parent_id is not null";

            }
            PreparedStatement statement = con.prepareStatement(query);


            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<Categories> findAll() {

        List<Categories> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from categories ";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
