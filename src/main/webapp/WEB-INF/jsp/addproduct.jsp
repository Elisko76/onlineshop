<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
    <title>Add Product</title>
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
<div>
    <form:form method="POST" modelAttribute="productForm">
        <p class="h2 offset-md-5">Add New Product</p>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputName">Product Name</label>
            <form:input name="name" type="text" path="name" class="form-control" id="exampleInputName"
                        placeholder="Name"
                        autofocus="true"></form:input>
            <form:errors path="name"></form:errors>
                ${productNameError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputDescription">Product Description</label>
            <form:input name="description" type="text" path="description" class="form-control" id="exampleInputDescription"
                        placeholder="Description"
                        autofocus="true"></form:input>
            <form:errors path="description"></form:errors>
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputPrice">Product Category</label>
            <form:select name="price" type="text" path="cathegory" class="form-control" id="exampleInputPrice"
                        placeholder="Category"
                        autofocus="true">
                <c:forEach items="<%=com.onlineshop.model.ProductCategory.values()%>" var="entry">
                <form:option value="${entry.name()}">${entry.displayValue}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="cathegory"></form:errors>
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputCategory">Product Price</label>
            <form:input name="secondName" type="text" path="price" class="form-control" id="exampleInputCategory"
                        placeholder="Price"
                        autofocus="true"></form:input>
            <form:errors path="price"></form:errors>
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputPhoto">Product Photo</label>
            <form:input name="phone" type="text" path="photo" class="form-control" id="exampleInputPhoto"
                        placeholder="Photo Path"
                        autofocus="true"></form:input>
            <form:errors path="photo"></form:errors>
        </div>
        <button type="submit" class="btn btn-primary offset-md-5">Add Product</button>
    </form:form>
</div>
</body>
</html>