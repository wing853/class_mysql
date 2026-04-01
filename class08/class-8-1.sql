use school;

-- 특정 컬럼만 조화
select name, major From student;

-- Where 절 추가
select * from student where name = '김철수';

-- 별칭(as) 사용
select student_id as 학번, name as 이름 from student;

-- mysql에서도 역시 연산자를 사용할 수 있다.
select * from student where grade between 1 and 2;

select * from student where name in ('이영희','최지아','티모'); 

select * from student where name like '김%';
select * from student where major like '%학';
select * from student where major like '컴%';
select * from student where major like '컴%';



