/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.admin;

import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.PageRequest;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.IUserService;
import com.webbanhang.sort.Sorter;
import com.webbanhang.utils.FromUltil;
import com.webbanhang.utils.MessageUltil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {

    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserModel userModel = FromUltil.toModel(UserModel.class, request);
        String view = "";
        if (userModel.getType().equals(SystemConstant.LIST)) {
            // set paging co bao nhieu trang bao nhieu item/1 trang, sap sep theo gi
            Pageble pageRequest = new PageRequest(
                    userModel.getPage(),
                    userModel.getMaxPageItem(),
                    new Sorter(userModel.getSortName(), userModel.getSortBy())
            );
            // get full
            userModel.setListResult(userService.findALl(pageRequest));
            userModel.setTotalItem(userService.getTotalUser());
            userModel.setPage(pageRequest.getPage());
            userModel.setMaxPageItem(pageRequest.getLimit());
            userModel.setTotalPage((int) Math.ceil((double) userModel.getTotalItem() / pageRequest.getLimit()));
            view = "/views/admin/user/list.jsp";
        }
        MessageUltil.showMessage(request);
//        System.out.println(userModel.getListResult().size());
        request.setAttribute(SystemConstant.MODEL, userModel);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    }
}
