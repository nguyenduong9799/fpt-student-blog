/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.PostDTO;
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
public class PostDAO {
       public List<PostDTO> getAllPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID=rs.getInt("postID");
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
    
    public PostDTO getPostByID(int postID) throws SQLException{
        PostDTO post = null;
         Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where postID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID=rs.getString("userID");
                    String status=rs.getString("statusPID");
                    String category=rs.getString("categoryID");
                    String title=rs.getString("title");
                    String postContent=rs.getString("postContent");
                    String date=rs.getString("date");
                    int vote=rs.getInt("vote");
                    post=new PostDTO(postID, userID, status, category, title, postContent, date, vote);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return post;
    }
}
