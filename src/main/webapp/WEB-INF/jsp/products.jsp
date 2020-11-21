<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="productItem" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
    <title>All Products</title>
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
<productItem:if test="${products.size() == 0}">
    <p class="h3 text-center">Sorry, we don't have products yet.</p>
</productItem:if>
<div class="card-deck">
    <productItem:forEach items="${products}" var="product">
        <div class="row row-cols-md-2 row-cols-md-1">
            <div class="col-md-12">
                <div class="card text-center">
<%--                    <img src="..." class="card-img-top" alt="...">--%>
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                        <form
                                action="${pageContext.request.contextPath}${pageContext.request.userPrincipal.name}/add/product/${product.id}"
                                method="POST">
                            <button type="submit" class="btn btn-primary">Add to basket</button>
                        </form>
                        <sec:authorize access="hasRole('ADMIN')">
                            <form action="${pageContext.request.contextPath}/product/delete/${product.id}"
                                  method="POST">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </sec:authorize>
                        <div class="card-footer">
                            <p class="card-text"><small class="text-muted">Price: ${product.price}</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </productItem:forEach>
</div>
</body>
</html>
