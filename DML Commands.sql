use pwskills;

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

-- DQL - select

select * from teacher; -- * means all the data

select teacher_name from teacher;

-- operations - from - join - where - group by - having - select - order by - limit

