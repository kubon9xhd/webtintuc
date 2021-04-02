/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao;

import com.webbanhang.model.UserModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface IUserDAO extends GenericDAO<UserModel> {

    UserModel findByUsernameAndPasswordAndStatus(String username, String password, Integer status);

    UserModel findByUsername(String username);

    List<UserModel> findALl(Pageble pageble);
    Long save(UserModel userModel);

    int getTotalUser();

    void delete(long id);

}
