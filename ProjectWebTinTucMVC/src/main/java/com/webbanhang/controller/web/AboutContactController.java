/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.controller.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
@WebServlet(urlPatterns = {"/about", "/contact"})
public class AboutContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String url = request.getRequestURL().toString();
        RequestDispatcher rd;
        if (url.contains("/about")) {
            rd = request.getRequestDispatcher("/views/web/about.jsp");
        } else {
            rd = request.getRequestDispatcher("/views/web/contact.jsp");
        }
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        final String username = "kubon9xhd113@gmail.com";
        final String password = "Anloznhe113";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        Session session = Session.getInstance(prop,
                new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        // login email
        String name = request.getParameter("name");
        String emailFrom = request.getParameter("emailFrom");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String emailTo = "kubon9xhd@gmail.com";
        try {

            Message  mess = new MimeMessage(session);
            mess.addHeader("Content-type", "text/HTML; charset=UTF-8");
            mess.addHeader("format", "flowed");
            mess.addHeader("Content-Transfer-Encoding", "8bit");
            mess.setFrom(new InternetAddress(username));
            mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            mess.setSubject("From [" + emailFrom + "] Name [" + name + "] " + subject);
            mess.setText(message);
            Transport.send(mess);
        } catch (Exception ex) {
        }
    }
}
