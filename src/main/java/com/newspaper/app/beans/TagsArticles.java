package com.newspaper.app.beans;

public class TagsArticles {
    private int TagID;
    private int ArticlesID;

    public TagsArticles() {
    }

    public TagsArticles(int tagID, int articlesID) {
        TagID = tagID;
        ArticlesID = articlesID;
    }

    public int getTagID() {
        return TagID;
    }

    public void setTagID(int tagID) {
        TagID = tagID;
    }

    public int getArticlesID() {
        return ArticlesID;
    }

    public void setArticlesID(int articlesID) {
        ArticlesID = articlesID;
    }
}
