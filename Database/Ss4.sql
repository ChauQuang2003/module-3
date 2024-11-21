create database ss4_Cac_Ham_Thong_Dung_SQL;
use ss4_Cac_Ham_Thong_Dung_SQL;

CREATE TABLE Class(

         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          ClassName VARCHAR(60) NOT NULL,

          StartDate DATETIME NOT NULL,

          Status BIT

);

CREATE TABLE Student(

          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          StudentName VARCHAR(30) NOT NULL,

          Address VARCHAR(50),

          Phone VARCHAR(20),

          Status BIT,

          ClassId INT NOT NULL,

          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)

);

CREATE TABLE Subject(

         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         SubName VARCHAR(30) NOT NULL,

         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         Status BIT DEFAULT 1

);

CREATE TABLE Mark(

        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        SubId INT NOT NULL,

        StudentId INT NOT NULL,

        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),

        ExamTimes TINYINT DEFAULT 1,

        UNIQUE (SubId, StudentId),

        FOREIGN KEY (SubId) REFERENCES Subject (SubId),

        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

 );

INSERT INTO Class (ClassName, StartDate, Status) VALUES
('Computer Science', '2024-09-01 08:00:00', 1),
('Mathematics', '2024-09-15 08:00:00', 1),
('Physics', '2024-12-01 08:00:00', 1),
('Chemistry', '2024-12-15 08:00:00', 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId) VALUES
('Hieu', '123 Main St', '0123456789', 1, 1),
('Hung', '456 Elm St', '0987654321', 1, 1),
('Hoa', '789 Maple St', '0129876543', 1, 2),
('Hanh', '321 Oak St', '0901234567', 1, 3);

INSERT INTO Subject (SubName, Credit, Status) VALUES
('Mathematics', 4, 1),
('Computer Programming', 3, 1),
('Physics', 5, 1),
('Chemistry', 3, 0);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes) VALUES
(1, 1, 85.5, 1),
(2, 1, 92.0, 1),
(3, 2, 78.0, 1),
(1, 3, 66.5, 1),
(2, 3, 88.0, 2),
(3, 4, 54.0, 1),
(4, 2, 71.5, 1);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from Subject


-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
