use school;
select * from student;
select * from enrollment;

-- school database에
-- 수강 과목이 2개 이상인 학생들의 평균을 계산하시오 
-- [출력] 학번, 이름, 과목수, 평균
select
	s.student_id as 학번,
    s.name as 이름,
    count(e.student_id) 수강과목수,
    round(avg(e.score),2)
from student s
join enrollment e on s.student_id = e.student_id
group by s.student_id
having count(e.subject_id) >= 2;
