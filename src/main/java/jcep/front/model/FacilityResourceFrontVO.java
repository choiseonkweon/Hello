package jcep.front.model;

import org.springframework.web.multipart.MultipartFile;

import jcep.admin.model.PagingVO;

/**
 * @Class Name : FacilityResourceFrontVO.java
 * @Description : FacilityResourceFrontVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.10          최초생성
 *
 * @since 2019.07.10
 * @version 1.0
 * @see
 *
 */
public class FacilityResourceFrontVO extends PagingVO {

	private static final long serialVersionUID = 1L;

	private String searchType;
	private String searchText;
	
	private String facilityId;
	private String facilityNm;
	private String facilityLoc;
	private String facilityScale;
	private String facilityCost;
	private String facilityEquip;
	private String facilityImg;
	private String facilitySt;
	private String facilityRegDt;
	private String facilityRegId;
	private MultipartFile facilityImgFile;
	
	private String resourceId;
	private String resourceNm;
	private String resourceImg;
	private String resourceSt;
	private String resourceRegDt;
	private String resourceRegId;
	private MultipartFile resourceImgFile;
	
	
	// 20191108 FacilityResourceFrontVO 부분에 MemberVO 관련 컬럼 추가
	private String memberIdx;
	private String memberId;
	private String memberId1;
	private String memberPw;
	private String memberNm;
	private String memberAddr;
	private String memberAddr1;
	private String memberTel;
	private String memberHp;
	private String memberMail;
	private String memberBelong;
	private String memberJoinDt;
	private String memberJoinType;
	private String memberSt;
	private String memberAuth;
	private String checkRow;
	private String memberAuthType;

	// 20191105 회원가입 정보 관련 추가
	
	private String memberSchool;
	private String memberMajor;
	private String memberAffiliation;
	private String memberDepartment;
	private String memberSpecialty;
	private String memberDetails;
	private String memberInterests;
	private String memberFieldinterest;
	private String memberMytel;
	private String memberFax;
	private String memberMyaddr;
	private String memberMyaddr1;
	private String memberMyfax;
	private String memberHp1;
	private String memberHp2;
	private String memberHp3;
	
	
	private String accountId;
	private String name;
	private String accNum;
	private String debit;
	private String credit;
	private String balance;
	private String parentId;
	
	// 20191022 기업정보 추가
	private String sno;
	private String snominus;
	private String snoplus;
	private String title;
	private String titleminus;
	private String titleplus;
	private String field;
	private String companyname;
	private String dateInserted;
	
	private String homepage;
	private String mainphone;
	private String fax;
	private String address;
	private String touchmoney;
	private String capital;
	private String employees;
	private String establishmentdate;
	private String remarks;
	
	// 20191025 바이어정보 추가
	private String buyer_id;
	private String buyer_nm;
	private String buyer_ceo;
	private String buyer_com_reg_num;
	private String buyer_ceo_email;
	private String buyer_bus_area;
	private String buyer_site;
	private String buyer_head_addr;
	private String buyer_head_detail_addr;
	private String buyer_head_tel;
	private String buyer_head_fax;
	private String buyer_branch_addr;
	private String buyer_branch_detail_addr;
	private String buyer_branch_tel;
	private String buyer_branch_fax;
	private String buyer_est_dt;
	private String buyer_capital;
	private String buyer_reg_dt;
	private String buyer_reg_id;
	private String buyer_hist_nm;
	private String buyer_hist_spec;
	private String buyer_hist_content;
	
	
	// 20191028 전문가 정보 추가
	private String expert_id;
	private String expert_nm;
	private String expert_ceo;
	private String expert_com_reg_num;
	private String expert_ceo_email;
	private String expert_bus_area;
	private String expert_site;
	private String expert_head_addr;
	private String expert_head_detail_addr;
	private String expert_head_tel;
	private String expert_head_fax;
	private String expert_branch_addr;
	private String expert_branch_detail_addr;
	private String expert_branch_tel;
	private String expert_branch_fax;
	private String expert_est_dt;
	private String expert_capital;
	private String expert_reg_dt;
	private String expert_reg_id;
	private String expert_hist_nm;
	private String expert_hist_spec;
	private String expert_hist_content;
	
	
	// 20191028 사업공고 정보 추가
	private String business_id;
	private String business_nm;
	private String business_ceo;
	private String business_com_reg_num;
	private String business_ceo_email;
	private String business_com_reg_num1;
	private String business_com_reg_num2;
	private String business_com_reg_num3;
	private String business_ceo_email1;
	private String business_ceo_email2;
	private String business_bus_area;
	private String business_site;
	private String business_head_addr;
	private String business_head_detail_addr;
	private String business_head_tel;
	private String business_head_fax;
	private String business_branch_addr;
	private String business_branch_detail_addr;
	private String business_branch_tel;
	private String business_branch_fax;
	private String business_est_dt;
	private String business_capital;
	private String business_reg_dt;
	private String business_reg_id;
	private String business_hist_nm;
	private String business_hist_spec;
	private String business_hist_content;
	private String business_level;
	private String datepicker;
	private String datepicker1;
	private String datepicker2;
	
	private String searchType1;
	private String searchType2;

	
	private String startDate;
	private String endDate;
	private int startNum;
	private int endNum;
	
	
	// 자원시설 신청 정보 
	private String compNm,compAddr1,compAddr2,compApplNm,compTelNo,compMail1,compMail2,useObj,useFrDt,useFrTm,useToDt,useToTm,resourFaciDiviCd,calYn,useDate,appliNo;
	private int usePersNum;
	
	
	
	
	
	public String getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(String memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberId1() {
		return memberId1;
	}
	public void setMemberId1(String memberId1) {
		this.memberId1 = memberId1;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberAddr1() {
		return memberAddr1;
	}
	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberHp() {
		return memberHp;
	}
	public void setMemberHp(String memberHp) {
		this.memberHp = memberHp;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public String getMemberBelong() {
		return memberBelong;
	}
	public void setMemberBelong(String memberBelong) {
		this.memberBelong = memberBelong;
	}
	public String getMemberJoinDt() {
		return memberJoinDt;
	}
	public void setMemberJoinDt(String memberJoinDt) {
		this.memberJoinDt = memberJoinDt;
	}
	public String getMemberJoinType() {
		return memberJoinType;
	}
	public void setMemberJoinType(String memberJoinType) {
		this.memberJoinType = memberJoinType;
	}
	public String getMemberSt() {
		return memberSt;
	}
	public void setMemberSt(String memberSt) {
		this.memberSt = memberSt;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}
	public String getCheckRow() {
		return checkRow;
	}
	public void setCheckRow(String checkRow) {
		this.checkRow = checkRow;
	}
	public String getMemberAuthType() {
		return memberAuthType;
	}
	public void setMemberAuthType(String memberAuthType) {
		this.memberAuthType = memberAuthType;
	}
	public String getMemberSchool() {
		return memberSchool;
	}
	public void setMemberSchool(String memberSchool) {
		this.memberSchool = memberSchool;
	}
	public String getMemberMajor() {
		return memberMajor;
	}
	public void setMemberMajor(String memberMajor) {
		this.memberMajor = memberMajor;
	}
	public String getMemberAffiliation() {
		return memberAffiliation;
	}
	public void setMemberAffiliation(String memberAffiliation) {
		this.memberAffiliation = memberAffiliation;
	}
	public String getMemberDepartment() {
		return memberDepartment;
	}
	public void setMemberDepartment(String memberDepartment) {
		this.memberDepartment = memberDepartment;
	}
	public String getMemberSpecialty() {
		return memberSpecialty;
	}
	public void setMemberSpecialty(String memberSpecialty) {
		this.memberSpecialty = memberSpecialty;
	}
	public String getMemberDetails() {
		return memberDetails;
	}
	public void setMemberDetails(String memberDetails) {
		this.memberDetails = memberDetails;
	}
	public String getMemberInterests() {
		return memberInterests;
	}
	public void setMemberInterests(String memberInterests) {
		this.memberInterests = memberInterests;
	}
	public String getMemberFieldinterest() {
		return memberFieldinterest;
	}
	public void setMemberFieldinterest(String memberFieldinterest) {
		this.memberFieldinterest = memberFieldinterest;
	}
	public String getMemberMytel() {
		return memberMytel;
	}
	public void setMemberMytel(String memberMytel) {
		this.memberMytel = memberMytel;
	}
	public String getMemberFax() {
		return memberFax;
	}
	public void setMemberFax(String memberFax) {
		this.memberFax = memberFax;
	}
	public String getMemberMyaddr() {
		return memberMyaddr;
	}
	public void setMemberMyaddr(String memberMyaddr) {
		this.memberMyaddr = memberMyaddr;
	}
	public String getMemberMyaddr1() {
		return memberMyaddr1;
	}
	public void setMemberMyaddr1(String memberMyaddr1) {
		this.memberMyaddr1 = memberMyaddr1;
	}
	public String getMemberMyfax() {
		return memberMyfax;
	}
	public void setMemberMyfax(String memberMyfax) {
		this.memberMyfax = memberMyfax;
	}
	public String getMemberHp1() {
		return memberHp1;
	}
	public void setMemberHp1(String memberHp1) {
		this.memberHp1 = memberHp1;
	}
	public String getMemberHp2() {
		return memberHp2;
	}
	public void setMemberHp2(String memberHp2) {
		this.memberHp2 = memberHp2;
	}
	public String getMemberHp3() {
		return memberHp3;
	}
	public void setMemberHp3(String memberHp3) {
		this.memberHp3 = memberHp3;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getDebit() {
		return debit;
	}
	public void setDebit(String debit) {
		this.debit = debit;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSnominus() {
		return snominus;
	}
	public void setSnominus(String snominus) {
		this.snominus = snominus;
	}
	public String getSnoplus() {
		return snoplus;
	}
	public void setSnoplus(String snoplus) {
		this.snoplus = snoplus;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleminus() {
		return titleminus;
	}
	public void setTitleminus(String titleminus) {
		this.titleminus = titleminus;
	}
	public String getTitleplus() {
		return titleplus;
	}
	public void setTitleplus(String titleplus) {
		this.titleplus = titleplus;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getDateInserted() {
		return dateInserted;
	}
	public void setDateInserted(String dateInserted) {
		this.dateInserted = dateInserted;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getMainphone() {
		return mainphone;
	}
	public void setMainphone(String mainphone) {
		this.mainphone = mainphone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTouchmoney() {
		return touchmoney;
	}
	public void setTouchmoney(String touchmoney) {
		this.touchmoney = touchmoney;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getEmployees() {
		return employees;
	}
	public void setEmployees(String employees) {
		this.employees = employees;
	}
	public String getEstablishmentdate() {
		return establishmentdate;
	}
	public void setEstablishmentdate(String establishmentdate) {
		this.establishmentdate = establishmentdate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_nm() {
		return buyer_nm;
	}
	public void setBuyer_nm(String buyer_nm) {
		this.buyer_nm = buyer_nm;
	}
	public String getBuyer_ceo() {
		return buyer_ceo;
	}
	public void setBuyer_ceo(String buyer_ceo) {
		this.buyer_ceo = buyer_ceo;
	}
	public String getBuyer_com_reg_num() {
		return buyer_com_reg_num;
	}
	public void setBuyer_com_reg_num(String buyer_com_reg_num) {
		this.buyer_com_reg_num = buyer_com_reg_num;
	}
	public String getBuyer_ceo_email() {
		return buyer_ceo_email;
	}
	public void setBuyer_ceo_email(String buyer_ceo_email) {
		this.buyer_ceo_email = buyer_ceo_email;
	}
	public String getBuyer_bus_area() {
		return buyer_bus_area;
	}
	public void setBuyer_bus_area(String buyer_bus_area) {
		this.buyer_bus_area = buyer_bus_area;
	}
	public String getBuyer_site() {
		return buyer_site;
	}
	public void setBuyer_site(String buyer_site) {
		this.buyer_site = buyer_site;
	}
	public String getBuyer_head_addr() {
		return buyer_head_addr;
	}
	public void setBuyer_head_addr(String buyer_head_addr) {
		this.buyer_head_addr = buyer_head_addr;
	}
	public String getBuyer_head_detail_addr() {
		return buyer_head_detail_addr;
	}
	public void setBuyer_head_detail_addr(String buyer_head_detail_addr) {
		this.buyer_head_detail_addr = buyer_head_detail_addr;
	}
	public String getBuyer_head_tel() {
		return buyer_head_tel;
	}
	public void setBuyer_head_tel(String buyer_head_tel) {
		this.buyer_head_tel = buyer_head_tel;
	}
	public String getBuyer_head_fax() {
		return buyer_head_fax;
	}
	public void setBuyer_head_fax(String buyer_head_fax) {
		this.buyer_head_fax = buyer_head_fax;
	}
	public String getBuyer_branch_addr() {
		return buyer_branch_addr;
	}
	public void setBuyer_branch_addr(String buyer_branch_addr) {
		this.buyer_branch_addr = buyer_branch_addr;
	}
	public String getBuyer_branch_detail_addr() {
		return buyer_branch_detail_addr;
	}
	public void setBuyer_branch_detail_addr(String buyer_branch_detail_addr) {
		this.buyer_branch_detail_addr = buyer_branch_detail_addr;
	}
	public String getBuyer_branch_tel() {
		return buyer_branch_tel;
	}
	public void setBuyer_branch_tel(String buyer_branch_tel) {
		this.buyer_branch_tel = buyer_branch_tel;
	}
	public String getBuyer_branch_fax() {
		return buyer_branch_fax;
	}
	public void setBuyer_branch_fax(String buyer_branch_fax) {
		this.buyer_branch_fax = buyer_branch_fax;
	}
	public String getBuyer_est_dt() {
		return buyer_est_dt;
	}
	public void setBuyer_est_dt(String buyer_est_dt) {
		this.buyer_est_dt = buyer_est_dt;
	}
	public String getBuyer_capital() {
		return buyer_capital;
	}
	public void setBuyer_capital(String buyer_capital) {
		this.buyer_capital = buyer_capital;
	}
	public String getBuyer_reg_dt() {
		return buyer_reg_dt;
	}
	public void setBuyer_reg_dt(String buyer_reg_dt) {
		this.buyer_reg_dt = buyer_reg_dt;
	}
	public String getBuyer_reg_id() {
		return buyer_reg_id;
	}
	public void setBuyer_reg_id(String buyer_reg_id) {
		this.buyer_reg_id = buyer_reg_id;
	}
	public String getBuyer_hist_nm() {
		return buyer_hist_nm;
	}
	public void setBuyer_hist_nm(String buyer_hist_nm) {
		this.buyer_hist_nm = buyer_hist_nm;
	}
	public String getBuyer_hist_spec() {
		return buyer_hist_spec;
	}
	public void setBuyer_hist_spec(String buyer_hist_spec) {
		this.buyer_hist_spec = buyer_hist_spec;
	}
	public String getBuyer_hist_content() {
		return buyer_hist_content;
	}
	public void setBuyer_hist_content(String buyer_hist_content) {
		this.buyer_hist_content = buyer_hist_content;
	}
	public String getExpert_id() {
		return expert_id;
	}
	public void setExpert_id(String expert_id) {
		this.expert_id = expert_id;
	}
	public String getExpert_nm() {
		return expert_nm;
	}
	public void setExpert_nm(String expert_nm) {
		this.expert_nm = expert_nm;
	}
	public String getExpert_ceo() {
		return expert_ceo;
	}
	public void setExpert_ceo(String expert_ceo) {
		this.expert_ceo = expert_ceo;
	}
	public String getExpert_com_reg_num() {
		return expert_com_reg_num;
	}
	public void setExpert_com_reg_num(String expert_com_reg_num) {
		this.expert_com_reg_num = expert_com_reg_num;
	}
	public String getExpert_ceo_email() {
		return expert_ceo_email;
	}
	public void setExpert_ceo_email(String expert_ceo_email) {
		this.expert_ceo_email = expert_ceo_email;
	}
	public String getExpert_bus_area() {
		return expert_bus_area;
	}
	public void setExpert_bus_area(String expert_bus_area) {
		this.expert_bus_area = expert_bus_area;
	}
	public String getExpert_site() {
		return expert_site;
	}
	public void setExpert_site(String expert_site) {
		this.expert_site = expert_site;
	}
	public String getExpert_head_addr() {
		return expert_head_addr;
	}
	public void setExpert_head_addr(String expert_head_addr) {
		this.expert_head_addr = expert_head_addr;
	}
	public String getExpert_head_detail_addr() {
		return expert_head_detail_addr;
	}
	public void setExpert_head_detail_addr(String expert_head_detail_addr) {
		this.expert_head_detail_addr = expert_head_detail_addr;
	}
	public String getExpert_head_tel() {
		return expert_head_tel;
	}
	public void setExpert_head_tel(String expert_head_tel) {
		this.expert_head_tel = expert_head_tel;
	}
	public String getExpert_head_fax() {
		return expert_head_fax;
	}
	public void setExpert_head_fax(String expert_head_fax) {
		this.expert_head_fax = expert_head_fax;
	}
	public String getExpert_branch_addr() {
		return expert_branch_addr;
	}
	public void setExpert_branch_addr(String expert_branch_addr) {
		this.expert_branch_addr = expert_branch_addr;
	}
	public String getExpert_branch_detail_addr() {
		return expert_branch_detail_addr;
	}
	public void setExpert_branch_detail_addr(String expert_branch_detail_addr) {
		this.expert_branch_detail_addr = expert_branch_detail_addr;
	}
	public String getExpert_branch_tel() {
		return expert_branch_tel;
	}
	public void setExpert_branch_tel(String expert_branch_tel) {
		this.expert_branch_tel = expert_branch_tel;
	}
	public String getExpert_branch_fax() {
		return expert_branch_fax;
	}
	public void setExpert_branch_fax(String expert_branch_fax) {
		this.expert_branch_fax = expert_branch_fax;
	}
	public String getExpert_est_dt() {
		return expert_est_dt;
	}
	public void setExpert_est_dt(String expert_est_dt) {
		this.expert_est_dt = expert_est_dt;
	}
	public String getExpert_capital() {
		return expert_capital;
	}
	public void setExpert_capital(String expert_capital) {
		this.expert_capital = expert_capital;
	}
	public String getExpert_reg_dt() {
		return expert_reg_dt;
	}
	public void setExpert_reg_dt(String expert_reg_dt) {
		this.expert_reg_dt = expert_reg_dt;
	}
	public String getExpert_reg_id() {
		return expert_reg_id;
	}
	public void setExpert_reg_id(String expert_reg_id) {
		this.expert_reg_id = expert_reg_id;
	}
	public String getExpert_hist_nm() {
		return expert_hist_nm;
	}
	public void setExpert_hist_nm(String expert_hist_nm) {
		this.expert_hist_nm = expert_hist_nm;
	}
	public String getExpert_hist_spec() {
		return expert_hist_spec;
	}
	public void setExpert_hist_spec(String expert_hist_spec) {
		this.expert_hist_spec = expert_hist_spec;
	}
	public String getExpert_hist_content() {
		return expert_hist_content;
	}
	public void setExpert_hist_content(String expert_hist_content) {
		this.expert_hist_content = expert_hist_content;
	}
	public String getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}
	public String getBusiness_nm() {
		return business_nm;
	}
	public void setBusiness_nm(String business_nm) {
		this.business_nm = business_nm;
	}
	public String getBusiness_ceo() {
		return business_ceo;
	}
	public void setBusiness_ceo(String business_ceo) {
		this.business_ceo = business_ceo;
	}
	public String getBusiness_com_reg_num() {
		return business_com_reg_num;
	}
	public void setBusiness_com_reg_num(String business_com_reg_num) {
		this.business_com_reg_num = business_com_reg_num;
	}
	public String getBusiness_ceo_email() {
		return business_ceo_email;
	}
	public void setBusiness_ceo_email(String business_ceo_email) {
		this.business_ceo_email = business_ceo_email;
	}
	public String getBusiness_com_reg_num1() {
		return business_com_reg_num1;
	}
	public void setBusiness_com_reg_num1(String business_com_reg_num1) {
		this.business_com_reg_num1 = business_com_reg_num1;
	}
	public String getBusiness_com_reg_num2() {
		return business_com_reg_num2;
	}
	public void setBusiness_com_reg_num2(String business_com_reg_num2) {
		this.business_com_reg_num2 = business_com_reg_num2;
	}
	public String getBusiness_com_reg_num3() {
		return business_com_reg_num3;
	}
	public void setBusiness_com_reg_num3(String business_com_reg_num3) {
		this.business_com_reg_num3 = business_com_reg_num3;
	}
	public String getBusiness_ceo_email1() {
		return business_ceo_email1;
	}
	public void setBusiness_ceo_email1(String business_ceo_email1) {
		this.business_ceo_email1 = business_ceo_email1;
	}
	public String getBusiness_ceo_email2() {
		return business_ceo_email2;
	}
	public void setBusiness_ceo_email2(String business_ceo_email2) {
		this.business_ceo_email2 = business_ceo_email2;
	}
	public String getBusiness_bus_area() {
		return business_bus_area;
	}
	public void setBusiness_bus_area(String business_bus_area) {
		this.business_bus_area = business_bus_area;
	}
	public String getBusiness_site() {
		return business_site;
	}
	public void setBusiness_site(String business_site) {
		this.business_site = business_site;
	}
	public String getBusiness_head_addr() {
		return business_head_addr;
	}
	public void setBusiness_head_addr(String business_head_addr) {
		this.business_head_addr = business_head_addr;
	}
	public String getBusiness_head_detail_addr() {
		return business_head_detail_addr;
	}
	public void setBusiness_head_detail_addr(String business_head_detail_addr) {
		this.business_head_detail_addr = business_head_detail_addr;
	}
	public String getBusiness_head_tel() {
		return business_head_tel;
	}
	public void setBusiness_head_tel(String business_head_tel) {
		this.business_head_tel = business_head_tel;
	}
	public String getBusiness_head_fax() {
		return business_head_fax;
	}
	public void setBusiness_head_fax(String business_head_fax) {
		this.business_head_fax = business_head_fax;
	}
	public String getBusiness_branch_addr() {
		return business_branch_addr;
	}
	public void setBusiness_branch_addr(String business_branch_addr) {
		this.business_branch_addr = business_branch_addr;
	}
	public String getBusiness_branch_detail_addr() {
		return business_branch_detail_addr;
	}
	public void setBusiness_branch_detail_addr(String business_branch_detail_addr) {
		this.business_branch_detail_addr = business_branch_detail_addr;
	}
	public String getBusiness_branch_tel() {
		return business_branch_tel;
	}
	public void setBusiness_branch_tel(String business_branch_tel) {
		this.business_branch_tel = business_branch_tel;
	}
	public String getBusiness_branch_fax() {
		return business_branch_fax;
	}
	public void setBusiness_branch_fax(String business_branch_fax) {
		this.business_branch_fax = business_branch_fax;
	}
	public String getBusiness_est_dt() {
		return business_est_dt;
	}
	public void setBusiness_est_dt(String business_est_dt) {
		this.business_est_dt = business_est_dt;
	}
	public String getBusiness_capital() {
		return business_capital;
	}
	public void setBusiness_capital(String business_capital) {
		this.business_capital = business_capital;
	}
	public String getBusiness_reg_dt() {
		return business_reg_dt;
	}
	public void setBusiness_reg_dt(String business_reg_dt) {
		this.business_reg_dt = business_reg_dt;
	}
	public String getBusiness_reg_id() {
		return business_reg_id;
	}
	public void setBusiness_reg_id(String business_reg_id) {
		this.business_reg_id = business_reg_id;
	}
	public String getBusiness_hist_nm() {
		return business_hist_nm;
	}
	public void setBusiness_hist_nm(String business_hist_nm) {
		this.business_hist_nm = business_hist_nm;
	}
	public String getBusiness_hist_spec() {
		return business_hist_spec;
	}
	public void setBusiness_hist_spec(String business_hist_spec) {
		this.business_hist_spec = business_hist_spec;
	}
	public String getBusiness_hist_content() {
		return business_hist_content;
	}
	public void setBusiness_hist_content(String business_hist_content) {
		this.business_hist_content = business_hist_content;
	}
	public String getBusiness_level() {
		return business_level;
	}
	public void setBusiness_level(String business_level) {
		this.business_level = business_level;
	}
	public String getDatepicker() {
		return datepicker;
	}
	public void setDatepicker(String datepicker) {
		this.datepicker = datepicker;
	}
	public String getDatepicker1() {
		return datepicker1;
	}
	public void setDatepicker1(String datepicker1) {
		this.datepicker1 = datepicker1;
	}
	public String getDatepicker2() {
		return datepicker2;
	}
	public void setDatepicker2(String datepicker2) {
		this.datepicker2 = datepicker2;
	}
	public String getSearchType1() {
		return searchType1;
	}
	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}
	public String getFacilityNm() {
		return facilityNm;
	}
	public void setFacilityNm(String facilityNm) {
		this.facilityNm = facilityNm;
	}
	public String getFacilityLoc() {
		return facilityLoc;
	}
	public void setFacilityLoc(String facilityLoc) {
		this.facilityLoc = facilityLoc;
	}
	public String getFacilityScale() {
		return facilityScale;
	}
	public void setFacilityScale(String facilityScale) {
		this.facilityScale = facilityScale;
	}
	public String getFacilityCost() {
		return facilityCost;
	}
	public void setFacilityCost(String facilityCost) {
		this.facilityCost = facilityCost;
	}
	public String getFacilityEquip() {
		return facilityEquip;
	}
	public void setFacilityEquip(String facilityEquip) {
		this.facilityEquip = facilityEquip;
	}
	public String getFacilityImg() {
		return facilityImg;
	}
	public void setFacilityImg(String facilityImg) {
		this.facilityImg = facilityImg;
	}
	public String getFacilitySt() {
		return facilitySt;
	}
	public void setFacilitySt(String facilitySt) {
		this.facilitySt = facilitySt;
	}
	public String getFacilityRegDt() {
		return facilityRegDt;
	}
	public void setFacilityRegDt(String facilityRegDt) {
		this.facilityRegDt = facilityRegDt;
	}
	public String getFacilityRegId() {
		return facilityRegId;
	}
	public void setFacilityRegId(String facilityRegId) {
		this.facilityRegId = facilityRegId;
	}
	public MultipartFile getFacilityImgFile() {
		return facilityImgFile;
	}
	public void setFacilityImgFile(MultipartFile facilityImgFile) {
		this.facilityImgFile = facilityImgFile;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getResourceNm() {
		return resourceNm;
	}
	public void setResourceNm(String resourceNm) {
		this.resourceNm = resourceNm;
	}
	public String getResourceImg() {
		return resourceImg;
	}
	public void setResourceImg(String resourceImg) {
		this.resourceImg = resourceImg;
	}
	public String getResourceSt() {
		return resourceSt;
	}
	public void setResourceSt(String resourceSt) {
		this.resourceSt = resourceSt;
	}
	public String getResourceRegDt() {
		return resourceRegDt;
	}
	public void setResourceRegDt(String resourceRegDt) {
		this.resourceRegDt = resourceRegDt;
	}
	public String getResourceRegId() {
		return resourceRegId;
	}
	public void setResourceRegId(String resourceRegId) {
		this.resourceRegId = resourceRegId;
	}
	public MultipartFile getResourceImgFile() {
		return resourceImgFile;
	}
	public void setResourceImgFile(MultipartFile resourceImgFile) {
		this.resourceImgFile = resourceImgFile;
	}
	public String getCompNm() {
		return compNm;
	}
	public void setCompNm(String compNm) {
		this.compNm = compNm;
	}
	public String getCompAddr1() {
		return compAddr1;
	}
	public void setCompAddr1(String compAddr1) {
		this.compAddr1 = compAddr1;
	}
	public String getCompAddr2() {
		return compAddr2;
	}
	public void setCompAddr2(String compAddr2) {
		this.compAddr2 = compAddr2;
	}
	public String getCompApplNm() {
		return compApplNm;
	}
	public void setCompApplNm(String compApplNm) {
		this.compApplNm = compApplNm;
	}
	public String getCompTelNo() {
		return compTelNo;
	}
	public void setCompTelNo(String compTelNo) {
		this.compTelNo = compTelNo;
	}
	public String getCompMail1() {
		return compMail1;
	}
	public void setCompMail1(String compMail1) {
		this.compMail1 = compMail1;
	}
	public String getCompMail2() {
		return compMail2;
	}
	public void setCompMail2(String compMail2) {
		this.compMail2 = compMail2;
	}

	public String getUseObj() {
		return useObj;
	}
	public void setUseObj(String useObj) {
		this.useObj = useObj;
	}
	public String getUseFrDt() {
		return useFrDt;
	}
	public void setUseFrDt(String useFrDt) {
		this.useFrDt = useFrDt;
	}
	public String getUseFrTm() {
		return useFrTm;
	}
	public void setUseFrTm(String useFrTm) {
		this.useFrTm = useFrTm;
	}
	public String getUseToDt() {
		return useToDt;
	}
	public void setUseToDt(String useToDt) {
		this.useToDt = useToDt;
	}
	public String getUseToTm() {
		return useToTm;
	}
	public void setUseToTm(String useToTm) {
		this.useToTm = useToTm;
	}
	public int getUsePersNum() {
		return usePersNum;
	}
	public void setUsePersNum(int usePersNum) {
		this.usePersNum = usePersNum;
	}
	public String getResourFaciDiviCd() {
		return resourFaciDiviCd;
	}
	public void setResourFaciDiviCd(String resourFaciDiviCd) {
		this.resourFaciDiviCd = resourFaciDiviCd;
	}
	public String getCalYn() {
		return calYn;
	}
	public void setCalYn(String calYn) {
		this.calYn = calYn;
	}
	public String getUseDate() {
		return useDate;
	}
	public String getAppliNo() {
		return appliNo;
	}
	public void setAppliNo(String appliNo) {
		this.appliNo = appliNo;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

}
