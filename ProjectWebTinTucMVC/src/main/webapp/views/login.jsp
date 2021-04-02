<%-- 
    Document   : login
    Created on : Feb 21, 2021, 3:16:12 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="sidenav bg-dark">
            <div class="login-main-text">
                <h2>Application<br> Login</h2>
                <p>Login or register from here to access.</p>
                <c:if test="${not empty alert and not empty message}">
                    <div class="alert alert-${alert}">
                        <strong>Fail!</strong> ${message}.
                    </div>
                </c:if>
            </div>
        </div>
        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <form action="<c:url value="/login"/>" id="formLogin" method="POST">
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" class="form-control" placeholder="UserName/Email" name="username">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                        <input type="hidden" value="login" name="action">
                        <button type="submit" class="btn btn-dark">Login</button>
                        <a href="register" class="btn btn-secondary">Register</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
