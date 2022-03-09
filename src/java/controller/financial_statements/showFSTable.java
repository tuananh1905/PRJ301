/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.financial_statements;

import com.google.gson.Gson;
import dal.Financial_StatementDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Financial_Statement;

/**
 *
 * @author TuanAnh
 */
public class showFSTable extends HttpServlet {

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

        String raw_date = request.getParameter("date");
        String raw_isAvai = request.getParameter("isAvai");
        String raw_FID = request.getParameter("FID");

        int FID = Integer.parseInt(raw_FID);
        int isAvai = Integer.parseInt(raw_isAvai);

        ArrayList<Financial_Statement> flist = new ArrayList<>();
        Financial_StatementDBContext fdb = new Financial_StatementDBContext();

        if (!raw_date.equals("")) {
            Date date = Date.valueOf(raw_date);
            if (isAvai == -1) {
                if (FID == -1) {
                    flist = fdb.getFSList_Date_all_all(date);
                } else {
                    flist = fdb.getFSList_Date_all_FID(date, FID);
                }
            } else {
                if (FID == -1) {
                    flist = fdb.getFSList_Date_isAvai_all(date, isAvai);
                } else {
                    flist = fdb.getFSList_Date_isAvai_FID(date, isAvai, FID);
                }
            }
        } else {
            if (isAvai == -1) {
                if (FID == -1) {
                    flist = fdb.getFSList();
                } else {
                    flist = fdb.getFSList_all_all_FID(FID);
                }
            } else {
                if (FID == -1) {
                    flist = fdb.getFSList_all_isAvai_all(isAvai);
                } else {
                    flist = fdb.getFSList_all_isAvai_FID(isAvai, FID);
                }
            }
        }

        Gson gson = new Gson();
        String jsondata = gson.toJson(flist);

        PrintWriter out = response.getWriter();
        out.print(jsondata);
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
