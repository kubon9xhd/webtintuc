/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.service.INewsService;
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
@WebServlet(urlPatterns = {"/api-admin-news"})
public class NewsAPI extends HttpServlet {

    @Inject
    private INewsService NewsService;

    // add news
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NewsModel newModel = HttpUltil.of(request.getReader()).toModel(NewsModel.class);
        newModel.setCreatedBy(((UserModel) SessionUltil.getInstance().getValue(request, "USERMODEL")).getUsername());
        newModel = NewsService.save(newModel);
        mapper.writeValue(response.getOutputStream(), newModel);
    }
//    // update

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NewsModel updateNews = HttpUltil.of(request.getReader()).toModel(NewsModel.class);
        updateNews.setModifiedBy(((UserModel) SessionUltil.getInstance().getValue(request, "USERMODEL")).getUsername());
        updateNews = NewsService.update(updateNews);
        mapper.writeValue(response.getOutputStream(), updateNews);
    }
//    //remove

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NewsModel newsModel = HttpUltil.of(request.getReader()).toModel(NewsModel.class);
        NewsService.delete(newsModel.getIds());
        mapper.writeValue(response.getOutputStream(), "{}");
    }

}
