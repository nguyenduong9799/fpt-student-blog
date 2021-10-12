/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.TagDTO;
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
public class TagDAO {

    public List<TagDTO> getListTagByPostID(int postID) throws SQLException {
        List<TagDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select t.tagID, tagName, date,postID "
                        + " from tblTags t join tblTagBlog tb on t.tagID = tb.tagID "
                        + " where postID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tagID = rs.getInt("tagID");
                    String tagName = rs.getString("tagName");
                    String createDate = rs.getString("date");
                    list.add(new TagDTO(tagID, tagName, createDate));
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

    public boolean checkTag(String tagName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select tagName "
                        + " from tblTags  "
                        + " where tagName=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public int getIDTagByName(String tagName) throws SQLException {
        int tagID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select tagID "
                        + " from tblTags  "
                        + " where tagName=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    tagID = rs.getInt("tagID");
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
        return tagID;
    }

    public boolean insertTag(String tagName, String date) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblTags(tagName,date) values(?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagName);
                stm.setString(2, date);
                check = stm.executeUpdate() > 0;
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

    public boolean insertTagBlog(int tagID, int postID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert into tblTagBlog(tagID,postID) values(?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, tagID);
                stm.setInt(2, postID);
                check = stm.executeUpdate() > 0;
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
}
