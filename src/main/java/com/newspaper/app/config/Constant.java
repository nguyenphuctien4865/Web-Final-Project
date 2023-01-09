package com.newspaper.app.config;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Constant {
    public static final String[] STATUS = {"Từ chối","Draft","Xuất bản"};
    public static final String[] ROLE = {"Admin","Editor","Writer","Độc giả"};

    public static final DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public String[] getSTATUS() {
        return STATUS;
    }

    public String[] getRole() {
        return ROLE;
    }
}
