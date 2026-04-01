create database checkout_book;
use checkout_book;

create table member(
	member_id int primary key auto_increment,
    name varchar(50),
    member_code int unique

);

create table book(
	book_id int primary key auto_increment,
    title varchar(100) not null,
    author varchar(50) not null,
    isbn varchar(100) not null unique,
    publish_at date
);

create table borrow(
	borrow_id int primary key auto_increment,
    member_id int not null,
    member_code int,
    book_id int not null,
    borrow_at timestamp default current_timestamp,
    foreign key (member_id) references member(member_id),
    foreign key (member_code) references member(member_code),
    foreign key (book_id) references book(book_id)
);

show tables;

select * from book;
select * from member;
select * from borrow;

insert into book(title, author, isbn, publish_at) values
('자바 기초', '김자바','123-123','2021-01-05'),
('Mysql 기초', '김디비','123-456','2021-02-05'),
('HTML 기초', '김웹','456-123','2022-04-05');

insert into member(name,member_code) values
('홍길동', 11111111),
('김개똥',22222222),
('이둘리',33333333);

insert into borrow(member_id, member_code, book_id) values
-- (1,11111111,1);
-- (2,22222222,1);
-- (1,11111111,2);
-- (3,33333333,3);
(2,22222222,3);

SHOW CREATE TABLE borrow;

ALTER TABLE borrow DROP FOREIGN KEY borrow_ibfk_3;

alter table borrow
add constraint fk_borrow_book_id
foreign key (book_id) references book(book_id)
on delete cascade
on update cascade;

-- 회원 정보 수정
update member
set member_code = 12345678
where member_id = 2;

-- 책반납 --> borrow delete
delete from borrow where borrow_id = 3;

-- 책이 훼손되어 책 대출이 불가능(기존책이 반납되었다 가정)
delete from book where book_id = 1;



