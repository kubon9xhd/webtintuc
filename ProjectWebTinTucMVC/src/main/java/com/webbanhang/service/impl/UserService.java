/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service.impl;

import com.webbanhang.dao.IUserDAO;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.IUserService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author asus
 */
public class UserService implements IUserService {

    @Inject
    private IUserDAO userDAO;

    @Override
    public UserModel findByUsernameAndPasswordAndStatus(String username, String password, Integer status) {
        return userDAO.findByUsernameAndPasswordAndStatus(username, password, status);
    }

    @Override
    public List<UserModel> findALl(Pageble pageble) {
        return userDAO.findALl(pageble);
    }

    @Override
    public int getTotalUser() {
        return userDAO.getTotalUser();
    }

    @Override
    public void delete(long[] ids) {
        for (int i = 0; i < ids.length; i++) {
            long id = ids[i];
            userDAO.delete(id);
        }
    }

    @Override
    public UserModel findByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    @Override
    public UserModel save(UserModel userModel) {
        userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        userModel.setStatus(0);
        userModel.setRoleId(2);
        Long newId = userDAO.save(userModel);
        return userDAO.findByUsernameAndPasswordAndStatus(userModel.getUsername(), userModel.getPassword(), userModel.getStatus());
    }

}
