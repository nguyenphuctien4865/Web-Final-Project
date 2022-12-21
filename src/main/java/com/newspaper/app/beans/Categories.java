package com.newspaper.app.beans;

public class Categories {
    private int CatID;
    private String name;

    public Categories(int catID, String name, int parentID) {
        CatID = catID;
        this.name = name;
        ParentID = parentID;
    }

    private int ParentID;

    public Categories() {
    }

    public int getCatID() {
        return CatID;
    }

    public void setCatID(int catID) {
        CatID = catID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentID() {
        return ParentID;
    }

    public void setParentID(int parentID) {
        ParentID = parentID;
    }
}
