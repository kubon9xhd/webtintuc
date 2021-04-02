/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.mapper;

import com.webbanhang.model.NewsModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class NewsMapper implements RowMapper<NewsModel> {

    @Override
    public NewsModel mapRow(ResultSet rs) {
        try {
            NewsModel news = new NewsModel();
            news.setId(rs.getLong("id"));
            news.setTitle(rs.getString("title"));
            news.setContent(rs.getString("content"));
            news.setCategoryId(rs.getLong("category_id"));
            news.setThumnail(rs.getString("thumbnail"));
            news.setShortDescription(rs.getString("short_desciption"));
            news.setCreatedDate(new Timestamp(rs.getDate("created_date").getTime()));
            news.setCreatedBy(rs.getString("created_by"));
            if(rs.getDate("modified_date") != null){
                news.setModifiedDate(new Timestamp(rs.getDate("modified_date").getTime()));
            }
            if(rs.getString("modified_by") != null){
                news.setModifiedBy(rs.getString("modified_by"));
            }
            return news;
        } catch (SQLException ex) {
            return null;
        }
    }

}
