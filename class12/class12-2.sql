select * from product where price between 100000 and 1500000;

select * from product where name Like '%삼성%';

select * from member where grade in ('VIP', 'GOLD');

select * from product
order by price desc
limit 3;

select * from product 
where is_deleted = false
and stock >=30
and price <50000;

 -- 전자제품 카테고리(category_id = 1) 중 재고가 30개 미만인 상품의 재고를 일괄 10개씩 늘려주세요. (UPDATE 전후 SELECT 확인 포함)
 select * from product;
 update product
 set stock = stock - 10
 where category_id = 1
 and stock < 30;
 
 -- '결제대기' 상태인 주문을 모두 '결제완료' 로 변경하세요. (id 지정 없이 상태값 조건만 사용)
 select * from orders;
 update orders
 set status = '결제완료'
 where status = '결제대기';
 
 -- 이메일이 '[hong@test.com]' 또는 
 -- '[lee@test.com]' 인 회원 등급을 'GOLD' 로 변경하세요. (IN 사용)
 select * from member;
 update member
 set grade = 'GOLD'
 where email in('hong@test.com','lee@test.com');
 
 -- 재고가 0 이고 아직 삭제되지 않은 상품을 소프트 삭제 처리하세요.
 select * from product;
 update product
 set is_deleted = true
 where is_deleted = false
 and stock = 0;
 
 
 -- 도서 카테고리(category_id = 4) 상품 중 가격이 4만원 이상인 것을 소프트 삭제 처리한 뒤, 
 -- 삭제되지 않은 도서 목록을 확인하세요.
 select * from product where category_id = 4; 
 update product
 set is_deleted = 1
 where category_id = 4
 and price >= 40000;
 select * from product 
 where category_id = 4
 and is_deleted = false;