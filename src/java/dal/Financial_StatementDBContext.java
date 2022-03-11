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
import model.Financial_Statement;
import model.Flock;
import model.Price;
import model.Product;

/**
 *
 * @author TuanAnh
 */
public class Financial_StatementDBContext extends DBContext {

    public void insertFinancial(Financial_Statement fs) {
        String sql = "INSERT INTO [dbo].[Financial]\n"
                    + "           ([IsRevenue]\n"
                    + "           ,[Date]\n"
                    + "           ,[FID]\n"
                    + "           ,[PriceID]\n"
                    + "           ,[Quantily]\n"
                    + "           ,[Total]\n"
                    + "           ,[Decrepsion])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setBoolean(1, fs.isRevenue());
            stm.setDate(2, fs.getDate());
            stm.setInt(3, fs.getFlock().getFID());
            stm.setInt(4, fs.getPrice().getPriceID());
            stm.setInt(5, fs.getQuantily());
            stm.setInt(6, fs.getTotal());
            stm.setString(7, fs.getDecrepsion());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Financial_StatementDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
    
    public ArrayList<Financial_Statement> getFSList(){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                            "      ,f.[Date]\n" +
                            "      ,f.[FID]\n" +
                            "	  ,fl.[FName]\n" +
                            "      ,f.[PriceID]\n" +
                            "      ,p.[Price]\n" +
                            "	  ,p.[ProductID]\n" +
                            "	  ,pr.[Product_name]\n" +
                            "      ,f.[Quantily]\n" +
                            "      ,f.[Total]\n" +
                            "      ,f.[Decrepsion]\n" +
                            "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID \n" +
                            "					 join [Price] p on f.PriceID = p.PriceID\n" +
                            "					 join [Products] pr on p.ProductID = pr.ProductID\n" +
                            "  ORDER BY [Date] DESC";
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
     
    public ArrayList<Financial_Statement> getFSList_Date_all_all(Date date){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[Date] = ?\n" +
                        "  ORDER BY [FName] ASC";
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_Date_all_FID(Date date, int FID){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[Date] = ? AND f.[FID] = ?\n" +
                        "  ORDER BY [FName] ASC";
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, FID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_Date_isAvai_all(Date date, int isAvai){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "       ,fl.[Sale_date]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[Date] = ?\n";
            if (isAvai == 0) {
                sql += "  AND (fl.[Sale_date] < getdate() and fl.[Sale_date] is not NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            if (isAvai == 1) {
                sql += "  AND (fl.[Sale_date] > getdate() or fl.[Sale_date] is NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_Date_isAvai_FID(Date date, int isAvai, int FID){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "       ,fl.[Sale_date]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[Date] = ? AND f.[FID] = ?\n";
            if (isAvai == 0) {
                sql += "  AND (fl.[Sale_date] < getdate() and fl.[Sale_date] is not NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            if (isAvai == 1) {
                sql += "  AND (fl.[Sale_date] > getdate() or fl.[Sale_date] is NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, FID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_all_all_FID(int FID){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "	   ,fl.[Sale_date]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[FID] = ?\n" +
                        "  ORDER BY [FName] ASC";
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, FID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_all_isAvai_FID(int isAvai, int FID){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "	   ,fl.[Sale_date]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n" +
                        "  WHERE f.[FID] = ?\n";
            if (isAvai == 0) {
                sql += "  AND (fl.[Sale_date] < getdate() and fl.[Sale_date] is not NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            if (isAvai == 1) {
                sql += "  AND (fl.[Sale_date] > getdate() or fl.[Sale_date] is NULL)";
                sql += "  ORDER BY [FName] ASC";
            }
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, FID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
    
    public ArrayList<Financial_Statement> getFSList_all_isAvai_all(int isAvai){
        ArrayList<Financial_Statement> flist = new ArrayList<>();
        try {
            String sql = "SELECT f.[IsRevenue]\n" +
                        "       ,f.[Date]\n" +
                        "       ,f.[FID]\n" +
                        "       ,fl.[FName]\n" +
                        "	   ,fl.[Sale_date]\n" +
                        "       ,f.[PriceID]\n" +
                        "       ,p.[Price]\n" +
                        "       ,p.[ProductID]\n" +
                        "       ,pr.[Product_name]\n" +
                        "       ,f.[Quantily]\n" +
                        "       ,f.[Total]\n" +
                        "       ,f.[Decrepsion]\n" +
                        "  FROM [Financial] f join [Flocks] fl on f.FID = fl.FID\n" +
                        "                     join [Price] p on f.PriceID = p.PriceID\n" +
                        "                     join [Products] pr on p.ProductID = pr.ProductID\n";
            if (isAvai == 0) {
                sql += "  WHERE (fl.[Sale_date] < getdate() and fl.[Sale_date] is not NULL)";
            }
            if (isAvai == 1) {
                sql += "  WHERE (fl.[Sale_date] > getdate() or fl.[Sale_date] is NULL)";
            }
            sql += "  ORDER BY [FName] ASC";
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Financial_Statement f = new Financial_Statement();
                Flock fl = new Flock();
                Price p = new Price();
                Product pr = new Product();
                
                f.setRevenue(rs.getBoolean("IsRevenue"));
                f.setDate(rs.getDate("Date"));
                
                fl.setFID(rs.getInt("FID"));
                fl.setFName(rs.getString("FName"));
                f.setFlock(fl);
                
                p.setPriceID(rs.getInt("PriceID"));
                pr.setProductID(rs.getInt("ProductID"));
                pr.setProduct_name(rs.getString("Product_name"));
                p.setProduct(pr);
                p.setPrice(rs.getInt("Price"));
                
                f.setPrice(p);
                f.setQuantily(rs.getInt("Quantily"));
                f.setTotal(rs.getInt("Total"));
                f.setDecrepsion(rs.getString("Decrepsion"));
                
                flist.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flist;
    }
}
