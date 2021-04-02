<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/home" />">Hot News</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <form class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" aria-label="Small" id="search" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/home" />">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/about"></c:url>">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/contact"></c:url>">Contact</a>
                </li>
                <c:if test="${not empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome ${USERMODEL.fullname}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/logout?action=logout"></c:url>">Logout</a>
                        </li>
                </c:if>
                <c:if test="${empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login?action=login"></c:url>">Login</a>
                        </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
