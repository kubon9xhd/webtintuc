/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao;

import com.webbanhang.model.CategoryModel;
import java.util.List;

/**
 *
 * @author asus
 */
public interface ICategoryDAO extends GenericDAO {

    List<CategoryModel> findAll();

    CategoryModel findOne(Long id);

    CategoryModel findOneByCode(String code);

}
