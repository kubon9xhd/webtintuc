/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.service.IUserService;
import com.webbanhang.utils.HttpUltil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
@WebServlet(urlPatterns = {"/api-admin-user"})
public class UserAPI extends HttpServlet {

    @Inject
    private IUserService userService;

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        UserModel userModel = HttpUltil.of(request.getReader()).toModel(UserModel.class);
        userService.delete(userModel.getIds());
        mapper.writeValue(response.getOutputStream(), "{}");
    }
}
