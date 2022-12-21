package com.newspaper.app.beans;

import java.time.LocalDateTime;

public class Users {
    private int UserID;
    private String Username;
    private String Password;
    private String Name;
    private LocalDateTime Issue_at;
    private int Expiration;
    private int Role;
    private String Second_name;
    private LocalDateTime Dob;
    private String Email;
    private String Otp;
    private String Otp_Exp;

    public Users(int userID, String username, String password, String name, LocalDateTime issue_at, int expiration, int role, String second_name, LocalDateTime dob, String email, String otp, String otp_Exp) {
        UserID = userID;
        Username = username;
        Password = password;
        Name = name;
        Issue_at = issue_at;
        Expiration = expiration;
        Role = role;
        Second_name = second_name;
        Dob = dob;
        Email = email;
        Otp = otp;
        Otp_Exp = otp_Exp;
    }

    public Users() {
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public LocalDateTime getIssue_at() {
        return Issue_at;
    }

    public void setIssue_at(LocalDateTime issue_at) {
        Issue_at = issue_at;
    }

    public int getExpiration() {
        return Expiration;
    }

    public void setExpiration(int expiration) {
        Expiration = expiration;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int role) {
        Role = role;
    }

    public String getSecond_name() {
        return Second_name;
    }

    public void setSecond_name(String second_name) {
        Second_name = second_name;
    }

    public LocalDateTime getDob() {
        return Dob;
    }

    public void setDob(LocalDateTime dob) {
        Dob = dob;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getOtp() {
        return Otp;
    }

    public void setOtp(String otp) {
        Otp = otp;
    }

    public String getOtp_Exp() {
        return Otp_Exp;
    }

    public void setOtp_Exp(String otp_Exp) {
        Otp_Exp = otp_Exp;
    }
}
