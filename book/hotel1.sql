create database hotel;
use hotel;

create table review(
	review_id int primary key auto_increment,
    user_id int,
    review_star int not null,
    review_body text,
    
    foreign key (user_id) references user(user_id)
);

create table reserve_room(
	room_number int primary key,
    is_reserve boolean default false
);