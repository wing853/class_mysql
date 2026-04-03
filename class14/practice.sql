select * from tb_employees;
select * from employees;
select * from tb_dept_emp;
select * from dept_manager;
select * from titles;

select * from employees
where emp_no in (
	select emp_no 
    from titles
    where title like '%Senior%'
);

select * from titles
where title in ('Senior Engineer','Staff')
and from_date >= '2000-01-01'
and to_date != '9999-01-01';

select * from employees
where last_name = 'Simmel'
order by emp_no desc
limit 20;

select * from tb_salaries
where is_delete = 1;

update tb_salaries
set salary = salary + 5000
where to_date = '9999-01-01'
and from_date <  '2001-08-28';

select * from salaries
where from_date >= '1990-01-01'
or salary >= 60000;