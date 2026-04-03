select * from employees;
select * from dept_emp;
select * from titles;
select * from departments;


-- 현재 입사중인 사원의 사원번호, first_name, last_name, 성별, 부서, 직책을 
-- 부서별 부서별 오름차순으로 출력하시오

select
	e.emp_no as 사원번호,
    e.last_name as 성,
    e.first_name as 이름,
    e.gender as 성별,
    dep.dept_name as 부서,
    t.title as 직책
from employees e
inner join dept_emp demp on e.emp_no = demp.emp_no
inner join departments dep on demp.dept_no = dep.dept_no
inner join titles t on e.emp_no = t.emp_no 
where t.to_date = '9999-01-01'
order by dep.dept_no, e.emp_no;