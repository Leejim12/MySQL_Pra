# 프로그래머스 MYSQL 문제 정리


## 프로그래머스 문제 별 SQL 정리.

### 중복 제거하기
> 중복되지 않는 이름의 갯수 조회
```
SELECT COUNT(DISTINCT NAME) from ANIMAL_INS;
```

### 중성화 여부 

```
SELECT ANIMAL_ID,NAME, 
IF(SEX_UPON_INTAKE like'%Neutered%' OR SEX_UPON_INTAKE like'%Spayed%','O','X') AS  중성화 
from ANIMAL_INS order by ANIMAL_ID;
```

### Null 처리하기
> Null 일 경우, 이름을 No name으로 처리하기.
```
SELECT ANIMAL_TYPE,if(NAME is not null,name,'No name'),SEX_UPON_INTAKE from ANIMAL_INS order by ANIMAL_ID;
```

### 입양 시각 구하기(1)
> DATETIME을 시각으로 바꿔서, 각 시간대 별 입양 COUNT
```
SELECT HOUR(DATETIME) AS HOUR,Count(###) AS COUNT from ANIMAL_OUTS WHERE Hour(DATETIME)>=9 AND Hour(DATETIME)<20 group by Hour(DATETIME) ORDER BY 1;
```

### DATETIME에서 DATE로 형변환
> DATETIME형식의 날짜데이터에서 시간 빼고 날짜만 넣기.
```
SELECT ANIMAL_ID,NAME,DATE_FORMAT(DATETIME,'%Y-%m-%d') AS 날짜 FROM ANIMAL_INS ORDER BY 1;
```

### 최댓값 구하기
> 가장 늦게 입양된 동물 찾기
```
SELECT DATETIME as 시간 from ANIMAL_INS order by DATETIME DESC LIMIT 1;
```

### 강원도에 위치한 생산공장 목록 출력
> ADDRESS가 강원도로 시작하는 데이터 출력
```
SELECT FACTORY_ID,FACTORY_NAME,ADDRESS FROM FOOD_FACTORY WHERE ADDRESS LIKE '강원도%' ORDER BY FACTORY_ID
```

### 경기도에 위치한 식품창고 목록 출력
> 경기도에 있음 + 냉동시설 NULL이면 'N' 입력
```
SELECT WAREHOUSE_ID,WAREHOUSE_NAME,ADDRESS,
IF(FREEZER_YN IS NULL,'N',FREEZER_YN) AS FREEZER_YN FROM FOOD_WAREHOUSE WHERE ADDRESS LIKE '경기도%' ORDER BY WAREHOUSE_ID ASC;
```

### 가격이 제일 비싼 식품의 정보 출력하기
```
SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_CD,CATEGORY,PRICE from FOOD_PRODUCT order by PRICE desc limit 1;
```

### 3월 태어난 여성 회원 목록 출력
> 왜 틀렸다고 하는지 모르겠음.
```
SELECT member_id, member_name, gender, date_format(date_of_birth, "%Y-%m-%d") as date_for_birth
from member_profile
where gender = 'W' and tlno is not null and date_format(date_of_birth, "%m") = "03";
```
> 틀린 sql
```
SELECT MEMBER_ID,MEMBER_NAME,GENDER,DATE_FORMAT(DATE_OF_BIRTH,'%Y-%m-%d') as DATE_OF_BIRTH FROM MEMBER_PROFILE WHERE MONTH(DATE_OF_BIRTH)=3 AND TLNO IS NOT NULL ORDER BY MEMBER_ID ASC;
```

### 나이 정보가 없는 회원 수 구하기
```
SELECT count(USER_ID) as USERS from USER_INFO where AGE is NULL;
```

### 카테고리 별 상품 갯수 구하기
```
SELECT left(PRODUCT_CODE,2) as CATEGORY,count(PRODUCT_CODE) as PRODUCTS from PRODUCT group by left(PRODUCT_CODE,2) order by 1;
```

### 가격대 별 상품 갯수 구하기
```
SELECT case when 0 < price and price < 10000 then 0
            when 10000 <= price and price < 20000 then 10000
            when 20000 <= price and price < 30000 then 20000
            when 30000 <= price and price < 40000 then 30000
            when 40000 <= price and price < 50000 then 40000
            when 50000 <= price and price < 60000 then 50000
            when 60000 <= price and price < 70000 then 60000
            when 70000 <= price and price < 80000 then 70000
            when 80000 <= price and price < 90000 then 80000
            end as price_group, count(*)
from product
group by price_group
order by price_group
```

### 상품 별 오프라인 매출 구하기
```
SELECT 
    P.PRODUCT_CODE,
    SUM(O.SALES_AMOUNT*P.PRICE) as SALES
from PRODUCT P,OFFLINE_SALE O
WHERE P.PRODUCT_ID = O.PRODUCT_ID
group by P.PRODUCT_CODE
order by 2 DESC, 1 ASC;
```

### 재구매가 일어난 상품과 회원 리스트 구하기
```
SELECT distinct USER_ID,PRODUCT_ID
from ONLINE_SALE
group by 1,2
having count(ONLINE_SALE_ID)>1
order by 1 ASC, 2 DESC;
```

### 가장 비싼 상품 구하기
```
SELECT max(price) as 'MAX_PRICE' from PRODUCT;
```