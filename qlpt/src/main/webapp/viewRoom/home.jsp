<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 12/11/2024
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách phòng trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .confirm-checkbox {
        display: none;
    }

    .confirm-modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Đảm bảo nền mờ */
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .modal-content {
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        width: 300px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .modal-content p {
        font-size: 18px;
        color: #333;
        margin-bottom: 20px;
    }

    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        text-decoration: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
    }

    .confirm-checkbox:checked + .confirm-modal {
        display: flex;
    }

    .btn-danger {
        background-color: #e74c3c;
        color: white;
        border: none;
    }

    .btn-secondary {
        background-color: #ccc;
        color: #333;
        border: none;
    }
</style>
<body>
<div class="container my-5">
    <h1 class="text-center mb-4">Danh sách phòng trọ</h1>

    <div class="d-flex justify-content-between mb-3">
        <form action="/rooms?path=search" method="get" >
        <div class="input-group w-50">
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
            <input type="hidden" name="path" value="search">
            <input name="keyword" type="text" class="form-control" placeholder="Tìm kiếm...">
            <button hidden="hidden" type="submit"></button>
        </div>
        </form>
        <a href="http://localhost:8080/rooms?path=add">
            <button class="btn btn-primary">Tạo mới</button>
        </a>
    </div>

    <div class="table-responsive">
        <form action="/rooms" method="post">
            <p>${mess}</p>
            <table class="table table-striped table-bordered text-center">
                <thead class="table-dark">
                <tr>
                    <th>STT</th>
                    <th>Mã phòng trọ</th>
                    <th>Tên người thuê trọ</th>
                    <th>Số điện thoại</th>
                    <th>Ngày bắt đầu thuê</th>
                    <th>Hình thức thanh toán</th>
                    <th>Ghi chú</th>
                    <th>action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${roomList}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${item.id}</td>
                        <td>${item.tenantName}</td>
                        <td>${item.phoneNumber}</td>
                        <td>${item.startDate}</td>
                        <td> ${item.paymentMethod.typeName}</td>
                        <td>${item.note}</td>
                        <td><input type="checkbox" name="checkbox" value="${item.id}"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <%--                <a href="/rooms?path=delete"><button class="btn btn-danger">Xóa</button></a>--%>
                <label for="delete-${loop.index}" class="btn btn-danger">Xóa</label>
                <input type="checkbox" id="delete-${loop.index}" class="confirm-checkbox"/>
                <c:forEach var="item" items="${roomList}">
                    <div class="confirm-modal">
                        <div class="modal-content">
                            <p>Bạn có chắc chắn muốn xóa? với ID:
                                ${item.id}
                            </p>
                            <!-- Nút Xác nhận -->
                            <a href="http://localhost:8080/rooms?path=delete&id=${item.id}"
                               class="btn btn-danger">Xác nhận</a>
                            <!-- Nút Hủy -->
                            <label for="delete-${loop.index}" class="btn btn-secondary">Hủy</label>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </form>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleAll(source) {
        const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
        checkboxes.forEach(checkbox => checkbox.checked = source.checked);
    }
</script>
</body>
</html>
