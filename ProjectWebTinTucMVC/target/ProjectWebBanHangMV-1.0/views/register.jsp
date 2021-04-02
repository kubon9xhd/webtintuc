<%-- 
    Document   : register
    Created on : Feb 23, 2021, 7:53:56 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="URLRegister" value="/register"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            <div class="container">
                <div class="container-fluid thumbnail">
                    <div class="thumbnail__content text-center">
                        <h1 class="heading--primary">Welcome to My Project.</h1>
                        <h2 class="heading--secondary">Are you ready to join the website?</h2>
                    </div>
                </div>
                <div class="container-fluid">
                <c:if test="${not empty message}">
                    <div class="alert alert-${alert}">
                        ${message}
                    </div>
                </c:if>
                <form method="post" id="formRegister">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input class="form-control" type="text" name="username" id="username" placeholder="james.bond" required />
                    </div>
                    <div class="form-group">
                        <label for="fullname">Fullname</label>
                        <input class="form-control" type="text" name="fullname" id="fullname" placeholder="Nguyen Duc Hung" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password" placeholder="********" required />
                    </div>
                    <div class="m-t-lg">
                        <ul class="list-inline">
                            <li>
                                <input class="btn btn-primary" type="submit" id="submitForm" value="Register" />
                            </li>
                        </ul>
                    </div>
                </form>  
            </div>
        </div>
 
    </body>
</html>
