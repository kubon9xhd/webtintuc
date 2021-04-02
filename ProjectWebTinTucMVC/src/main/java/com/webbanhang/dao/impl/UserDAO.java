/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao.impl;

import com.webbanhang.dao.IUserDAO;
import com.webbanhang.mapper.UserMapper;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

    @Override
    public UserModel findByUsernameAndPasswordAndStatus(String username, String password, Integer status) {
        StringBuilder sql = new StringBuilder("Select * from [User] as u ");
        sql.append("inner join Role as r on r.id = u.role_id");
        sql.append("  where username = ? and password = ? and status = ?");
        List<UserModel> model = query(sql.toString(), new UserMapper(), username, password, status);
        return model.isEmpty() ? null : model.get(0);
    }

    @Override
    public List<UserModel> findALl(Pageble pageble) {
        StringBuilder sql = new StringBuilder("Select * From [User] as u ");
        sql.append("inner join Role as r on r.id = u.role_id");
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

        return query(sql.toString(), new UserMapper());
    }

    @Override
    public int getTotalUser() {
        String sql = "Select count(*) from [User]";
        return count(sql);
    }

    @Override
    public void delete(long id) {
        String sql = "Delete From [User] WHERE id = ?";
        update(sql, id);
    }

    @Override
    public UserModel findByUsername(String username) {
        StringBuilder sql = new StringBuilder("Select * from [User] as u ");
        sql.append("inner join Role as r on r.id = u.role_id");
        sql.append("  where username = ?");
        List<UserModel> model = query(sql.toString(), new UserMapper(), username);
        return model.isEmpty() ? null : model.get(0);
    }

    @Override
    public Long save(UserModel userModel) {
        String sql = "Insert into [User](username,password,fullname,status,role_id,created_date) values(?,?,?,?,?,?)";
        return insert(sql, userModel.getUsername(),
                userModel.getPassword(),
                userModel.getFullname(),
                userModel.getStatus(),
                userModel.getRoleId(),
                userModel.getCreatedDate());
    }

}
