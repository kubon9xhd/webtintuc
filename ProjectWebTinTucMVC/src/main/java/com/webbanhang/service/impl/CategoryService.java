/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service.impl;

import com.webbanhang.dao.ICategoryDAO;
import com.webbanhang.model.CategoryModel;
import com.webbanhang.service.ICategoryService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author asus
 */
public class CategoryService implements ICategoryService {

//    private ICategoryDAO categoryDAO;
//
//    public CategoryService() {
//        categoryDAO = new CategoryDAO();
//    }
    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }

}
