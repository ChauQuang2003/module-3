<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 11/26/2024
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h1>Product List</h1>
<a href="acction">Add New Product</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Manufacturer</th>
    </tr>
    <c:forEach var="product" items="${product}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td><a href="http://localhost:8080/products?path=edit&id=${item.id}"><button>Sửa</button></a></td>
            <td><a href="http://localhost:8080/products?path=delete&id=${item.id}"><button>Xóa</button></a></td>
            <td><a href="http://localhost:8080/products?path=detail&id=${item.id}"><button>Chi tiết</button></a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
