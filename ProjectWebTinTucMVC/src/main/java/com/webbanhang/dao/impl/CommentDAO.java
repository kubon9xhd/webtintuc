/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao.impl;

import com.webbanhang.dao.IComentDAO;
import com.webbanhang.mapper.CommentMapper;
import com.webbanhang.mapper.NewsMapper;
import com.webbanhang.mapper.UserMapper;
import com.webbanhang.model.CommentModel;
import com.webbanhang.paging.Pageble;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class CommentDAO extends AbstractDAO implements IComentDAO {

    @Override
    public Long save(CommentModel cmtModel) {
        StringBuilder sql = new StringBuilder("Insert into Comment ([content],");
        sql.append(" user_id, news_id,created_date, created_by)");
        sql.append(" values (?,?,?,?,?)");
        return insert(sql.toString(), cmtModel.getContent(), cmtModel.getUserId(), cmtModel.getNewsId(),
                cmtModel.getCreatedDate(), cmtModel.getCreatedBy());
    }

    @Override
    public CommentModel findOne(Long id) {
        String sql = "SELECT * FROM Comment WHERE id = ?";
        List<CommentModel> cmt = new ArrayList<>();
        cmt = query(sql, new CommentMapper(), id);
        return cmt.isEmpty() ? null : cmt.get(0);
    }

    @Override
    public List<CommentModel> finAllCmtByUserId(Long id) {
        String sql = "SELECT * FROM Comment WHERE news_id = ?";
        List<CommentModel> cmt = new ArrayList<>();
        cmt = query(sql, new CommentMapper(), id);
        return cmt.isEmpty() ? null : cmt;
    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * From Comment");
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

        return query(sql.toString(), new CommentMapper());
    }

    @Override
    public int getTotalCmt() {
        String sql = "Select count(*) from Comment";
        return count(sql);
    }

    @Override
    public void delete(long id) {
        String sql = "Delete From Comment WHERE id = ?";
        update(sql, id);
    }

}
