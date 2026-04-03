-- 전체 게시글 수
select count(*) as 게시글수 from post;
select count(id) as 게시글수 from post;

select * from like_log;
select count(*) as 총좋아요수 from like_log; 

-- 평균 
select avg(view_count) as 평균조회수 from post;
select round(avg(view_count),1) as 평균조회수 from post;

-- 최대/최소
select MAX(view_count) from post;
select MIN(view_count) from post;

-- 한번에 쿼리에서 최대 조회수 최소 조회수를 출력해보자.
select 
	max(view_count) as 최대조회수,
    min(view_count) as 최소조회수
from post;

-- ------------------------------

-- 문자열 함수
-- CONCAT, UPPER, LOWER
-- select nickname + ('a@naver.com') from user;
select concat(nickname,'(',email,')') as 회원정보 from user;
select upper(email) as 대문자이메일 from user;
select lower(email) as 소문자이메일 from user;

-- substring, locate
-- locate(찾을문자, 원본문자열): 특정 문자가 시작되는 '위치'를 숫자로 반환
-- substring(원본문자열, 시작위치, 가져올길이): 원본 문자에서 정해진 범위만큼 잘라 내기
select '안녕반가워';
-- mysql에서 글자순번슨 서수적 표현을 사용
select locate('@', '@abccom');
select substring('abc@com',1,2);

-- 응용
select * from user;
select substring(email,1,locate('@',email) - 1) as 아이디 from user;

-- LENGTH vs CAHR_LENGTH
-- LENGTH(문자열): 문자열의 바이트 수를 반환.: MYSQL 한글 한글자 UTF-8(3바이트)
-- CHAR_LENGTH(문자열): 문자열에 글자 수를 반환(한글 사용시 권장)
select "HI", LENGTH('HI') as 글자길이;
select "자바", LENGTH('자바') as 글자길이;

select "HI", CHAR_LENGTH('HI') as 글자길이;
select "자바", CHAR_LENGTH('자바') as 글자길이;

-- 조건 함수
-- 조회수에 따라서 인기 등급 표시
select title, view_count from post;
-- 50보다 크거나 같다면 '인기글' / 30보다 크거나 같다면 '주목글'
select 
	title,
    view_count,
case 
	when view_count >= 50 then '인기글'
    when view_count >= 30 then '주목글'
    else '일반글'
end as 인기등급
from post
order by view_count desc;

-- 날짜 함수 
-- 오늘 날짜
select current_date() as 오늘;
select CURRENT_DATE as 오늘;

-- DATEDIFF
-- 가입후 경과 일수
select * from user;
select 
	nickname,
    created_at,
    datediff(current_date,'2025-04-02') as 가입일수
from user;

-- 가입 년도/ 월 추출
select 
	nickname,
    year(created_at) as 가입년도,
    month(created_at) as 가입월
from user;

-- 형 변환 함수
select 
	title,
    view_count
from post;
-- MySQL에서 varchar은 변환 불가, CHAR 변환 가능
select 
	title,
    concat(cast(view_count as char) ,'회') as 조회수
from post;





