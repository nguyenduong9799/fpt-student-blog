/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.PostDTO;
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

    public List<PostDTO> getListPostByTagID(int tagID) throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select p.*, tagID  "
                        + " from tblPosts p join tblTagBlog tb on tb.postID=p.postID\n"
                        + " where tb.tagID=? and statusPID=1 order by date desc";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, tagID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt("postID");
                    String userID = UserDAO.getUserNameByID(rs.getString("userID"));
                    String status = StatusDAO.getStatusByStatusID(rs.getInt("statusPID"));
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String approveComment = rs.getString("approveComment");
                    String image=rs.getString("image");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote, approveComment,image));
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

    public static List<TagDTO> getListMostTag() throws SQLException {
        List<TagDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT TOP 10 tagID,\n"
                        + " COUNT(postID)\n"
                        + "FROM tblTagBlog\n"
                        + "GROUP BY  tagID\n"
                        + "ORDER BY COUNT(postID) DESC ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tagID = rs.getInt("tagID");
                    String tagName = getTagNameByID(tagID);
                    list.add(new TagDTO(tagID, tagName));
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
    public static List<TagDTO> getListTag() throws SQLException {
        List<TagDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT tagID,\n"
                        + " COUNT(postID)\n"
                        + "FROM tblTagBlog\n"
                        + "GROUP BY  tagID\n"
                        + "ORDER BY COUNT(postID) DESC ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tagID = rs.getInt("tagID");
                    String tagName = getTagNameByID(tagID);
                    list.add(new TagDTO(tagID, tagName));
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

    public static String getTagNameByID(int tagID) throws SQLException {
        String tagName = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select tagName "
                        + " from tblTags  "
                        + " where tagID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, tagID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    tagName = rs.getString("tagName");
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
        return tagName;
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
    
    public int getTotalPostByTag(int tagID) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(p.postID)" 
                        +" from tblPosts p join tblTagBlog tb on tb.postID=p.postID "
                        +" where tb.tagID=? and statusPID=1";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, tagID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    total = rs.getInt(1);
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
        return total;
    }
}
