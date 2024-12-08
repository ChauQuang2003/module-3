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
    <link href="/css/home.css" rel="stylesheet">
</head>
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
<!-- Hero Section -->
<div class="hero-section">
    <img alt="Living room with modern furniture and large windows" height="100%"
         src="https://storage.googleapis.com/a1aa/image/m0sbgnrGezUbW6xCoscdhrfsLMXP7nNpuaYHq2EMltlmwW4TA.jpg"
         width="100%"/>
    <div class="hero-text">
        <h2>Value of the Day</h2>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <c:forEach items="${products}" var="product">
                <div class="product-card">
                    <div class="discount">
                    </div>
                    <img alt="Căn hộ 3PN ở Pearl Plaza" height="300"
                         src="${product.image}"
                         width="400"/>
                    <h5>
                            ${product.name}
                    </h5>
                    <p class="description">
                        ${product.description}
                    </p>
                    <p class="price">
                    </p>
                    <p class="price" style="font-size: 18px; color: #d9534f; font-weight: bold;">
                            ${product.price} Vnd
                    </p>
                    <div class="btn-group">
                        <a class="btn btn-primary" href="#">
                            Xem chi tiết
                        </a>
                        <a class="btn btn-success" href="/products?action=edit&id=${product.id}">
                            Chỉnh sửa
                        </a>
                        <a href="/products?action=delete&id=${product.id}">
                            <button class="btn btn-danger" onclick="confirmDelete()">
                                Xóa
                            </button>
                        </a>
                        <div class="confirm-modal" style="display: none">
                            <div class="modal-content">
                                <p>Bạn có chắc chắn muốn xóa?</p>
                                <a href="http://localhost:8080/home?path=delete&id=${product.id}"
                                   class="btn btn-danger">Xác nhận</a>
                                <label for="delete-${loop.index}" class="btn btn-secondary">Hủy</label>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
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

<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Home</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"--%>
<%--            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"--%>
<%--            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <link href="../css/home.css" type="text/css" rel="stylesheet">--%>

<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-12">--%>
<%--            <nav class="navbar navbar-expand-lg nav-bg">--%>
<%--                <a class="navbar-brand color-white" href="http://localhost:8080/products?action=home">Logo</a>--%>
<%--                <button class="navbar-toggler" type="button" data-toggle="collapse"--%>
<%--                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>

<%--                <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--                    <ul class="navbar-nav mr-auto">--%>
<%--                        <li class="nav-item active">--%>
<%--                            <a class="nav-link color-white" href="http://localhost:8080/products?action=create">Create Product <span--%>
<%--                                    class="sr-only">(current)</span></a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <form class="form-inline my-2 my-lg-0">--%>
<%--                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--        <div class="col-12 mt-5">--%>
<%--            <table class="table">--%>
<%--                <thead>--%>
<%--                <tr class="nav-bg color-white">--%>
<%--                    <th scope="col">ID</th>--%>
<%--                    <th scope="col">Name</th>--%>
<%--                    <th scope="col">Price</th>--%>
<%--                    <th scope="col">Category</th>--%>
<%--                    <th scope="col" colspan="2" style="padding-left: 10%">Action</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <c:forEach items="${products}" var="product">--%>
<%--                    <tr>--%>
<%--                        <th scope="row">${product.id}</th>--%>
<%--                        <td>${product.name}</td>--%>
<%--                        <td>${product.price}</td>--%>
<%--                        <td>${product.category.name}</td>--%>
<%--                        <td><a href="" class="btn btn-outline-danger">Xóa</a></td>--%>
<%--                        <td><a href="" class="btn btn-outline-warning">Sửa</a></td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>

<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
