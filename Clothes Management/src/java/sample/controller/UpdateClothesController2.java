/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.object.Clothes;
import sample.object.DAO;

/**
 *
 * @author ADMIN
 */
public class UpdateClothesController2 extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "AddCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            DAO dao = new DAO();
            String name = request.getParameter("checkOutClothesName");
            int quantity = Integer.parseInt(request.getParameter("checkOutClothesQuantity"));
            int price = Integer.parseInt(request.getParameter("checkOutClothesPrice"));
            Clothes clo = dao.getQuantity(name);
            int clothesQuantity = clo.getQuantity();
            clothesQuantity -= quantity;
            boolean status = false;
            if (clothesQuantity > 0) {
                status = true;
            }
            Clothes clo2 = new Clothes("", name, "", price, clothesQuantity, status, "");
            boolean checkUpdate = dao.updateClothes2(clo2);

            if (checkUpdate) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at Update Controller" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
