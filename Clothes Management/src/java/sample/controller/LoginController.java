
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.object.DAO;
import sample.object.User;

public class LoginController extends HttpServlet {
    private static final String ERROR = "login.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER_PAGE = "user.jsp";
    private static final String US = "US";
    private static final String AD = "AD";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            DAO dao = new DAO();
            User loginUser = dao.checkLogin(userID,password);
            if (loginUser != null){
                String roleID = loginUser.getRoleID();
                HttpSession session = request.getSession();
                session.setAttribute ("LOGIN_USER",loginUser);
                if (US.equals(roleID)){
                    url = USER_PAGE;
                } else if (AD.equals(roleID)){
                    url = ADMIN_PAGE;
                } else{
                    request.setAttribute("ERROR", "Your role is not supported");
                }
            } else{
                request.setAttribute("ERROR", "Incorrect userID or password");
            }
        } catch (Exception e){
            log ("Error at LoginController: "+e.toString());
        } finally{
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
