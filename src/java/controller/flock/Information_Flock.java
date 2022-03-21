/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.flock;

import com.google.gson.Gson;
import dal.Financial_StatementDBContext;
import dal.FlockDBContext;
import dal.PriceDBContext;
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
public class Information_Flock extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("ID"));
        Financial_StatementDBContext fdb = new Financial_StatementDBContext();
        FlockDBContext fldb = new FlockDBContext();
        
        ArrayList<Financial_Statement> flist = fdb.getFSList_all_all_FID(id);
        int days = fldb.getDaysFlock(id);
        
        int revenue = 0;
        int cost = 0;
        for (Financial_Statement fs : flist) {
            int total = fs.getQuantily()*fs.getPrice().getPrice();
            if(fs.isRevenue()) revenue += total;
            else cost += total;
        }
        ArrayList<Integer> list = new ArrayList<>();
        list.add(revenue);
        list.add(cost);
        list.add(days);
        
        ArrayList<Financial_Statement> rList = fdb.getTotalFSListDay(1, id);
        ArrayList<Financial_Statement> cList = fdb.getTotalFSListDay(0, id);
        
        ArrayList<String> dlist = fldb.getAllDateBetweenTwoDate(id);
        
        ArrayList<ArrayList> l = new ArrayList<>();
        l.add(list);
        l.add(rList);
        l.add(cList);
        l.add(dlist);
        
        PrintWriter out = response.getWriter();
        
        Gson gson = new Gson();
        
        String jsondata = gson.toJson(l);
        
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
