/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.utils;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author asus
 */
public class MessageUltil {

    public static void showMessage(HttpServletRequest request) {
        String message = "";
        String alert = "";
        String messageResponse = "";
        if (request.getParameter("message") != null) {
            message = request.getParameter("message");
            if (message.equalsIgnoreCase("insert_success")) {
                messageResponse = "Insert done";
                alert = "success";
            } else if (message.equalsIgnoreCase("update_success")) {
                messageResponse = "Update done";
                alert = "success";

            } else if (message.equalsIgnoreCase("delete_success")) {
                messageResponse = "Delete done";
                alert = "success";

            } else if (message.equalsIgnoreCase("error_system")) {
                messageResponse = "Error";
                alert = "danger";
            }
            request.setAttribute("message", messageResponse);
            request.setAttribute("alert", alert);
        }
    }
}
