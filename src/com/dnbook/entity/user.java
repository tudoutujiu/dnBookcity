package com.dnbook.entity;

public class user {
    private int id;
    private int lv;
    private String username;
    private String password;
    private String email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLv() {
        return lv;
    }

    public void setLv(int lv) {
        this.lv = lv;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public user(int id, int lv, String username, String password, String email) {
        this.id = id;
        this.lv = lv;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public user() {}
}
