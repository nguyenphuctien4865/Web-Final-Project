package com.newspaper.app.models;

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
}
