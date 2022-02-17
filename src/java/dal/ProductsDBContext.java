/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author TuanAnh
 */
public class ProductsDBContext extends DBContext{
    public ArrayList<Product> getProducts(){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT ProductID, Product_name FROM Products";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProduct_name(rs.getString("Product_name"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
