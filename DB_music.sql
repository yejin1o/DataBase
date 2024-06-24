-- 장르 테이블 생성
CREATE TABLE 장르 (
    장르ID INTEGER PRIMARY KEY,
    장르이름 VARCHAR(100),
    부모장르ID INTEGER,
    FOREIGN KEY (부모장르ID) REFERENCES 장르(장르ID)
    );

-- 아티스트 테이블 생성
CREATE TABLE 아티스트 (
    아티스트ID INTEGER PRIMARY KEY,
    이름 VARCHAR(100),
    국적 VARCHAR(100),
    활동시작일 DATE
);

-- 앨범 테이블 생성
CREATE TABLE 앨범 (
    앨범ID INTEGER PRIMARY KEY,
    아티스트ID INTEGER,
    제목 VARCHAR(100),
    발매연도 INTEGER,
    FOREIGN KEY (아티스트ID) REFERENCES 아티스트(아티스트ID)
);

-- 음악 테이블 생성
CREATE TABLE 음악 (
    음악ID INTEGER PRIMARY KEY,
    아티스트ID INTEGER,
    제목 VARCHAR(100),
    발매연도 INTEGER,
    앨범ID INTEGER,
    장르ID INTEGER,
    FOREIGN KEY (아티스트ID) REFERENCES 아티스트(아티스트ID),
    FOREIGN KEY (앨범ID) REFERENCES 앨범(앨범ID),
    FOREIGN KEY (장르ID) REFERENCES 장르(장르ID)
);

-- 사용자 테이블 생성
CREATE TABLE 사용자 (
    사용자ID INTEGER PRIMARY KEY,
    이름 VARCHAR(100),
    이메일 VARCHAR(100),
    패스워드 VARCHAR(100),
    등록일 DATE
);

-- 플레이리스트 테이블 생성
CREATE TABLE 플레이리스트 (
    플레이리스트ID INTEGER PRIMARY KEY,
    사용자ID INTEGER,
    제목 VARCHAR(100),
    생성일 DATE,
    FOREIGN KEY (사용자ID) REFERENCES 사용자(사용자ID)
);

-- 플레이리스트 테이블 생성
CREATE TABLE 플레이리스트_음악 (
    플레이리스트ID INTEGER,
    음악ID INTEGER,
    순서 INTEGER,
    PRIMARY KEY (플레이리스트ID, 음악ID),
    FOREIGN KEY (플레이리스트ID) REFERENCES 플레이리스트(플레이리스트ID),
    FOREIGN KEY (음악ID) REFERENCES 음악(음악ID)
);

-- 결제 테이블 생성
CREATE TABLE 결제 (
    결제ID INTEGER PRIMARY KEY,
    사용자ID INTEGER,
    결제날짜 DATE,
    금액 DECIMAL(10, 2),
    결제방법 VARCHAR(50),
    FOREIGN KEY (사용자ID) REFERENCES 사용자(사용자ID)
);

-- 음악평가 테이블 생성
CREATE TABLE 음악평가 (
    사용자ID INTEGER,
    음악ID INTEGER,
    별점 INTEGER,
    PRIMARY KEY (사용자ID, 음악ID),
    FOREIGN KEY (사용자ID) REFERENCES 사용자(사용자ID),
    FOREIGN KEY (음악ID) REFERENCES 음악(음악ID)
);

-- 음악스트리밍 서비스 테이블 생성
CREATE TABLE 음악스트리밍서비스 (
    서비스ID INTEGER PRIMARY KEY,
    서비스이름 VARCHAR(100),
    가입일 DATE,
    요금제 VARCHAR(50),
    사용자ID INTEGER,
    FOREIGN KEY (사용자ID) REFERENCES 사용자(사용자ID)
);

-- 장르 데이터 삽입
INSERT INTO 장르 VALUES (1, '발라드', NULL);
INSERT INTO 장르 VALUES (2, '댄스', NULL);
INSERT INTO 장르 VALUES (3, '힙합', NULL);
INSERT INTO 장르 VALUES (4, '알앤비', NULL);
INSERT INTO 장르 VALUES (5, '트로트', NULL);

-- 아티스트 데이터 삽입
INSERT INTO 아티스트 VALUES (1, '에일리', '대한민국', '2012-02-09');
INSERT INTO 아티스트 VALUES (2, '에스파', '대한민국', '2020-11-17');
INSERT INTO 아티스트 VALUES (3, '에픽하이', '대한민국', '2003-10-23');
INSERT INTO 아티스트 VALUES (4, '태양', '대한민국', '2008-05-22');
INSERT INTO 아티스트 VALUES (5, '장윤정', '대한민국', '1999-10-01');

-- 앨범 데이터 삽입
INSERT INTO 앨범 VALUES (1, 1, 'Invitation', 2012);
INSERT INTO 앨범 VALUES (2, 2, 'Savage', 2021);
INSERT INTO 앨범 VALUES (3, 3, 'Shoebox', 2014);
INSERT INTO 앨범 VALUES (4, 4, 'Rise', 2014);
INSERT INTO 앨범 VALUES (5, 5, '첫사랑', 2004);

-- 음악 데이터 삽입
INSERT INTO 음악 VALUES (1, 1, 'Heaven', 2012, 1, 1);
INSERT INTO 음악 VALUES (2, 2, 'Next Level', 2021, 2, 2);
INSERT INTO 음악 VALUES (3, 3, 'Born Hater', 2014, 3, 3);
INSERT INTO 음악 VALUES (4, 4, '눈, 코, 입', 2014, 4, 1);
INSERT INTO 음악 VALUES (5, 5, '어머나', 2004, 5, 5);

-- 사용자 데이터 삽입
INSERT INTO 사용자 VALUES (1, '김예진', 'yj22@example.com', 'password1', '2023-01-01');
INSERT INTO 사용자 VALUES (2, '유재홍', 'jh20@example.com', 'password2', '2023-02-01');

-- 플레이리스트 데이터 삽입
INSERT INTO 플레이리스트 VALUES (1, 1, 'My Favorites', '2023-03-01');
INSERT INTO 플레이리스트 VALUES (2, 2, 'Uplifting', '2023-03-02');

-- 플레이리스트 음악 데이터 삽입
INSERT INTO 플레이리스트_음악 VALUES (1, 1, 1);
INSERT INTO 플레이리스트_음악 VALUES (1, 2, 2);
INSERT INTO 플레이리스트_음악 VALUES (2, 3, 1);
INSERT INTO 플레이리스트_음악 VALUES (2, 4, 2);

-- 결제 데이터 삽입
INSERT INTO 결제 VALUES (1, 1, '2023-04-01', 10000, 'Credit Card');
INSERT INTO 결제 VALUES (2, 2, '2023-04-02', 15000, 'PayPal');

-- 음악평가 데이터 삽입
INSERT INTO 음악평가 VALUES (1, 1, 5);
INSERT INTO 음악평가 VALUES (2, 2, 4);

-- 음악 스트리밍 서비스 데이터 삽입
INSERT INTO 음악스트리밍서비스 VALUES (1, 'Spotify', '2023-05-01', 'Premium', 1);
INSERT INTO 음악스트리밍서비스 VALUES (2, 'Apple Music', '2023-05-02', 'Family', 2);

select 장르ID, 장르이름 From 장르;

select 아티스트ID, 이름, 국적, 활동시작일 From 아티스트;

select 앨범ID, 아티스트ID, 제목, 발매연도 From 앨범;

select 음악ID, 아티스트ID, 제목, 발매연도, 앨범ID, 장르ID From 음악;

select 사용자ID, 이름, 이메일, 패스워드, 등록일 From 사용자;

select 플레이리스트ID, 사용자ID, 제목, 생성일 From 플레이리스트;

select 결제ID, 사용자ID, 결제날짜, 금액, 결제방법 From 결제;

select 사용자ID, 음악ID, 별점 From 음악평가;

select 서비스ID, 서비스이름, 가입일, 요금제, 사용자ID From 음악스트리밍서비스;