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
import model.Financial_Statement;

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
}
