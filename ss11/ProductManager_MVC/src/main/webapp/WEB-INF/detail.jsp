<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 11/29/2024
  Time: 4:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail</title>
</head>
<body>
<form action="http://localhost:8080/products?path=detail">
<h1>Chi Tiết Sản Phẩm</h1>
<p name="id"><strong>ID:</strong>${product.id}</p>
<p name="id"><strong>Tên sản phẩm:</strong>${product.name}</p>
<p name="id"><strong>Giá sản phẩm:</strong>${product.price}</p>
<p name="id"><strong>Mô tả sản phẩm:</strong>${product.description}</p>
<p name="id"><strong>Tác giả:</strong>${product.manufacturer}</p>
    <a href="/products">Back</a>
</form>
</body>
</html>
