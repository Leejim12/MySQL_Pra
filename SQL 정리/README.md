### MySQL 정리


#SQL문 정리

-. MySQL Login
> 루트 로그인 : mysql -u root -p
> 정상 로그인 : mysql -h ip주소 -u 계정 -p;


## 기본 문법
유저 보여주기
> select user, host from mysql.user;

유저 생성
> create users '유저명'@'localhost' identified by 'somepassword';

유저 삭제
>Drop user 'someuser'@'localhost';

-. 접근권한 부여
> Grant All PRIVILEGES ON *.* TO 'someuser'@'localhost';
> FLUSH PRIVILEGES;

-. 사용자의 권한 확인.
> Show Grants for 'someuser'@'localhost';

-. 권한 회수
> REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'someuser'@'localhost';
> ( REVOKE UPDATE )

-. 데이터베이스 보기
> Show Databases

-. DB 생성
> Create Database dbname;

-. DB 선택
> use dbname;

## 테이블 관련
-. 테이블 생성
> CREATE TABLE users( id INT AUTO_INCREMENT,
> first_name VARCHAR(100),
> last_name VARCHAR(100),
> email VARCHAR(50),
> password VARCHAR(20),
> location VARCHAR(100),
> dept VARCHAR(100),
> is_admin TINYINT(1),
> register_date DATETIME,
> PRIMARY KEY(id)
> );