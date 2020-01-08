use jcepdb;

/* 회원 테이블*/
CREATE TABLE tb_member (
member_idx VARCHAR(10) NOT NULL COMMENT '인덱스',
member_id varchar(30) NOT NULL COMMENT '아이디',
member_pw varchar(30) NOT NULL COMMENT '비밀번호',
member_nm varchar(30) NOT NULL COMMENT '이름', 
member_addr varchar(60) COMMENT '주소',
member_tel varchar(40) COMMENT '전화번호',
member_hp varchar(40) COMMENT '휴대전화',
member_mail varchar(60) COMMENT 'E-mail',
member_belong varchar(60) COMMENT '소속',
member_join_dt TIMESTAMP COMMENT '가입일',
member_join_type varchar(10) COMMENT '가입유형',
member_st varchar(10) COMMENT '상태'
) DEFAULT CHARSET=utf8 COMMENT='회원';

/* 회원권한 테이블 */
CREATE TABLE tb_member_auth (
member_idx VARCHAR(10) NOT NULL COMMENT '인덱스',
member_auth VARCHAR(10) NOT NULL COMMENT '권한'
) DEFAULT CHARSET=utf8 COMMENT='회원권한';

/* 회원권한 테이블 member_idx 컬럼 unique 값으로 설정 */ 
ALTER TABLE tb_member_auth add unique key (member_idx);