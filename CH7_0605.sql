-- 20224301 인공지능공학부 김예진
-- 2024.06.05 DB
-- 강의 실습

-- 데이터베이스 변경
USE school;

-- 새로운 테이블 생성
CREATE TABLE 학과(
번호 INTEGER NOT NULL,
이름 VARCHAR(50),
PRIMARY KEY(번호));

CREATE TABLE 교수(
번호 INTEGER NOT NULL,
이름 VARCHAR(30),
학과번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학과번호) REfERENCES 학과(번호));


CREATE TABLE 학생
(번호 INTEGER NOT NULL,
이름 VARCHAR(30),
주소 VARCHAR(50),
학년 INTEGER,
키 INTEGER,
몸무게 INTEGER,
별명 VARCHAR(20),
별명이유 VARCHAR(50),
학과번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학과번호) REFERENCES 학과(번호));

CREATE TABLE 과목(
번호 INTEGER NOT NULL,
이름 VARCHAR(30),
학점 INTEGER,
교수번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(교수번호) REFERENCES 교수(번호));

CREATE TABLE 등록(
번호 INTEGER NOT NULL,
등록일 DATETIME,
학생번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학생번호) REFERENCES 학생(번호));

CREATE TABLE 수강(
등록번호 INTEGER NOT NULL,
과목번호 INTEGER NOT NULL,
중간성적 DECIMAL(6,2),
기말성적 DECIMAL(6,2),
PRIMARY KEY(등록번호,과목번호),
FOREIGN KEY(등록번호) REFERENCES 등록(번호),
FOREIGN KEY(과목번호) REFERENCES 과목(번호));

-- 학과 데이터 삽입
INSERT INTO 학과 VALUES (1,'국문과');
iNSERT INTO 학과 VALUES (2,'연극영화과');
iNSERT INTO 학과 VALUES (3,'영문과');
iNSERT INTO 학과 VALUES (4,'의류학과');
iNSERT INTO 학과 VALUES (5,'전산학과');
iNSERT INTO 학과 VALUES (6,'철학과');


-- 교수 데이터 삽입
INSERT INTO 교수 VALUES (1,'김태길',6);
INSERT INTO 교수 VALUES (2,'김봉남',4);
INSERT INTO 교수 VALUES (3,'조정래',1);
INSERT INTO 교수 VALUES (4,'이문열',1);
INSERT INTO 교수 VALUES (5,'안성기',2);
INSERT INTO 교수 VALUES (6,'장미희',2);
INSERT INTO 교수 VALUES (7,'김영걸',2);
INSERT INTO 교수 VALUES (8,'남기찬',3);
INSERT INTO 교수 VALUES (9,'이종만',5);


-- 학생 데이터 삽입
INSERT INTO 학생 VALUES (1,'조용필',NULL,4,166,56,'작은거인','작은 체구 불구 폭발적인 가창력 때문에',1);
INSERT INTO 학생 VALUES (2,'임성훈',NULL,4,168,NULL,NULL,NULL,6);
INSERT INTO 학생 VALUES (3,'이수만','SM엔터테이먼트',4,NULL,NULL,NULL,NULL,5);
INSERT INTO 학생 VALUES (4,'임예진',NULL,3,NULL,NULL,NULL,NULL,2);
INSERT INTO 학생 VALUES (5,'원미경',NULL,3,NULL,NULL,NULL,NULL,1);
INSERT INTO 학생 VALUES (6,'박수홍',NULL,2,183,65,'허우대','키가 큰 것을 비유하여',3);
INSERT INTO 학생 VALUES (7,'안칠현','SM엔터테이먼트',1,178,65,NULL,NULL,2);
INSERT INTO 학생 VALUES (8,'김태희',NULL,1,165,45,'헤드뱅잉','수업시간에 졸때 낙차가 너무 커서',4);
INSERT INTO 학생 VALUES (9,'한채영', '스타제이엔터테이먼트',1,172,47,'바비인형','시원하게 생긴 서구적인 마스크 때문에',2);
INSERT INTO 학생 VALUES (10,'박수애','스타제이엔터테이먼트',1,168,46,'리틀 정윤희',NULL,1);
INSERT INTO 학생 VALUES (11,'허영란',NULL,1,162,43,'까치','눈동자가 까치 닮아서',2);
INSERT INTO 학생 VALUES (12,'정윤호','SM엔터테이먼트',1,184,66,'꼬비',NULL,2);
INSERT INTO 학생 VALUES (13,'권보아','SM엔터테이먼트',1,162,45,NULL,NULL,1);
INSERT INTO 학생 VALUES (14,'문근영','나무엑터스',1,165,45,'국민 여동생','귀여운 여동생 이미지 때문에',3);

-- 과목 데이터 삽입
INSERT INTO 과목 VALUES (1,'문학의 이해',2,3);
iNSERT INTO 과목 VALUES (2,'대화의 기법',2,4);
iNSERT INTO 과목 VALUES (3,'연극개론',3,5);
iNSERT INTO 과목 VALUES (4,'한국영화사',3,6);
iNSERT INTO 과목 VALUES (5,'애니메이션 개론',3,7);
iNSERT INTO 과목 VALUES (6,'영어회화실습',1,8);
iNSERT INTO 과목 VALUES (7,'현대사회와 패션',2,2);
iNSERT INTO 과목 VALUES (8,'의복과 첨단과학',2,2);
iNSERT INTO 과목 VALUES (9,'데이터베이스',3,9);
iNSERT INTO 과목 VALUES (10,'프로그래밍 언어',3,9);


-- 등록 데이터 삽입
INSERT INTO 등록 VALUES (2006101,'2006-02-20',1);
INSERT INTO 등록 VALUES (2006102,'2006-02-20',2);
INSERT INTO 등록 VALUES (2006103,'2006-02-21',3);
INSERT INTO 등록 VALUES (2006104,'2006-02-21',4);
INSERT INTO 등록 VALUES (2006105,'2006-02-21',5);
INSERT INTO 등록 VALUES (2006106,'2006-02-21',6);
INSERT INTO 등록 VALUES (2006107,'2006-02-22',7);
INSERT INTO 등록 VALUES (2006108,'2006-02-22',8);
INSERT INTO 등록 VALUES (2006109,'2006-02-23',9);
INSERT INTO 등록 VALUES (2006110,'2006-02-23',10);
INSERT INTO 등록 VALUES (2006111,'2006-02-23',11);
INSERT INTO 등록 VALUES (2006112,'2006-02-23',12);
INSERT INTO 등록 VALUES (2006113,'2006-02-23',13);
INSERT INTO 등록 VALUES (2006114,'2006-02-23',14);
INSERT INTO 등록 VALUES (2005101,'2005-02-21',1);
INSERT INTO 등록 VALUES (2005102,'2005-02-21',2);
INSERT INTO 등록 VALUES (2005103,'2005-02-21',3);
INSERT INTO 등록 VALUES (2005104,'2005-02-22',4);
INSERT INTO 등록 VALUES (2005105,'2005-02-23',5);
INSERT INTO 등록 VALUES (2005106,'2005-02-24',6);
INSERT INTO 등록 VALUES (2005201,'2005-08-22',1);
INSERT INTO 등록 VALUES (2005202,'2005-08-22',2);
INSERT INTO 등록 VALUES (2005203,'2005-08-24',3);
INSERT INTO 등록 VALUES (2005204,'2005-08-24',4);
INSERT INTO 등록 VALUES (2005205,'2005-08-24',5);
INSERT INTO 등록 VALUES (2005206,'2005-08-24',6);
INSERT INTO 등록 VALUES (2004101,'2004-02-23',1);
INSERT INTO 등록 VALUES (2004102,'2004-02-24',2);
INSERT INTO 등록 VALUES (2004103,'2004-02-25',3);
INSERT INTO 등록 VALUES (2004104,'2004-02-25',4);
INSERT INTO 등록 VALUES (2004105,'2004-02-26',5);
INSERT INTO 등록 VALUES (2004201,'2004-08-23',1);
INSERT INTO 등록 VALUES (2004202,'2004-08-25',2);
INSERT INTO 등록 VALUES (2004203,'2004-08-26',3);
INSERT INTO 등록 VALUES (2004204,'2004-08-26',4);
INSERT INTO 등록 VALUES (2004205,'2004-08-26',5);
INSERT INTO 등록 VALUES (2003101,'2003-02-17',1);
INSERT INTO 등록 VALUES (2003102,'2003-02-18',2);
INSERT INTO 등록 VALUES (2003103,'2003-02-20',3);
INSERT INTO 등록 VALUES (2003201,'2003-08-25',1);
INSERT INTO 등록 VALUES (2003202,'2003-08-28',2);
INSERT INTO 등록 VALUES (2003203,'2003-08-28',3);

-- 수강 데이터 삽입
insert into 수강 values (2006101,1,90,95);
insert into 수강 values (2006101,2,83,98);
insert into 수강 values (2006102,1,95,90);
insert into 수강 values (2006102,6,90,95);
insert into 수강 values (2006102,7,85,80);
insert into 수강 values (2006103,9,90,95);
insert into 수강 values (2006103,10,75,83);
insert into 수강 values (2006104,3,95,90);
insert into 수강 values (2006104,4,90,95);
insert into 수강 values (2006105,1,55,65);
insert into 수강 values (2006105,2,85,75);
insert into 수강 values (2006106,6,95,90);
insert into 수강 values (2006107,3,90,95);
insert into 수강 values (2006107,4,55,65);
insert into 수강 values (2006108,2,95,90);
insert into 수강 values (2006108,3,85,80);
insert into 수강 values (2006108,7,90,95);
insert into 수강 values (2006108,8,77,78);
insert into 수강 values (2006109,3,85,80);
insert into 수강 values (2006109,4,90,95);
insert into 수강 values (2006110,1,75,95);
insert into 수강 values (2006110,2,90,95);
insert into 수강 values (2006111,3,55,65);
insert into 수강 values (2006111,4,95,88);
insert into 수강 values (2006112,3,90,95);
insert into 수강 values (2006112,4,85,80);
insert into 수강 values (2006113,1,90,95);
insert into 수강 values (2006113,3,75,75);
insert into 수강 values (2006114,6,90,93);
insert into 수강 values (2005101,3,90,95);
insert into 수강 values (2005101,9,83,98);
insert into 수강 values (2005102,3,95,90);
insert into 수강 values (2005102,9,90,95);
insert into 수강 values (2005103,3,85,80);
insert into 수강 values (2005103,1,90,95);
insert into 수강 values (2005104,1,75,83);
insert into 수강 values (2005105,3,95,90);
insert into 수강 values (2005106,1,90,95);
insert into 수강 values (2005106,2,55,65);
insert into 수강 values (2005106,3,85,75);
insert into 수강 values (2005201,4,95,90);
insert into 수강 values (2005201,10,90,95);
insert into 수강 values (2005202,4,55,65);
insert into 수강 values (2005202,10,95,90);
insert into 수강 values (2005203,4,85,80);
insert into 수강 values (2005203,2,90,95);
insert into 수강 values (2005204,2,77,78);
insert into 수강 values (2005205,4,85,80);
insert into 수강 values (2005206,4,90,95);
insert into 수강 values (2005206,5,75,95);
insert into 수강 values (2004101,5,90,95);
insert into 수강 values (2004102,5,55,65);
insert into 수강 values (2004103,5,95,88);
insert into 수강 values (2004104,5,90,95);
insert into 수강 values (2004105,5,85,80);
insert into 수강 values (2004105,6,90,95);
insert into 수강 values (2004201,6,75,75);
insert into 수강 values (2004202,2,90,93);
insert into 수강 values (2004203,6,90,95);
insert into 수강 values (2004204,6,83,98);
insert into 수강 values (2004205,6,95,90);
insert into 수강 values (2003101,7,90,95);
insert into 수강 values (2003102,7,85,80);
insert into 수강 values (2003103,7,90,95);
insert into 수강 values (2003201,8,75,83);
insert into 수강 values (2003202,8,95,90);
insert into 수강 values (2003203,8,90,95);

-- 테이블의 모든 열의 검색
select 번호, 이름, 주소, 학년, 키, 몸무게, 별명, 별명이유, 학과번호
From 학생;

-- 특정 열만 선택적으로 검색
select 이름, 별명, 주소, 학년
from 학생;

-- 테이블의 특정 열에 별명 부여
select 이름 AS 성명, 주소 AS '현재 주소지' From 학생;

-- 테이블에 특정열 검색
select 학년 From 학생;

-- 중복 행 방지
select distinct 학년 From 학생;

-- 테이블에 조건에 대한 열 검색_비교 연산자 이용
select *
From 학생
where 키 < 165;

-- 테이블에 조건에 대한 열 검색_AND 이용
select 이름, 별명, 주소, 키, 몸무게
From 학생
where 학년 = 1
	OR 키 > 170;

-- 테이블에 조건에 대한 열 검색_BETWEEN, AND 이용
select 이름, 별명, 주소, 키, 몸무게
From 학생
where 몸무게 between 45 and 50;

-- -- 테이블에 조건에 대한 열 검색_비교 연산자, AND 이용
select 이름, 별명, 주소, 키, 몸무게
From 학생
where 몸무게 >=45 and 몸무게 <=50;

-- 조건 검색_IN 연산자
select 이름, 번호,학년
From 학생
WHERE 학년 IN (2,3);

-- 조건 검색_LIKE 연산자_특정 열
SELECT *
FROM 학생
WHERE 이름 LIKE '박%';

-- 조건 검색_LIKE 연산
SELECT *
FROM 학생
WHERE 이름 LIKE '[김이박]%';

-- 조건 검색_LIKE 연산
SELECT * FROM 학생 WHERE 이름 LIKE '김%'
UNION
SELECT * FROM 학생 WHERE 이름 LIKE '이%'
UNION
SELECT * FROM 학생 WHERE 이름 LIKE '박%';

-- 조건이 아닌 열 검색_*
SELECT *
FROM 학생
WHERE 이름 LIKE '[^김이박]%';

-- 테이블에 조건 검색
SELECT 이름, 별명, 학년, 주소
FROM 학생;

-- 테이블이 아닌 조건 검색
SELECT 이름, 별명, 학년, 주소
FROM 학생
WHERE 별명 IS NULL;

-- 테이블에 특정 조건 검색
SELECT 이름, 별명, 학년, 키, 몸무게
FROM 학생
WHERE 몸무게 IS NOT NULL
	AND 몸무게 > 0;
    
-- 테이블 오름차순 정렬
SELECT *
FROM 학생
ORDER BY 이름;

-- 테이블 내림차순 정렬
SELECT *
FROM 학생
ORDER BY 키 DESC;

-- 테이블 조건 검색 오름차순 정렬
SELECT *
FROM 학생
WHERE 학년 = 1
ORDER BY 키;

-- 테이블 정렬 순 검색
SELECT 이름, 키, 몸무게
FROM 학생
ORDER BY 몸무게;

-- 테이블 복합 정렬
SELECT 이름, 별명, 학년, 키, 몸무게
FROM 학생
WHERE 학년 = 1
ORDER BY 키 DESC, 몸무게;

-- 수업SQL파일
-- ALTER TABLE 컬럼 삭제
alter table Participants drop column phone;