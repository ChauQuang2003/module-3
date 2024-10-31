create database Ss1;
use Ss1;
 
create table class (
id int primary key,
name varchar(50)
);

create table teacher (
id int primary key,
name varchar(50),
age int,
country varchar(50)
);

select *
from Class, Teacher