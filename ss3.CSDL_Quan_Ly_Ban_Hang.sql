create database ss3_Quan_ly_ban_hang;
use ss3_Quan_ly_ban_hang;

CREATE TABLE customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(50),
    cAge INT
);

CREATE TABLE orders (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME,
    oTotalPrice DOUBLE,
    FOREIGN KEY (cID) REFERENCES customer (cID) 
        
);

CREATE TABLE product (
    pID INT PRIMARY KEY,
    pName VARCHAR(50),
    pPrice DOUBLE
);

CREATE TABLE orderDetail (
    oID INT,
    pID INT,
    odQTY VARCHAR(50),
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID) REFERENCES orders (oID),
    FOREIGN KEY (pID) REFERENCES product (pID)
);

insert into Customer (cID, cName, cAge) values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

 insert into orders (oID, cID, oDate, oTotalPrice) values
    (1, 1, '2006-03-21', null),
    (2, 2, '2006-03-23', null),
    (3, 1, '2006-03-16', null);

insert into product (pID, pName, pPrice) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat',1),
(5, 'Bep Dien', 2);

insert into orderDetail (oID, pID, odQTY) VALUES
    (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oDate
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName as customerName, product.pName as productName
from customer
join orders on customer.cID = orders.cID
join orderdetail on orders.oID = orderdetail.oID
join product on orderdetail.pID = product.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName
from customer
where cID not in (select cID from orders);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT orders.oID, orders.oDate, SUM(OrderDetail.odQTY * Product.pPrice) AS TotalPrice
FROM orders
JOIN OrderDetail ON orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID
GROUP BY orders.oID, orders.oDate;

