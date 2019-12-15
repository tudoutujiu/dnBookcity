package com.dnbook.entity;

public class book {
    private int id;
    private int bookid;
    private int stock;
    private String bname;
    private String bookimg;
    private int price;
    private String author;
    private String details;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBookimg() {
        return bookimg;
    }

    public void setBookimg(String bookimg) {
        this.bookimg = bookimg;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public book(int id, int bookid, int stock, String bname, String bookimg, int price, String author, String details) {
        this.id = id;
        this.bookid = bookid;
        this.bname = bname;
        this.bookimg = bookimg;
        this.price = price;
        this.author = author;
        this.details = details;
        this.stock = stock;
    }

    public book() {
    }
}
