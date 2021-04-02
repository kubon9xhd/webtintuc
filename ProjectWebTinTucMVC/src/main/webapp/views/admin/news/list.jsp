<%-- Document : list Created on : Feb 18, 2021, 2:33:26 PM Author : asus --%>
<%@include file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url var="APIurl" value="/api-admin-news"></c:url>
<c:url var="URLnews" value="/admin-news"></c:url>

    <!DOCTYPE html>
    <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Danh sách bài viết</title>
        </head>

        <body>
            <div class="main-content">
                <form action="<c:url value="/admin-news"></c:url>" method="get" id="formSubmit">
                    <div class="main-content-inner">
                        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                            <ul class="breadcrumb">
                                <li>
                                    <i class="ace-icon fa fa-home home-icon"></i>
                                    <a href="#">Home</a>
                                </li>
                            </ul><!-- /.breadcrumb -->
                        </div>

                        <div class="page-content">
                            <div class="row">
                                <div class="col-xs-12">
                                <c:if test="${not empty message}">
                                    <div class="alert alert-${alert}">
                                        ${message}
                                    </div>
                                </c:if>
                                <div class="row">
                                    <div class="col-xs-offset 1 col-xs-11 col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6">
                                        <div class="btn-toolbar" role="toolbar">
                                            <div class="btn-group btn-group-justified" role="group">
                                                <div class="btn-group" role="group">
                                                    <a class="dt-button-info buttons btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                                                       title="Add a news" href="<c:url value="/admin-news?type=edit"></c:url>"
                                                           >
                                                           <span><i class="fa fa-plus fa-lg" aria-hidden="true"></i></span>
                                                       </a>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button id="btnDelete" type="button" class="btn btn-warning" title="Delete" data-toggle="tooltip">
                                                            <i class="fa fa-trash-o fa-lg" aria-hidden="true">

                                                            </i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th><input type="checkbox" id="checkAll"></th>
                                                            <th scope="col">Tên Bài Viết</th>
                                                            <th scope="col">Mô tả ngắn</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var = "item" items = "${model.listResult}">
                                                        <tr>
                                                            <td><input type="checkbox" value="${item.id}" id="checkBox_${item.id}" value='${item.id}'></td>
                                                            <td>${item.title}</td>
                                                            <td>${item.shortDescription}</td>
                                                            <td>
                                                                <c:url var="editURL" value="/admin-news">
                                                                    <c:param name="type" value="edit"></c:param>
                                                                    <c:param name="id" value="${item.id}"></c:param>
                                                                </c:url>
                                                                <a class="dt-button-info buttons btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                                                                   title="Edit a news" href="${editURL}"
                                                                   >
                                                                    <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <ul class="pagination" id="pagination"></ul>
                                            <input type="hidden" value="" id="page" name="page"/>
                                            <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
                                            <input type="hidden" value="" id="sortName" name="sortName"/>
                                            <input type="hidden" value="" id="sortBy" name="sortBy"/>
                                            <input type="hidden" value="" id="type" name="type"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.page-content -->
                </div>
            </form>

        </div><!-- /.main-content -->
        <script type="text/javascript">
            var currentPage = ${model.page};
            var totalPage = ${model.totalPage};
            var limit = 4;
            $(function () {
                window.pagObj = $('#pagination').twbsPagination({
                    totalPages: totalPage,
                    visiblePages: 10,
                    startPage: currentPage,
                    onPageClick: function (event, page) {
                        if (currentPage != page) {
                            $("#page").val(page);
                            $("#maxPageItem").val(limit);
                            $("#sortName").val('title');
                            $("#sortBy").val('desc');
                            $("#type").val('list');
                            $("#formSubmit").submit();
                        }
                    }
                });
            });
            $("#btnDelete").click(function () {
                var data = {};
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                data['ids'] = ids;
                deleteNew(data);
            });
            function deleteNew(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'DELETE',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (result) {
//                        console.log(result)
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&sortName=title&sortBy=desc&type=list&message=delete_success";
                    },
                    error: function (error) {
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&sortName=title&sortBy=desc&type=list&message=error_system";
                    }
                });
            }
        </script>
    </body>

</html>