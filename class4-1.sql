-- 데이터베이스 구축하기
CREATE DATABASE school;

-- 어떤 데이터 베이스를 사용하겠다
USE school;

-- 테이블 생성
-- 1. 학생 테이블
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL,
    phone VARCHAR(20) 
);

select* from student;

-- 2. 과목테이블
CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    professor VARCHAR(30) NOT NULL
);

-- 3. 수강테이블(student테이블과 subject테이블 연결) -> FK
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL, -- 일반적으로 FK를 선언시 not null로 설정
    subject_id INT NOT NULL,
    score 	   DECIMAL(5,2),
    enrolled_at DATE  Not null,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 테이블 목록확인
show tables;
