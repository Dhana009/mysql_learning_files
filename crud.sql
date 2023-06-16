use employees;

-- insert data into the table
insert into departments (dept_no, dept_name) values ('d998','awesome testing');
select * from departments;

-- inserting data with sub select
insert into departments select max(dept_no)+1,'' from departments;
select * from departments;

-- creating new employee and joining the table
select * from employees;
select * from titles;
select * from departments;
insert into employees select max(emp_no)+1, '1953-10-02', 'dj', 'babu', 'M', '1987-06-26' from employees;
select * from employees where first_name = 'dj';
insert into titles (emp_no, title, from_date, to_date) values ('500000', 'Seniorr Engineer', '1986-08-26', '9998-01-01') ;
select d.first_name,d.emp_no,d.birth_date,t.emp_no,t.title from employees d join titles t on d.emp_no=t.emp_no where first_name = 'dj';

-- updating the employees table and salary table
select * from salaries;
select * from employees where first_name = 'dj';
update employees set first_name = 'dhanunjaya',gender='M' where emp_no = '500000'; 
select * from employees where first_name = 'dhanunjaya';
insert into salaries (emp_no,salary,from_date,to_date) values ('500000', '601417', '1986-06-26', '1987-06-26');
select * from salaries where emp_no = '500000';
select e.first_name,e.emp_no,s.salary from employees e join salaries s on e.emp_no=s.emp_no where first_name = 'dhanunjaya'; 

update salaries set salary='62632',from_date='1987-12-12',to_date='1988-12-12' where emp_no = '500000';

-- drop database
-- drop database employees;

-- delete the records from the table
select * from salaries where emp_no = '500000';
select * from employees;
-- delete from employees where emp_no='10001';
select * from employees where emp_no='10001';


-- crud
select * from salaries where emp_no = '500002';
insert into employees values ('500002', '1953-1-05', 'dk', 'bakbu', 'F', '1941-06-06');
insert into salaries values('500002','56145','1989-12-12','1990-12-12');
update salaries set salary='525252' where emp_no='500002';
delete from employees where emp_no='500002';

-- acid
-- atomicity
-- consistency
-- isolated
-- durable
-- transaction
-- commit
-- rollback
-- save point
-- autocommit


select * from employees;
begin;
insert into employees values ('500002', '1953-1-05', 'dk', 'bakbu', 'F', '1941-06-06');
insert into salaries values('500002','56145','1989-12-12','1990-12-12');
select * from salaries where emp_no = '500002';

commit;

update salaries set salary='525252' where emp_no='500002';
delete from salaries where emp_no='500002';
delete from employees where emp_no='500002';

rollback;
set autocommit=0;


-- north wind dataset
use northwind;
select * from employees;
select cust.first_name as 'firstname', cust.last_name as 'lastname',
ord.ship_address as 'street' , ord.ship_city as 'city',shippers.company,
date_format(ord.order_date, '%m %D %Y') as 'order date' , products.product_code as 'product code',
products.product_name as 'product name',
format(ord_det.quantity,0) as 'qty ordered',format(products.standard_cost,2) as 'cost',
format(ord_det.quantity * products.standard_cost, 2) as 'total cost'
from orders as ord join order_details as ord_det
on ord.id=ord_det.id join customers as cust
on ord.customer_id=cust.id join shippers
on shippers.id=ord.shipper_id join products
on ord_det.product_id = products.id;

select * from order_details;
select * from customers;
select * from shippers;
select * from products;
select * from orders;

-- create sales report by year - month by state
-- shoe total revenue - list price * order quantity
-- limit to order lines invoiced

select date_format(order_date, '%Y - %m') as 'sales month'
,concat("$ " , format(sum(odt.quantity * products.list_price),2)) as total,
ord.ship_state_province as 'state'
from orders as ord
 join order_details odt on ord.id=odt.order_id
join products on odt.product_id=products.id where odt.status_id='2'
group by date_format(order_date, '%Y - %m'), ord.ship_state_province;



-- ass
select date_format(ord.order_date, '%Y - %m') as 'order date',
p.product_code as 'product code',
sum(quantity* p.list_price) as 'sales', 
sum(odt.quantity * p.standard_cost) as 'cost',
sum((p.list_price - p.standard_cost) * odt.quantity) as 'profit'
from orders as ord, order_details as odt, products as p 
where
ord.id = odt.order_id
and odt.product_id = p.id
group by date_format(ord.order_date, '%Y - %m'), p.product_code;






















