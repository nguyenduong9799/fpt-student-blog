/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dto;

public class PostDTO {

    private int postID;
    private String userID;
    private String status;
    private String category;
    private String title;
    private String postContent;
    private String date;
    private int vote;
    private String approveComment;
    private String image;

    public PostDTO() {
    }
  public PostDTO(int postID, String userID, String title, String date, String image) {
        this.postID = postID;
        this.userID = userID;
        this.title = title;
        this.date = date;
        this.image = image;
    }
    public PostDTO(int postID, String userID) {
        this.postID = postID;
        this.userID = userID;
    }

    public PostDTO(int postID, String userID, String status, String category, String title, String postContent, String date, int vote, String approveComment, String image) {
        this.postID = postID;
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
        this.vote = vote;
        this.approveComment = approveComment;
        this.image = image;
    }

    public PostDTO(String userID, String status, String category, String title, String postContent, String date) {
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
    }

    public PostDTO(int postID, String userID, String status, String category, String title, String postContent, String date, int vote) {
        this.postID = postID;
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
        this.vote = vote;
    }

    public PostDTO(int postID, String userID, String status, String category, String title, String postContent, String date, int vote, String approveComment) {
        this.postID = postID;
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
        this.vote = vote;
        this.approveComment = approveComment;
    }

    public PostDTO(String userID, String status, String category, String title, String postContent, String date, String image) {
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
        this.image = image;
    }

    public PostDTO(int postID, String userID, String status, String category, String title, String postContent, String date, String image, int vote) {
        this.postID = postID;
        this.userID = userID;
        this.status = status;
        this.category = category;
        this.title = title;
        this.postContent = postContent;
        this.date = date;
        this.vote = vote;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public String getApproveComment() {
        return approveComment;
    }

    public void setApproveComment(String approveComment) {
        this.approveComment = approveComment;
    }

}
