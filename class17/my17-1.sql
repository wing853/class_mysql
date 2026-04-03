-- 성별이 여자이고 고용일(hire_date)이 1991년 이후인 직원을 날짜 순서대로 출력하세요.
select * from employees
where gender = 'F'
and hire_date >= '1991-01-01'
order by hire_date asc;

-- 직급이 'Senior Engineer' 이고 
-- 이름(first_name)이 'Ram' 으로 시작하고 현재 연봉이 100,000 이상인 직원의 [사번, 이름, 연봉, 직급]을 조회하세요.

select * from salaries;
select
	e.emp_no,
    e.first_name,
    s.salary,
    t.title
from employees e
join titles t on e.emp_no = t.emp_no and title = 'Senior Engineer'
join salaries s on e.emp_no = s.emp_no and s.salary >= 100000
where e.first_name LIke 'Ram%'
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01';


-- first_name 이 'S' 로 시작하고 직급이 'Senior Engineer' 이고 
-- 직급 종료일이 '1990-01-01' 이하인 직원의 [사번, 이름, 직급, 시작일, 종료일]을 조회하세요.

select * from titles;
select 
	e.emp_no,
    e.first_name,
    t.title,
    t.from_date,
    t.to_date
from employees e
join titles t on e.emp_no = t.emp_no 
and t.title = 'Senior Engineer'
and to_date <= '1990-01-01'
where e.first_name Like 'S%';

-- 1960년대에 태어난 여성 직원을 조회하세요. (BETWEEN 사용)
select * from employees
where birth_date between '1960-01-01' and '1960-12-31'
and gender = 'F'
order by birth_date;

-- 성(last_name)이 'J' 로 시작하는 직원의 [사번, 이름, 성, 현재 연봉]을 출력하세요.
select
	e.emp_no,
    e.first_name,
    e.last_name,
    s.salary
from employees e
join salaries s on e.emp_no = s.emp_no and to_date = '9999-01-01'
where last_name like 'J%';

-- 사원번호, 성별, 현재 연봉을 한글 컬럼명으로 출력하되 
-- 사원번호가 10020 이하인 직원만 사원번호 오름차순으로 출력하세요.

select
	e.emp_no as 사원번호,
    e.gender as 성별,
    s.salary as 현재연봉
from employees e
join salaries s on e.emp_no = s.emp_no and s.to_date = '9999-01-01'
where e.emp_no <= 10020;

-- 모든 현재 직원(dept_emp.to_date='9999-01-01')의 [사번, 이름, 부서명]을 조회하세요.
select 
	e.emp_no,
    e.first_name,
    d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no and to_date = '9999-01-01'
join departments d on d.dept_no = de.dept_no;



