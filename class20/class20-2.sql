-- 1단계: DISTINCT 개념 확인

-- 데이터 확인
select * from student;
select * from book;
select * from borrow;
select * from review;

-- 문제 1: 학생들 중 책을 한번이라도 빌린 학생의 학번과 이름을 출력
select
	s.id,
    s.name
from student s
join borrow b on s.id = b.student_id;

-- 명단에 중복을 없애 주세요
-- DISTINCT로 중복을 제거할 수 있다.
select
	distinct s.id,
    s.name
from student s
join borrow b on s.id = b.student_id;

-- 문제2: 리뷰가 등록된 책 이름만 알고싶다.
select 
	b.title
from book b
join review r on b.id = r.book_id;

select 
	distinct b.title
from book b
join review r on b.id = r.book_id;