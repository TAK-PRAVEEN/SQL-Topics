-- DDL - create - alter - truncate - drop 

create database pwskills; 

use pwskills;

create table pwStuds(
studentid int, -- column_name datatype
student_name char(50), -- char(size)
student_email varchar(100), -- variable character
short_description text, -- for unknown legth of text
grades decimal(3,2) -- for floating point 000.00 = (3,2)
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

