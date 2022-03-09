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
import java.util.ArrayList;
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
public class Insert_Financial_Record extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Insert_Financial_Record</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Insert_Financial_Record at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("../view/financial_statements/insert.jsp").forward(request, response);
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
        int count_data = Integer.parseInt(request.getParameter("count_data"));
        
//        ArrayList<Financial_Statement> fsList = new ArrayList<>();
        
        PrintWriter out = response.getWriter();
        for (int i = 1; i <= count_data; i++) {
            Financial_StatementDBContext fdb = new Financial_StatementDBContext();
            String raw_isRevenue = request.getParameter("hidden_isRevenue["+i+"]");
            String raw_date = request.getParameter("hidden_date["+i+"]");
            String raw_flockID = request.getParameter("hidden_flockID["+i+"]");
            String raw_priceID = request.getParameter("hidden_priceID["+i+"]");
            String raw_quantily = request.getParameter("hidden_quantily["+i+"]");
            String raw_total = request.getParameter("hidden_total["+i+"]");
            String raw_decrepsion = request.getParameter("hidden_decrepsion["+i+"]");
            
            boolean gender = raw_isRevenue.equals("Revenue");
            Date date = Date.valueOf(raw_date);
            int flockID = Integer.parseInt(raw_flockID);
            Flock f = new Flock();
            f.setFID(flockID);
            
            int priceID = Integer.parseInt(raw_priceID);
            Price p = new Price();
            p.setPriceID(priceID);
            
            int quantily = Integer.parseInt(raw_quantily);
            int total = Integer.parseInt(raw_total);
            
            Financial_Statement fs = new Financial_Statement(gender, date, f, p, quantily, total, raw_decrepsion);
            fdb.insertFinancial(fs);
//            fsList.add(fs);
//            data += i;
//            data += "\n    "+raw_isRevenue+" "+raw_date+" "+raw_flockID+" "+raw_priceID+" "+raw_quantily+" "+raw_total+" "+raw_decrepsion;
        }
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
