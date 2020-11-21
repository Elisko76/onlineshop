<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Index</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
</head>
<body style="background: url('/resources/images/background_img.jpg') center center no-repeat fixed; background-size:
cover;">
<div>
    <nav class="navbar navbar-expand-md navbar-light" style="background-color: #e3f2fd;">
        <a class="navbar-brand" href="/"> <img src="/resources/images/shop.jpg" width="30" height="30" alt=""/>
            OnlineShop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
            <ul class="navbar-nav mr-auto">
                <sec:authorize access="!isAuthenticated()">
                <li class="nav-item active">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/registration">Register</a>
                </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link active" href="/products">Products</a>
                </li>
                <sec:authorize access="isAuthenticated() || hasRole('USER')">
                <li class="nav-item">
                    <a class="nav-link active" href="/user/basket">My Basket</a>
                </li>
                </sec:authorize>
                </sec:authorize>

        </div>
        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
            <ul class="navbar-nav ml-auto">
                <sec:authorize access="isAuthenticated() && hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link active" href="/product/add">Add Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin">Manage Users</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item ">
                        <a class="nav-link active" href="/user">Settings
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active" href="/logout">Logout</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </nav>
    <br/>
    <sec:authorize access="isAuthenticated()">
        <p class="h3 text-center">Здравствуйте, ${pageContext.request.userPrincipal.name}! </p>
    </sec:authorize>
    <br/>
    <p class="h3 text-center">Это онлайн магазин телефонов, электронных книг и планшетов</p>
    <sec:authorize access="!isAuthenticated()">
        <br/>
        <p class="h3 text-center">Пожалуйста, авторизуйтесь для просмотра товаров</p>
    </sec:authorize>
    <sec:authorize access="isAuthenticated() || hasRole('ROLE_USER')">
        <br/>
        <p class="h3 text-center">Пожалуйста, перейдите на вкладку product, чтобы увидеть все товары.</p>
    </sec:authorize>
</div>

</body>
</html>