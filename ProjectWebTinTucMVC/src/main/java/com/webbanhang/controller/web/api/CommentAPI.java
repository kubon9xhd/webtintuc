/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.webbanhang.model.CommentModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.service.ICommentService;
import com.webbanhang.utils.HttpUltil;
import com.webbanhang.utils.SessionUltil;
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
@WebServlet(urlPatterns = {"/api-cmt"})
public class CommentAPI extends HttpServlet {

    @Inject
    private ICommentService cmtService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        CommentModel cmtModel = HttpUltil.of(request.getReader()).toModel(CommentModel.class);
        
        UserModel modelUser = (UserModel) SessionUltil.getInstance().getValue(request, "USERMODEL");
        
        cmtModel.setCreatedBy(modelUser.getUsername());
        cmtModel.setUserId(modelUser.getId());
        cmtModel = cmtService.save(cmtModel);
        mapper.writeValue(response.getOutputStream(), cmtModel);
    }
}
