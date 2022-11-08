### 프로그래머스 MYSQL 문제 정리


# 프로그래머스 문제 별 SQL 정리.

* 중복 제거하기
> 중복되지 않는 이름의 갯수 조회
```
SELECT COUNT(DISTINCT NAME) from ANIMAL_INS;
```

* 중성화 여부 

```
SELECT ANIMAL_ID,NAME, 
IF(SEX_UPON_INTAKE like'%Neutered%' OR SEX_UPON_INTAKE like'%Spayed%','O','X') AS  중성화 
from ANIMAL_INS order by ANIMAL_ID;
```

* Null 처리하기
> Null 일 경우, 이름을 No name으로 처리하기.
```
SELECT ANIMAL_TYPE,if(NAME is not null,name,'No name'),SEX_UPON_INTAKE from ANIMAL_INS order by ANIMAL_ID;
```

* 입양 시각 구하기(1)
> DATETIME을 시각으로 바꿔서, 각 시간대 별 입양 COUNT
```
SELECT HOUR(DATETIME) AS HOUR,Count(*) AS COUNT from ANIMAL_OUTS WHERE Hour(DATETIME)>=9 AND Hour(DATETIME)<20 group by Hour(DATETIME) ORDER BY 1;
```

* DATETIME에서 DATE로 형변환
> DATETIME형식의 날짜데이터에서 시간 빼고 날짜만 넣기.
```
SELECT ANIMAL_ID,NAME,DATE_FORMAT(DATETIME,'%Y-%m-%d') AS 날짜 FROM ANIMAL_INS ORDER BY 1;
```
