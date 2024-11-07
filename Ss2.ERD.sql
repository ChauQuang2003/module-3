create database Ss2;
use Ss2;

create table PHIEUXUAT (
    SoPX int primary key,
    NgayXuat datetime
);

create table VATTU (
    MaVTU int primary key,
    TenVTU varchar(50),
    DGNhap double,
    SLNhap int
);

create table PHIEUNHAP (
    SoPN int primary key,
    NgayNhap datetime
);

create table NHACC (
    MaNCC varchar(50) primary key,
    TenNCC varchar(50),
    DiaChi varchar(50),
    SDT varchar(50) 
);

create table DONDH (
    SoDH int primary key,
    NgayDH datetime,
    MaNCC_Id varchar(50),
    foreign key (MaNCC_Id) references NHACC(MaNCC)
);

create table CHITIETPHIEUXUAT (
    SoPX_Id int,
    MaVTU_Id int,
    DGXuat double,
    SLXuat int,
    foreign key (SoPX_Id) references PHIEUXUAT(SoPX),
    foreign key (MaVTU_Id) references VATTU(MaVTU)  
);

create table CHITIETPHIEUNHAP (
    MaVTU_Id int,
    SoPN_Id int,
    DGNhap double,
    SLNhap int,
    foreign key (SoPN_Id) references PHIEUNHAP(SoPN),
    foreign key (MaVTU_Id) references VATTU(MaVTU) 
);

create table CHITIETDONHANG (
    MaVTU_Id int,
    SoDH_Id int,
    foreign key (SoDH_Id) references DONDH(SoDH),
    foreign key (MaVTU_Id) references VATTU(MaVTU)  
);
