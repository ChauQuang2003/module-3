<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 12/11/2024
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tạo thông tin thuê trọ</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
  <h1 class="text-center mb-4">Tạo thông tin thuê trọ</h1>
  <form action="/rooms?path=add" method="post" id="createForm" class="row g-3">
    <div class="col-md-12">
      <label for="roomCode" class="form-label">Mã phòng trọ</label>
      <input type="text" class="form-control" id="roomCode" name="roomCode" readonly>
    </div>

    <div class="col-md-12">
      <label for="tenantName" class="form-label">Tên người thuê</label>
      <input type="text" class="form-control" id="tenantName" name="tenantName" placeholder="Nhập tên người thuê">
      <p class="text-danger">${usernameError}</p>
    </div>
    <div class="col-md-12">
      <label for="phoneNumber" class="form-label">Số điện thoại</label>
      <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại">
      <p class="text-danger">${phoneError}</p>
    </div>


    <div class="col-md-12">
      <label for="startDate" class="form-label">Ngày bắt đầu thuê</label>
      <input type="date" class="form-control" id="startDate" name="startDate">
<%--      <p class="text-danger">${phoneError}</p>--%>
    </div>
    <div class="col-md-12">
      <label for="paymentMethod" class="form-label">Hình thức thanh toán</label>
      <select id="paymentMethod" class="form-select" name="paymentMethod">
        <c:forEach items="${payment}" var="payment">
          <option value="${payment.id}">${payment.typeName}</option>
        </c:forEach>
      </select>
    </div>

    <div class="col-md-12">
      <label for="note" class="form-label">Ghi chú</label>
      <textarea id="note" class="form-control" rows="3" placeholder="Nhập ghi chú..." name="note"></textarea>
      <p class="text-danger">${noteError}</p>
    </div>
    <div class="col-md-12 text-center">
      <button type="submit" class="btn btn-primary me-2">Tạo mới</button>
      <button type="reset" class="btn btn-secondary">Hủy</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
