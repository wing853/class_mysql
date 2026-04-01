-- 실습용 DB 생성
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 도서 테이블
CREATE TABLE book (
    book_id    INT          PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100) NOT NULL,
    author     VARCHAR(50)  NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    stock      INT          DEFAULT 0,
    published_at DATE,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP
);

-- 회원 테이블
CREATE TABLE customer (
    customer_id INT          PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    phone       VARCHAR(20),
    grade       VARCHAR(10)  DEFAULT '일반'
);

-- 구매 테이블
CREATE TABLE purchase (
    purchase_id  INT  PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT  NOT NULL,
    book_id      INT  NOT NULL,
    quantity     INT  NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    purchased_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id)     REFERENCES book(book_id)
);


-- -------------------------------------
select * from book;
insert into book (title, author, price, stock, published_at) 
values ('자바 완전정복', '김자바', 32000, 50,'2023-06-15');

insert into book(title, author, price) values
('MySQL 입문','이디비',28000),
('스프링부트 실전','박스프링',35000),
('파이썬 기초','최파이',25000);

select * from customer;
insert into customer(name,email) values
('홍길동', 'hong@test.com'),
('김영희', 'kim@test.com');

select * from purchase;
insert into purchase(customer_id, book_id, quantity,total_price)
values (1,1,2, 64000);

INSERT INTO purchase (customer_id, book_id, quantity, total_price)
VALUES (2, 1, 1, 32000.00);















