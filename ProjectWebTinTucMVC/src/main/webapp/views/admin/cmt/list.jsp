<%-- Document : list Created on : Feb 18, 2021, 2:33:26 PM Author : asus --%>
<%@include file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:url var="APIurl" value="/api-admin-cmt"></c:url>
<c:url var="URLnews" value="/admin-cmt"></c:url>

    <!DOCTYPE html>
    <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Danh sách cmt</title>
        </head>

        <body>
            <div class="main-content">
                <form action="<c:url value="/admin-cmt"></c:url>" method="get" id="formSubmit">
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
                                                        <th scope="col">Content</th>
                                                        <th scope="col">User id</th>
                                                        <th scope="col">News id</th>
                                                        <th scope="col">Created Date</th>
                                                        <th scope="col">Created By</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "item" items = "${model.listResult}">
                                                        <tr>
                                                            <td><input type="checkbox" value="${item.id}" id="checkBox_${item.id}"></td>
                                                            <td>${item.content}</td>
                                                            <td>${item.userId}</td>
                                                            <td><a href="new/read?id=${item.newsId}">${item.newsId}</a></td>
                                                            <td>${item.createdDate}</td>
                                                            <td>${item.createdBy}</td>
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
            $('#pagination').twbsPagination({
                totalPages: totalPage,
                visiblePages: 10,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (currentPage != page) {
                        $("#page").val(page);
                        $("#maxPageItem").val(limit);
                        $("#sortName").val('id');
                        $("#sortBy").val('desc');
                        $("#type").val('list');
                        $("#formSubmit").submit();
                    }
                }
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
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&sortName=id&sortBy=desc&type=list&message=delete_success";
                    },
                    error: function (error) {
//                        console.log("Error")
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&sortName=id&sortBy=desc&type=list&message=error_system";
                    }
                });
            }
        </script>
    </body>

</html>