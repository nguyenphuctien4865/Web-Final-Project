package com.newspaper.app.beans;

public class EditorManage {
    private int ID;
    private int EditorID;
    private int CategoryID;

    private Users editor;

    public Users getEditor() {
        return editor;
    }

    public void setEditor(Users editor) {
        this.editor = editor;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
    }

    private Categories category;

    public EditorManage() {
    }

    public EditorManage(int ID, int editorID, int categoryID) {
        this.ID = ID;
        EditorID = editorID;
        CategoryID = categoryID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getEditorID() {
        return EditorID;
    }

    public void setEditorID(int editorID) {
        EditorID = editorID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int categoryID) {
        CategoryID = categoryID;
    }
}
