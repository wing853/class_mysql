-- DCL(권한을 관리)

-- 사용자 생성(사람, 시스템에게 줄 수 있다)
create user 'user1'@'localhost' identified by '비밀번호 설정';

-- 권한 설정
GRANT SELECT ON school.student TO 'user1'@'localhost';

revoke select on school.student from 'user1'@'localhost';

-- 도전 문제
-- 외부 사요자가 사용할 계정을 생성하고 조회 권한만 주고 접속 확인(계정 받은 사람)
-- ip주소 확인
create user 'user2'@'ip기입' identified by '비밀번호 설정';
grant select on school.student to 'user2'@'ip기입';

-- 풀이alter

-- 1. 로컬 접속 계정 외 별개로 외부 접송용 계정 모두 만들어 줘야 한다. 필요없다면, 로컬은 생성 안해도 됨
create user 'tenco'@'localhost' identified by '비밀번호 설정';
create user 'tenco'@'%' identified by '비밀번호 설정'; -- 모든 아이피 허용

-- 2. 권한 부여(모든 권한: ALL PRIVILEGES)
grant all privileges on school.* to 'tenco'@'localhost';  -- *.*: RDBMS 안에 모든 db 모든 테이블
grant all privileges on school.* to 'tenco'@'%';

-- 권한 확인
show grants for 'tenco'@'localhost';
show grants for 'tenco'@'%';

-- 참고: 추가된 권한이 바로 적용 안될 수 있다.
flush privileges; -- 바로 적용

-- 3. 권한 회수 
revoke ALL privileges on school.* from 'tenco'@'localhost';
revoke ALL privileges on school.* from 'tenco'@'%';
