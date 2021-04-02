<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title><decorator:title default="Trang chủ"></decorator:title></title>
            <meta name="description" content="overview &amp; stats" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

            <!-- bootstrap & fontawesome -->
            <link rel="stylesheet" href="<c:url value="/template/admin/css/bootstrap.min.css"></c:url>" />
        <link rel="stylesheet" href="<c:url value="/template/admin/font-awesome/4.5.0/css/font-awesome.min.css"/>" />

        <!-- page specific plugin styles -->

        <!-- text fonts -->
        <link rel="stylesheet" href="<c:url value="/template/admin/css/fonts.googleapis.com.css"/>" />

        <!-- ace styles -->
        <link rel="stylesheet" href="<c:url value="/template/admin/css/ace.min.css"/>" class="ace-main-stylesheet" id="main-ace-style" />

        <!--[if lte IE 9]>
                <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="<c:url value="/template/admin/css/ace-skins.min.css"/>" />
        <link rel="stylesheet" href="<c:url value="/template/admin/css/ace-rtl.min.css"/>" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="<c:url value="/template/admin/js/ace-extra.min.js"/>"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <!--[if !IE]> -->
        <script src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />"></script>

        <!-- <![endif]-->

        <!--[if IE]>
            <script src="assets/js/jquery-1.11.3.min.js"></script>
         <![endif]-->
        <script src="<c:url value="/template/admin/js/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="/template/paging/jquery.twbsPagination.js" /> " type="text/javascript"></script>
        <script src="<c:url value="/ckeditor/ckeditor.js" /> " type="text/javascript"></script>
    </head>
    <body class="no-skin">
        <!-- header -->
        <%@include file="../common/admin/header.jsp" %>
        <!-- header -->

        <!-- main -->
        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>
            <!-- menu -->
            <%@include file="../common/admin/menu.jsp" %>
            <!-- menu -->
            <decorator:body></decorator:body>
                <!-- footer -->
            <%@include file="../common/admin/footer.jsp" %>
            <!-- footer -->
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>
        <!-- main -->

        <!-- basic scripts -->

        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement)
                document.write("<script src='<c:url value="template/admin/js/jquery.mobile.custom.min.js'>"></c:url>" + "<" + "/script>");
            </script>

            <!-- page specific plugin scripts -->

            <!--[if lte IE 8]>
              <script src="assets/js/excanvas.min.js"></script>
            <![endif]-->
            <script src="<c:url value="/template/admin/js/jquery-ui.custom.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.ui.touch-punch.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.easypiechart.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.sparkline.index.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.flot.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.flot.pie.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/jquery.flot.resize.min.js"/>"></script>

        <!-- ace scripts -->
        <script src="<c:url value="/template/admin/js/ace-elements.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/ace.min.js"/>"></script>

    </body>
</html>
