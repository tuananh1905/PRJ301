/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.flock;

import dal.FlockDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Flock;

/**
 *
 * @author TuanAnh
 */
public class Edit_Flock extends HttpServlet {

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
            out.println("<title>Servlet Edit_Flock</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Edit_Flock at " + request.getContextPath() + "</h1>");
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
        int FID = Integer.parseInt(request.getParameter("FID"));
        
        FlockDBContext fd = new FlockDBContext();
        Flock f = fd.getFlock(FID);
        request.setAttribute("flock", f);
        
        String raw_FName = request.getParameter("name");
        String raw_purchase_date = request.getParameter("purchase_date");
        String raw_sale_date = request.getParameter("sale_date");
        
        if(raw_FName!=null){
            Date purchase_date_updated = Date.valueOf(raw_purchase_date);
            Date sale_date_updated = (raw_sale_date.equals(""))?null:Date.valueOf(raw_sale_date);
//            Date sale_date_updated = Date.valueOf(raw_sale_date);
            
            Flock f_updated = new Flock(FID, raw_FName, purchase_date_updated, sale_date_updated);
            fd.updateFlock(f_updated);
            response.sendRedirect("Search");
        }
        else{
            request.getRequestDispatcher("../view/flock/edit.jsp").forward(request, response);
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
