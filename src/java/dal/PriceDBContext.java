/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Price;
import model.Product;

/**
 *
 * @author TuanAnh
 */
public class PriceDBContext extends DBContext {

    public void insertPrice(Price p) {
        String sql = "INSERT INTO [Price]\n"
                + "           ([ProductID]\n"
                + "           ,[Date]\n"
                + "           ,[Price]\n"
                + "           ,[Decrepsion])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, p.getProduct().getProductID());
            stm.setDate(2, p.getDate());
            stm.setInt(3, p.getPrice());
            stm.setString(4, p.getDecrepsion());
            stm.executeUpdate(); //INSERT UPDATE DELETE
        } catch (SQLException ex) {
            Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public ArrayList<Price> getPriceList(int prdid, String date) {
        ArrayList<Price> priceList = new ArrayList<>();
        try {
            String sql = "SELECT p.[PriceID]\n"
                    + "      ,p.[ProductID]\n"
                    + "      ,prd.[Product_name]\n"
                    + "      ,p.[Date]\n"
                    + "      ,p.[Price]\n"
                    + "      ,p.[Decrepsion]\n"
                    + "  FROM [Price] p join [Products] prd on p.[ProductID] = prd.[ProductID]\n";
            PreparedStatement stm = null;
            if (prdid==0 && !date.equals("")) {
                sql += "  WHERE p.[Date] = ?\n";
                sql += "  ORDER BY p.[Date] DESC\n";
                stm = connection.prepareStatement(sql);
                Date d = Date.valueOf(date);
                stm.setDate(1, d);
            }
            else if(prdid > 0 && date.equals("")){
                sql += "  WHERE p.[ProductID] = ?\n";
                sql += "  ORDER BY p.[Date] DESC\n";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, prdid);
            }
            else if (prdid > 0 && !date.equals("")) {
                sql += "  WHERE p.[ProductID] = ?\n";
                sql += "  AND p.[Date] = ?\n";
                sql += "  ORDER BY p.[Date] DESC\n";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, prdid);
                Date d = Date.valueOf(date);
                stm.setDate(2, d);
            }
            else {
                sql += "  ORDER BY p.[Date] DESC\n";
                stm = connection.prepareStatement(sql);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product prd = new Product();
                prd.setProductID(rs.getInt("ProductID"));
                prd.setProduct_name(rs.getString("Product_name"));

                Price p = new Price();
                p.setPriceID(rs.getInt("PriceID"));
                p.setProduct(prd);
                p.setDate(rs.getDate("Date"));
                p.setPrice(rs.getInt("Price"));
                p.setDecrepsion(rs.getString("Decrepsion"));
                priceList.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return priceList;
    }
    
    public void updateFlock(int pid, int prdid, Date date, int price, String decrepsion){
        String sql = "UPDATE [Price]\n" +
                    "   SET [ProductID] = ?\n" +
                    "      ,[Date] = ?\n" +
                    "      ,[Price] = ?\n" +
                    "      ,[Decrepsion] = ?\n" +
                    " WHERE [PriceID] = ?";
        PreparedStatement stm = null;
        try{
            stm = connection.prepareStatement(sql);
            stm.setInt(1, prdid);
            stm.setDate(2, date);
            stm.setInt(3, price);
            stm.setString(4, decrepsion);
            stm.setInt(5, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection !=null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public boolean deletePrice(int pid){
        boolean check = true;
        String sql = "DELETE FROM [Price]\n" +
                    "      WHERE [PriceID] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.executeUpdate(); //INSERT UPDATE DELETE
        } catch (SQLException ex) {
            check = false;
            Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection !=null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PriceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return check;
    }
}
