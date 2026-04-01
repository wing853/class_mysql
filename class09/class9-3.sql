select * from product;
select * from product where product_id = 1;
update product
set price = 1100000
where product_id = 1;

-- -------------------------------
select * from product where category = '도서';
update product
set is_sale = true
where category = '도서';

-- ---------------------------
select * from product where product_id =6;
delete from product
where product_id = 6;

-- ----------------------------
INSERT INTO product (name, category, price, stock)
VALUES ('포스트졼 쓰레드 3', '논멀피터 ', 150000, 0);
select * from product where stock = 0;
delete from product
where stock = 0;

select * from product where category = '휴대폰';
UPDATE product
SET price = price * 0.9
where category = '휴대폰';