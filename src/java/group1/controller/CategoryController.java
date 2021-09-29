/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.PostDAO;
import group1.dto.PostDTO;
import group1.dto.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author buili
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

    public static final String USER = "home.jsp";
    public static final String ADMIN = "admin.jsp";
    public static final String MENTOR = "mentor.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "login.jsp";
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            int categoryID = Integer.parseInt(request.getParameter("txtCategoryID"));
            ArrayList<PostDTO> listPost = null;
            if (user.getRoleID().equals("AD")) {
                listPost = PostDAO.getAllPostByCategory(categoryID);
                url = ADMIN;
            } else if (user.getRoleID().equals("MT")) {
                listPost = PostDAO.getAllPostByCategory(categoryID);
                url = MENTOR;
            } else {
                listPost = PostDAO.getAvailablePostByCategory(categoryID);
                url = USER;
            }
            if (listPost == null) {
                listPost = new ArrayList<>();
            }

            session.setAttribute("LIST_POST", listPost);

        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}
