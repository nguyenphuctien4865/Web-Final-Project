package com.newspaper.app.beans;

public class TagsArticles {
    private int TagID;
    private int ArticlesID;

    public Tags getTag() {
        return tag;
    }

    public void setTag(Tags tag) {
        this.tag = tag;
    }

    public Articles getArticles() {
        return articles;
    }

    public void setArticles(Articles articles) {
        this.articles = articles;
    }

    private Tags tag;
    private Articles articles;

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
