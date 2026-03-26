-- 연습용 DB 생성
create database mydb;
use mydb;

-- 학생, 과목, 수강 테이블을 만들고 직접 샘플값을 넣어보기
create table student(
	student_id int primary key,
    name varchar(50) not null,
    grade int not null,
    phone varchar(50),
    address varchar(100)
);

create table subject(
	subject_id int primary key,
    subject_name varchar(50) not null,
    professor varchar(50) not null,
	credit int not null
);

create table enrollment(
	enrollment_id int primary key,
    student_id int not null,
    subject_id int not null,
    score      decimal(5,2),
    grade_score varchar(10),
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subject(subject_id)
    
); 

select * from student;
select * from subject;
select * from enrollment;

insert into student(student_id, name, grade, phone, address) values
(1, '김민수', 1, '010-1234-5678', '부산광역시 해운대구'),
(2, '이서연', 2, '010-2345-6789', '서울특별시 강남구'),
(3, '박지훈', 3, '010-3456-7890', '대구광역시 수성구'),
(4, '최유진', 4, '010-4567-8901', '인천광역시 연수구'),
(5, '정다은', 1, '010-5678-9012', '광주광역시 북구'),
(6, '한지민', 2, '010-6789-0123', '대전광역시 유성구'),
(7, '오준호', 3, '010-7890-1234', '울산광역시 남구'),
(8, '윤채원', 4, '010-8901-2345', '경기도 성남시'),
(9, '장현우', 2, '010-9012-3456', '강원도 춘천시'),
(10, '임수정', 3, '010-0123-4567', '제주특별자치도 제주시');

insert into subject(subject_id, subject_name, professor, credit) values
(1, '데이터베이스', '김교수', 3),
(2, '자료구조', '이교수', 3),
(3, '인공지능', '정교수', 4),
(4, '웹프로그래밍', '한교수', 1),
(5, '소프트웨어공학', '오교수', 3),
(6, '알고리즘', '윤교수', 4),
(7, '모바일프로그래밍', '장교수', 2),
(8, '컴퓨터그래픽스', '임교수', 3),
(9, '빅데이터', '조교수', 2),
(10, '프로그래밍기초', '황교수', 1);

insert into enrollment (enrollment_id, student_id, subject_id, score, grade_score) values
(1, 1, 10, 95, 'A'),
(2, 1, 1, 88, 'B+'),
(3, 2, 2, 92, 'A'),
(4, 2, 4, 81, 'B'),
(5, 3, 1, 96, 'A'),
(6, 3, 6, 90, 'A-'),
(7, 4, 3, 89, 'B+'),
(8, 4, 5, 93, 'A'),
(9, 5, 10, 97, 'A'),
(10, 5, 4, 85, 'B+'),
(11, 6, 2, 80, 'B'),
(12, 6, 7, 94, 'A'),
(13, 7, 1, 87, 'B+'),
(14, 7, 5, 91, 'A-'),
(15, 8, 8, 95, 'A'),
(16, 8, 3, 82, 'B'),
(17, 9, 4, 90, 'A-'),
(18, 9, 9, 88, 'B+'),
(19, 10, 6, 93, 'A'),
(20, 10, 8, 86, 'B+');


