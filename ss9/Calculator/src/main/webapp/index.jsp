<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Discount Calculation Result</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/display-discount" method="post">
    <input type="text" name="description" placeholder="Mô tả của sản phẩm" required>
    <input type="text" name="price" placeholder="Giá niêm yết của sản phẩm" required>
    <input type="text" name="percent" placeholder="Tỷ lệ chiết khấu (phần trăm)" required>
    <button type="submit" name="submit">Submit</button>
</form>
</body>
</html>