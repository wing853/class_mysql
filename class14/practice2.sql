select * from employees;
select * from dept_emp where to_date = '1986-05-24';
select * 
from employees 
where emp_no in(select emp_no 
from dept_emp 
where to_date  = '1986-05-24');

select last_name, first_name from employees where birth_date = '1953-01-12';
insert into tb_employees(emp_no,birth_date, first_name, last_name, gender, hire_date)
values (1, '2000-10-10', 'kim', 'hong','M','2022-03-04');

select * from tb_employees where first_name = 'kim'; 

select * from employees
where emp_no in
(select emp_no from dept_emp where dept_no = 'd005');

select * from tb_employees where last_name = 'Warwick';
update tb_employees
set gender = 'F'
where last_name = 'Warwick';

select * from salaries where salary between 80000 and 80005;

desc departments;