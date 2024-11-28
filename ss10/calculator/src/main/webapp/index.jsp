<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<form action="/hello-servlet" method="post">
    <div>
        <p>First operand:
            <input type="number" name="num1" id="num1" placeholder="Nhập số num 1">
        </p>
        <p>Operator:
            <select name="operation" id="">
                <option value="add">Cộng</option>
                <option value="sub">Trừ</option>
                <option value="mul">Nhân</option>
                <option value="divide">Chia</option>
            </select>
        </p>
        <p>Second operand:
            <input type="number" name="num2" id="num2" placeholder="Nhập số num ">
        </p>
        <div>
            <button type="submit">Calculate</button>
        </div>
    </div>
</form>
<br/>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>