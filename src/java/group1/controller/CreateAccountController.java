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
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CreateAccountController extends HttpServlet {

    private static final String ERROR = "createAccount.jsp";
    private static final String SUCCESS = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "UTF-8");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String confirm = request.getParameter("confirm");
            String role = request.getParameter("role");
            boolean check = true;
            UserError userError = new UserError();
            if (userID.length() > 50 || userID.length() < 3) {
                userError.setUserIDError("UserID length must be [3,50]");
                check = false;
            }
            if (name.length() > 50 || name.length() < 5) {
                userError.setNameError("Full Name must be [5,50]");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("Two password are diffirent");
                check = false;
            }
            if (check) {
                long millis = System.currentTimeMillis();
                Date date = new Date(millis);
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, role, "1", name, password, email, phone, 0, 0, date, "images/images.png");
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if (checkDuplicate) {
                    userError.setUserIDError("Duplicate User ID " + userID + "!");
                    request.setAttribute("USER_ERROR", userError);
                } else {
                    boolean checkInsert = dao.insert(user);
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        userError.setMessageError("Can not insert, unknow error!");
                        request.setAttribute("USER_ERROR", userError);
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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