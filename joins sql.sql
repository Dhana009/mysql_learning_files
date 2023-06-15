-- join or inner join // matches the common records from the two tables

-- left or right join // inner join + left table // inner join + right table

-- natural join // first looks for the inner join if not then it looks for the cross join

-- cross join // it matches the each row in the left table to all rows in the right table

-- self join // it matches the records in the same table if any relation is present b/w the tables.

-- union // it needs the same columns in both of the table

-- union all // same function but allows the duplicates.


use sakila;
show tables;
select * from actor ;
select * from customer;
select * from film ;
select * from staff;

select count(*) from rental;
select * from rental r cross join staff s on r.staff_id = s.staff_id where first_name='Jon' and inventory_id = 3979;

select a.first_name,a.last_name from actor a union all select c.first_name,c.last_name from customer c;
select * from customer;
select * from film ;













