/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import group1.dao.CommentDAO;
import group1.dao.PostDAO;
import group1.dao.TagDAO;
import group1.dao.UserDAO;
import group1.dto.CommentDTO;
import group1.dto.PostDTO;
import group1.dto.TagDTO;
import group1.dto.UserDTO;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "ViewYourPostController", urlPatterns = {"/ViewYourPostController"})
public class ViewYourPostController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "viewYourPost.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int postID = Integer.parseInt(request.getParameter("postID"));
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            PostDAO dao = new PostDAO();
            PostDTO post = dao.getPostByID(postID);
            TagDAO tagDAO = new TagDAO();
            CommentDAO commentDao = new CommentDAO();
            UserDAO userDAO = new UserDAO();
            List<CommentDTO> comment = commentDao.getListCommentByPostID(postID);
            List<TagDTO> listTag = tagDAO.getListTagByPostID(postID);
            if (loginUser != null) {
                String userID = loginUser.getUserID();
                boolean checkVoted = dao.checkDuplicateVote(postID, userID);
                if (checkVoted) {
                    PostDTO voted = new PostDTO(postID, userID);
                    request.setAttribute("USER_VOTED", voted);
                    url = SUCCESS;
                }
            }
            if (post != null) {
                request.setAttribute("AUTHOR_IMAGE", userDAO.getUserImageByID(post.getUserID()));
                request.setAttribute("AUTHOR_NAME", UserDAO.getUserNameByID(post.getUserID()));
                request.setAttribute("AUTHOR_RANK", userDAO.Rank(post.getUserID()));
                request.setAttribute("POST_VIEW", post);
                request.setAttribute("LIST_COMMENT", comment);
                request.setAttribute("POST_TAGS", listTag);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ViewPostController: " + e.toString());
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
