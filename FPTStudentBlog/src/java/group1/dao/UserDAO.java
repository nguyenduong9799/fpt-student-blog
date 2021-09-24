/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.UserDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT roleID, statusUID, userName, email, phone, totalVote, rankID, date "
                        + " FROM tblUsers "
                        + " WHERE userID=? AND password=? AND statusUID='1'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleID");
                    String statusID = rs.getString("statusUID");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    int totalVote = rs.getInt("totalVote");
                    int rankID = rs.getInt("rankID");
                    Date date = rs.getDate("date");
                    user = new UserDTO(userID, roleID, statusID, userName, password, email, phone, totalVote, rankID, date);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        UserDTO user = dao.checkLogin("admin", "1234567");
        System.out.println(user);
    }
}
