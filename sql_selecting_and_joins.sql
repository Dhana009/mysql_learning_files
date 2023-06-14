-- review tab
#selecting data from a table
#group by methods
#joins 
#insert data 
#update data
#delete data
#sql transactions

-- first create an instance of schema
use employees;

-- shows all the tables in the schema
show tables;

-- tells the count of the total table
select count(*) from departments;

-- selects all the columns in the table given
select * from dept_emp;

-- select specific columns by giving the specific column names from the specific table
select emp_no,dept_no from dept_emp;

-- selecting specific column names with custom name made by us using as
select emp_no as 'EMP_NO',dept_no from dept_emp;

-- concatnating the two columns and using custom name from the table
select first_name,last_name, concat(first_name,' ', last_name) as 'Fullname' from employees;

-- selecting a column and doing math operations on it using custom names from the table
select salary from salaries;
select salary,
salary * 0.01 as 'weekly' ,
salary * 0.01*4 as 'monthly',
salary * 0.01*52 as 'yearly' from salaries;

-- date formating the date column from the table
select * from salaries;
select from_date as original, 
date_format(from_date, "%M %d,%Y") as version1,
date_format(from_date, "%M %D,%Y") as version2,
date_format(from_date, "%m-%d-%y") as version3
 from salaries;

-- selecting the indexs from left and right
select right('dhanunjaya',1);
select left('dhanunjaya',1);

-- using the left and right with concat 
select * from employees;
select first_name, last_name, concat(left(first_name,1),left(last_name,1)) as initials 
from employees;

-- selecting the table based on the specific condition : equal to
select * from employees where first_name = 'Parto';

-- selecting the table based on the specific condition : not equal to
select * from employees where first_name != 'Parto';
select * from employees where first_name <> 'Parto';

-- selecting the table based on the specific condition : checking the variable present in that column or not
select * from employees where first_name in ('Parto','Chirstian','Mary');

-- selecting the table based on the specific condition : first condition or second condition (<> = not equal to)
select * from employees where first_name ='Parto' and last_name = 'Wrigley' or 
first_name <>'Parto' and last_name = 'Wrigley';

-- selecting the table based on the specific condition : counts the total columns that safity the both conditions
select count(*) from employees where first_name ='Parto' and last_name = 'Wrigley' 
or 
first_name <>'Parto' and last_name = 'Wrigley';

-- selecting the table based on the specific condition : checks the conditions and select the table (not in//!=)
select * from employees where first_name in ('Parto','Chirstian','Mary')
and last_name not in ('Hideyuki');

-- selecting the table based on the specific condition : by using % before and after like the last letter is x
select * from employees where first_name like 'Mar%' and last_name like '%ly';
select * from employees where first_name like 'Mar%' and last_name not like '%ly';

-- selecting the table based on the specific condition : applying the order by for specific column by order desc or asc
select * from employees order by first_name desc;

-- selecting the table based on the specific condition : applying the limit method on the column to limit the output
select * from employees order by first_name limit 10;
select * from employees order by first_name limit 10,20;

-- checking the null values in the table // check this once
select * from titles;
select * from titles where to_date is null;
select * from information_schema.PLUGINS WHERE PLUGIN_LIBRARY IS NOT NULL;

-- selecting the table based on the specific condition : checking the values in a range
select * from salaries;
select * from salaries where salary >= 60117 and salary <= 70000;
select * from salaries where salary between 60117 and 70000;

-- selecting the table based on the specific condition : checking the values not in a range
select * from salaries where salary not between 60117 and 70000;
select * from salaries where salary < 60117 or salary > 70000;

-- checking the count of the columns in the table
select count(*) from salaries where salary >= 60117 and salary <= 70000;
select count(*) from salaries where salary between 60117 and 70000;

-- selecting the table based on the specific condition : order by and applying the limit
select * from employees order by first_name;
select * from employees where first_name = 'Aamer' order by last_name desc,hire_date;
select * from employees order by hire_date limit 10,100;

-- selecting the table based on the specific condition : selecting the distinct values in the table
select distinct first_name from employees;
select count(distinct first_name) from employees;
select distinct first_name from employees where first_name like 'E%';

-- selecting the table based on the specific condition : applying the subcondition in another condition
select * from employees where first_name in 
(select distinct first_name from employees where first_name like 'E%');

-- selecting the table based on the specific condition : grouping the table based on specific column
select first_name, count(*) from employees group by first_name; 
select birth_date, count(*) from employees group by birth_date; 
select birth_date, count(*) as count from employees group by birth_date order by count desc; 

-- selecting the table based on the specific condition : grouping the table based on specific column with a condition greater than 250
select first_name, count(*) count from employees group by first_name having count>250 order by count; 

-- selecting the table based on the specific condition : using the agg functions on the table
select * from salaries;
SELECT 
    DATE_FORMAT(from_date, '%Y') AS year,
    SUM(salary),
    MIN(salary) AS mins,
    MAX(salary) AS maxs,
    avg(salary) as avgs
FROM
    salaries
GROUP BY year;

-- selecting the table based on the specific condition : selecting data from one table based on the other table.
select * from salaries;
select * from dept_manager;
select distinct(emp_no) from dept_manager;
select * from salaries where emp_no not in (select distinct(emp_no) from dept_manager);

-- both are methods do the same action and  performance
select * from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no;
select * from employees join dept_manager on employees.emp_no = dept_manager.emp_no;

-- joining three tables based on the common column in these tables
select dept_name,employees.emp_no,first_name,last_name from employees join dept_manager on
 employees.emp_no = dept_manager.emp_no 
join departments on dept_manager.dept_no = departments.dept_no 
order by dept_name,last_name;

-- joining three tables based on the common column in these tables with specific conditions
select dept_name,employees.emp_no,first_name,last_name from employees join dept_manager on
 employees.emp_no = dept_manager.emp_no 
join departments on dept_manager.dept_no = departments.dept_no 
where dept_manager.to_date = '9999-01-01' and employees.gender = 'F'
order by dept_name,last_name;

select * from dept_emp;
select * from departments;
select * from employees;
select * from dept_manager;
select * from titles;

select dept_emp.dept_no,dept_name as title,first_name,last_name from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no 
where departments.dept_name = 'Development' or dept_emp.dept_no = 'd005'
order by title, last_name;

-- using the natural join here with a custom column added emp_type
select dept_no,dept_name,first_name,last_name, 'dell' as emp_type from dept_emp
natural join departments
natural join employees 
natural join titles
where departments.dept_name = 'Development';

-- joining all the same columns in the different tables
SELECT 
    dept_name, first_name, last_name,title , 'call' as emp_type
FROM
    employees AS emp,
    dept_emp AS de,
    departments AS dept,
    titles AS t
WHERE
    emp.emp_no = de.emp_no
        AND de.dept_no = dept.dept_no
        AND t.emp_no = emp.emp_no
        AND de.to_date = '9999-01-01'
        AND t.to_date = '9999-01-01'
ORDER BY dept_name,last_name;

-- using the union method to join the two tables.
select dept_no,dept_name,first_name,last_name, 'dell' as emp_type from dept_emp
natural join departments
natural join employees 
natural join titles
where departments.dept_name = 'Development'

union

SELECT 
    dept_name, first_name, last_name,title , 'call' as emp_type
FROM
    employees AS emp,
    dept_emp AS de,
    departments AS dept,
    titles AS t
WHERE
    emp.emp_no = de.emp_no
        AND de.dept_no = dept.dept_no
        AND t.emp_no = emp.emp_no
        AND de.to_date = '9999-01-01'
        AND t.to_date = '9999-01-01'
ORDER BY dept_name,last_name;


-- selecting the data for filtering from two tables
select * from employees where emp_no not in (select emp_no from dept_manager);

-- using the left join to join the tables
select * from employees emp left join dept_manager dm on emp.emp_no = dm.emp_no;
select emp.emp_no, dm.emp_no, first_name, last_name from employees emp left join dept_manager dm on emp.emp_no = dm.emp_no;
select emp.emp_no, dm.emp_no, first_name, last_name from employees emp left join dept_manager dm on emp.emp_no = dm.emp_no where dm.emp_no is not null;
SELECT emp.emp_no,first_name, last_name,to_date FROM employees emp LEFT JOIN titles t ON emp.emp_no = t.emp_no and to_date='9999-01-01' where t.emp_no is not null;

-- selecting using the not in 
select * from employees where emp_no not in (select to_date from titles where to_date='9999-01-01');
select * from employees where emp_no not in (select emp_no from dept_manager);

































