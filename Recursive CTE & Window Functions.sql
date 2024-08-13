-- Recursive CTE
with recursive even_no (n) as(
select 10 -- anchor
union all
select n + 2 from even_no where n <= 20) -- recursive part
select * from even_no;

with recursive odd_no(n) as (
select 5
union all
select n + 2 from odd_no where n <= 25)
select * from odd_no;

create database employee;
use employee;

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES emp(emp_id)
);

INSERT INTO emp (emp_id, emp_name, manager_id) VALUES
    (1, 'John Doe', NULL), -- Top-level employee
    (2, 'Alice Smith', 1), -- Employee managed by John Doe
    (3, 'Bob Johnson', 1), -- Employee managed by John Doe
    (4, 'Charlie Brown', 2), -- Employee managed by Alice Smith
    (5, 'Diana Williams', 2), -- Employee managed by Alice Smith
    (6, 'Eva Garcia', 3), -- Employee managed by Bob Johnson
    (7, 'Franklin Wang', 3); -- Employee managed by Bob Johnson
    
select * from emp;

with recursive emp_heirarchy as (
select emp_id, emp_name, manager_id, 0 as level from emp where manager_id is null
union all 
select e.emp_id, e.emp_name, e.manager_id, level + 1 from emp e join emp_heirarchy eh on e.manager_id = eh.emp_id)
select * from emp_heirarchy;

-- calculate the average rental duration for films and display both the individual average duration
-- for each film and the overall average duration.
use mavenmovies;
select * from film;

select film_id, title, rental_duration, rating, avg(rental_duration) over(), avg(rental_duration) over(partition by rating) from film;
-- gives the average of rental duration based on distinct ratings 

-- assign the ranks based on ratings along with rental_durations
with ranked as (select film_id, title, rental_duration, rating, rank() over(partition by rating order by rental_duration) as rankings, row_number() over() from film)
select rating ,count(distinct rankings) from ranked group by rating; 

select film_id, title, rental_duration, rating, rank() over(partition by rating order by rental_duration) as rankings, row_number() over() from film;

-- dense rank
select film_id, title, rental_duration, rating, dense_rank() over(partition by rating order by rental_duration) as rankings, row_number() over() from film;
