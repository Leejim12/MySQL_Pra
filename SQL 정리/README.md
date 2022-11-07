## MySQL 정리


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
    CREATE TABLE users( id INT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(20),
    location VARCHAR(100),
    dept VARCHAR(100),
    is_admin TINYINT(1),
    register_date DATETIME,
    PRIMARY KEY(id)
    );

-. 인덱스 생성
    CREATE INDEX idx_location On users(location);
    DROP INDEX idx_location ON users;

-. 외래키와 함께 테이블 생성
    CREATE TABLE posts(
    id INT AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(100),
    body TEXT,
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
    );

-. 외래키(2개)와 함께 테이블 생성
    CREATE TABLE comments(
    id INT AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    body TEXT,
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) references users(id),
    FOREIGN KEY(post_id) references posts(id)
    );


--------------------------------------------------
## Join
ex) 내부조인
    Select
      users.first_name,
      users.last_name,
      posts.title,
      posts.publish_date
    from users u
      inner join posts p
      On u.id = p.user_id
    Order by p.title; 


--------------------------------------------------
## Select 관련
-. select 기본
    SELECT * FROM users;
    SELECT first_name, last_name FROM users;

-. select where
    SELECT * FROM users WHERE location='Massachusetts';
    SELECT * FROM users WHERE location='Massachusetts' AND dept='sales';
    SELECT * FROM users WHERE is_admin = 1;
    SELECT * FROM users WHERE is_admin > 0;

-. Order by
    SELECT * FROM users ORDER BY last_name ASC;
    SELECT * FROM users ORDER BY last_name DESC;

-. Concatenate Columns
    SELECT CONCAT(first_name,' ', last_name) AS 'Name', dept FROM users;

-. in Range
    SELECT * FROM users WHERE age BETWEEN 20 AND 25;

-. Like
    SELECT * FROM users WHERE dept LIKE 'd%';
    SELECT * FROM users WHERE dept LIKE 'dev%';
    SELECT * FROM users WHERE dept LIKE '%t';
    SELECT * FROM users WHERE dept LIKE '%e%';

-. Not Like
    SELECT * FROM users WHERE dept NOT LIKE 'd%';

