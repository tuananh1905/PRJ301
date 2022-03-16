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
import model.Flock;

/**
 *
 * @author TuanAnh
 */
public class FlockDBContext extends DBContext {

    public void insertFlock(Flock f) {
        String sql = "INSERT INTO [Flocks]\n"
                + "           ([FName]\n"
                + "           ,[Purchase_date]\n"
                + "           ,[Sale_date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, f.getFName());
            stm.setDate(2, f.getPurchase_date());
            stm.setDate(3, f.getSale_date());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<Flock> getFlocks(int isAvai) {
        ArrayList<Flock> flocks = new ArrayList<>();
        try {
            String sql = "SELECT [FID]\n"
                        + "      ,[FName]\n"
                        + "      ,[Purchase_date]\n"
                        + "      ,[Sale_date]\n"
                        + "  FROM [Flocks]\n";
            if (isAvai == 0) {
                sql += "  Where [Sale_date] < getdate() and [Sale_date] is not NULL";
            }
            if (isAvai == 1) {
                sql += "  Where [Sale_date] > getdate() or [Sale_date] is NULL";
            }
            PreparedStatement stm;
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Flock f = new Flock();
                f.setFID(rs.getInt("FID"));
                f.setFName(rs.getString("FName"));
                f.setPurchase_date(rs.getDate("Purchase_date"));
                f.setSale_date(rs.getDate("Sale_date"));

                flocks.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flocks;
    }

    public Flock getFlock(int FID) {
        try {
            String sql = "SELECT [FID]\n"
                        + "      ,[FName]\n"
                        + "      ,[Purchase_date]\n"
                        + "      ,[Sale_date]\n"
                        + "  FROM [Flocks]\n"
                        + "  WHERE [FID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, FID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Flock f = new Flock();
                f.setFID(rs.getInt("FID"));
                f.setFName(rs.getString("FName"));
                f.setPurchase_date(rs.getDate("Purchase_date"));
                f.setSale_date(rs.getDate("Sale_date"));
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void updateFlock(Flock f){
        String sql = "UPDATE [Flocks]\n" +
                    "   SET [FName] = ?\n" +
                    "      ,[Purchase_date] = ?\n" +
                    "      ,[Sale_date] = ?\n" +
                    " WHERE [FID] = ?";
        PreparedStatement stm = null;
        try{
            stm = connection.prepareStatement(sql);
            stm.setString(1, f.getFName());
            stm.setDate(2, f.getPurchase_date());
            stm.setDate(3, f.getSale_date());
            stm.setInt(4, f.getFID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection !=null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    public boolean deleteFlock(int FID){
        boolean check = true;
        String sql = "DELETE FROM [Flocks]\n" +
                    "      WHERE [FID] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, FID);
            stm.executeUpdate(); //INSERT UPDATE DELETE
        } catch (SQLException ex) {
            check = false;
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection !=null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return check;
    }
    public int getDaysFlock(int id){
        int days = 0;
        try {
            String sql = "SELECT [FID]\n" +
                    "      ,[FName]\n" +
                    "      ,[Purchase_date]\n" +
                    "      ,[Sale_date]\n" +
                    "	  ,CASE \n" +
                    "		WHEN [Sale_date] is null then (DATEDIFF(dd, [Purchase_date], GETDATE()) + 1)\n" +
                    "		ELSE (DATEDIFF(dd, [Purchase_date], [Sale_date]) + 1)\n" +
                    "		END AS [days]\n" +
                    "  FROM [Flocks]\n" +
                    "  WHERE [FID] = ?";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                days = rs.getInt("days");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return days;
    }
    
    public int TestdeleteFlock(int FID){
        int error = 0;
        String sql = "DELETE FROM [Flocks]\n" +
                    "      WHERE [FID] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, FID);
            stm.executeUpdate(); //INSERT UPDATE DELETE
        } catch (SQLException ex) {
            error = ex.getErrorCode();
            Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection !=null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlockDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return error;
    }
}
