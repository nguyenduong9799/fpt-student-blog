/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.PostDAO;
import group1.dao.TagDAO;
import group1.dto.PostDTO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CreatePostController", urlPatterns = {"/CreatePostController"})
public class CreatePostController extends HttpServlet {

    private static final String ERROR = "addPost.jsp";
    private static final String SUCCESS = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String title = request.getParameter("title");
            String category = request.getParameter("category");
            String postContent = request.getParameter("postContent");
            String userID = request.getParameter("userID");
            String image = request.getParameter("imageBackgound");
            String status = "Waiting";
            LocalDateTime currentDateTime = java.time.LocalDateTime.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String date = currentDateTime.format(format);

            PostDTO post = new PostDTO(userID, status, category, title, postContent, date, image);
            PostDAO dao = new PostDAO();
            boolean check = dao.insertPost(post);
            if (check) {
                String taglist[] = request.getParameter("tagList").split(", ");
                TagDAO tagDAO = new TagDAO();
                for (String tag : taglist) {
                    boolean checkDuplicate = tagDAO.checkTag(tag);
                    if (checkDuplicate) {
                        tagDAO.insertTagBlog(tagDAO.getIDTagByName(tag), dao.getPostIDByPostTitle(title));
                    } else {
                        if (tagDAO.insertTag(tag, date)) {
                            tagDAO.insertTagBlog(tagDAO.getIDTagByName(tag), dao.getPostIDByPostTitle(title));
                        }
                    }
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CreatePostController: " + e.toString());
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
