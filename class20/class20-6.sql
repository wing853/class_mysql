use shop;

-- 1페이지 5건 보여줌
select * from product order by id limit 5 offset 0;

-- 2페이지에 5건을 또 보여줘야함
select * from product order by id limit 5 offset 5;

-- 3페이지에 5건을 또 보여줘야함
select * from product order by id limit 5 offset 10;