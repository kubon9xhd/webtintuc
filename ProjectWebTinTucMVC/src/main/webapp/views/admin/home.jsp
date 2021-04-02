<%-- 
    Document   : home
    Created on : Feb 1, 2021, 9:15:00 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chu</title>
    </head>
    <body>
        <div class="main-content">
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
                    <div class="ace-settings-container" id="ace-settings-container">
                        <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                            <i class="ace-icon fa fa-cog bigger-130"></i>
                        </div>

                        <div class="ace-settings-box clearfix" id="ace-settings-box">
                            <div class="pull-left width-50">
                                <div class="ace-settings-item">
                                    <div class="pull-left">
                                        <select id="skin-colorpicker" class="hide">
                                            <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                        </select>
                                    </div>
                                    <span>&nbsp; Choose Skin</span>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-add-container">
                                        Inside
                                        <b>.container</b>
                                    </label>
                                </div>
                            </div><!-- /.pull-left -->

                            <div class="pull-left width-50">
                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                                </div>

                                <div class="ace-settings-item">
                                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
                                    <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                                </div>
                            </div><!-- /.pull-left -->
                        </div><!-- /.ace-settings-box -->
                    </div><!-- /.ace-settings-container -->

                    <div class="page-header">
                        <h1>
                            Dashboard
                            <small>
                                <i class="ace-icon fa fa-angle-double-right"></i>
                                overview &amp; stats
                            </small>
                        </h1>
                    </div><!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="alert alert-block alert-success">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>

                                <i class="ace-icon fa fa-check green"></i>

                                Welcome to
                                <strong class="green">
                                    Admin systemn
                                    <small>(v1.0.1)</small>
                                </strong>,
                            </div>

                            <div class="row">
                                <div class="space-6"></div>

                                <div class="col-sm-12 infobox-container">
                                    <div class="infobox infobox-green">
                                        <div class="infobox-icon">
                                            <i class="ace-icon fa fa-comments"></i>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-data-number">32</span>
                                            <div class="infobox-content">comments + 2 reviews</div>
                                        </div>

                                        <div class="stat stat-success">8%</div>
                                    </div>

                                    <div class="infobox infobox-blue">
                                        <div class="infobox-icon">
                                            <i class="ace-icon fa fa-twitter"></i>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-data-number">11</span>
                                            <div class="infobox-content">new followers</div>
                                        </div>

                                        <div class="badge badge-success">
                                            +32%
                                            <i class="ace-icon fa fa-arrow-up"></i>
                                        </div>
                                    </div>

                                    <div class="infobox infobox-pink">
                                        <div class="infobox-icon">
                                            <i class="ace-icon fa fa-shopping-cart"></i>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-data-number">8</span>
                                            <div class="infobox-content">new orders</div>
                                        </div>
                                        <div class="stat stat-important">4%</div>
                                    </div>

                                    <div class="infobox infobox-red">
                                        <div class="infobox-icon">
                                            <i class="ace-icon fa fa-flask"></i>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-data-number">7</span>
                                            <div class="infobox-content">experiments</div>
                                        </div>
                                    </div>

                                    <div class="infobox infobox-orange2">
                                        <div class="infobox-chart">
                                            <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-data-number">6,251</span>
                                            <div class="infobox-content">pageviews</div>
                                        </div>

                                        <div class="badge badge-success">
                                            7.2%
                                            <i class="ace-icon fa fa-arrow-up"></i>
                                        </div>
                                    </div>

                                    <div class="infobox infobox-blue2">
                                        <div class="infobox-progress">
                                            <div class="easy-pie-chart percentage" data-percent="42" data-size="46">
                                                <span class="percent">42</span>%
                                            </div>
                                        </div>

                                        <div class="infobox-data">
                                            <span class="infobox-text">traffic used</span>

                                            <div class="infobox-content">
                                                <span class="bigger-110">~</span>
                                                58GB remaining
                                            </div>
                                        </div>
                                    </div>

                                    <div class="space-6"></div>

                                    <div class="infobox infobox-green infobox-small infobox-dark">
                                        <div class="infobox-progress">
                                            <div class="easy-pie-chart percentage" data-percent="61" data-size="39">
                                                <span class="percent">61</span>%
                                            </div>
                                        </div>

                                        <div class="infobox-data">
                                            <div class="infobox-content">Task</div>
                                            <div class="infobox-content">Completion</div>
                                        </div>
                                    </div>

                                    <div class="infobox infobox-blue infobox-small infobox-dark">
                                        <div class="infobox-chart">
                                            <span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
                                        </div>

                                        <div class="infobox-data">
                                            <div class="infobox-content">Earnings</div>
                                            <div class="infobox-content">$32,000</div>
                                        </div>
                                    </div>

                                    <div class="infobox infobox-grey infobox-small infobox-dark">
                                        <div class="infobox-icon">
                                            <i class="ace-icon fa fa-download"></i>
                                        </div>

                                        <div class="infobox-data">
                                            <div class="infobox-content">Downloads</div>
                                            <div class="infobox-content">1,205</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="vspace-12-sm"></div>
                            </div><!-- /.row -->

                            <div class="hr hr32 hr-dotted"></div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="widget-box transparent" id="recent-box">
                                        <div class="widget-header">
                                            <h4 class="widget-title lighter smaller">
                                                <i class="ace-icon fa fa-rss orange"></i>RECENT
                                            </h4>

                                            <div class="widget-toolbar no-border">
                                                <ul class="nav nav-tabs" id="recent-tab">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#task-tab">Tasks</a>
                                                    </li>

                                                    <li>
                                                        <a data-toggle="tab" href="#member-tab">Members</a>
                                                    </li>

                                                    <li>
                                                        <a data-toggle="tab" href="#comment-tab">Comments</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main padding-4">
                                                <div class="tab-content padding-8">
                                                    <div id="task-tab" class="tab-pane active">
                                                        <h4 class="smaller lighter green">
                                                            <i class="ace-icon fa fa-list"></i>
                                                            Sortable Lists
                                                        </h4>

                                                        <ul id="tasks" class="item-list">
                                                            <li class="item-orange clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Answering customer questions</span>
                                                                </label>

                                                                <div class="pull-right easy-pie-chart percentage" data-size="30" data-color="#ECCB71" data-percent="42">
                                                                    <span class="percent">42</span>%
                                                                </div>
                                                            </li>

                                                            <li class="item-red clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Fixing bugs</span>
                                                                </label>

                                                                <div class="pull-right action-buttons">
                                                                    <a href="#" class="blue">
                                                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                    </a>

                                                                    <span class="vbar"></span>

                                                                    <a href="#" class="red">
                                                                        <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                    </a>

                                                                    <span class="vbar"></span>

                                                                    <a href="#" class="green">
                                                                        <i class="ace-icon fa fa-flag bigger-130"></i>
                                                                    </a>
                                                                </div>
                                                            </li>

                                                            <li class="item-default clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Adding new features</span>
                                                                </label>

                                                                <div class="pull-right pos-rel dropdown-hover">
                                                                    <button class="btn btn-minier bigger btn-primary">
                                                                        <i class="ace-icon fa fa-cog icon-only bigger-120"></i>
                                                                    </button>

                                                                    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close dropdown-menu-right">
                                                                        <li>
                                                                            <a href="#" class="tooltip-success" data-rel="tooltip" title="Mark&nbsp;as&nbsp;done">
                                                                                <span class="green">
                                                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                </span>
                                                                            </a>
                                                                        </li>

                                                                        <li>
                                                                            <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
                                                                                <span class="red">
                                                                                    <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </li>

                                                            <li class="item-blue clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Upgrading scripts used in template</span>
                                                                </label>
                                                            </li>

                                                            <li class="item-grey clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Adding new skins</span>
                                                                </label>
                                                            </li>

                                                            <li class="item-green clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Updating server software up</span>
                                                                </label>
                                                            </li>

                                                            <li class="item-pink clearfix">
                                                                <label class="inline">
                                                                    <input type="checkbox" class="ace" />
                                                                    <span class="lbl"> Cleaning up</span>
                                                                </label>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div id="member-tab" class="tab-pane">
                                                        <div class="clearfix">
                                                            <div class="itemdiv memberdiv">
                                                                <div class="user">
                                                                    <img alt="Bob Doe's avatar" src="https://znews-photo.zadn.vn/w1024/Uploaded/qhj_yvobvhfwbv/2018_07_18/Nguyen_Huy_Binh1.jpg" style="width: 50px; height: 50px" />
                                                                </div>

                                                                <div class="body">
                                                                    <div class="name">
                                                                        <a href="#">Bob Doe</a>
                                                                    </div>

                                                                    <div class="time">
                                                                        <i class="ace-icon fa fa-clock-o"></i>
                                                                        <span class="green">20 min</span>
                                                                    </div>

                                                                    <div>
                                                                        <span class="label label-warning label-sm">pending</span>

                                                                        <div class="inline position-relative">
                                                                            <button class="btn btn-minier btn-yellow btn-no-border dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                                                                <i class="ace-icon fa fa-angle-down icon-only bigger-120"></i>
                                                                            </button>

                                                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                <li>
                                                                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="Approve">
                                                                                        <span class="green">
                                                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>

                                                                                <li>
                                                                                    <a href="#" class="tooltip-warning" data-rel="tooltip" title="Reject">
                                                                                        <span class="orange">
                                                                                            <i class="ace-icon fa fa-times bigger-110"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>

                                                                                <li>
                                                                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
                                                                                        <span class="red">
                                                                                            <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="space-4"></div>

                                                        <div class="center">
                                                            <i class="ace-icon fa fa-users fa-2x green middle"></i>

                                                            &nbsp;
                                                            <a href="#" class="btn btn-sm btn-white btn-info">
                                                                See all members &nbsp;
                                                                <i class="ace-icon fa fa-arrow-right"></i>
                                                            </a>
                                                        </div>

                                                        <div class="hr hr-double hr8"></div>
                                                    </div><!-- /.#member-tab -->

                                                    <div id="comment-tab" class="tab-pane">
                                                        <div class="comments">
                                                            <div class="itemdiv commentdiv">
                                                                <div class="user">
                                                                    <img alt="Bob Doe's Avatar" src="<c:url value="https://phunugioi.com/wp-content/uploads/2020/10/hinh-anh-avatar-de-thuong-cute.jpg"></c:url>" />
                                                                </div>

                                                                <div class="body">
                                                                    <div class="name">
                                                                        <a href="#">Bob Doe</a>
                                                                    </div>

                                                                    <div class="time">
                                                                        <i class="ace-icon fa fa-clock-o"></i>
                                                                        <span class="green">6 min</span>
                                                                    </div>

                                                                    <div class="text">
                                                                        <i class="ace-icon fa fa-quote-left"></i>
                                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis &hellip;
                                                                    </div>
                                                                </div>

                                                                <div class="tools">
                                                                    <div class="inline position-relative">
                                                                        <button class="btn btn-minier bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
                                                                            <i class="ace-icon fa fa-angle-down icon-only bigger-120"></i>
                                                                        </button>

                                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                            <li>
                                                                                <a href="#" class="tooltip-success" data-rel="tooltip" title="Approve">
                                                                                    <span class="green">
                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                    </span>
                                                                                </a>
                                                                            </li>

                                                                            <li>
                                                                                <a href="#" class="tooltip-warning" data-rel="tooltip" title="Reject">
                                                                                    <span class="orange">
                                                                                        <i class="ace-icon fa fa-times bigger-110"></i>
                                                                                    </span>
                                                                                </a>
                                                                            </li>

                                                                            <li>
                                                                                <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
                                                                                    <span class="red">
                                                                                        <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                    </span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="hr hr8"></div>

                                                        <div class="center">
                                                            <i class="ace-icon fa fa-comments-o fa-2x green middle"></i>

                                                            &nbsp;
                                                            <a href="#" class="btn btn-sm btn-white btn-info">
                                                                See all comments &nbsp;
                                                                <i class="ace-icon fa fa-arrow-right"></i>
                                                            </a>
                                                        </div>

                                                        <div class="hr hr-double hr8"></div>
                                                    </div>
                                                </div>
                                            </div><!-- /.widget-main -->
                                        </div><!-- /.widget-body -->
                                    </div><!-- /.widget-box -->
                                </div><!-- /.col -->

                                <div class="col-sm-6">
                                    <div class="widget-box">
                                        <div class="widget-header">
                                            <h4 class="widget-title lighter smaller">
                                                <i class="ace-icon fa fa-comment blue"></i>
                                                Conversation
                                            </h4>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main no-padding">
                                                <div class="dialogs">
                                                    <div class="itemdiv dialogdiv">
                                                        <div class="user">
                                                            <img alt="Alexa's Avatar" src="<c:url value="https://phunugioi.com/wp-content/uploads/2020/10/hinh-anh-avatar-de-thuong-cute.jpg"/>" />
                                                        </div>

                                                        <div class="body">
                                                            <div class="time">
                                                                <i class="ace-icon fa fa-clock-o"></i>
                                                                <span class="green">4 sec</span>
                                                            </div>

                                                            <div class="name">
                                                                <a href="#">Alexa</a>
                                                            </div>
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis.</div>

                                                            <div class="tools">
                                                                <a href="#" class="btn btn-minier btn-info">
                                                                    <i class="icon-only ace-icon fa fa-share"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <form>
                                                    <div class="form-actions">
                                                        <div class="input-group">
                                                            <input placeholder="Type your message here ..." type="text" class="form-control" name="message" />
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-sm btn-info no-radius" type="button">
                                                                    <i class="ace-icon fa fa-share"></i>
                                                                    Send
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div><!-- /.widget-main -->
                                        </div><!-- /.widget-body -->
                                    </div><!-- /.widget-box -->
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <!-- PAGE CONTENT ENDS -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
    </body>
</html>
