/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.filter;

import com.webbanhang.constant.SystemConstant;
import com.webbanhang.model.UserModel;
import com.webbanhang.utils.SessionUltil;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse respone = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
//        System.out.println(url);
        if (url.contains("/admin")) {
            UserModel model = (UserModel) SessionUltil.getInstance().getValue(request, "USERMODEL");
            if (model != null) {
                if (model.getRole().getCode().equals(SystemConstant.ADMIN)) {
                    chain.doFilter(servletRequest, servletResponse);
                } else {
                    respone.sendRedirect(request.getContextPath() + "/login?action=login&message=not_permission&alert=danger");
                }
            } else {
                respone.sendRedirect(request.getContextPath() + "/login?action=login&message=not_login&alert=danger");
            }
        } else {
            chain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
