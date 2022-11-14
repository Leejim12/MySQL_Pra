-- pnusw01db 데이터베이스 선택
use pnusw01db;

-- usertbl 테이블 전체 컬럼 조회
select * from usertbl;

-- usertbl 테이블에서 이름과 주소 검색
select name,addr from usertbl;

-- usertbl 테이블에서 김경호 검색
select * from usertbl where name like '김경호';

-- usertbl 테이블에서 키가 177보다 큰 사람의 이름과 키를 검색
select name,height from usertbl where height >= 177;

-- 1970년 이후 출생 & 키가 182 이상인 사람 아이디와 이름 검색
select userID,name from usertbl where month(mDate)>=1970 and height >=182; -- 체크 필요

-- 1970년 이후에 출생했거나 키가 182이상인 사람 아이디와 이름 검색
select userID,name from usertbl where month(mDate)>=1970 or height >= 182;

-- 키가 180~183인 사람 이름과 키 ( and 및 between 사용 )
select name,height from usertbl where height between 180 and 183;

-- 지역이 경남, 전남, 경북인 사람 이름과 지역 검색 ( or 및 in으로 검색 )
select name,addr from usertbl where addr in ('경남','전남','경북');

-- 김씨인 사람 이름과 키
select name,height from usertbl where name like '김%';

-- 김씨가 아닌 사람들의 이름과 키
select name,height from usertbl where name not like '김%';

-- 이름이 종신인 사람의 이름과 키 검색
select name,height from usertbl where name like '_종신';

-- 김경호 키보다 큰 사람의 이름과 키를 검색 ( 서브쿼리 사용 )
select name,height from usertbl where height > (select height from usertbl where name = '김경호');

-- 먼저 가입한 순서대로 회원의 이름과 가입일 검색
select name,mDate from usertbl order by mDate asc;

-- 최근에 가입한 순서대로 회원의 이름과 가입일 검색
select name,mDate from usertbl order by mDate DESC;

-- 키가 큰 순서대로 정렬하되 키가 같을 경우 이름 순서대로 회원 이름과 키 검색
select name,height from usertbl order by height DESC, name asc;

-- 주소 1개씩만 출력(중복X)
select distinct addr from usertbl;

-- buytbl 테이블에서 사용자별 이름, 수량의 합계 검색
select userID, sum(amount) from buytbl group by userID;

-- 위의 문제에서, userID는 '사용자아이디','sum(amount)는 '총 구매 개수' 로 출력
select userID as '사용자아이디', sum(amount) as '총 구매 개수' from buytbl group by userID;

-- buytbl 테이블에서 사용자별로 이름, 총구매액 검색
select userID,sum(price) from buytbl group by userID;

-- buytbl; 테이블에서 사용자별로 이름, 총구매액(amount*price)이 1000 이상인 사용자를 검색
select userID from buytbl where amount*price >= 1000;

-- buytbl; 테이블에서 사용자별로 이름, 총구매액(amount*price)이 1000 이상인 사용자 구매액 적은 사람부터
select userID from buytbl where amount*price >= 1000 order by price;

-- 전체 구매자가 구매한 물품수량(amount)의 평균을 검색(컬럼명은 ‘평균구매개수’로 출력)
select avg(amount) as '평균구매개수' from buytbl;

-- 각 사용자별로 평균구매개수를 검색하여 사용자아이디, 평균구매개수 출력
select userID,avg(amount) as '평균구매개수' from buytbl group by userID;

-- usertbl; 테이블에서 가장 큰 키값과 가장 작은 키값을 출력
select max(height),min(height) from usertbl;

-- usertbl; 테이블에서 휴대폰이 있는 사람의 수를 ‘휴대폰이 있는 사용자’로 출력
select count(userID) as '휴대폰이 있는 사용자' from usertbl where mobile1 is not null;

-- 물품을 구매한 회원의 이름, 주소, 연락처 정보를 출력
select U.name,U.addr,concat(U.mobile1,'-',U.mobile2) from usertbl U,buytbl B where U.userID = B.userID;

-- 구매한 회원중에 BBK라는 아이디를 가진 회원의 이름, 주소, 연락처를 검색
select Distinct U.name,U.addr,concat(U.mobile1,'-',U.mobile2) from usertbl U,buytbl B where U.userID = B.userID and U.name = '바비킴';