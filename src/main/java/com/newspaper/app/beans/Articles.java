package com.newspaper.app.beans;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Articles {

    private String id;
    private String tittle;
    private Timestamp publish_date;
    private int views;
    private String Abstract;
    private String content;
    private String picture_main;
    private int preminum;
    private int status;
    private int categories_id;
    private int writer_id;

    public Articles(String id, String tittle, Timestamp publish_date, int views, String anAbstract, String content, String picture_main, int preminum, int status, int categories_id, int writer_id) {
        this.id = id;
        this.tittle = tittle;
        this.publish_date = publish_date;
        this.views = views;
        Abstract = anAbstract;
        this.content = content;
        this.picture_main = picture_main;
        this.preminum = preminum;
        this.status = status;
        this.categories_id = categories_id;
        this.writer_id = writer_id;
    }

    public Articles() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public Timestamp getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(Timestamp publish_date) {
        this.publish_date = publish_date;
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
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
