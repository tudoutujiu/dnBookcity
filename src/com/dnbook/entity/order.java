package com.dnbook.entity;

public class order {
    private int id;
    private int did;
    private int uid;
    private String uname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public order(int id, int did, int uid, String uname) {
        this.id = id;
        this.did = did;
        this.uid = uid;
        this.uname = uname;
    }

    public order() {}
}
