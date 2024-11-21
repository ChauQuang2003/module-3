create database Ss1;
use Ss1;
 
CREATE TABLE class (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

SELECT 
    *
FROM
    Class,
    Teacher