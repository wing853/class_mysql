-- 데이터 확인
select * from student;
select * from book;
select * from borrow;
select * from review;

-- 3. 각 도서별 대출 통계(그룹바이 사용)

-- 자바 기초라는 책이 몇 번 대출 되었을까?(각 책에 대한 대출 횟수, 대출 학생 수)
-- 예) 자바 기초 책에 대한 총 대출횟수, 대출학생 수
-- 예) SQL 완전정복 책에 대한 총 대출횟수, 대출학생 수
-- 예) 파이썬 입문 책에 대한 총 대출횟수, 대출학생 수
select 
	b.title as 도서명,
    br.book_id as '대출 테이블의 book_id',
    b.id as '책 테이블의 아이디'
from book b
left join borrow br on b.id = br.book_id;

-- 추가적인 집계함수 사용해보기. 총 대출 횟수, 총 대출 학생수
select 
	b.title as 도서명,
    count(br.student_id) as '총 대출 횟수',
    count(distinct br.student_id) as '대출 학생수'
from book b
left join borrow br on b.id = br.book_id
group by b.id, b.title;

-- 김철수 학생이 자바 기초 이전에 대출 이력이 있지만 한번 더 대출한 경우
insert into borrow(student_id,book_id) values(1,1);

delete from borrow where id = 8;

-- 행별로 중복을 제거 하고 싶다면 DISTINCT를 사용하면 된다
-- 집계 함수 COUNT 경우 중복된 값을 카운트에 제거하고 싶다면 DISTINCT를 사용한다
