/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.admin;

import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.CommentModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.PageRequest;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.ICommentService;
import com.webbanhang.service.impl.CommentService;
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
@WebServlet(urlPatterns = {"/admin-cmt"})

public class CommentController extends HttpServlet {
    @Inject
    private ICommentService cmtService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommentModel cmt = FromUltil.toModel(CommentModel.class, request);
        String view = "";
        // bao nhieu trang, bao nhieu item/ trang, sap sep theo gi
        if (cmt.getType().equals(SystemConstant.LIST)) {
            Pageble pageRequest = new PageRequest(
                    cmt.getPage(),
                    cmt.getMaxPageItem(),
                    new Sorter(cmt.getSortName(), cmt.getSortBy())
            );
            // get list cmt
            cmt.setListResult(cmtService.findAll(pageRequest));
            cmt.setTotalItem(cmtService.getTotalCmt());
            cmt.setPage(pageRequest.getPage());
            cmt.setMaxPageItem(pageRequest.getLimit());
            cmt.setTotalPage((int) Math.ceil((double) cmt.getTotalItem() / pageRequest.getLimit()));
            view = "/views/admin/cmt/list.jsp";
        }
        MessageUltil.showMessage(request);
//        System.out.println(userModel.getListResult().size());
        request.setAttribute(SystemConstant.MODEL, cmt);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
