<%--
  Created by IntelliJ IDEA.
  User: chauq
  Date: 12/4/2024
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Nhập Sang Trọng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Form Đăng Nhập</h2>
        <form>
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" placeholder="Tên đăng nhập">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" class="form-control" placeholder="Tên đăng nhập">
            </div>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Nhớ mật khẩu</label>
                </div>
                <a href="#" class="text-white">Quên mật khẩu?</a>
            </div>
            <button type="submit" class="btn btn-primary w-100">Đăng Nhập</button>
        </form>
        <div class="social-buttons">
            <button class="btn btn-secondary w-100 mt-3">Đăng Ký</button>
        </div>
        <div class="social-buttons d-flex justify-content-between mt-3">
            <button class="btn btn-primary"><i class="fab fa-facebook-f"></i> Facebook</button>
            <button class="btn btn-danger"><i class="fab fa-google"></i> Google</button>
        </div>
    </div>
</div>
</body>
</html>
