use employees;
show tables;

desc employees;
desc salaries;
desc titles;
desc departments;
desc dept_emp;
desc dept_manager;
select * from salaries;
-- 현재 유효한 연봉 기준으로 연봉이 높은 순서대로 출력하세요. (emp_no, first_name, last_name, salary)
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    s.salary
from employees e
inner join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
order by s.salary desc;
-- JOIN후 where 필터를 사용 할 수 있음(사후 필터)

-- 사번, 이름(first_name), 성(last_name), 현재 직급(title), 현재 연봉(salary)을 한 화면에 보여주세요.
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no and t.to_date = '9999-01-01' 
join salaries s on e.emp_no = s.emp_no and s.to_date = '9999-01-01';

-- JOIN문법에서 ON절 뒤에 AND를 붙여 조인 조건과 필터를 한꺼번에 걸 수 있음(사전 필터)
-- (사전 필터), 인라인 필터
-- 공식명칭: 조인 조건

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no 
join salaries s on e.emp_no = s.emp_no
where t.to_date = '9999-01-01'
	and s.to_date ='9999-01-01';
    
-- INNER JOIN 에서는 사전 필터 결과 값과 사후 필터 결과 값 동일하다. 

-- LEFT JOIN 을 사용해서 현재 부서 관리자만 출력하세요.
-- 출력: 사번, 이름(first_name), 부서명, 시작일
select * from departments;
select * from employees;
select * from dept_manager;
-- 한 사원이 여러 부서의 관리가자 될 수 있다(드물지만), 
-- 한 부서에는 시간의 흐륾에 따라서 여러명의 사원이 거쳐 갈 수 있다. 
-- LEFT JOIN에서 사전 필터링 사용
select
	e.emp_no,
    e.first_name,
	d.dept_name,
	dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no and dm.to_date = '9999-01-01'
left join departments d on dm.dept_no = d.dept_no;

-- 사후 필터
select
	e.emp_no,
    e.first_name,
	d.dept_name,
	dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
left join departments d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01';

-- 아우터 조인을 사용할 때 (LEFT JOIN) 사후 필터로 적용을 하게 되면
-- LEFT JOIN에 의미가 없어지게 된다. 즉 INNER JOIN 사용한거와 같게된다.
-- 실무에서 90퍼센트 실수를 하는 부분이된다.

-- 즉, 아우터 필터를 적용할 때는 사후필터(X), 사전 필터로 사용해서 아우터 조인에 특성을 살린다.
