/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.mapper;

import com.webbanhang.model.RoleModel;
import com.webbanhang.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author asus
 */
public class UserMapper implements RowMapper<UserModel> {

    @Override
    public UserModel mapRow(ResultSet rs) {
        try {
            UserModel model = new UserModel();
            model.setId(rs.getInt("id"));
            model.setUsername(rs.getString("username"));
            model.setPassword(rs.getString("password"));
            model.setStatus(rs.getInt("status"));
            model.setRoleId(rs.getLong("role_id"));
            model.setFullname(rs.getString("fullname"));
            try {
                RoleModel role = new RoleModel();
                role.setCode(rs.getString("code"));
                role.setName(rs.getString("name"));
                model.setRole(role);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return model;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

}
