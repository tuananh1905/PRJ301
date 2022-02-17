/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author TuanAnh
 */
public class Product {
    private int ProductID;
    private String Product_name;

    public Product() {
    }

    public Product(int ProductID, String Product_name) {
        this.ProductID = ProductID;
        this.Product_name = Product_name;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProduct_name() {
        return Product_name;
    }

    public void setProduct_name(String Product_name) {
        this.Product_name = Product_name;
    }
    
}
