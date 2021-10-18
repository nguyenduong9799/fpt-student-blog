/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.CategoryDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public static ArrayList<CategoryDTO> getAllCategory() throws SQLException {
        ArrayList<CategoryDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select categoryID, categoryName\n"
                        + "From tblCategories Where categoryName NOT IN ('NOTIFICATION')\n";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new CategoryDTO(rs.getInt("categoryID"),
                            rs.getString("categoryName")));
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

    public static String getCategoryNameByID(int categoryID) throws SQLException {
        String categoryName = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select categoryName "
                        + "From tblCategories where categoryID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    categoryName = rs.getString("categoryName");
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
        return categoryName;
    }   
    
    public static int getCategoryIDByName(String categoryName) throws SQLException {
        int categoryID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select categoryID "
                        + "From tblCategories where categoryName=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                rs = stm.executeQuery();
                while (rs.next()) {
                    categoryID = rs.getInt("categoryID");
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
        return categoryID;
    }

    public boolean AddCategory(String categoryName) throws SQLException {
        boolean valid = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblCategories(categoryName) "
                        + "VALUES(?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                valid = stm.executeUpdate() > 0;
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
        return valid;

    }

    public boolean UpdateCategory(String categoryName, int categoryID) throws SQLException {
        boolean valid = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update tblCategories "
                        + "set categoryName = ? "                    
                        + "where categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                stm.setInt(2, categoryID);
                valid = stm.executeUpdate() > 0;
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
        return valid;
    }
}
