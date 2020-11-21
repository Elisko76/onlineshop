<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
    <title>Log in with your account</title>
</head>

<body style="background: url('/resources/images/background_img.jpg') center center no-repeat fixed; background-size:
cover;">
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
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
                <a class="nav-link active" href="/registration">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/registration">My Items</a>
            </li>
            </sec:authorize>

    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item ">
                    <a class="nav-link active" href="/logout">Logout</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>
<form method="POST" action="/login">
    <p class="h2 offset-md-5">Login</p>
    <div class="form-group col-md-3 offset-md-4">
        <label for="exampleInputUsername">Username</label>
        <input name="username" type="text" class="form-control" id="exampleInputUsername" placeholder="Username"
        autofocus="true"
               aria-describedby="usernameHelp"/>
        <small id="usernameHelp" class="form-text text-muted">Enter your username</small>

    </div>
    <div class="form-group col-md-3 offset-md-4">
        <label for="exampleInputPassword">Password</label>
        <input name="password" type="password" class="form-control" id="exampleInputPassword" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary offset-md-5">Log In</button>
</form>
</body>
</html>