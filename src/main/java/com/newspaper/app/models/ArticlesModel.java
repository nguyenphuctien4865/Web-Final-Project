package com.newspaper.app.models;

import com.newspaper.app.beans.Articles;
import com.newspaper.app.beans.Categories;
import com.newspaper.app.beans.Users;
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
    public static List<Articles> findAll() {

        List<Articles> list = new ArrayList<>();
         try (Connection con = DbUtils.initializeDatabase() ){
             String query = "select * from articles";
             PreparedStatement statement = con.prepareStatement(query);
             ResultSet rs = statement.executeQuery();
             while (rs.next()) {
                 Articles a = new Articles();
                 a.setId(rs.getInt("id"));
                 a.setTittle(rs.getString("title"));
                 a.setPublish_date(rs.getTimestamp("publish_date"));
                 a.setViews(rs.getInt("views"));
                 a.setAbstract(rs.getString("abstract"));
                 a.setContent(rs.getString("content"));
                 a.setCategories_id(rs.getInt("categories_id"));
                 a.setPicture_main(rs.getString("picture_main"));
                 a.setPreminum(rs.getInt("preminum"));
                 a.setWriter_id(rs.getInt("writer_id"));
                 a.setStatus(rs.getInt("status"));
                 a.setMessage(rs.getString("message"));
                 list.add(a);
             }
         }
         catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

		return list;
    }

    public static List<Articles> findbyCAT(int catID, int id) {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from articles where categories_id = ? AND id <> ? LIMIT 5";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,catID);
            statement.setInt(2,id);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Articles> findallbyCAT(int catID) {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase() ){
            String query = "select * from articles where categories_id = ? ";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,catID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public static List<Articles> findbyStatus(int status) {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from articles where status = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,status);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Articles findbyID(int ID) {
        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "select * from articles where ID = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);

            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }


    public static Articles findDetail(int ID) {

        Articles a = null;
        Categories c = null;
        Users u = null;

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "SELECT a.id,a.title, a.publish_date,a.views,a.abstract,a.content,a.categories_id,a.picture_main,a.preminum,a.writer_id,a.status,a.message,b.name,c.name FROM newspaper_website.articles a JOIN categories b ON (a.categories_id = b.id) JOIN users c ON (a.writer_id = c.id) WHERE a.id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,ID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = new Articles();
                c = new Categories();
                u = new Users();

                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));

                c.setName(rs.getString(13));

                u.setName(rs.getString(14));

                a.setCategory(c);
                a.setWriter(u);

                list.add(a);

            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list.get(0);
    }

    public static List<Articles> findbyViewWeek() {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "SELECT * FROM newspaper_website.articles  WHERE  (YEARWEEK(`publish_date`, 1) = YEARWEEK(CURDATE(), 1)) ORDER BY views desc LIMIT 5;";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Articles> findbyView() {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "SELECT * FROM newspaper_website.articles ORDER BY views desc LIMIT 10;";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Articles> findbyDate() {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "SELECT * FROM newspaper_website.articles ORDER BY publish_date desc LIMIT 10;";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Articles> findbyCat() {

        List<Articles> list = new ArrayList<>();
        try (Connection con = DbUtils.initializeDatabase()){
            String query = " select articles.* from articles,(Select  max(a.publish_date) maxdate, a.categories_id from articles a  inner join (SELECT c.*, count(a.id) as npa \n" +
                    "\t\tFROM categories  c\n" +
                    "\t\tleft join articles a  \n" +
                    "\t\ton c.id = a.categories_id\n" +
                    "\t\tgroup by c.id order by npa desc limit 10  ) c  on a.categories_id = c.id group by a.categories_id) time_cat \n" +
                    "        where articles.categories_id= time_cat.categories_id and articles.publish_date = maxdate";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Articles a = new Articles();
                a.setId(rs.getInt("id"));
                a.setTittle(rs.getString("title"));
                a.setPublish_date(rs.getTimestamp("publish_date"));
                a.setViews(rs.getInt("views"));
                a.setAbstract(rs.getString("abstract"));
                a.setContent(rs.getString("content"));
                a.setCategories_id(rs.getInt("categories_id"));
                a.setPicture_main(rs.getString("picture_main"));
                a.setPreminum(rs.getInt("preminum"));
                a.setWriter_id(rs.getInt("writer_id"));
                a.setStatus(rs.getInt("status"));
                a.setMessage(rs.getString("message"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void update(Articles articles) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "UPDATE articles SET title=?, publish_date=?, views=?, abstract=?, content=?, categories_id=?, picture_main=?, preminum=?,status=?, message=? where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, articles.getTittle());
            statement.setTimestamp(2, articles.getPublish_date());
            statement.setInt(3,articles.getViews());
            statement.setString(4, articles.getAbstract());
            statement.setString(5, articles.getContent());
            statement.setInt(6,articles.getCategories_id());
            statement.setString(7,articles.getPicture_main());
            statement.setInt(8,articles.getPreminum());
            statement.setInt(9,articles.getStatus());
            statement.setString(10,articles.getMessage());
            statement.setInt(11,articles.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try (Connection con = DbUtils.initializeDatabase()){
            String query = "DELETE FROM articles WHERE id=? ";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt(1,id);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    public void save(Articles a) {
        try (Connection con = DbUtils.initializeDatabase()) {
            String query = "insert into articles"
                    + "(title,publish_date, views, abstract, content, categories_id, picture_main, preminum, writer_id, status) "
                    + "values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, a.getTittle());
            pre.setTimestamp(2, a.getPublish_date());
            pre.setInt(3, a.getViews());
            pre.setString(4, a.getAbstract());
            pre.setString(5, a.getContent());
            pre.setInt(6, a.getCategories_id());
            pre.setString(7, a.getPicture_main());
            pre.setInt(8, a.getPreminum());
            pre.setInt(9, a.getWriter_id());
            pre.setInt(10, a.getStatus());
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }





}

