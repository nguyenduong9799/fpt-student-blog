/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lakho
 */
@WebServlet(name = "HideUserController", urlPatterns = {"/HideUserController"})
public class HideUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "admin.jsp";
    private static final String MENTOR = "listMentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            String userID = request.getParameter("userID");
            String roleID = dao.getRoleIDByID(userID);
            String statusUID = request.getParameter("statusUID");
            String banReason = request.getParameter("banReason");
            HttpSession session = request.getSession();
            if ("admin".equals(userID)) {
                session.setAttribute("ERROR_MESSAGE", "Admin can not be hide!");
            } else if ("1".equals(statusUID)) {
                boolean check = dao.hideUser(userID, banReason);
                if (check) {
                    if ("MT".equals(roleID)) {
                        url = MENTOR;
                    } else {
                        url = SUCCESS;
                    }
                }
            } else {
                boolean check = dao.unHideUser(userID);
                if (check) {
                    if ("MT".equals(roleID)) {
                        url = MENTOR;
                    } else {
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AdminEditBookController: " + e.toString());
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
