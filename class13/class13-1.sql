use shop;

select * from member;
desc member;

create table member_address (
	id int primary key auto_increment,
    address varchar(200) not null,
    member_id bigint unique, -- UNIQUE 1:1설정
    foreign key (member_id) references member(id)
);

insert into member_address (address, member_id) values
('서울시 강남구 역삼동', 1),
('부산시 해운대구', 2);

select * from member_address;