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
public class Price {
    private int PriceID;
    private Product Product;
    private Date Date;
    private int Price;
    private String Decrepsion;

    public Price() {
    }

    public Price(int PriceID, Product Product, Date Date, int Price, String Decrepsion) {
        this.PriceID = PriceID;
        this.Product = Product;
        this.Date = Date;
        this.Price = Price;
        this.Decrepsion = Decrepsion;
    }

    public int getPriceID() {
        return PriceID;
    }

    public void setPriceID(int PriceID) {
        this.PriceID = PriceID;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getDecrepsion() {
        return Decrepsion;
    }

    public void setDecrepsion(String Decrepsion) {
        this.Decrepsion = Decrepsion;
    }
    
    
}
