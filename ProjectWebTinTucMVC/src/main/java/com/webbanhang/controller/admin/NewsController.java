/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.admin;

import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.NewsModel;
import com.webbanhang.paging.PageRequest;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.ICategoryService;
import com.webbanhang.service.INewsService;
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
@WebServlet(urlPatterns = {"/admin-news"})
public class NewsController extends HttpServlet {

    @Inject
    private INewsService newsService;
    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        NewsModel newsModel = FromUltil.toModel(NewsModel.class, request);
        String view = "";
        if (newsModel.getType().equals(SystemConstant.LIST)) {
            Pageble pageRequest = new PageRequest(
                    newsModel.getPage(),
                    newsModel.getMaxPageItem(),
                    new Sorter(newsModel.getSortName(), newsModel.getSortBy())
            );
            newsModel.setListResult(
                    newsService.findAll(pageRequest)
            );
            newsModel.setTotalItem(newsService.getTotalItem());
            newsModel.setPage(pageRequest.getPage());
            newsModel.setMaxPageItem(pageRequest.getLimit());
            newsModel.setTotalPage((int) Math.ceil((double) newsModel.getTotalItem() / pageRequest.getLimit()));
            view = "/views/admin/news/list.jsp";
        } else if (newsModel.getType().equals(SystemConstant.EDIT)) {
            if (newsModel.getId() != 0) {
                newsModel = newsService.finOne(newsModel.getId());
            }
            request.setAttribute("categories", categoryService.findAll());
            view = "/views/admin/news/edit.jsp";
        }
        MessageUltil.showMessage(request);
        request.setAttribute(SystemConstant.MODEL, newsModel);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}
