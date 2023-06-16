use northwind;

-- create view and drop
create or replace view some_name
as select * from products;
select * from some_name where product_name='Northwind Traders Potato Chips';
update some_name set supplier_ids='4' where product_name='Northwind Traders Potato Chips';
drop view some_name;


-- create tables
use employees;
select count(*) from saraly2;
create table saraly2 as (select * from salaries);
-- drop table and recreate it
truncate table saraly2;

-- drop table
drop table if exists saraly2;

-- create new table
use employees;

create table if not exists customers(
id integer primary key,
first_name varchar(100),
last_name varchar(100),
address varchar(100),
city varchar(10),
state varchar(10),
zip_code varchar(10) default 517507,
date_created timestamp,
date_updated timestamp not null default current_timestamp
);

insert into customers(id,first_name,last_name,zip_code,state,city,address)
 values(1,'dj','babu',517507,'ap','app','tpt');

select * from customers;
truncate table customers;
drop table customers;


-- auto increment // text,char,decimal(9,2)
create table if not exists customers1(
id integer primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
address varchar(100),
city varchar(10),
state varchar(10),
zip_code varchar(10),
constraint fk_abc foreign key (id) references customers(id)
);

insert into customers1 values(1,'gfdg','bagsdgdbu',51751407,'ap','app','tpt');
select * from customers1;
truncate table customers1;
drop table customers1;

-- drop foreign key const
alter table customers1 drop foreign key fk_abc;

-- add foreign key
alter table customers1 add foreign key fk_abc (id) references customers(id);

-- indexes and unique key
create table if not exists customers2(
id integer primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
address varchar(100),
city varchar(10),
state varchar(10),
zip_code varchar(10),
unique key unique_idx (first_name,last_name),
index last_name_idx (last_name ASC)
);

drop table customers2;



-- alter table
use employees;

-- add new column to the table
ALTER table customers add column middle_name integer;
select * from customers;
alter table customers drop column middle_name;

-- change the location of new column with new properties
alter table customers change column middle_name middle_name varchar(110) after first_name;
alter table customers modify middle_name integer after first_name;
ALTER table customers add column middle_name integer after first_name;



























