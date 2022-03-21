///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller.flock;
//
//import dal.FlockDBContext;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Date;
//import java.util.ArrayList;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import model.Flock;
//
///**
// *
// * @author TuanAnh
// */
//public class Insert_Flock extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Insert_Flock</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Insert_Flock at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("../view/flock/insert.jsp").forward(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String raw_Fname = request.getParameter("name");
//        String raw_purchase_date = request.getParameter("purchase_date");
//        String raw_sale_date = request.getParameter("sale_date");
//        
//        Date purchase_date = Date.valueOf(raw_purchase_date);
//        Date sale_date = null;
//        if(!raw_sale_date.equals("")){
//            sale_date = Date.valueOf(raw_sale_date);
//        }
//        Flock f = new Flock(0, raw_Fname, purchase_date, sale_date);
//        
//        FlockDBContext fd = new FlockDBContext();
//        fd.insertFlock(f);
//        response.sendRedirect("Search");
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}

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
public class Insert_Flock extends HttpServlet {

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

        String raw_Fname = request.getParameter("name");
        String raw_purchase_date = request.getParameter("purchase_date");
        String raw_sale_date = request.getParameter("sale_date");

        Date purchase_date = Date.valueOf(raw_purchase_date);
        Date sale_date = null;
        if (!raw_sale_date.equals("")) {
            sale_date = Date.valueOf(raw_sale_date);
        }
        Flock f1 = new Flock(0, raw_Fname, purchase_date, sale_date);

        FlockDBContext fd = new FlockDBContext();
        fd.insertFlock(f1);
        
        FlockDBContext fd1 = new FlockDBContext();
        ArrayList<Flock> flocks = fd1.getFlocks(-1);
        
//        String url_submit = request.getParameter("url_submit");
        
        PrintWriter out = response.getWriter();
//        out.println(url_submit);
        String data = "<table border=\"1px\" id=\"myTable\">\n"
                + "                <tr>\n"
                + "                    <td>ID</td>\n"
                + "                    <td>Name</td>\n"
                + "                    <td>Purchase date</td>\n"
                + "                    <td>Sale date</td>\n"
                + "                    <td>Interactive</td>\n"
                + "                </tr>\n";
        for (Flock f : flocks) {
            data+=
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
                    + "                </tr>\n";

        }
        out.println(data);
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
        request.getRequestDispatcher("../view/flock/search.jsp").forward(request, response);
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
