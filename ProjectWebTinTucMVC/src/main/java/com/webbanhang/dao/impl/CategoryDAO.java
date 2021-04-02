/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao.impl;

import com.webbanhang.dao.ICategoryDAO;
import com.webbanhang.mapper.CategoryMapper;
import com.webbanhang.model.CategoryModel;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class CategoryDAO extends AbstractDAO implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll() {
        String sql = "Select * from Category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(Long id) {
        String sql = "SELECT * FROM Category WHERE id = ?";
        List<CategoryModel> categorys = new ArrayList<>();
        categorys = query(sql, new CategoryMapper(), id);
        return categorys.isEmpty() ? null : categorys.get(0);
    }

    @Override
    public CategoryModel findOneByCode(String code) {
        String sql = "SELECT * FROM Category WHERE code = ?";
        List<CategoryModel> categorys = new ArrayList<>();
        categorys = query(sql, new CategoryMapper(), code);
        return categorys.isEmpty() ? null : categorys.get(0);    }

}
