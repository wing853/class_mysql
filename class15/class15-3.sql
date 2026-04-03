-- enrollment 테이블을 기준으로 student 와 subject 를 INNER JOIN 하여 아래 컴럼을 출력하는 SQL을 작성하세요.
-- 출력 컬럼: 학생이름([s.name]), 과목명(su.subject_name), 점수(e.score)

select * from student;
select * from subject;
select * from enrollment;

select 
	s.name as 학생이름,
    su.subject_name as 과목명,
    e.score as 점수
from enrollment e
inner join student s on e.student_id = s.student_id
inner join subject su on e.subject_id = su.subject_id;

-- 모든 학생을 조회하되 수강 기록이 없는 학생도 포함해서 출력하는 SQL을 작성하세요.
select 
	s.name          as 학생이름,
    su.subject_name as 과목명,
    e.score         as 점수
from student s
left join enrollment e on s.student_id = e.student_id
left join subject su on e.subject_id = su.subject_id;

-- shop DB 에서 아래 조건에 맞는 SQL을 작성하세요.
-- 조건: 주문한 회원만 조회. 회원명, 주문번호, 주문금액, 주문상태 출력
select * from orders;
select 
	m.name as 회원명,
    o.id as 주문번호,
    o.total_price as 주문금액,
    o.status as 주문상태
from member m
inner join orders o on m.id = o.member_id; 

-- shop DB 에서 주문이 없는 회원도 포함하여 모든 회원의 이름과 주문 정보를 조회하는 SQL을 작성하세요.
select 
	m.name as 회원명,
    o.id as 주문번호,
    o.total_price as 주문금액,
    o.status as 주문상태
from member m
left join orders o on m.id = o.member_id;

-- shop DB 에서 주문번호, 회원명, 상품명, 수량, 상품가격을 조회하는 SQL을 작성하세요.

select * from orders;
select * from product;

select 
	o.id as 주문번호,
    m.name as 회원명,
    p.name as 상품명,
    oi.quantity as 수량,
    oi.price as 상품가격
from order_item oi
inner join orders o on oi.order_id = o.id
inner join member m on o.member_id = m.id
inner join product p on oi.product_id = p.id;




