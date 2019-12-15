package com.dnbook.entity;

public class details {
    private int id;
    private int unum;
    private int price;
    private double totalprice;
    private String uname;
    private String times;
    private String bookname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUnum() {
        return unum;
    }

    public void setUnum(int unum) {
        this.unum = unum;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public details(int id, int unum, int price, double totalprice, String uname, String times, String bookname) {
        this.id = id;
        this.unum = unum;
        this.price = price;
        this.totalprice = totalprice;
        this.uname = uname;
        this.times = times;
        this.bookname = bookname;
    }

    public details() {
    }
}
