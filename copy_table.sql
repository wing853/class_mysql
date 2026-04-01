-- 테이블 복사

-- 구조만 복사
create table tb_salaries
as select * from salaries;
alter table tb_dept_emp add column is_fire boolean default false;

select * from tb_salaries;
alter table tb_salaries add column is_delete boolean default false;

