/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.mapper;

import com.webbanhang.model.CategoryModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class CategoryMapper implements RowMapper<CategoryModel> {

    @Override
    public CategoryModel mapRow(ResultSet rs) {
        CategoryModel category = new CategoryModel();
        try {
            category.setId(rs.getLong("id"));
            category.setName(rs.getString("name"));
            category.setCode(rs.getString("code"));
            return category;
        } catch (SQLException ex) {
            return null;
        }
       
    }

}
