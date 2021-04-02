/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao.impl;

import com.webbanhang.dao.INewsDAO;
import com.webbanhang.mapper.NewsMapper;
import com.webbanhang.model.NewsModel;
import com.webbanhang.paging.Pageble;
import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class NewsDAO extends AbstractDAO implements INewsDAO {

    @Override
    public List<NewsModel> findByCategoryId(Long categoryId) {
        String sql = "Select * from News where category_id = ?";
        return query(sql, new NewsMapper(), categoryId);
    }

    @Override
    public Long save(NewsModel newsModel) {
//        String sql = "Insert into News (title, content, category_id, ) values (?,?,?)";
        StringBuilder sql = new StringBuilder("Insert into News (title, [content],");
        sql.append(" category_id, short_desciption, thumbnail, created_date, created_by)");
        sql.append(" values (?,?,?,?,?,?,?)");
        return insert(sql.toString(), newsModel.getTitle(), newsModel.getContent(), newsModel.getCategoryId(),
                newsModel.getShortDescription(), newsModel.getThumnail(), newsModel.getCreatedDate(),
                newsModel.getCreatedBy());
    }

    @Override
    public NewsModel findOne(Long id) {
        String sql = "SELECT * FROM News WHERE id = ?";
        List<NewsModel> news = new ArrayList<>();
        news = query(sql, new NewsMapper(), id);
        return news.isEmpty() ? null : news.get(0);
    }

    @Override
    public void update(NewsModel updateModel) {
        StringBuilder sql = new StringBuilder("Update News set title = ?,thumbnail = ?,");
        sql.append("content = ?,short_desciption = ?,category_id = ?,");
        sql.append("created_date = ?, created_by = ?, modified_date = ?, modified_by = ? where id = ?");
        update(
                sql.toString(), updateModel.getTitle(), updateModel.getThumnail(),
                updateModel.getContent(), updateModel.getShortDescription(), updateModel.getCategoryId(),
                updateModel.getCreatedDate(), updateModel.getCreatedBy(), updateModel.getModifiedDate(),
                updateModel.getModifiedBy(), updateModel.getId()
        );
    }

    @Override
    public void delete(long id) {
        String sql = "Delete From News WHERE id = ?";
        update(sql, id);
    }

    @Override
    public List<NewsModel> findAll(Pageble pageble) {
//        String sql = "select * from News order by id offset ? rows fetch next ? rows only";
        StringBuilder sql = new StringBuilder("Select * From News");
        if (pageble.getSorter().getSortBy() != null && pageble.getSorter().getSortName() != null) {
            sql.append(" order by ").append(pageble.getSorter().getSortName()).append(" ").append(pageble.getSorter().getSortBy()).append("");
            if (pageble.getOffset() != null && pageble.getLimit() != null) {
                sql.append(" offset ").append(pageble.getOffset()).append(" rows fetch next ").append(pageble.getLimit()).append(" rows only");
            }
        } else {
            if (pageble.getOffset() != null && pageble.getLimit() != null) {
                sql.append(" order by id offset ").append(pageble.getOffset()).append(" rows fetch next ").append(pageble.getLimit()).append(" rows only");
            }
        }

        return query(sql.toString(), new NewsMapper());

    }

    @Override
    public int getTotalItem() {
        String sql = "Select count(*) from News";
        return count(sql);
    }

}
