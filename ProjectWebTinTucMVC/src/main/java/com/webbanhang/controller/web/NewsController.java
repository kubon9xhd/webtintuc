/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.web;

import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.service.impl.CommentService;
import com.webbanhang.service.impl.NewsService;
import com.webbanhang.utils.FromUltil;
import com.webbanhang.utils.SessionUltil;
import java.io.IOException;
import java.util.List;
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
@WebServlet(urlPatterns = {"/new/read"})
public class NewsController extends HttpServlet {

    @Inject
    private NewsService newsService;
    @Inject
    private CommentService cmtService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        NewsModel newsModel = FromUltil.toModel(NewsModel.class, request);
        if (newsModel.getId() != 0) {
            newsModel = newsService.finOne(newsModel.getId());
            SessionUltil.getInstance().pushValue(request, "LASTVIEW", newsModel);
        }
        List<NewsModel> listNearlyCategory = newsService.findByCategoryId(newsModel.getCategoryId());
        for (NewsModel newsModel1 : listNearlyCategory) {
            if(newsModel1.getId() == newsModel.getId()){
                listNearlyCategory.remove(newsModel1);
                break;
            }
        }
        boolean login = false;
        if(SessionUltil.getInstance().getValue(request, "USERMODEL") != null){
            login = true;
        }
        newsModel.setListCmt(cmtService.finAllCmtByUserId(newsModel.getId()));
        request.setAttribute("login", login);
        request.setAttribute("randomNews", listNearlyCategory);
        request.setAttribute(SystemConstant.MODEL, newsModel);
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/news/detailNews.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}
