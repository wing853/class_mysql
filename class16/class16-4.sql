--  member_id=2 인 회원이 product_id=3 인 상품을 2개 주문합니다.
--   (total_price = 상품가격 × 수량으로 계산)

--   1. orders 테이블에 주문 INSERT (status = '결제완료')
--   2. order_item 에 주문 상세 INSERT
--   3. product 의 stock 을 2 감소

--   모두 성공하면 COMMIT
select * from product;
select * from orders;
select * from order_item;

start transaction;
insert into orders(member_id, total_price, status)
values(2,2600000.00,'결제완료');

insert into order_item(order_id, product_id, quantity, price)
values (last_insert_id(),3,2,2600000.00);

update product
set stock = stock - 2
where id = 3; 

commit;
-- -------------------------------------------------
start transaction;
insert into orders(member_id, total_price, status)
values(2,2600000.00,'결제완료');

insert into order_item(order_id, product_id, quantity, price)
values (last_insert_id(),3,2,2600000.00);

update product
set stock = stock - 2
where id = 3; 

rollback;