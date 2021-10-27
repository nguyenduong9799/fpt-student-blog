/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dto;

import java.sql.Date;

public class UserDTO {

    private String userID;
    private String roleID;
    private String statusUID;
    private String userName;
    private String password;
    private String email;
    private String phone;
    private int totalVote;
    private int rankID;
    private Date date;
    private String image;
    private String banReason;
    public UserDTO() {
    }

    public UserDTO(String userID, String userName, String password, String email, String phone, String image) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.image = image;
    }

    public UserDTO(String userID, String roleID, String statusUID, String userName, String password, String email, String phone, int totalVote, int rankID, Date date) {
        this.userID = userID;
        this.roleID = roleID;
        this.statusUID = statusUID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.totalVote = totalVote;
        this.rankID = rankID;
        this.date = date;
    }

    public UserDTO(String userID, String roleID, String statusUID, String userName, String password, String email, String phone, int totalVote, int rankID, Date date, String image) {
        this.userID = userID;
        this.roleID = roleID;
        this.statusUID = statusUID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.totalVote = totalVote;
        this.rankID = rankID;
        this.date = date;
        this.image = image;
    }
    
    public UserDTO(String userID, String roleID, String statusUID, String userName, String password, String email, String phone, int totalVote, int rankID, Date date, String image, String banReason) {
        this.userID = userID;
        this.roleID = roleID;
        this.statusUID = statusUID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.totalVote = totalVote;
        this.rankID = rankID;
        this.date = date;
        this.image = image;
        this.banReason = banReason;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getStatusUID() {
        return statusUID;
    }

    public void setStatusUID(String statusUID) {
        this.statusUID = statusUID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getTotalVote() {
        return totalVote;
    }

    public void setTotalVote(int totalVote) {
        this.totalVote = totalVote;
    }

    public int getRankID() {
        return rankID;
    }

    public void setRankID(int rankID) {
        this.rankID = rankID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public String getBanReason() {
        return banReason;
    }

    public void setBanReason(String banReason) {
        this.banReason = banReason;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", roleID=" + roleID + ", statusUID=" + statusUID + ", userName=" + userName + ", password=" + password + ", email=" + email + ", phone=" + phone + ", totalVote=" + totalVote + ", rankID=" + rankID + ", date=" + date + '}';
    }

}
