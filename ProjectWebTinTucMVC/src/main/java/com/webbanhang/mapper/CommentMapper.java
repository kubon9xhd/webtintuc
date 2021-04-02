/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.mapper;

import com.webbanhang.dao.impl.CommentDAO;
import com.webbanhang.model.CommentModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class CommentMapper implements RowMapper<CommentModel> {

    @Override
    public CommentModel mapRow(ResultSet rs) {
        try {
            CommentModel model = new CommentModel();
            model.setId(rs.getInt("id"));
            model.setUserId(rs.getInt("user_id"));
            model.setNewsId(rs.getInt("news_id"));
            model.setContent(rs.getString("content"));
            model.setCreatedDate(new Timestamp(rs.getDate("created_date").getTime()));
            model.setCreatedBy(rs.getString("created_by"));
            return model;
        } catch (SQLException ex) {
            Logger.getLogger(CommentMapper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
