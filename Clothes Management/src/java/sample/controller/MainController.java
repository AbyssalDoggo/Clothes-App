/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "Login";
    private static final String LoginPage = "login.jsp";
    private static final String LoginController = "LoginController";
    private static final String REGISTER = "Register";
    private static final String REGISTERCONTROLLER = "RegisterController";
    private static final String CREATEUSER = "CreateUser";
    private static final String CreateUserController = "CreateUserController";
    private static final String DELETE = "Delete";
    private static final String DeleteUserController = "DeleteUserController";
    private static final String UPDATE = "Update";
    private static final String UpdateUserController = "UpdateUserController";
    private static final String SEARCH = "Search";
    private static final String SearchController = "SearchController";
    private static final String SearchController2 = "SearchController2";
    private static final String SEARCHCLOTHES = "SearchClothes";
    private static final String ManageClothesController = "ManageClothesController";
    private static final String SEARCHORDER = "SearchOrder";
    private static final String ManageOrderController = "ManageOrderController";
    private static final String CREATECLOTHES = "CreateClothes";
    private static final String CreateClothesController = "CreateClothesController";
    private static final String UPDATECLOTHES = "UpdateClothes";
    private static final String UpdateClothesController = "UpdateClothesController";
    private static final String DELETECLOTHES = "DeleteClothes";
    private static final String DeleteClothesController = "DeleteClothesController";
    private static final String SEARCHUSER = "SearchUser";
    private static final String ManageUserController = "ManageUserController";
    private static final String ADDCART = "AddCart";
    private static final String AddCartController = "AddCartController";
    private static final String EDITCART = "EditCart";
    private static final String EditCartController = "EditCartController";
    private static final String REMOVECART = "RemoveCart";
    private static final String RemoveCartController = "RemoveCartController";
    private static final String CHECKOUT = "CheckOut";
    private static final String CheckOutController = "CheckOutController";
    private static final String DELETEORDER = "DeleteOrder";
    private static final String DeleteOrderController = "DeleteOrderController";
    private static final String CHECKCART = "CheckCart";
    private static final String CHECKCARTPAGE = "cart.jsp";
    private static final String RETURNUSER = "ReturnUser";
    private static final String RETURNUSERPAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LoginPage;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LoginPage;
            } else if (action.equals(LOGIN)) {
                url = LoginController;
                request.getRequestDispatcher(SearchController2).include(request, response);
            } else if (action.equals(CREATEUSER)) {
                url = CreateUserController;
            } else if (action.equals(DELETE)) {
                url = DeleteUserController;
            } else if (action.equals(UPDATE)) {
                url = UpdateUserController;
            } else if (action.equals(SEARCH)) {
                url = SearchController2;
            } else if (action.equals(SEARCHUSER)) {
                url = ManageUserController;
            } else if (action.equals(REGISTER)) {
                url = REGISTERCONTROLLER;
            } else if (action.equals(SEARCHCLOTHES)) {
                url = ManageClothesController;
            } else if (action.equals(DELETECLOTHES)) {
                url = DeleteClothesController;
            } else if (action.equals(UPDATECLOTHES)) {
                url = UpdateClothesController;
            } else if (action.equals(CREATECLOTHES)) {
                url = CreateClothesController;
            } else if (action.equals(SEARCHORDER)) {
                url = ManageOrderController;
            } else if (action.equals(ADDCART)) {
                url = AddCartController;
            } else if (action.equals(EDITCART)) {
                url = EditCartController;
            } else if (action.equals(REMOVECART)) {
                url = RemoveCartController;
            } else if (action.equals(CHECKOUT)) {
                url = CheckOutController;
            } else if (action.equals(CHECKCART)) {
                url = CHECKCARTPAGE;
//                request.getRequestDispatcher(SearchController2).include(request, response);
            } else if (action.equals(DELETEORDER)) {
                url = DeleteOrderController;
            } else if (action.equals(RETURNUSER)) {
                url = RETURNUSERPAGE;
                request.getRequestDispatcher(SearchController).include(request, response);
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
