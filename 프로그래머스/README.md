### 프로그래머스 MYSQL 문제 정리


# 프로그래머스 문제 별 SQL 정리.

## 중복 제거하기
> 중복되지 않는 이름의 갯수 조회
```
SELECT COUNT(DISTINCT NAME) from ANIMAL_INS;
```

## 중성화 여부 

```
SELECT ANIMAL_ID,NAME, 
IF(SEX_UPON_INTAKE like'%Neutered%' OR SEX_UPON_INTAKE like'%Spayed%','O','X') AS  중성화 
from ANIMAL_INS order by ANIMAL_ID;
```

## Null 처리하기
> Null 일 경우, 이름을 No name으로 처리하기.
```
SELECT ANIMAL_TYPE,if(NAME is not null,name,'No name'),SEX_UPON_INTAKE from ANIMAL_INS order by ANIMAL_ID;
```

## 입양 시각 구하기(1)
> DATETIME을 시각으로 바꿔서, 각 시간대 별 입양 COUNT
```
SELECT HOUR(DATETIME) AS HOUR,Count(##) AS COUNT from ANIMAL_OUTS WHERE Hour(DATETIME)>=9 AND Hour(DATETIME)<20 group by Hour(DATETIME) ORDER BY 1;
```

## DATETIME에서 DATE로 형변환
> DATETIME형식의 날짜데이터에서 시간 빼고 날짜만 넣기.
```
SELECT ANIMAL_ID,NAME,DATE_FORMAT(DATETIME,'%Y-%m-%d') AS 날짜 FROM ANIMAL_INS ORDER BY 1;
```

## 최댓값 구하기
> 가장 늦게 입양된 동물 찾기
```
SELECT DATETIME as 시간 from ANIMAL_INS order by DATETIME DESC LIMIT 1;
```

## 강원도에 위치한 생산공장 목록 출력
> ADDRESS가 강원도로 시작하는 데이터 출력
```
SELECT FACTORY_ID,FACTORY_NAME,ADDRESS FROM FOOD_FACTORY WHERE ADDRESS LIKE '강원도%' ORDER BY FACTORY_ID
```

## 경기도에 위치한 식품창고 목록 출력
> 경기도에 있음 + 냉동시설 NULL이면 'N' 입력
```
SELECT WAREHOUSE_ID,WAREHOUSE_NAME,ADDRESS,
IF(FREEZER_YN IS NULL,'N',FREEZER_YN) AS FREEZER_YN FROM FOOD_WAREHOUSE WHERE ADDRESS LIKE '경기도%' ORDER BY WAREHOUSE_ID ASC;
```

## 가격이 제일 비싼 식품의 정보 출력하기
```
SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_CD,CATEGORY,PRICE from FOOD_PRODUCT order by PRICE desc limit 1;
```