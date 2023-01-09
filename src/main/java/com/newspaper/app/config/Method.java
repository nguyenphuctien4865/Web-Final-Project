package com.newspaper.app.config;

import java.sql.Timestamp;
import java.util.Calendar;

public class Method {
    public static int[] StringArrToIntArr(String[] s) {
        int[] result = new int[s.length];
        for (int i = 0; i < s.length; i++) {
            result[i] = Integer.parseInt(s[i]);
        }
        return result;
    }

    public static Timestamp checkExpire(Timestamp issue_at, int expiration) {

        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(issue_at.getTime());
        cal.add(Calendar.MINUTE, expiration);
        Timestamp later = new Timestamp(cal.getTime().getTime());
        return later;
    }

    }
