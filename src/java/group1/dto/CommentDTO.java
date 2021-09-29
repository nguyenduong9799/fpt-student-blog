/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dto;

/**
 *
 * @author Admin
 */
public class CommentDTO {
    private int commentID;
    private int postID;
    private String userID;
    private String date;
    private String commentContent;

    public CommentDTO() {
    }

    public CommentDTO(int postID, String userID, String date, String commentContent) {
        this.postID = postID;
        this.userID = userID;
        this.date = date;
        this.commentContent = commentContent;
    }

    public CommentDTO(int commentID, int postID, String userID, String date, String commentContent) {
        this.commentID = commentID;
        this.postID = postID;
        this.userID = userID;
        this.date = date;
        this.commentContent = commentContent;
    }
    
    

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    
}
