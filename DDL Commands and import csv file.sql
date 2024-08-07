-- DDL - create - alter - truncate - drop 

create database pwskills; 

use pwskills;

create table pwStuds(
studentid int, -- column_name datatype
student_name char(50), -- char(size)
student_email varchar(100), -- variable character
short_description text, -- for unknown legth of text
grades decimal(3,2) -- for floating point 0.00 = (3,2)
);

select * from pwStuds; -- to view every data from table

describe pwstuds; -- to see schema

drop table pwstuds; -- to delete data and schema of table

drop database pwskills; -- to delete the data and schema of database

alter table pwstuds add weight float; -- to add new column to table

alter table pwstuds drop short_description; -- to delete column from table

alter table pwstuds modify weight int; -- to convert datatype of column

alter table pwstuds rename column weight to mass; -- to rename the column

alter table pwstuds add joining_date date;

insert into pwstuds(studentid, student_name, student_email, grades, mass, joining_date) values(1,"Praveen","praveentak715@gmail.com",8.4,120,"2022-02-10");

truncate pwstuds; -- delete the whole data of table

select * from studs;

drop table pwstuds;

create table teacher(
teacherid int,
teacher_name char(50),
primary key (teacherid)
);

create table pwStuds(
studentid int auto_increment(), -- column_name datatype
student_name char(50) not null, -- char(size)
student_email varchar(100) unique, -- variable character
short_description text, -- for unknown legth of text
joining_date date default('2022-05-14'), -- date.now() for current date
grades decimal(3,2), -- for floating point 0.00 = (3,2)
teacherid int,
primary key (studentid),
foreign key  (teacherid) references teacher(teacherid)
);

describe pwstuds;

-- DML - insert - delete - update

insert into teacher(teacherid) values (3); -- to get null value 

insert into teacher values (4,"Pratap"),(5,"sudhanshu"); -- multiple entry insertion

delete from teacher where teacherid = 5;

update teacher set teacher_name = "Nitin" where teacherid = 3;

select * from teacher;