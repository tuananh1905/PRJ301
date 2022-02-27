/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.price;

import dal.PriceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Price;

/**
 *
 * @author TuanAnh
 */
public class showPriceTable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        int prdid = Integer.parseInt(request.getParameter("prdid"));
        String date = request.getParameter("date");
        
        PriceDBContext pd = new PriceDBContext();
        ArrayList<Price> priceList = pd.getPriceList(prdid, date);
        String html = "";
        if(priceList.size()>0){
            html += "<table border=\"1px\" id=\"myTable\">\n"
                + "                <tr>\n"
                + "                    <td>ID</td>\n"
                + "                    <td>Product Name</td>\n"
                + "                    <td>Date</td>\n"
                + "                    <td>Price</td>\n"
                + "                    <td>Decrepsion</td>\n"
                + "                    <td>Interactive</td>\n"
                + "                </tr>\n";
            for (Price p : priceList) {
                html += "                <tr>\n"
                    + "                    <td>" + p.getPriceID() + "</td>\n"
                    + "                    <td>" + p.getProduct().getProduct_name() + "</td>\n"
                    + "                    <td>" + p.getDate() + "</td>\n"
                    + "                    <td>" + p.getPrice() + "</td>\n"
                    + "                    <td>" + p.getDecrepsion() + "</td>\n"
                    + "                    <td>\n"
                    + "                        <button id=\"edit\" data-modal-target=\"#modal\">Edit</button>\n"
                    + "                        <button id=\"delete\" data-modal-target=\"#modalDelete\">Delete</button>\n"
                    + "                        <button id=\"interactive\" data-modal-target=\"#modal\">Information</button>\n"
                    + "                    </td>\n"
                    + "                </tr>\n";
            }
            out.println(html);
        }
        else{
            out.println("No record to display");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
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
