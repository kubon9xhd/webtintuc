/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service;

import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface IUserService {

    UserModel findByUsernameAndPasswordAndStatus(String username, String password, Integer status);

    List<UserModel> findALl(Pageble pageble);

    UserModel findByUsername(String username);

    UserModel save(UserModel userModel);

    int getTotalUser();

    void delete(long[] ids);

}
