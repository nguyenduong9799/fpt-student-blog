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
                String sql = "select tagID, tagName, date "
                        + "from tblTags "
                        + "where postID=? ";
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
}