<%-- 
    Document   : home
    Created on : Jan 17, 2021, 8:08:57 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-3 mt-4">
                <div class="card bg-light">
                    <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                    <ul class="list-group category_block">
                        <c:forEach items="${categories}" var="categoriesItem">
                            <li class="list-group-item"><a href="#">${categoriesItem.name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
                
                <c:if test="${not empty modelLastView}">
                    <div class="card bg-light mt-4">
                        <div class="card-header bg-dark text-white text-uppercase">Last View Post</div>
                        <div class="card-body">
                            <img class="img-fluid" src="<c:if test="${not empty modelLastView.thumnail}">  
                                     <c:url value="${modelLastView.thumnail}"></c:url>
                                 </c:if><c:if test="${empty modelLastView.thumnail}">
                                     <c:url value="https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png"></c:url>
                                 </c:if>" alt="${modelLastView.shortDescription}">
                            <a class="card-title" href="<c:url value="/new/read?id=${modelLastView.id}"></c:url>">${modelLastView.title}</a>
                            <p class="card-text">${modelLastView.shortDescription}</p>
                        </div>
                    </div>
                </c:if>
            </div>

            <!-- /.col-lg-3 -->

            <div class="col-lg-9">

                <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <c:forEach var="i" items="${model.listResult}" begin="0" end="2" varStatus="loop">
                            <c:if test="${loop.index == 1}">
                                <div class="carousel-item active">
                                    <img class="d-block img-fluid" style="width: 900px; height: 400px;" src="<c:if test="${not empty i.thumnail}">
                                             <c:url value="${i.thumnail}"></c:url>
                                         </c:if><c:if test="${empty i.thumnail}">
                                             <c:url value="https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png"></c:url>
                                         </c:if>" alt="${i.shortDescription}">
                                </div>
                            </c:if>
                            <c:if test="${loop.index != 1}">
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" style="width: 900px; height: 400px;" src="<c:if test="${not empty i.thumnail}">
                                             <c:url value="${i.thumnail}"></c:url>
                                         </c:if><c:if test="${empty i.thumnail}">
                                             <c:url value="https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png"></c:url>
                                         </c:if>" alt="${i.shortDescription}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="row">
                    <c:forEach var="item" items="${model.listResult}">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="<c:url value="/new/read?id=${item.id}"></c:url>"><img class="card-img-top" src="<c:if test="${not empty item.thumnail}">
                                                                                                   <c:url value="${item.thumnail}"></c:url>
                                                                                               </c:if><c:if test="${empty item.thumnail}">
                                                                                                   <c:url value="https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png"></c:url>
                                                                                               </c:if>" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="<c:url value="/new/read?id=${item.id}"></c:url>">${item.title}</a>
                                        </h4>
                                        <p class="card-text">${item.shortDescription}</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <form  action="<c:url value="/home"></c:url>" method="get" id="formSubmit">
                        <ul class="pagination justify-content-center" id="pagination"></ul>
                        <input type="hidden" value="" id="page" name="page"/>
                        <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
                        <input type="hidden" value="" id="sortName" name="sortName"/>
                        <input type="hidden" value="" id="sortBy" name="sortBy"/>
                    </form>
                </div>
            </div> 
            <script type="text/javascript">
                var currentPage = ${model.page};
                var totalPage = ${model.totalPage};
                var limit = 9;
                $('#pagination').twbsPagination({
                    totalPages: totalPage,
                    visiblePages: 10,
                    startPage: currentPage,
                    onPageClick: function (event, page) {
                        if (currentPage != page) {
                            $("#page").val(page);
                            $("#maxPageItem").val(limit);
                            $("#sortName").val('title');
                            $("#sortBy").val('desc');
                            $("#formSubmit").submit();
                        }
                    }
                });
        </script>
    </body>
</html>
