create database demo_ss5;
use demo_ss5;

create table Products(
Id int primary key auto_increment,
productCode varchar(50),
productName varchar(50),
productPrice double,
productAmount int,
productDescription varchar(50),
productStatus varchar(50)
);
-- Chèn một số dữ liệu mẫu cho bảng Products.
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P005', 'Product 5', 180.00, 8, 'Description of Product 5', 'Available'),
('P006', 'Product 6', 90.00, 25, 'Description of Product 6', 'Out of Stock'),
('P007', 'Product 7', 210.00, 10, 'Description of Product 7', 'Available'),
('P008', 'Product 8', 75.00, 50, 'Description of Product 8', 'Available'),
('P009', 'Product 9', 320.00, 5, 'Description of Product 9', 'Out of Stock'),
('P010', 'Product 10', 400.00, 2, 'Description of Product 10', 'Available'),
('P011', 'Product 11', 110.00, 30, 'Description of Product 11', 'Available'),
('P012', 'Product 12', 50.00, 40, 'Description of Product 12', 'Out of Stock'),
('P013', 'Product 13', 275.00, 15, 'Description of Product 13', 'Available'),
('P014', 'Product 14', 330.00, 18, 'Description of Product 14', 'Out of Stock'),
('P015', 'Product 15', 125.00, 22, 'Description of Product 15', 'Available'),
('P016', 'Product 16', 500.00, 3, 'Description of Product 16', 'Available'),
('P017', 'Product 17', 95.00, 60, 'Description of Product 17', 'Available'),
('P018', 'Product 18', 450.00, 7, 'Description of Product 18', 'Out of Stock'),
('P019', 'Product 19', 145.00, 12, 'Description of Product 19', 'Available'),
('P020', 'Product 20', 300.00, 20, 'Description of Product 20', 'Available');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_productCode on Products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_productName_productPrice on Products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from Products where productName = 'Product 1';
explain select * from Products where productName = 'Product 1' and productPrice = 100.000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view productView as
select productCode, productName, productPrice, productStatus
from Products;

-- Tiến hành sửa đổi view
DROP VIEW IF EXISTS ProductView;
create view productView as
select productCode, productName, productPrice, productStatus
from Products;

-- Tiến hành xoá view
drop view if exists productView;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
create procedure GetAllProducts()
begin	
select * from Products
end
DELIMITER ;
-- Gọi Stored Procedure
CALL GetAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
create procedure AddProduct(
in p_code varchar(50),
in p_name varchar(50),
in p_price double,
in p_amount int,
in p_description text,
in p_status varchar(50)
)
begin
insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
value (p_code, p_name, p_price, p_amount, p_description, p_status)
end
DELIMITER ;
CALL AddProduct('P004', 'Product 4', 250.00, 5, 'Description of Product 4', 'Available');


