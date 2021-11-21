/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.UserDAO;
import group1.dto.UserDTO;
import group1.dto.UserError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "EditProfileController", urlPatterns = {"/EditProfileController"})
public class EditProfileController extends HttpServlet {

    private static final String ERROR = "ProfileController";
    private static final String SUCCESS = "ProfileController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String name = request.getParameter("userName");
            String password = request.getParameter("newPassword");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String image = request.getParameter("image");
            String confirm = request.getParameter("confirm");
            boolean check = true;
            UserError userError = new UserError();
            if (name.length() > 50 || name.length() < 5) {
                userError.setNameError("Full Name must be [5,50]");
                check = false;
            }
            if ("".equals(password) && "".equals(confirm)) {
                password = request.getParameter("password");
            } else {
                if (!password.equals(confirm)) {
                    userError.setConfirmError("Two password are diffirent");
                    check = false;
                }
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, name, password, email, phone, image);

                boolean checkUpdate = dao.update(user);
                if (checkUpdate) {
                    url = SUCCESS;
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", dao.checkLogin(userID, password));

                } else {
                    userError.setMessageError("Can not insert, unknow error!");
                    request.setAttribute("USER_ERROR", userError);
                }

            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at EditProfileController: " + e.toString());
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
