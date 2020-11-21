<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin Cabinet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
</head>

<body style="background: url('/resources/images/background_img.jpg') center center no-repeat fixed; background-size:
cover;">
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
                <a class="nav-link active" href="/registration">My Items</a>
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
                    <a class="nav-link active" href="/logout">Logout</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>
<div>
    <table class="table table-bordered table-secondary">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Roles</th>
        </tr>
        </thead>
        <c:forEach items="${allUsers}" var="user">
        <tbody>
        <tr>
            <th>${user.id}</th>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td><c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach></td>
            <td>
                <form action="${pageContext.request.contextPath}/admin" method="post">
                    <input type="hidden" name="userId" value="${user.id}"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button type="submit">Delete</button>
                </form>

            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>