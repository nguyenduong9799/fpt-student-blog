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

    public static ArrayList<PostDTO> getAllPost() throws SQLException {
        ArrayList<PostDTO> list = null;
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
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = rs.getString("userID");
                    String status = rs.getString("statusPID");
                    String category = rs.getString("categoryID");
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
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

    public PostDTO getPostByID(int postID) throws SQLException {
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
                    String userID = UserDAO.getUserNameByID(rs.getString("userID"));
                    String status = StatusDAO.getStatusByStatusID(rs.getInt("statusPID"));
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String approveComment = rs.getString("approveComment");
                    post = new PostDTO(postID, userID, status, category, title, postContent, date, vote, approveComment);
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

    public List<PostDTO> getWaitingPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where statusPID=2 ";
                stm = conn.prepareStatement(sql);
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

    public List<PostDTO> getApprovedPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where statusPID=1 order by date desc ";
                stm = conn.prepareStatement(sql);
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

    public List<PostDTO> getDeniedPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where statusPID=0 ";
                stm = conn.prepareStatement(sql);
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

    public boolean approvePost(int postID, String approveComment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblPosts set statusPID=1, approveComment=? where postID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, approveComment);
                stm.setInt(2, postID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean insertPost(PostDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert into tblPosts(userID,title,statusPID,categoryID,postContent,date) "
                        + " values(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getUserID());
                stm.setString(2, post.getTitle());
                stm.setInt(3, StatusDAO.getStatusIDByStatusName(post.getStatus()));
                stm.setInt(4, CategoryDAO.getCategoryIDByName(post.getCategory()));
                stm.setString(5, post.getPostContent());
                stm.setString(6, post.getDate());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean denyPost(int postID, String approveComment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblPosts set statusPID=0, approveComment=? "
                        + "where postID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, approveComment);
                stm.setInt(2, postID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public static ArrayList<PostDTO> getAvailablePost() throws SQLException {
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts \n"
                        + "Where statusPID = '1'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = rs.getString("userID");
                    String status = rs.getString("statusPID");
                    String category = rs.getString("categoryID");
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
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

    public static ArrayList<PostDTO> getAllPostByCategory(int categoryID) throws SQLException {
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts\n"
                        + "Where categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = rs.getString("userID");
                    String status = rs.getString("statusPID");
                    String category = rs.getString("categoryID");
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
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

    public static ArrayList<PostDTO> getAvailablePostByCategory(int categoryID) throws SQLException {
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {

            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts\n"
                        + "where categoryID = ? and statusPID = '1'";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = rs.getString("userID");
                    String status = rs.getString("statusPID");
                    String category = rs.getString("categoryID");
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote));
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

    public static ArrayList<PostDTO> getAvailablePostByTitle(String title) throws SQLException {
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select postID, userID, status, category, title, postContent, date, vote \n"
                        + "From tblPosts\n"
                        + "where title = ? and statusPID = '1'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + title + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new PostDTO(rs.getInt("postID"),
                            rs.getString("userID"),
                            rs.getString("statusPID"),
                            rs.getString("categoryID"),
                            rs.getString("title"),
                            rs.getString("postContent"),
                            rs.getString("date"),
                            rs.getInt("vote")));
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

    public static ArrayList<PostDTO> getAllPostByTitle(String title) throws SQLException {
        ArrayList<PostDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select postID, userID, status, category, title, postContent, date, vote \n"
                        + "From tblPosts\n"
                        + "Where title like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + title + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new PostDTO(rs.getInt("postID"),
                            rs.getString("userID"),
                            rs.getString("statusPID"),
                            rs.getString("categoryID"),
                            rs.getString("title"),
                            rs.getString("postContent"),
                            rs.getString("date"),
                            rs.getInt("vote")));
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
