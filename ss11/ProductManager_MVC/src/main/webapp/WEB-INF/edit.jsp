<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 11/29/2024
  Time: 4:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<h1>Form Edit</h1>
<a href="http://localhost:8080/products?path=home">Back</a>
<form method="post" action="http://localhost:8080/products?path=edit">
    <input type="number" name="id" placeholder="Nhập id" value="${product.id}" readonly>
    <br>
    <input type="text" name="name" placeholder="Nhập tên" value="${product.name}">
    <br>
    <input type="text" name="price" placeholder="Nhập giá" value="${product.price}">
    <br>
    <input type="text" name="description" placeholder="Nhập mô tả" value="${product.description}">
    <br>
    <input type="text" name="manufacturer" placeholder="Nhập mô tả" value="${product.manufacturer}">
    <br>
    <button>Submit sửa</button>
</form>
</body>
</html>
