/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Price;

/**
 *
 * @author TuanAnh
 */
public class PriceDBContext extends DBContext{
    public void insertPrice(Price p){
        String sql = "INSERT INTO [Price]\n" +
                    "           ([ProductID]\n" +
                    "           ,[Date]\n" +
                    "           ,[Price]\n" +
                    "           ,[Decrepsion])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?)";
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
}
