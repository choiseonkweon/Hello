use jcepdb;

/* 시설 테이블 */
CREATE TABLE tb_facility (
facility_id varchar(10) NOT NULL comment '시설아이디',
facility_nm varchar(30) NOT NULL COMMENT '시설명',
facility_loc varchar(30) NOT NULL COMMENT '시설위치',
facility_scale varchar(30) COMMENT '시설규모',
facility_cost varchar(40) COMMENT '시설비용',
facility_equip varchar(40) COMMENT '시설보유장비',
facility_img varchar(30) COMMENT '시설이미지',
facility_st varchar(5) NOT NULL COMMENT '시설상태',
facility_reg_dt TIMESTAMP COMMENT '시설등록일자',
facility_reg_id varchar(30) COMMENT '시설등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='시설';

ALTER TABLE tb_facility add unique key (facility_id); 


/* 자원 테이블 */
CREATE TABLE tb_resource (
resource_id varchar(10) NOT NULL comment '자원아이디',
resource_nm varchar(30) NOT NULL COMMENT '자원명',
resource_img varchar(30) COMMENT '자원이미지',
resource_st varchar(5) NOT NULL COMMENT '자원상태',
resource_reg_dt TIMESTAMP COMMENT '자원등록일자',
resource_reg_id varchar(30) COMMENT '자원등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='자원';

ALTER TABLE tb_resource add unique key (resource_id); 

