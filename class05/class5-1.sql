-- 데이터베이스 생성
CREATE DATABASE school;
USE school;

-- 테이블 생성
CREATE TABLE student (
    student_id INT         PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    grade      INT         NOT NULL,
    major      VARCHAR(50) NOT NULL,
    phone      VARCHAR(20)
);

-- 테이블 구조 확인
DESC student;

-- 컬럼 추가
ALTER TABLE student ADD COLUMN email VARCHAR(100);

-- 컬럼 삭제
ALTER TABLE student DROP COLUMN email;

-- 테이블 삭제
DROP TABLE student;

-- 데이터베이스 삭제
DROP DATABASE school;

