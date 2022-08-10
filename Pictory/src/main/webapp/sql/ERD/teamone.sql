
/* Drop Tables */

DROP TABLE ADJUSTMENT CASCADE CONSTRAINTS;
DROP TABLE ALARM CASCADE CONSTRAINTS;
DROP TABLE ANSWER CASCADE CONSTRAINTS;
DROP TABLE AUTHORITIES CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE COMMENT_TBL CASCADE CONSTRAINTS;
DROP TABLE DM CASCADE CONSTRAINTS;
DROP TABLE FOLLOW CASCADE CONSTRAINTS;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;
DROP TABLE LIKES CASCADE CONSTRAINTS;
DROP TABLE MAP CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE PDORDER CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE PHOTO CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE STORY CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ADJUSTMENT
(
	adjNo number NOT NULL,
	adjAmount number,
	bank nvarchar2(100),
	adjDate date DEFAULT SYSDATE,
	-- USER_SEQ
	userNo number NOT NULL
);


CREATE TABLE ALARM
(
	alarmNo number NOT NULL,
	-- comment
	-- like
	-- qna
	-- sales
	alarmType nvarchar2(30) NOT NULL,
	alarmDate date DEFAULT SYSDATE,
	-- default-0(확인전)
	-- 확인후 - 1
	isChecked number DEFAULT 0,
	-- userId 참조
	receiver number,
	-- userId 참조
	eventUser number,
	-- like/comment/sales - postTitle로 지정
	-- qna - 글제목
	subject nvarchar2(50),
	-- like-좋아요
	-- comment-댓글내용넣기
	-- sales-구매
	-- qna- 답변입력
	content nvarchar2(2000),
	PRIMARY KEY (alarmNo)
);


CREATE TABLE ANSWER
(
	-- QNA_SEQ
	qnaNo number NOT NULL,
	answerText nvarchar2(300),
	answerDate date DEFAULT SYSDATE
);


CREATE TABLE AUTHORITIES
(
	-- USER_SEQ
	userNo number NOT NULL,
	authorities nvarchar2(10) DEFAULT 'USER',
	-- 활동중지 및 재개 관련
	-- 1- 활성
	-- 2- 비활성
	enabled number
);


CREATE TABLE CART
(
	-- USER_SEQ
	userNo number NOT NULL,
	-- 생성순 PRODUCT_SEQ
	pdNo number NOT NULL
);


CREATE TABLE COMMENT_TBL
(
	-- COMMENT_SEQ
	cNo number NOT NULL,
	-- POST_SEQ
	postNo number NOT NULL,
	-- USER_SEQ
	userNo number NOT NULL,
	-- 댓글내용
	cText nvarchar2(300),
	-- 1 원댓글
	cLevel number,
	cDate date DEFAULT SYSDATE,
	-- COMMENT_SEQ
	parentCNo number,
	PRIMARY KEY (cNo)
);


CREATE TABLE DM
(
	-- SEQ_DM
	dmNo number NOT NULL,
	-- SEQ_DMROOM
	dmRoom number,
	-- USER_SEQ
	sendNick number NOT NULL,
	-- USER_SEQ
	readNick number NOT NULL,
	sendTime date DEFAULT SYSDATE,
	readTime date DEFAULT SYSDATE,
	dmContent nvarchar2(1000),
	-- 0,1
	readCheck number,
	PRIMARY KEY (dmNo)
);


CREATE TABLE FOLLOW
(
	-- USER_SEQ
	userNo number NOT NULL,
	-- USER_SEQ
	followTargetId number NOT NULL
);


CREATE TABLE HASHTAG
(
	-- POST_SEQ
	postNo number NOT NULL,
	hashtag nvarchar2(10) NOT NULL
);


CREATE TABLE LIKES
(
	-- USER_SEQ
	userNo number NOT NULL,
	-- POST_SEQ
	postNo number NOT NULL
);


CREATE TABLE MAP
(
	-- 생성순서에 따라 MARKER_SEQ
	markerNo number NOT NULL,
	-- POST_SEQ
	postNo number NOT NULL,
	markerLocation nvarchar2(100),
	markerName nvarchar2(30),
	PRIMARY KEY (markerNo)
);


CREATE TABLE NOTICE
(
	-- NOTICE_SEQ
	noticeNo number NOT NULL,
	-- USER_SEQ
	userNo number NOT NULL,
	-- 굳이
	noticeCode number,
	noticeTitle nvarchar2(30),
	noticeContent nvarchar2(2000),
	noticeDate date DEFAULT SYSDATE,
	-- 필요없을듯
	noticeCategory number,
	PRIMARY KEY (noticeNo)
);


CREATE TABLE PAYMENT
(
	-- ORDER_SEQ
	paymentNo number NOT NULL,
	-- USER_SEQ
	userNo number NOT NULL,
	paymentDate date DEFAULT SYSDATE,
	-- 원단위
	paymentTotal number,
	PRIMARY KEY (paymentNo)
);


CREATE TABLE PDORDER
(
	-- ORDER_SEQ
	paymentNo number NOT NULL,
	-- 생성순 PRODUCT_SEQ
	pdNo number NOT NULL,
	pdStatus number
);


CREATE TABLE PHOTO
(
	-- PHOTO_SEQ
	photoNo number NOT NULL,
	-- POST_SEQ
	postNo number NOT NULL,
	photoSize number,
	photoName nvarchar2(200),
	-- http://192.168.0.,xxx:4040/springapp이런식으로 구성됩니다!
	photoUrl nvarchar2(300),
	PRIMARY KEY (photoNo)
);


CREATE TABLE POST
(
	-- POST_SEQ
	postNo number NOT NULL,
	-- USER_SEQ
	userNo number NOT NULL,
	-- 생성순서대로 SEQ_STORY
	-- 
	sNo number,
	postTitle nvarchar2(25) NOT NULL,
	postHits number DEFAULT 0,
	-- 1 판매 2 낫판매
	postSellorNot number NOT NULL,
	-- 카테고리 인물정물풍경기타 nvarchar2로 넣기
	postCategory nvarchar2(10) NOT NULL,
	-- 텍스트영역
	postText nvarchar2(300),
	-- 좋아요개수 저장용
	postLikes number DEFAULT 0,
	postDate date DEFAULT SYSDATE,
	PRIMARY KEY (postNo)
);


CREATE TABLE PRODUCT
(
	-- 생성순 PRODUCT_SEQ
	pdNo number NOT NULL,
	-- PHOTO_SEQ
	photoNo number NOT NULL,
	-- 원단위숫자만
	pdPrice number NOT NULL,
	pdSalesNo number DEFAULT 0,
	pdDate date DEFAULT SYSDATE,
	PRIMARY KEY (pdNo)
);


CREATE TABLE QNA
(
	-- QNA_SEQ
	qnaNo number NOT NULL,
	-- USER_SEQ
	userNo number NOT NULL,
	qnaTitle nvarchar2(30),
	qnaContent nvarchar2(2000),
	qnaDate date DEFAULT SYSDATE,
	qnaCheck number DEFAULT 0,
	PRIMARY KEY (qnaNo)
);


CREATE TABLE STORY
(
	-- 생성순서대로 SEQ_STORY
	-- 
	sNo number NOT NULL,
	-- 상대경로 url로 저장!
	storyThumbnail nvarchar2(300),
	storyTitle nvarchar2(20),
	storyDescription nvarchar2(100),
	PRIMARY KEY (sNo)
);


CREATE TABLE USERS
(
	-- USER_SEQ
	userNo number NOT NULL,
	-- 20자, 영어소문자,숫자만 사용가능
	userId nvarchar2(20) NOT NULL UNIQUE,
	-- 영어대소문자특문 포함
	userPassword nvarchar2(30) NOT NULL,
	userEmail nvarchar2(40) NOT NULL UNIQUE,
	userName nvarchar2(10),
	userNickname nvarchar2(20),
	userFing number DEFAULT 0,
	userFwer number DEFAULT 0,
	-- 기본값에 기본 프사 지정
	userProfile nvarchar2(300) DEFAULT 'basicprofile.png',
	-- 자기소개 하나만!
	-- 
	userSelf nvarchar2(300),
	userDate date DEFAULT SYSDATE,
	PRIMARY KEY (userNo)
);



/* Create Foreign Keys */

ALTER TABLE COMMENT_TBL
	ADD FOREIGN KEY (parentCNo)
	REFERENCES COMMENT_TBL (cNo)
;


ALTER TABLE PDORDER
	ADD FOREIGN KEY (paymentNo)
	REFERENCES PAYMENT (paymentNo)
;


ALTER TABLE PRODUCT
	ADD FOREIGN KEY (photoNo)
	REFERENCES PHOTO (photoNo)
;


ALTER TABLE COMMENT_TBL
	ADD FOREIGN KEY (postNo)
	REFERENCES POST (postNo)
;


ALTER TABLE HASHTAG
	ADD FOREIGN KEY (postNo)
	REFERENCES POST (postNo)
;


ALTER TABLE LIKES
	ADD FOREIGN KEY (postNo)
	REFERENCES POST (postNo)
;


ALTER TABLE MAP
	ADD FOREIGN KEY (postNo)
	REFERENCES POST (postNo)
;


ALTER TABLE PHOTO
	ADD FOREIGN KEY (postNo)
	REFERENCES POST (postNo)
;


ALTER TABLE CART
	ADD FOREIGN KEY (pdNo)
	REFERENCES PRODUCT (pdNo)
;


ALTER TABLE PDORDER
	ADD FOREIGN KEY (pdNo)
	REFERENCES PRODUCT (pdNo)
;


ALTER TABLE ANSWER
	ADD FOREIGN KEY (qnaNo)
	REFERENCES QNA (qnaNo)
;


ALTER TABLE POST
	ADD FOREIGN KEY (sNo)
	REFERENCES STORY (sNo)
;


ALTER TABLE ADJUSTMENT
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE ALARM
	ADD FOREIGN KEY (receiver)
	REFERENCES USERS (userNo)
;


ALTER TABLE ALARM
	ADD FOREIGN KEY (eventUser)
	REFERENCES USERS (userNo)
;


ALTER TABLE AUTHORITIES
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE CART
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE COMMENT_TBL
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE DM
	ADD FOREIGN KEY (sendNick)
	REFERENCES USERS (userNo)
;


ALTER TABLE DM
	ADD FOREIGN KEY (readNick)
	REFERENCES USERS (userNo)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (followTargetId)
	REFERENCES USERS (userNo)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE LIKES
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE POST
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (userNo)
	REFERENCES USERS (userNo)
;



