package com.newspaper.app.beans;

public class Articles {

    private String ArticlesID;
    private String tittle;
    private int views;
    private String Abstract;
    private String Content;
    private String picture_main;
    private int preminum;
    private int status;
    private int categories_id;
    private int writer_id;

    public Articles(String articlesID, String tittle, int views, String anAbstract, String content, String picture_main, int preminum, int status, int categories_id, int writer_id) {
        ArticlesID = articlesID;
        this.tittle = tittle;
        this.views = views;
        Abstract = anAbstract;
        Content = content;
        this.picture_main = picture_main;
        this.preminum = preminum;
        this.status = status;
        this.categories_id = categories_id;
        this.writer_id = writer_id;
    }

    public Articles() {
    }



    public String getArticlesID() {
        return ArticlesID;
    }

    public void setArticlesID(String articlesID) {
        ArticlesID = articlesID;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String anAbstract) {
        Abstract = anAbstract;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getPicture_main() {
        return picture_main;
    }

    public void setPicture_main(String picture_main) {
        this.picture_main = picture_main;
    }

    public int getPreminum() {
        return preminum;
    }

    public void setPreminum(int preminum) {
        this.preminum = preminum;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }

    public int getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(int writer_id) {
        this.writer_id = writer_id;
    }
}
