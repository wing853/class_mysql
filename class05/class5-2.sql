-- DML(데이터 다룬다)
select * from student;

-- 데이터 추가 (insert)
insert into student(student_id, name, grade, major, phone)
values (1001, '김철수', 2, '컴퓨터공학', '010-1234-5678');

-- 여러건 한번 에
insert into student(student_id, name, grade, major, phone) values
(1002, '이영희', 3, '경영학', '010-2345-6789'),
(1003, '박민준', 1, '전자공학', '010-3456-7890');

-- 데이터 조회(select)
select * from student;
select name,major from student;
-- 조건절 추가하기(where)
select name, major, grade from student where grade = 2;

-- 데이터 수정(update)
-- 주의! 조건절이 없으면 전체 수정 -> 비상!!!!!!
update student set grade = 3;

-- 데이터 삭제(delete)
-- -- 주의! 조건절이 없으면 전체 삭제 -> 비상!!!!!!
delete from student where student_id = 1003;
delete from student;
