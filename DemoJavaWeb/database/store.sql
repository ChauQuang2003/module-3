create database StoreQuang;
use StoreQuang;

create table product(
                        id int not null  primary key auto_increment,
                        name varchar(60) not null ,
                        price double not null ,
                        quantity int not null default 0,
                        idCategory int ,
                        image VARCHAR(255),
                        description text,
                        foreign key (idCategory) references category(id)
);

create table category(
                         id int not null primary key auto_increment,
                         name varchar(60) not null
)

select * from category;



