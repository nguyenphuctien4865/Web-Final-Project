package com.newspaper.app.beans;

public class Tags {
    private int Id;

    public Tags() {
    }

    public Tags(int id, String value) {
        Id = id;
        Value = value;
    }

    private String Value;


    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getValue() {
        return Value;
    }

    public void setValue(String value) {
        Value = value;
    }
}


