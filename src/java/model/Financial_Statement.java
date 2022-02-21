/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author TuanAnh
 */
public class Financial_Statement {
    private boolean Revenue;
    private Date date;
    private Flock flock;
    private Price price;
    private int Quantily;
    private int Total;
    private String Decrepsion;

    public Financial_Statement() {
    }

    public Financial_Statement(boolean Revenue, Date date, Flock flock, Price price, int Quantily, int Total, String Decrepsion) {
        this.Revenue = Revenue;
        this.date = date;
        this.flock = flock;
        this.price = price;
        this.Quantily = Quantily;
        this.Total = Total;
        this.Decrepsion = Decrepsion;
    }

    public boolean isRevenue() {
        return Revenue;
    }

    public void setRevenue(boolean Revenue) {
        this.Revenue = Revenue;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Flock getFlock() {
        return flock;
    }

    public void setFlock(Flock flock) {
        this.flock = flock;
    }

    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
    }

    public int getQuantily() {
        return Quantily;
    }

    public void setQuantily(int Quantily) {
        this.Quantily = Quantily;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

    public String getDecrepsion() {
        return Decrepsion;
    }

    public void setDecrepsion(String Decrepsion) {
        this.Decrepsion = Decrepsion;
    }
   
}
