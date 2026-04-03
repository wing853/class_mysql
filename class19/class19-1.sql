use sns;

-- GROUP BY 없이 전체 좋아요 개수 출력
select count(*) as 전체좋아요수
from like_log;

select * from like_log;

-- 게시글 별 좋아요 수 
select post_id, count(*) as 좋아요수
from like_log
group by post_id;

-- GROUP BY 외 집계함수 모두 사용해보기
select 
 post_id,
 count(*) as 좋아요수,
 min(created_at) as 첫번째좋아요,
 max(created_at) as 마지막좋아요
from like_log
group by post_id
order by 좋아요수 desc;

-- 그룹바이 사용시 안되는 쿼리 1
select user_id, title, count(*)
from post
group by user_id;
-- title 컬럼을 넣는순간 
-- (오늘 날씨가 정말 좋네요, 맛집 추천 받아요) 두개 데이터 중 무엇을 출력해야 될지 판단 불가

-- 그룹바이 사용시 안되는 쿼리 2
select id, count(*)
from post
where count(*) >= 3
group by id;
-- 오류 발생: where절에는 집계 함수를 사용 할 수 없다.
-- 이유: WHERE절은 그룹이 만들어지기 전에 실행이 된다.
-- 즉, 아직  COUNT 결과가 존재하지 않는 시점이라 사용이 불가능
-- group by는 where절 사용 불가
-- 대신 HAVING 절을 추가