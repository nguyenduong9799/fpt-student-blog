/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.StatusDTO;
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
public class StatusDAO {

    public List<StatusDTO> getAllPostStatus() throws SQLException {
        List<StatusDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblStatusPosts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String statusID = rs.getString("statusPID");
                    String statusName = rs.getString("statusName");
                    list.add(new StatusDTO(statusID, statusName));
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

    public List<StatusDTO> getAllUserStatus() throws SQLException {
        List<StatusDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblStatusUser ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String statusID = rs.getString("statusUID");
                    String statusName = rs.getString("statusName");
                    list.add(new StatusDTO(statusID, statusName));
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

    public static String getStatusByStatusID(int statusPID) throws SQLException {
        String statusName = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select statusName from tblStatusPosts "
                        + "where statusPID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, statusPID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    statusName = rs.getString("statusName");
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
        return statusName;
    }

    public static int getStatusIDByStatusName(String statusName) throws SQLException {
        int statusID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select statusPID from tblStatusPosts "
                        + "where statusName=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, statusName);
                rs = stm.executeQuery();
                while (rs.next()) {
                    statusID = rs.getInt("statusPID");
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
        return statusID;
    }

    public static String getStatusByStatusID(String statusUID) throws SQLException {
        String statusName = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select statusName from tblStatusUser "
                        + "where statusUID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, statusUID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    statusName = rs.getString("statusName");
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
        return statusName;
    }
}
