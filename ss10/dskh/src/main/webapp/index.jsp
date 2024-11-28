<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Danh Sách Khách Hàng</h1>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${list}" var="Customer">
        <tr>
            <td>${loop.id}</td>
            <td>${Customer.name}</td>
            <td>${Customer.dateOfBirth}</td>
            <td>${Customer.address}</td>
            <td><img src="${Customer.img}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</form>
</body>
</html>