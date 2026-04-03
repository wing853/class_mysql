-- 2단계. COUNT와 COUNT(DISTINCT)

-- 데이터 확인
select * from student;
select * from book;
select * from borrow;
select * from review;

-- 문제 1. 전체 대출 정보를 출력(학생아이디, 학생이름, 책아이디, 책이름)
select
	s.id as 학생아이디,
    s.name as 학생이름,
    b.id as 책아이디,
    b.title as 책이름
from student s
join borrow br on s.id = br.student_id
join book b on br.book_id = b.id
order by s.name asc; 

-- 전체 대출이 일어난 횟수 알려주세요
select count(*) as 총대출횟수 from borrow;

-- 대출한 학생수만 확인(한 학생이 여러번 대출 가능하다)
select count(distinct student_id) as 대출학생수 from borrow;

-- distinct는 문법적으로 select 절 바로 앞에만 사용할 수 있다
-- 단, count 함수 안에 distinct를 사용할 수 있다(뭉쳐진 바구니 않에 중복된 데이터를 제거하고 카운트)

-- 대출 테이블에서 총대출횟수, 대출 학생수를 각각 출력
select 
	count(*) as 총대출횟수,
	count(distinct student_id) as 대출학생수
from borrow;
