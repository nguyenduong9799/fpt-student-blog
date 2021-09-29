/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.CommentDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CommentDAO {
    public boolean insertComment(CommentDTO comment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblComment(postID, userID, date, commentContent) "
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, comment.getPostID());
                stm.setString(2, comment.getUserID());
                stm.setString(3, comment.getDate());
                stm.setString(4, comment.getCommentContent());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public List<CommentDTO> getListCommentByPostID(int postID) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT commentID, postID, userID, date, commentContent "
                        + " FROM tblComment "
                        + " WHERE postID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("commentID");
                    String userID = rs.getString("userID");
                    String date = rs.getString("date");
                    String commentContent = rs.getString("commentContent");                
                    list.add(new CommentDTO(commentID, postID, userID, date, commentContent));
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
        return list;
    }
}
