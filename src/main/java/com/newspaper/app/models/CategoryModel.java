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
                query = "select * from categories where parent_id is null  ";
            }else {
                query = "select * from categories where parent_id is not null ORDER BY parent_id ASC";

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
        Categories catC = null;
        Categories catP = null;
        List<Categories> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select a.id, a.name, a.parent_id, b.id, b.name, b.parent_id from categories a LEFT JOIN categories b ON a.parent_id = b.id";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                catP = new Categories();
                catC = new Categories();

                catP.setId(rs.getInt("b.id"));
                catP.setName(rs.getString("b.name"));

                catC.setId(rs.getInt(1));
                catC.setName(rs.getString(2));
                catC.setParent_id(rs.getInt(3));
                catC.setParentCAT(catP);

                list.add(catC);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Categories findbyID(int ID) {

        List<Categories> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from categories where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add( new Categories(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }

    public static void update(Categories c) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "UPDATE categories set name=?, parent_id=? WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1,c.getName());
            if (c.getParent_id()==0)
                statement.setNull(2,java.sql.Types.INTEGER);
            else
                statement.setInt(2,c.getParent_id());
            statement.setInt(3,c.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void delete(int id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM categories WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1,id);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void add(Categories c) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "INSERT INTO categories (name, parent_id) VALUES (?,?)";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1,c.getName());
            if (c.getParent_id() == 0 )
                statement.setInt(2,java.sql.Types.INTEGER);
            else
                statement.setInt(2, c.getParent_id());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
