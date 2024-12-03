<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 11/29/2024
  Time: 4:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h1>Add Product</h1>
<a href="http://localhost:8080/products?path=home">Back</a>
<form method="post" action="http://localhost:8080/products?path=add">
    <input type="number" name="id" placeholder="Nhập id">
    <br>
    <input type="text" name="name" placeholder="Nhập tên">
    <br>
    <input type="text" name="price" placeholder="Nhập giá">
    <br>
    <input type="text" name="description" placeholder="Nhập mô tả">
    <br>
    <input type="text" name="manufacturer" placeholder="Nhập mô tả">
    <br>
    <button>Submit thêm</button>
</form>
</body>
</html>
