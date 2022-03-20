/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.financial_statements;

import dal.Financial_StatementDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Financial_Statement;
import model.Flock;
import model.Price;

/**
 *
 * @author TuanAnh
 */
public class Edit_Financial_Record extends HttpServlet {

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
        String raw_isRevenue = request.getParameter("isRevenue");
        String raw_date = request.getParameter("date");
        String raw_flockID = request.getParameter("flockID");
        String raw_priceID = request.getParameter("priceID");
        String raw_quantily = request.getParameter("quantily");
        String raw_decrepsion = request.getParameter("decrepsion");
        String raw_id = request.getParameter("ID");
        
        boolean gender = raw_isRevenue.equals("Revenue");
        Date date = Date.valueOf(raw_date);
        int flockID = Integer.parseInt(raw_flockID);
        Flock f = new Flock();
        f.setFID(flockID);

        int priceID = Integer.parseInt(raw_priceID);
        Price p = new Price();
        p.setPriceID(priceID);

        int quantily = Integer.parseInt(raw_quantily);

        Financial_Statement fs = new Financial_Statement(gender, date, f, p, quantily, 0, raw_decrepsion);
        
        int id = Integer.parseInt(raw_id);
        Financial_StatementDBContext db = new Financial_StatementDBContext();
        db.updateFS(id, fs);
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
