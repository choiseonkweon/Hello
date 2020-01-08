use jcepdb;

/* 기업 테이블 */
CREATE TABLE tb_enterprise (
enterprise_id varchar(10) NOT NULL COMMENT '기업아이디',
enterprise_nm varchar(30) NOT NULL COMMENT '기업명',
enterprise_ceo varchar(30) NOT NULL COMMENT '대표자',
enterprise_com_reg_num varchar(20) COMMENT '사업자등록번호',
enterprise_ceo_email varchar(60) COMMENT '대표자E-Mail',
enterprise_bus_area varchar(20) COMMENT '사업분야',
enterprise_site varchar(40) COMMENT '홈페이지',
enterprise_type varchar(5) NOT NULL COMMENT '기업유형',
enterprise_emp_cnt varchar(20) COMMENT '고용인원',
enterprise_head_addr varchar(60) COMMENT '본사주소',
enterprise_head_detail_addr varchar(40) COMMENT '본사상세주소',
enterprise_head_tel varchar(30) COMMENT '본사대표전화',
enterprise_head_fax varchar(30) COMMENT '본사대표Fax',
enterprise_branch_addr varchar(60) COMMENT '지사주소',
enterprise_branch_detail_addr varchar(40) COMMENT '지사상세주소', 
enterprise_branch_tel varchar(30) COMMENT '지사대표전화',
enterprise_branch_fax varchar(30) COMMENT '지사대표Fax',
enterprise_est_dt varchar(30) COMMENT '설립일',
enterprise_capital varchar(30) COMMENT '자본금',
enterprise_reg_dt TIMESTAMP COMMENT '기업등록일자',
enterprise_reg_id varchar(30) COMMENT '기업등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='기업';

ALTER TABLE tb_enterprise add unique key (enterprise_id); 

/* 기업성과 테이블 */
CREATE TABLE tb_enterprise_result (
enterprise_id varchar(10) COMMENT '기업아이디',
enterprise_result_id varchar(10) COMMENT '인덱스',
enterprise_result_year varchar(10) COMMENT '수행년도',
enterprise_result_qta varchar(10) COMMENT '분기',
enterprise_result_capital varchar(30) COMMENT '자본금',
enterprise_result_take varchar(30) COMMENT '매출액',
enterprise_result_emp_cnt varchar(20) COMMENT '직원수',
enterprise_result_reg_dt TIMESTAMP COMMENT '성과등록일자',
enterprise_result_reg_id varchar(30) COMMENT '성과등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='기업성과';

ALTER TABLE tb_enterprise_result add unique key (enterprise_id,enterprise_result_id); 

/* 기업사업진행현황 테이블 */
CREATE TABLE tb_enterprise_bus_pro_stus (
enterprise_id varchar(10) COMMENT '기업아이디',
enterprise_bus_pro_stus_id varchar(10) COMMENT '인덱스',
enterprise_bus_pro_stus_nm varchar(40) COMMENT '사업명',
enterprise_bus_pro_stus_con varchar(40) COMMENT '사업내용',
enterprise_bus_pro_stus_str_dt varchar(30) COMMENT '사업시작일',
enterprise_bus_pro_stus_end_dt varchar(30) COMMENT '사업종료일',
enterprise_bus_pro_stus_exp varchar(20) COMMENT '사업비',
enterprise_bus_pro_stus_st varchar(5) COMMENT '진행사항',
enterprise_bus_pro_stus_reg_dt TIMESTAMP COMMENT '사업등록일자',
enterprise_bus_pro_stus_reg_id varchar(30) COMMENT '사업등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='기업사업진행현황';

ALTER TABLE tb_enterprise_bus_pro_stus add unique key (enterprise_id,enterprise_bus_pro_stus_id); 

/* 기업직원 테이블 */
CREATE TABLE tb_enterprise_employee (
enterprise_id varchar(10) COMMENT '기업아이디',
enterprise_employee_idx varchar(10) COMMENT '인덱스',
enterprise_employee_nm varchar(30) COMMENT '성명',
enterprise_employee_dept varchar(30) COMMENT '부서',
enterprise_employee_position varchar(30) COMMENT '직책',
enterprise_employee_id varchar(30) COMMENT '아이디',
enterprise_employee_email varchar(60) COMMENT 'E-Mail',
enterprise_employee_phone varchar(30) COMMENT '연락처',
enterprise_employe_reg_dt TIMESTAMP COMMENT '직원등록일자',
enterprise_employe_reg_id varchar(30) COMMENT '직원등록자아이디'
) DEFAULT CHARSET=utf8 COMMENT='기업사업진행현황';

ALTER TABLE tb_enterprise_employee add unique key (enterprise_id,enterprise_employee_idx); 




