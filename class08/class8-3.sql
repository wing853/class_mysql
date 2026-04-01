select *
from employee
Where dept = '개발팀';

select name as '이름', dept as '부서', salary as '봉급'
from employee
Where salary >= 3500000;

select name as '이름', position as '직책', salary as '봉급'
from employee
where position in ('시니어', '미드레벨');

select *
from employee
where is_active = true
and salary between 3000000 and  4500000;

select *
from employee
where name like '김%'
or dept like '%팀';

