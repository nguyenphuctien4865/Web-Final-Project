package com.newspaper.app.beans;

import java.time.LocalDateTime;

public class Comments {
    public Comments(int articlesID, int userID, String comment, LocalDateTime date) {
        ArticlesID = articlesID;
        UserID = userID;
        Comment = comment;
        Date = date;
    }

    private int ArticlesID;
    private int UserID;
    private String Comment;
    private LocalDateTime Date;

    public Comments() {
    }


    public int getArticlesID() {
        return ArticlesID;
    }

    public void setArticlesID(int articlesID) {
        ArticlesID = articlesID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }

    public LocalDateTime getDate() {
        return Date;
    }

    public void setDate(LocalDateTime date) {
        Date = date;
    }
}


