/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SHOW_DETAIL_POST = "ShowDetailPostController";
    private static final String APPROVE_DENY_POST = "ApproveDenyPostController";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String SUBMIT_POST = "CreatePostController";
    private static final String ADD_CATEGORY = "AddCategoryController";
    private static final String VIEW_POST = "ViewPostController";
    private static final String CREATE_ACCOUNT = "CreateAccountController";
    private static final String CREATE_COMMENT = "CommentController";
    private static final String VOTE_POST = "VoteController";
    private static final String SEARCH = "SearchController";
    private static final String CREATE_NOFICATION = "CreateNoficationController";
    private static final String UPDATE_CATEGORY = "UpdateCategoryController";
    private static final String GET_POST_BY_TAG = "GetPostByTagController";
    private static final String PROFILE = "ProfileController";
    private static final String VIEW_YOUR_POST = "ViewYourPostController";
    private static final String EDIT_POST = "EditPostController";
    private static final String SUBMIT_AGAIN = "SubmitAgainController";
    private static final String EDIT_PROFILE = "EditProfileController";
    private static final String HIDE_USER = "HideUserController";
    private static final String UPDATE_RANK_CONTROLLER = "UpdateRankController";
    private static final String CREATE_MENTOR = "CreateMentorController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Detail".equals(action)) {
                url = SHOW_DETAIL_POST;
            } else if ("Approve".equals(action)) {
                url = APPROVE_DENY_POST;
            } else if ("Deny".equals(action)) {
                url = APPROVE_DENY_POST;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Submit Post".equals(action)) {
                url = SUBMIT_POST;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Add Category".equals(action)) {
                url = ADD_CATEGORY;
            } else if ("ViewPost".equals(action)) {
                url = VIEW_POST;
            } else if ("Create".equals(action)) {
                url = CREATE_ACCOUNT;
            } else if ("Comment".equals(action)) {
                url = CREATE_COMMENT;
            } else if ("Vote".equals(action)) {
                url = VOTE_POST;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Create Notification".equals(action)) {
                url = CREATE_NOFICATION;
            } else if ("Update Category".equals(action)) {
                url = UPDATE_CATEGORY;
            } else if ("GetPostByTag".equals(action)) {
                url = GET_POST_BY_TAG;
            } else if ("Profile".equals(action)) {
                url = PROFILE;
            } else if ("ViewYourPost".equals(action)) {
                url = VIEW_YOUR_POST;
            } else if ("EditPost".equals(action)) {
                url = EDIT_POST;
            } else if ("Submit Post Again".equals(action)) {
                url = SUBMIT_AGAIN;
            } else if ("Save Changes".equals(action)) {
                url = EDIT_PROFILE;
            } else if ("Ban".equals(action)) {
                url = HIDE_USER;
            } else if ("Unban".equals(action)) {
                url = HIDE_USER;
            } else if ("Update Rank".equals(action)) {
                url = UPDATE_RANK_CONTROLLER;
            } else if ("Create Mentor".equals(action)) {
                url = CREATE_MENTOR;
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
