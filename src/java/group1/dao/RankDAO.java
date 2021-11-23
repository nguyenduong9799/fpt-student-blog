/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dao;

import group1.dto.RankDTO;
import group1.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RankDAO {

    public List<RankDTO> getListRank() throws SQLException {
        List<RankDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM tblRank ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int rankID = rs.getInt("rankID");
                    String rankName = rs.getString("rankName");
                    int vote = rs.getInt("vote");
                    String image = rs.getString("image");
                    list.add(new RankDTO(rankID, rankName, vote, image));
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

    public static String getRankImage(int rankID) throws SQLException {
        String image = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select image "
                        + "From tblRank where rankID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, rankID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    image = rs.getString("image");
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
        return image;
    }

    public boolean UpdateRank(int rankID, int rankVote) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "update tblRank "
                        + "set vote = ? "
                        + "where rankID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, rankVote);
                stm.setInt(2, rankID);
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
