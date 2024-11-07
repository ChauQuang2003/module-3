create database ss3_CSDL_Quan_ly_sinh_vien;
use ss3_CSDL_Quan_ly_sinh_vien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
Select *
from Student 
where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from Class
where month(StartTime) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
Select *
from Subject
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student
set ClassID = 2
where StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select Student.StudentName, Subject.SubName, Mark.Mark
from Student
join Mark on Student.StudentID = Mark.StudentID
join Subject on Mark.SubID = Subject.SubID
order by Mark.Mark desc, Student.StudentName asc;
