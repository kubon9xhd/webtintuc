<%-- 
    Document   : edit
    Created on : Feb 22, 2021, 3:26:56 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-news"></c:url>
<c:url var="URLnews" value="/admin-news"></c:url>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Edit</title>
        </head>
        <body>
            <div class="main-content">
                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="#">Edit</a>
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
                            <form id="formSubmit">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Category</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="categoryCode" name="categoryCode">
                                            <option value = "">Type of Category</option>
                                            <c:if test="${not empty model.categoryCode}">
                                                <c:forEach var="item" items="${categories}">
                                                    <option value = "${item.code}" 
                                                            <c:if test="${model.categoryCode == item.code}">
                                                                selected="selected"
                                                            </c:if>
                                                            >${item.name}
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty model.categoryCode}">
                                                <c:forEach var="item" items="${categories}">
                                                    <option value = "${item.code}">${item.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <br/><br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="title" id="title" value="${model.title}">
                                    </div>
                                </div>
                                <br/><br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Thumbnail</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="thumnail" id="thumbnail" value="${model.thumnail}">
                                    </div>
                                </div>
                                <br/><br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Short Description</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="shortDescription" id="shortDescription" value="${model.shortDescription}">
                                    </div>
                                </div>
                                <br/><br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Content</label>
                                    <div class="col-sm-9">
<!--                                        <input type="text" class="form-control" name="content" id="content" value="${model.content}">-->
                                        <textarea rows="" cols="" name="content" id="content" style="margin: 0px; width: 725px; height: 259px">${model.content}</textarea>
                                    </div>
                                </div>
                                <br/><br/>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <c:if test="${not empty model.categoryCode}">
                                            <input type="button" class="btn btn-white btn-warning btn-bold" value="Update new" id="btnAddorUpdateNew">
                                        </c:if>
                                        <c:if test="${empty model.categoryCode}">
                                            <input type="button" class="btn btn-white btn-warning btn-bold" value="Add new" id="btnAddorUpdateNew">
                                        </c:if>
                                    </div>
                                    <input type="hidden" name="id" id="id" value="${model.id == 0 ? "" : model.id}">
                                </div>
                            </form>
                        </div>
                    </div>
                </div><!-- /.page-content -->
            </div>
        </div>
        <script>
            var editor = '';
            $(document).ready(function () {
                editor = CKEDITOR.replace('content');
            });
            $("#btnAddorUpdateNew").click(function (e) {
                e.preventDefault();
                var data = {};
                var formData = $("#formSubmit").serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                data["content"] = editor.getData();
                var id = $("#id").val();
                if (id == "") {
                    addNew(data);
                } else {
                    updateNew(data);
                }
            });
            function addNew(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "${URLnews}?type=edit&id="+result.id+"&message=insert_success";
                    },
                    error: function (error) {
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&type=list&message=error_system";
                    }
                });
            }
            ;
            function updateNew(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "${URLnews}?type=edit&id="+result.id+"&message=update_success";
                    },
                    error: function (error) {
                        window.location.href = "${URLnews}?page=1&maxPageItem=4&type=list&message=error_system";
                    }
                });
            }
        </script>
    </body>
</html>
