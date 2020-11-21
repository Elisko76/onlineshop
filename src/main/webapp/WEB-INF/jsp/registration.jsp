<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.5.3/css/bootstrap.min.css">
    <title>Registration</title>
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
                <a class="nav-link active" href="/products">Products</a>
            </li>
            <sec:authorize access="isAuthenticated() || hasRole('USER')">
            <li class="nav-item">
                <a class="nav-link active" href="/registration">My Items</a>
            </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated() || hasRole('ADMIN')">
            <li class="nav-item">
                <a class="nav-link active" href="/product/add">Add Product</a>
            </li>
            </sec:authorize>
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
<div>
    <form:form method="POST" modelAttribute="userForm">
        <p class="h2 offset-md-5">Registration</p>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputUsername">Username</label>
            <form:input name="username" type="text" path="username" class="form-control" id="exampleInputUsername"
                        placeholder="Username"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors>
                ${usernameError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputPassword">Password</label>
            <form:input name="password" type="password" path="password" class="form-control" id="exampleInputPassword"
                        placeholder="Password"></form:input>
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputFirstName">First Name</label>
            <form:input name="firstName" type="text" path="firstName" class="form-control" id="exampleInputFirstName"
                        placeholder="First Name"
                        autofocus="true"></form:input>
            <form:errors path="firstName"></form:errors>
                ${firstNameError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputSecondName">Second Name</label>
            <form:input name="secondName" type="text" path="secondName" class="form-control" id="exampleInputSecondName"
                        placeholder="Second Name"
                        autofocus="true"></form:input>
            <form:errors path="secondName"></form:errors>
                ${secondNameError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputLastName">Last Name</label>
            <form:input name="lastName" type="text" path="lastName" class="form-control" id="exampleInputLastName"
                        placeholder="Last Name"
                        autofocus="true"></form:input>
            <form:errors path="lastName"></form:errors>
                ${lastNameError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputEmail">Email</label>
            <form:input name="email" type="text" path="email" class="form-control" id="exampleInputEmail"
                        placeholder="Email"
                        autofocus="true"></form:input>
            <form:errors path="email"></form:errors>
                ${emailError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputAddress">Address</label>
            <form:input name="address" type="text" path="address" class="form-control" id="exampleInputAddress"
                        placeholder="Email"
                        autofocus="true"></form:input>
            <form:errors path="address"></form:errors>
                ${addressError}
        </div>
        <div class="form-group col-md-3 offset-md-4">
            <label for="exampleInputPhone">Phone Number</label>
            <form:input name="phone" type="text" path="phoneNumber" class="form-control" id="exampleInputPhone"
                        placeholder="Phone Number"
                        autofocus="true"></form:input>
            <form:errors path="phoneNumber"></form:errors>
                ${phoneError}
        </div>
        <button type="submit" class="btn btn-primary offset-md-5">Register</button>
    </form:form>
</div>
</body>
</html>