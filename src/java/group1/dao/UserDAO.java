/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.RankDTO;
import group1.dto.UserDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT roleID, statusUID, userName, email, phone, totalVote, rankID, date, image, banReason "
                        + " FROM tblUsers "
                        + " WHERE userID=? AND password=? ";
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
                    String image = rs.getString("image");
                    String banReason = rs.getString("banReason");
                    user = new UserDTO(userID, roleID, statusID, userName, password, email, phone, totalVote, rankID, date, image, banReason);
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
    public UserDTO checkLoginID(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT roleID, statusUID, userName, password, email, phone, totalVote, rankID, date, image, banReason "
                        + " FROM tblUsers "
                        + " WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
               
                rs = stm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleID");
                    String statusID = rs.getString("statusUID");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    int totalVote = rs.getInt("totalVote");
                    int rankID = rs.getInt("rankID");
                    Date date = rs.getDate("date");
                    String image = rs.getString("image");
                    String banReason = rs.getString("banReason");
                    user = new UserDTO(userID, roleID, statusID, userName, password, email, phone, totalVote, rankID, date, image, banReason);
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

    public int Rank(String userID) throws SQLException {
        int rank = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select totalVote from tblUsers where userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                RankDAO rankDAO=new RankDAO();
                ArrayList<RankDTO> listRank =(ArrayList<RankDTO>) rankDAO.getListRank();
                if(rs.next()) {
                    int total = rs.getInt("totalVote");
                    if (total == listRank.get(0).getVote()) {
                        rank = 0;
                    }
                    if (total >= listRank.get(1).getVote() && total < listRank.get(2).getVote()) {
                        rank = 1;
                    }
                    if (total >= listRank.get(2).getVote() && total < listRank.get(3).getVote()) {
                        rank = 2;
                    }
                    if (total >= listRank.get(3).getVote() && total < listRank.get(4).getVote()) {
                        rank = 3;
                    }
                    if (total >= listRank.get(4).getVote() && total < listRank.get(5).getVote()) {
                        rank = 4;
                    }
                    if (total >= listRank.get(5).getVote()) {
                        rank = 5;
                    }
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
        return rank;
    }

    public void checkRank(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int rank = Rank(userID);
                String sql = " Update tblUsers set rankID = ? where userID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, rank);
                stm.setString(2, userID);
                stm.executeUpdate();
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
    }

    public static String getUserImageByID(String userID) throws SQLException {
        String userImage = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select image "
                        + "From tblUsers where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    userImage = rs.getString("image");
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
        return userImage;
    }

    public static String getUserNameByID(String userID) throws SQLException {
        String userName = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select userName "
                        + "From tblUsers where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    userName = rs.getString("userName");
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
        return userName;
    }
    
    public String getRoleIDByID(String userID) throws SQLException {
        String roleID = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select roleID "
                        + "From tblUsers where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    roleID = rs.getString("roleID");
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
        return roleID;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT userID"
                        + " FROM tblUsers"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
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

    public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblUsers set userName=?, password=?, email=?, phone=?, image=?  "
                        + "Where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserName());
                stm.setString(2, user.getPassword());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getPhone());
                stm.setString(5, user.getImage());
                stm.setString(6, user.getUserID());
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

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblUsers(userID, roleID, statusUID, userName, password, email, phone, totalVote, rankID, date, image) "
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getStatusUID());
                stm.setString(4, user.getUserName());
                stm.setString(5, user.getPassword());
                stm.setString(6, user.getEmail());
                stm.setString(7, user.getPhone());
                stm.setInt(8, user.getTotalVote());
                stm.setInt(9, user.getRankID());
                stm.setDate(10, user.getDate());
                stm.setString(11, user.getImage());
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

    public List<UserDTO> getListUser() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM tblUsers "
                        + " WHERE roleID like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + "US" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    String statusUID = rs.getString("statusUID");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    int totalVote = rs.getInt("totalVote");
                    Date date = rs.getDate("date");
                    String banReason = rs.getString("banReason");
                    list.add(new UserDTO(userID, roleID, statusUID, userName, "", email, phone, totalVote, 0, date, "", banReason));
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

    public List<UserDTO> getListMentor() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM tblUsers "
                        + " WHERE roleID like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + "MT" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    String statusUID = rs.getString("statusUID");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    int totalVote = rs.getInt("totalVote");
                    Date date = rs.getDate("date");
                    list.add(new UserDTO(userID, roleID, statusUID, userName, "", email, phone, totalVote, 0, date));
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
    
    public int getTotalMentor() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblUsers where roleID= 'MT'";
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
    
    public int getTotalUser() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from tblUsers where roleID= 'US'";
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
    
    public boolean hideUser(String userID, String banReason) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET statusUID='0', banReason = ? "
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, banReason);
                stm.setString(2, userID);
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
    
    public boolean unHideUser(String userID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET statusUID='1', banReason = '' "
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
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
//    public static void main(String[] args) throws SQLException {
//        UserDAO dao = new UserDAO();
//
//        UserDTO user = dao.checkLogin("admin", "12345678");
//
//        System.out.println(user);
//    }
}
