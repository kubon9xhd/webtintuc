/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.NewsModel;
import com.webbanhang.model.UserModel;
import com.webbanhang.paging.PageRequest;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.ICategoryService;
import com.webbanhang.service.INewsService;
import com.webbanhang.service.IUserService;
import com.webbanhang.sort.Sorter;
import com.webbanhang.utils.FromUltil;
import com.webbanhang.utils.SessionUltil;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
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
@WebServlet(urlPatterns = {"/home", "/login", "/logout", "/register", "/detail", "/category"})
public class HomeController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;
    @Inject
    private INewsService newsService;
    @Inject
    private IUserService userService;

    ResourceBundle rs = ResourceBundle.getBundle("message", new Locale("en"));

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        String url = request.getRequestURI();
        UserModel userModel = (UserModel) SessionUltil.getInstance().getValue(request, "USERMODEL");
        //login
        if (action != null && action.equals("login")) {
            // da dang nhap
            if (userModel != null) {
                response.sendRedirect("home");
                return;
            }
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            // neu ma co thong bao
            if (message != null && alert != null) {
                request.setAttribute("alert", alert);
                request.setAttribute("message", rs.getString(message));
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
            rd.forward(request, response);
            // end login
        } else if (action != null && action.equals("logout")) {
            SessionUltil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/home");
        } else if (url.contains("/detail")) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/news/detailNews.jsp");
            rd.forward(request, response);
        } else if (url.contains("/category")) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/news/detailCategory.jsp");
            rd.forward(request, response);
        } else if (url.contains("/register")) {
            // dang nhap chua
            if (userModel != null) {
                response.sendRedirect("home");
                return;
            }
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            // co thong bao k
            if (message != null && alert != null) {
                request.setAttribute("alert", alert);
                request.setAttribute("message", rs.getString(message));
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/register.jsp");
            rd.forward(request, response);
        } else {
            // The
                    NewsModel newsModel = FromUltil.toModel(NewsModel.class, request);
                    Pageble pageRequest;
                    if (newsModel.getPage() != null && newsModel.getMaxPageItem() != null) {
                        pageRequest = new PageRequest(
                                newsModel.getPage(),
                                newsModel.getMaxPageItem(),
                                new Sorter(newsModel.getSortName(), newsModel.getSortBy())
                        );
                    } else {
                        pageRequest = new PageRequest(
                                1,
                                9,
                                new Sorter("title", "desc")
                        );
                    }
                    // last view
                    if (SessionUltil.getInstance().getValue(request, "LASTVIEW") != null) {
                        request.setAttribute(SystemConstant.MODEL + "LastView", (NewsModel) SessionUltil.getInstance().getValue(request, "LASTVIEW"));
                    }
                    // get all news
                    newsModel.setListResult(
                            newsService.findAll(pageRequest)
                    );
                    // truyen ra jsp
                    newsModel.setTotalItem(newsService.getTotalItem());
                    newsModel.setPage(pageRequest.getPage());
                    newsModel.setMaxPageItem(pageRequest.getLimit());
                    newsModel.setTotalPage((int) Math.ceil((double) newsModel.getTotalItem() / pageRequest.getLimit()));
                    request.setAttribute("categories", categoryService.findAll());
                    request.setAttribute(SystemConstant.MODEL, newsModel);
                    RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
                    rd.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        String url = request.getRequestURI();
        System.out.println(url);
        if (action != null && action.equals("login")) {
            // map du lieu
            UserModel model = FromUltil.toModel(UserModel.class, request);
           // kiem tra tai khoan ton tai
            model = userService.findByUsernameAndPasswordAndStatus(model.getUsername(), model.getPassword(), model.getStatus());
            if (model != null) {
                SessionUltil.getInstance().pushValue(request, "USERMODEL", model);
                if (model.getRole().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/home");
                } else if (model.getRole().getCode().equals("ADMIN")) {
                    response.sendRedirect(request.getContextPath() + "/admin-home");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/login?action=login&message=username_password_invalid&alert=danger");
            }
        } else if (url.contains("/register")) {
            // map du lieu
            UserModel model = FromUltil.toModel(UserModel.class, request);
            // kiem tra usser name co ton tai k
            UserModel model1 = userService.findByUsername(model.getUsername());
            if (model1 == null) {
                // chua ton tai
                model1 = userService.save(model);
                // luu thanh cong
                if (model1 != null) {
                    response.sendRedirect(request.getContextPath() + "/login?action=login");
                } else {
                    response.sendRedirect(request.getContextPath() + "/register?message=username_password_invalid&alert=danger");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/register?message=username_password_invalid&alert=danger");
            }
        }
    }
}
