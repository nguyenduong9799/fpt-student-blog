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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
                    String userID = rs.getString("userID");
                    String status = StatusDAO.getStatusByStatusID(rs.getInt("statusPID"));
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String approveComment = rs.getString("approveComment");
                    String image = rs.getString("image");
                    post = new PostDTO(postID, userID, status, category, title, postContent, date, vote, approveComment, image);
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

    public List<PostDTO> getPostByUserID(String userID) throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where userID=? order by date desc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt("postID");
                    String status = StatusDAO.getStatusByStatusID(rs.getInt("statusPID"));
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String approveComment = rs.getString("approveComment");

                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote, approveComment));
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

    public static List<PostDTO> getListMostPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select top 3 * from tblPosts order by vote desc ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt("postID");
                    String userID = UserDAO.getUserNameByID(rs.getString("userID"));
                    String title = rs.getString("title");
                    String image = rs.getString("image");
                    String date = rs.getString("date").substring(0, 19);
                    list.add(new PostDTO(postID, userID, title, date, image));
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

    public List<PostDTO> getApprovedPost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where statusPID=1 order by date desc";
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
                    String image = rs.getString("image");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, image, vote));
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

    public boolean updatePost(PostDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblPosts Set userID=?, title=?, statusPID=?, categoryID=?, "
                        + "postContent=?, date=?, vote=?, image=?, approveComment=? Where postID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getUserID());
                stm.setString(2, post.getTitle());
                stm.setInt(3, StatusDAO.getStatusIDByStatusName(post.getStatus()));
                stm.setInt(4, CategoryDAO.getCategoryIDByName(post.getCategory()));
                stm.setString(5, post.getPostContent());
                stm.setString(6, post.getDate());
                stm.setInt(7, 0);
                stm.setString(8, post.getImage());
                stm.setString(9, post.getApproveComment());
                stm.setInt(10, post.getPostID());
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
                String sql = "Insert into tblPosts(userID,title,statusPID,categoryID,postContent,date,vote,image ) "
                        + " values(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getUserID());
                stm.setString(2, post.getTitle());
                stm.setInt(3, StatusDAO.getStatusIDByStatusName(post.getStatus()));
                stm.setInt(4, CategoryDAO.getCategoryIDByName(post.getCategory()));
                stm.setString(5, post.getPostContent());
                stm.setString(6, post.getDate());
                stm.setInt(7, 0);
                stm.setString(8, post.getImage());
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
                        + "Where statusPID = 1";
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
                        + "Where categoryID = ? AND statusPID=1 order by date desc";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = UserDAO.getUserNameByID(rs.getString("userID"));
                    String status = rs.getString("statusPID");
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String image = rs.getString("image");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, image, vote));
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
                        + "where categoryID = ? and statusPID = 1";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int postID = rs.getInt("postID");
                    String userID = UserDAO.getUserNameByID(rs.getString("userID"));
                    String status = rs.getString("statusPID");
                    String category = CategoryDAO.getCategoryNameByID(rs.getInt("categoryID"));
                    String title = rs.getString("title");
                    String postContent = rs.getString("postContent");
                    String date = rs.getString("date");
                    int vote = rs.getInt("vote");
                    String image = rs.getString("image");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, image, vote));
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
        ArrayList<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select postID, userID, statusPID, categoryID, title, postContent, date, vote, image "
                        + "From tblPosts "
                        + "where title LIKE ? and statusPID = ? order by date desc";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + title + "%");
                stm.setString(2, "1");
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new PostDTO(rs.getInt("postID"),
                            UserDAO.getUserNameByID(rs.getString("userID")),
                            rs.getString("statusPID"),
                            CategoryDAO.getCategoryNameByID(rs.getInt("categoryID")),
                            rs.getString("title"),
                            rs.getString("postContent"),
                            rs.getString("date"),
                            rs.getString("image"),
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
                String sql = "Select postID, userID, status, category, title, postContent, date, vote, image \n"
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
                            rs.getString("image"),
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

    public boolean addVoteByPostID(int postID, String userID, String loginUser) throws Exception {
        boolean status = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                LocalDateTime currentDateTime = java.time.LocalDateTime.now();
                DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String date = currentDateTime.format(format);
                String sql = "UPDATE tblPosts SET vote = vote + 1 WHERE postID = ? "
                        + " UPDATE tblUsers SET totalVote = totalVote + 1 WHERE userID = ? "
                        + " Insert into tblVote(postID, userID, date) values(?, ?, ?) ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, userID);
                stm.setInt(3, postID);
                stm.setString(4, loginUser);
                stm.setString(5, date);
                status = stm.executeUpdate() > 0;
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
        return status;
    }

    public boolean subVoteByPostID(int postID, String userID, String loginUser) throws Exception {
        boolean status = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblPosts SET vote = vote - 1 WHERE postID = ? "
                        + " UPDATE tblUsers SET totalVote = totalVote - 1 WHERE userID = ? "
                        + " DELETE FROM tblVote WHERE postID = ? AND userID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, userID);
                stm.setInt(3, postID);
                stm.setString(4, loginUser);
                status = stm.executeUpdate() > 0;
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
        return status;
    }

    public boolean checkDuplicateVote(int postID, String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT postID, userID"
                        + " FROM tblVote"
                        + " WHERE postID=? AND userID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public String getUserIDByPostID(int postID) throws SQLException {
        String userID = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select userID "
                        + "From tblPosts where postID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    userID = rs.getString("userID");
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
        return userID;
    }

    public int getPostIDByPostTitle(String title) throws SQLException {
        int postID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select postID "
                        + "From tblPosts where title=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, title);
                rs = stm.executeQuery();
                while (rs.next()) {
                    postID = rs.getInt("postID");
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
        return postID;
    }

    public List<PostDTO> getNotification() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblPosts where statusPID=3 order by date desc ";
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
                    String approveComment = rs.getString("approveComment");
                    String image = rs.getString("image");
                    list.add(new PostDTO(postID, userID, status, category, title, postContent, date, vote, approveComment, image));
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

    public int getTotalPost() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblPosts where statusPID=1";
                stm = conn.prepareStatement(sql);
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

    public int getTotalWaitingPost() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblPosts where statusPID=2";
                stm = conn.prepareStatement(sql);
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

    public int getTotalDeniedPost() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblPosts where statusPID=0";
                stm = conn.prepareStatement(sql);
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

    public int getTotalPostBySearch(String title) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select count(*) "
                        + "From tblPosts "
                        + "where title LIKE ? and statusPID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + title + "%");
                stm.setString(2, "1");
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

    public int getTotalPostByCategory(int categoryID) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select count(*) "
                        + "From tblPosts "
                        + "Where categoryID = ? AND statusPID=1";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
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

    public int getTotalPostByUserID(String userID) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select count(*) "
                        + "From tblPosts "
                        + "Where userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
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

    public int getTotalComment(int postID) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblComment where postID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postID);
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

    public int getTotalNotification() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblPosts where statusPID=3";
                stm = conn.prepareStatement(sql);
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

    public String splitDate(String date) throws SQLException {
        int index = date.indexOf(".");
        String dateSplited = date.substring(0, index);
        return dateSplited;
    }

    public String startDayOfMonth() throws SQLException {
        String startDay = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DECLARE @mydate DATETIME "
                        + " SELECT @mydate = GETDATE() "
                        + "SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)-1),@mydate),101) AS Start_Day";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    startDay = rs.getString("Start_Day");
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
        return startDay;
    }

    public String endDayOfMonth() throws SQLException {
        String startDay = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DECLARE @mydate DATETIME "
                        + " SELECT @mydate = GETDATE() "
                        + "SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))),DATEADD(mm,1,@mydate)),101) AS End_Day";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    startDay = rs.getString("End_Day");
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
        return startDay;
    }

    public int totalNewPostPerMonth(String startDay, String endDay) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(postID) from tblPosts Where statusPID= 1 AND date >= ? AND date <= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, startDay);
                stm.setString(2, endDay);
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

    public int totalNewUserPerMonth(String startDay, String endDay) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(userID) from tblUsers Where statusUID = 1  AND roleID = 'US' AND date >= ? AND date <= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, startDay);
                stm.setString(2, endDay);
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

    public int totalVote() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) from tblVote";
                stm = conn.prepareStatement(sql);
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

    public int totalAccessSystem() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Viewed from tblView";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    total = rs.getInt("Viewed");
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

    public void updateView() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblView Set Viewed = Viewed +1";
                stm = conn.prepareStatement(sql);
                stm.executeUpdate();
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
    }
}
