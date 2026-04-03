-- 실습 1
-- 게시글 별 좋아요 수를 출력하시요. 단, 좋아요가 없는 게시글도 출력이 되어야 한다.
-- 게시글 타이틀, 좋아요 수
select * from post;
select * from like_log;

select 
	p.id as 게시글번호,
    p.title as 타이틀 ,
    count(l.id) 좋아요수
from post p
left join like_log l on p.id = l.post_id
group by p.id, p.title
order by count(l.id) desc;

-- 실습 2
-- 사용자별 작성 게시글 수, 게시글 하나도 작성 안 한 회원도 출력
-- 닉네임, 작성 글 수

select * from user;
select * from post;
select
	u.id,
	u.nickname,
    count(p.id) 게시글수
from user u
left join post p on u.id = p.user_id
group by u.id;

-- 실습 3
-- 사용자별 평균 게시글 조회수 (단,2개 이상인 사람만)
-- 닉네임, 게시글 수, 평균 조회수
select * from post;
select * from user;
select * from like_log;
select * from comment;

select
	u.id,
	u.nickname,
    count(p.id) 게시글수,
    TRUNCATE(avg(view_count),0) 평균조회수
from user u
left join post p on u.id = p.user_id
group by u.id
having count(p.id) >= 2;


