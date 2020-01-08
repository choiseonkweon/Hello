use jcepdb;

/* 공지사항 테이블 */
CREATE TABLE tb_notice (
notice_idx VARCHAR(10) NOT NULL COMMENT '인덱스',
notice_title varchar(50) NOT NULL COMMENT '제목',
notice_content longtext NOT NULL COMMENT '내용',
notice_open_yn varchar(10) NOT NULL COMMENT '공개여부', 
notice_impt_yn varchar(10) NOT NULL COMMENT '중요공지여부',
notice_file varchar(40) COMMENT '첨부파일',
notice_reg_dt TIMESTAMP COMMENT '등록일',
notice_reg_id varchar(30) COMMENT '등록자'
) DEFAULT CHARSET=utf8 COMMENT='공지사항';

ALTER TABLE tb_notice add unique key (notice_idx);

