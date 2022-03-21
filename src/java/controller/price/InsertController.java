/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.price;

import com.google.gson.Gson;
import dal.PriceDBContext;
import dal.ProductsDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Price;
import model.Product;

/**
 *
 * @author TuanAnh
 */
public class InsertController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_productID = request.getParameter("prdid");
        String raw_date = request.getParameter("date");
        String raw_price = request.getParameter("price");
        String raw_decrepsion = request.getParameter("decrepsion");
        
        int productID = Integer.parseInt(raw_productID);
        Date date = Date.valueOf(raw_date);
        int price = Integer.parseInt(raw_price);
        
        ProductsDBContext pd = new ProductsDBContext();
        ArrayList<Product> products = pd.getProducts();
        Product p = new Product();
        p.setProductID(productID);
        p.setProduct_name(products.get(productID-1).getProduct_name());
        
        Price pr = new Price(0, p, date, price, raw_decrepsion);
        
        PriceDBContext pricedb = new PriceDBContext();
        pricedb.insertPrice(pr);
        
//        Gson gson = new Gson();
//        String jsondata = gson.toJson();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
