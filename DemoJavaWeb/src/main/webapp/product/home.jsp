<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>
        Mendover
    </title>
    <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
<%--    <link href="/css/home.css" rel="stylesheet">--%>
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

    .hero-section img {
        object-fit: cover;
        width: 100%;
        height: 100%;
    }

    .product-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

</style>
<body>
<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <div class="d-flex justify-content-end w-100">
            <a class="nav-link" href="#" style="color: blue">
                Đăng nhập
            </a>
            <a class="nav-link" href="#" style="color: blue">
                Đăng ký
            </a>
        </div>
    </div>
</nav>
<!-- Main Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img alt="Mendover logo" height="80px"
                 src="https://i.pinimg.com/originals/65/c0/07/65c0077d81d31356e5244f010a5bac10.jpg" width="80px"/>
        </a>
        <button aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"
                data-bs-target="#navbarNav" data-bs-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/products?action=home">
                        TRANG CHỦ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        GIỚI THIỆU
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a aria-expanded="false" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
                       id="navbarDropdown" role="button">
                        SẢN PHẨM
                    </a>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        LIÊN HỆ
                    </a>
                </li>
            </ul>
        </div>
        <div class="d-flex">
            <a class="nav-link" href="#">
                <i class="fas fa-search"></i>
            </a>
            <a class="nav-link" href="http://localhost:8080/products?action=create" style="color: blue">
                Thêm Sảm Phẩm
            </a>
        </div>
    </div>
</nav>
<div class="container my-4">
    <form action="${pageContext.request.contextPath}/products" method="get">
        <div class="row">
            <div class="col-md-8">
                <input type="hidden" name="action" value="search">
                <input type="text" class="form-control" name="keyword"
                       placeholder="Tìm kiếm sản phẩm theo tên hoặc ID..." required>
                <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
            </div>
            <div class="col-md-4">
            </div>
        </div>
    </form>
</div>
<!-- Hero Section -->
<div class="hero-section">
    <img alt="Living room with modern furniture and large windows" height="100%"
         src="https://storage.googleapis.com/a1aa/image/m0sbgnrGezUbW6xCoscdhrfsLMXP7nNpuaYHq2EMltlmwW4TA.jpg"
         width="100%"/>
</div>
<br><br><br><br>
<div class="container">
    <div class="row product-row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-4 product-card">
                <div class="discount">
                </div>
                <img alt="Căn hộ 3PN ở Pearl Plaza" height="300" src="${product.image}" width="400"/>
                <h5>${product.name}</h5>
                <p class="description">${product.description}</p>
                <p class="price" style="font-size: 18px; color: #d9534f; font-weight: bold;">${product.price} Vnd</p>
                <div class="btn-group">
                    <a class="btn btn-primary" href="/products?action=detail&id=${product.id}">Xem chi tiết</a>
                    <a class="btn btn-success" href="/products?action=edit&id=${product.id}">Chỉnh sửa</a>
                    <!-- Thẻ checkbox dùng để kiểm tra hiển thị modal -->
                    <label for="delete-${loop.index}" class="btn btn-danger">Xóa</label>
                    <input type="checkbox" id="delete-${loop.index}" class="confirm-checkbox"/>
                    <div class="confirm-modal">
                        <div class="modal-content">
                            <p>Bạn có chắc chắn muốn xóa? ${product.name}</p>
                            <!-- Nút Xác nhận -->
                            <a href="http://localhost:8080/products?action=delete&id=${product.id}"
                               class="btn btn-danger">Xác nhận</a>
                            <!-- Nút Hủy -->
                            <label for="delete-${loop.index}" class="btn btn-secondary">Hủy</label>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>


<footer class="bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h5>Thông tin liên hệ</h5>
                <p>Email: support@mendover.com</p>
                <p>Hotline: 1800-123-456</p>
                <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP. HCM</p>
            </div>
            <div class="col-md-6">
                <h5>Theo dõi chúng tôi</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="#" class="text-white"><i class="fab fa-facebook-f"></i> Facebook</a>
                    </li>
                    <li>
                        <a href="#" class="text-white"><i class="fab fa-instagram"></i> Instagram</a>
                    </li>
                    <li>
                        <a href="#" class="text-white"><i class="fab fa-twitter"></i> Twitter</a>
                    </li>
                    <li>
                        <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i> LinkedIn</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="text-center mt-4">
            <p>&copy; 2024 Mendover. All rights reserved.</p>
        </div>
    </div>
</footer>
<script crossorigin="anonymous" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMt23cez/72nBOF0UJfR0e3cohA2xyhI7fLOZzz"
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

