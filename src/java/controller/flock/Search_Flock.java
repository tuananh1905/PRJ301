/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.flock;

import dal.FlockDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Flock;

/**
 *
 * @author TuanAnh
 */
public class Search_Flock extends HttpServlet {

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
        String raw_isAvai = request.getParameter("isAvai");
        raw_isAvai = (raw_isAvai == null || raw_isAvai.length() == 0) ? "-1" : raw_isAvai;
        int isAvai = Integer.parseInt(raw_isAvai);

        FlockDBContext fd = new FlockDBContext();
        ArrayList<Flock> flocks = fd.getFlocks(isAvai);

        PrintWriter out = response.getWriter();
        out.println("<table border=\"1px\" id=\"myTable\">\n"
                + "                <tr>\n"
                + "                    <td>ID</td>\n"
                + "                    <td>Name</td>\n"
                + "                    <td>Purchase date</td>\n"
                + "                    <td>Sale date</td>\n"
                + "                    <td>Interactive</td>\n"
                + "                </tr>\n");
        for (Flock f : flocks) {
            out.println(
                    "                <tr>\n"
                    + "                    <td>" + f.getFID() + "</td>\n"
                    + "                    <td>" + f.getFName() + "</td>\n"
                    + "                    <td>" + f.getPurchase_date() + "</td>\n"
                    + "                    <td>" + f.getSale_date() + "</td>\n"
                    + "                    <td>\n"
                    + "                        <button id=\"edit\" data-modal-target=\"#modal\">Edit</button>\n"
                    + "                        <button id=\"delete\" data-modal-target=\"#modalDelete\">Delete</button>\n"
                    + "                        <button id=\"interactive\" data-modal-target=\"#modal\">Information</button>\n"
                    + "\n"
                    + "                    </td>\n"
                    + "                </tr>\n");

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
        FlockDBContext fd1 = new FlockDBContext();
        ArrayList<Flock> flocks = fd1.getFlocks(-1);
        request.getRequestDispatcher("../view/flock/search.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
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
