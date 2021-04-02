<%-- 
    Document   : detail
    Created on : Mar 18, 2021, 9:49:28 AM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="APIUrl" value="/api-cmt"/>
<c:url var="URLnews" value="/new/read"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Detail</title>
    </head>
    <body>
        <div class="container">
            <div class="row mt-4">
                <div class="col-lg-1">
                </div>
                <div class="col-lg-10">
                    <div class="card">
                        <div class="card-body">
                            <strong class="d-inline-block mb-2 text-primary card-title">Home > ${model.categoryCode} </strong><div class="mb-1 text-muted">${model.createdDate}</div>
                        </div>
                    </div>
                    <div class="card card-outline-secondary my-4">
                        <div class="card-body">
                            ${model.content}
                        </div>
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-1">
                </div>
            </div>
            <div class="row justify-content-md-center mb-4">
                <div class="col-lg-10">
                    <div class="card">
                        <div class="card-body">
                            <strong class="d-inline-block mb-2 text-primary card-title">Suggestions</strong>
                        </div>
                    </div>
                </div>
            </div>           
            <div class="row mb-2 justify-content-md-center">
                <c:forEach var="item" items="${randomNews}" begin="0" end="1">
                    <div class="col-lg-10">
                        <div class="card flex-md-row mb-4 box-shadow h-md-250">
                            <div class="card-body d-flex flex-column align-items-start">
                                <h6 class="mb-0">
                                    <a class="text-dark" href="#">${item.title}</a>
                                </h6>
                                <div class="mb-1 text-muted">${item.createdDate}</div>
                                <p class="card-text mb-auto">${item.shortDescription}</p>
                                <a href="<c:url value="/new/read?id=${item.id}"></c:url>">Continue reading</a>
                                </div>
                                <img class="card-img-right flex-auto d-none d-md-block" data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]" style="width: 200px; height: 250px;" src="<c:url value="${item.thumnail}"></c:url>" data-holder-rendered="true">
                            </div>
                        </div>
                </c:forEach>
            </div>
            <div class="row justify-content-md-center mb-4">
                <div class="col-lg-10">
                    <div class="form-group">
                        <label for="comment">Comment:</label>
                        <c:if test="${login == true}">
                            <textarea class="form-control" rows="5" id="commentContent"></textarea>
                            <button type="button" class="btn btn-primary mt-1" id="commentBtn">Comment</button>
                        </c:if>
                        <c:if test="${login == false}">
                            <textarea class="form-control" rows="5" id="comment" disabled=""></textarea>
                            <button type="button" class="btn btn-primary mt-1" disabled="">Comment</button>
                        </c:if>
                    </div>
                    <c:if test="${not empty model.listCmt}">
                        <c:forEach items="${model.listCmt}" var="cmtItem">
                            <!-- First Comment -->
                            <article class="row">
                                <div class="col-md-2 col-sm-2 hidden-xs">
                                    <figure class="thumbnail">
                                        <img class="img-responsive" src="http://www.tangoflooring.ca/wp-content/uploads/2015/07/user-avatar-placeholder.png" style="width: 100px;height: 100px"/>
                                        <figcaption class="text-center">${cmtItem.createdBy}</figcaption>
                                    </figure>
                                </div>
                                <div class="col-md-10 col-sm-10">
                                    <div class="panel panel-default arrow left">
                                        <div class="panel-body">
                                            <header class="text-left">
                                                <div class="comment-user"><i class="fa fa-user"></i> Test</div>
                                                <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> ${cmtItem.createdDate}</time>
                                            </header>
                                            <div class="comment-post">
                                                <p>
                                                    ${cmtItem.content}
                                                </p>
                                            </div>
                                            <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#commentBtn").click(function (e) {
            var data = {};
            data['content'] = $("#commentContent").val();
            data['newsId'] = ${model.id};
            e.preventDefault();
            $.ajax({
                url: '${APIUrl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (result) {
                    window.location.href = "${URLnews}?id=${model.id}";
                },
                error: function (error) {
                    alert("Can not cmt now.");
                }
            });
        });
    </script>
</body>
</html>
