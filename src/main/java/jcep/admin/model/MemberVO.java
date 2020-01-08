package jcep.admin.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : MemberVO.java
 * @Description : MemberVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.10           최초생성
 *
 * @since 2019.06.10
 * @version 1.0
 * @see
 *
 */
public class MemberVO extends PagingVO {

	private static final long serialVersionUID = 1L;

	private String searchType;
	private String searchText;
	private String searchText1;
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
	private String memberMytel1;
	private String memberMytel2;
	private String memberMytel3;
	private String memberFax;
	private String memberFax1;
	private String memberFax2;
	private String memberFax3;
	private String memberMyaddr;
	private String memberMyaddr1;
	private String memberMyfax;
	private String memberHp1;
	private String memberHp2;
	private String memberHp3;
	private String memberHomepage;
	private String memberRegistrationNumber;
	
	
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
	private String mainphone1;
	private String mainphone2;
	private String mainphone3;
	private String fax;
	private String fax1;
	private String fax2;
	private String fax3;
	private String address;
	private String touchmoney;
	private String capital;
	private String employees;
	private String establishmentdate;
	private String remarks;
	private String registrationnumber;
	
	
	private String performance;
	private String quarteryear;
	private String touch;
	private String support;
	
	private String projectprogressnumber;
	private String projectname;
	private String projectprogress;
	private String projectperiod;
	private String projectcosts;
	private String projectprogressstatus;
	
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
	
	// 20191108 MemberVO 부분에 FacilityResourceFrontVO 관련 컬럼 추가
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
	
	// 20191113 신승원 회원정보
	private String joinDt;
	private String joinTypeCd;
	private String joinTypeCdNm;
	private String memberStCd;
	private String regDt;
	private String entprRespsibNm;
	
	// 20191113 신승원 기업정보
	private String entprRespsibHpNo;
	private String entprRespsibEmail;
	private String entprNm;
	private String entprCeo;
	private String entprCeoEmail;
	private String entprTypeNm;
	private String entprComRegNum;
	private String largeBussAreaCd;
	private String mediumBussAreaCd;
	private String entprSite;
	private String entprHeadAddr;
	private String entprHeadDetailAddr;
	private String entprHeadTel;
	private String entprHeadTel1;
	private String entprHeadTel2;
	private String entprHeadTel3;
	private String entprHeadFax;
	private String entprHeadFax1;
	private String entprHeadFax2;
	private String entprHeadFax3;
	private String entprBranchAddr;
	private String entprBranchDetailAddr;
	private String entprBranchTel;
	private String entprBranchTel1;
	private String entprBranchTel2;
	private String entprBranchTel3;
	private String entprBranchFax;
	private String entprBranchFax1;
	private String entprBranchFax2;
	private String entprBranchFax3;
	private String entprEstDt;
	private String entprCapitalAmt;
	private String moveinYn;
	private String moveinDt;
	
	// 20191113 신승원 기업성과정보
	private String entprResultYearCd;
	private String entprResultQtaCd;
	private String entprResultTakeAmt;	//20191210 최선권 int -> Stirng 변경 
	private int entprResultEmpCnt;

	// 20191113 기업지적재산권정보
	private String enterpriseIdx;	
	private String ntltProptBussNm;  
	private String ntltProptPerfNm;   
	private String intltProptCd;	
	private String regFormCd;	
	private String regNationCd;	
	private String intltProptRegNo;    
	private String intltProptyDt;	
	private String regId;

	// 20191113 신승원 바이어정보
	private String buyerNm;				
	private String buyerEnm;				
	private String companyNm;			
	private String buyerCeo;				
	private String buyerComRegNum;		
	private String buyerCeoEmail;
	private String buyerBusAreaCd;			
	private String buyerSite;				
	private String buyerHeadAddr;			
	private String buyerHeadDetailAddr;		
	private String buyerHeadTel;					
	private String buyerHeadTel1;		
	private String buyerHeadTel2;		
	private String buyerHeadTel3;
	private String buyerHeadFax;	
	private String buyerHeadFax1;
	private String buyerHeadFax2;
	private String buyerHeadFax3;		
	private String buyerBranchAddr;		
	private String buyerBranchDetailAddr;	
	private String buyerBranchTel;	
	private String buyerBranchTel1;
	private String buyerBranchTel2;	
	private String buyerBranchTel3;
	private String buyerBranchFax;
	private String buyerBranchFax1;
	private String buyerBranchFax2;
	private String buyerBranchFax3;			
	private String buyerEstDt;			
	private String buyerCapitalAmt;		

	// 20191113 신승원 바이어히스토리
	private String buyerHistIdx;		
	private String buyerHistNm;		
	private String buyerHistInvt;		
	private String buyerHistSpecCd;		
	private String buyerHistDt;		
	private String buyerHistContent;	
	private String processCd;			

	// 20191113 신승원 전문가정보
	private String expertNm;					
	private String expertEmail;				
	private String expertGender;			
	private String expertCareerNum;			
	private String largeSpecialAreaCd;			
	private String mediumSpecialAreaCd;		
	private String detailSpecialAreaCd;			
	private String expertInterestAreaCd;		
	private String expertDetailIntrtAreaCd;		
	private String expertIndsEduCd;			
	private String expertStRegNo;				
	private String expertRegNo;				
	private String expertFinalSchoolNm;			
	private String expertMajorNm;				
	private String expertFnalEduNm;			
	private String expertHeadAddrNm;			
	private String expertDptmNm;				
	private String expertOffiDutyNm;			
	private String expertOffiAddr;				
	private String expertOffiDetailAddr;			
	private String expertOffiTel;	
	private String expertOffiTel1;	
	private String expertOffiTel2;
	private String expertOffiTel3;
	private String expertOffiFax;
	private String expertOffiFax1;
	private String expertOffiFax2;
	private String expertOffiFax3;			
	private String expertHeadTel;			
	private String expertHeadTel1;			
	private String expertHeadTel2;			
	private String expertHeadTel3;				
	private String expertHomeAddr;			
	private String expertHomeDetailAddr;		
	private String benefitBankCd;			
	private String benefitAccntNo;			
	private String benefitBirthDt;			
	private String benefitRespsibHpNo;		
	private String fileCourse;				
	private String orgFileNm;				
	private String uploadFileNm;
	private String expertFnalEduCd;
	
	// 20191113 신승원 전문가심의이력정보
	private String expertHistIdx;	
	private String expertDelibrDt;
	private String expertDelibrTitle;
	
	// 20191113 신승원 기업사업진행정보
	private String entprBussProStusNm;
	private String entprBussProStusCont;
	
	// 20191113 신승원 기업사원정보
	private String entprEmployeeNm;
	private String entprEmployeeDept;
	private String entprEmployeePosition;
	private String entprEmployeeEmail;
	private String entprEmployeePhone;
	
	// 20191113 신승원 기업진흥원수해사업진행정보
	private String bussAnncemntNo;	
	private int entprCreatJobCnt;	
	private String entprBussYn;		
	
	// 20191113 신승원 사업공고정보
	private String bussAnncemntNm;	
	private String bussFrDt;			
	private String bussToDt;			
	private int bussCostAmt;		
	private String bussDeptCd;		
	private String originalUrl;			
	private String bussCont;			
	private String bussDiviCd;		
	
	// 20191113 신승원 기업진흥원수해사업진행첨부파일
	private String attchFileNo;	

	// 20191113 신승원 사업공고첨부파일정보
	
	// 20191113 신승원 평가위원추출정보
	private String selectNo;		
	private String selectTitle;		
	private String selectDt;		
	private String evaluationDt;	
	private int evaluationCnt;	
	
	// 20191113 신승원 평가위원분류정보
	private String selectClassCd;
	
	// 20191113 신승원 평가위원추출상세정보
	private String attendYn;

	// 20191113 신승원 지원사업수해실적정보
	private String benefitPerformNm;	
	private int empCreateStaff;		

	// 20191113 신승원 지원정보
	private String resourFaciId;
	private String resourceMngDeptCd;
	private String resourceStCd;

	// 20191113 신승원 지적재산권현황정보
	private String intltProptyNm;
	private String intltProptPerfNm;

	// 20191113 신승원 지원시설신청정보
	private String appliNo;			
	private String resourFaciDiviCd;	
	private String compNm;			
	private String compAddr1;		
	private String compAddr2;		
	private String compTelNo;		
	private String compMail;			
	private int usePersNum;		
	private String useObj;			
	private String useFrDt;			
	private String useFrTm;			
	private String useToDt;			
	private String useToTm;			
	private String applicStCd;

	// 20191113 신승원 콘텐츠제작지원실적정보
	private String contentPerformNm;	
	private String contentDiviCd;		
	private String contentNm	;
	
	// 20191113 신승원 원스톱지원신청정보
	private String onestopSupportNo;	
	private String applicatDt;
	private String proMemberId;
	private String suppBussAreaCd;
	private String bussAreaOthers;
	private int compEmplCnt;		
	private String compApplNm;
	private String compPosit;
	private String compFaxNo;
	private String compFaxNo1;
	private String compFaxNo2;
	private String compFaxNo3;
	private String compHpNo;
	private String compHpNo1;
	private String compHpNo2;
	private String compHpNo3;
	private String adviceHopeDt;
	private String advicePlaceCd;
	private String adviceAreaCd;
	private String adviceApplicCont;
	
	// 20191113 신승원 기업유치창업현황정보
	private String bussAttractNm;
	private String entprType;

	// 20191113 신승원 자원정보

	// 20191113 신승원 시설정보
	private String facilityMngDeptCd;
	private String facilityFuncCd;
	private String facilityStCd;

	// 20191114 신승원 관리자정보
	private String mngNo;
	private String mngPw;
	private String mngId;
	private String[] mngId1;
	private String mngNm;
	private String authTpCd;
	private String mngTel;
	private String mngCel;
	private String mngFlag;
	private String mngAddr;
	private String mngHp;
	private String mngEmail;
	private String mngBelong;

	//20191114 최선권 페이지번호 변수 추가
	private int pageNum;
	private String fileCourse2;
	private String orgFileNm2;
	private String uploadFileNm2;

	private String idCnt;
	
	// 20191119 신승원 추가
	private String memberCeo;
	private String memberHeadTel;
	

	// 20191030 파일 관련 추가
	private int file_no;
	private String file_name_key;
	private String file_name;
	private String file_path;
	private String file_size;
	private String remark;
	private String del_yn;
	private String ins_user_nm;
	private String ins_date;
	private String upd_user_id;
	private Date upd_date;
	private MultipartFile noticeFiles;
	
	
	// 20191120 공통코드, 공지사항, 첨부파일정보, 
	// 추후 작업 해야 함 팝업정보, 관리자정보, 관리자로그, 접속로그정보, 메뉴권한, 메뉴소분류, 메뉴중분류, 메뉴대분류 추가
	private String groupCd;
	private String groupNm;
	private String commonCd;
	private String commonNm;
	private String commonEnm;
	private String orderNbr;
	private String useFlag;
	
	private String noticeIdx;
	private String noticeTitle;
	private String noticeCont;
	private String noticeOpenYn;
	private String noticeImptYn;
	
	private String cntpartNo;
	
	private String tableName;
	
	// 20191126 문의사항, 자주하는질문사항 추가
	private String questionIdx;
	private String questionTitle;
	private String writeNm;
	private String writeDt;
	private String questionCont;
	private String questionPw;
	private String answerCont;
	private String totcnt;

	private String faqIdx;
	private String faqTitle;
	private String faqCont;
	private String faqOpenYn;
	
	

	private String enterpriseId;
	private String enterpriseNm;
	private String enterpriseCeo;
	private String enterpriseComRegNum;
	private String enterpriseCeoEmail;
	private String enterpriseBusArea;
	private String enterpriseSite;
	private String enterpriseType;
	private String enterpriseEmpCnt;
	private String enterpriseHeadAddr;
	private String enterpriseHeadDetailAddr;
	private String enterpriseHeadTel;
	private String enterpriseHeadFax;
	private String enterpriseBranchAddr;
	private String enterpriseBranchDetailAddr;
	private String enterpriseBranchTel;
	private String enterpriseBranchFax;
	private String enterpriseEstDt;
	private String enterpriseCapital;
	private String enterpriseRegDt;
	private String enterpriseRegId;
	
	private String enterpriseResultIdx;
	private String enterpriseResultYear;
	private String enterpriseResultQta;
	private String enterpriseResultCapital;
	private String enterpriseResultTake;
	private String enterpriseResultEmpCnt;
	private String enterpriseResultRegDt;
	private String enterpriseResultRegId;
	
	private String enterpriseBusProStusIdx;
	private String enterpriseBusProStusNm;
	private String enterpriseBusProStusCon;
	private String enterpriseBusProStusStrDt;
	private String enterpriseBusProStusEndDt;
	private String enterpriseBusProStusExp;
	private String enterpriseBusProStusSt;
	private String enterpriseBusProStusRegDt;
	private String enterpriseBusProStusRegId;
	
	private String enterpriseEmployeeIdx;
	private String enterpriseEmployeeNm;
	private String enterpriseEmployeeDept;
	private String enterpriseEmployeePosition;
	private String enterpriseEmployeeId;
	private String enterpriseEmployeeEmail;
	private String enterpriseEmployeePhone;
	private String enterpriseEmployeRegDt;
	private String enterpriseEmployeRegId;
	
	//바이어정보 관리
	private List<EnterpriseBuyerExpertVO> list;
	private String buyerId;
	private String buyerCapital;
	private String buyerRegDt;
	private String buyerRegId;
	
	private String buyerHistIdData;
	private String buyerHistIdxData;
	private String buyerHistNmData;
	private String buyerHistInvtData;
	private String buyerHistSpecCdData;
	private String buyerHistDtData;
	private String buyerHistContentData;
	private String buyerHistProData;
	private String buyerHistRegDtData;
	private String buyerHistRegIdData;
	
	private String[] buyerHistId;
	private String[] buyerHistPro;
	private String[] buyerHistRegDt;
	private String[] buyerHistRegId; 
	
	/*	20191202 최선권 사업공고신청정보 업데이트*/	
	private String approvalDt;
	
	private String selboxDirect;
	private String selboxDirect1;
	
	private String entprRespsibEmail1;
	private String entprCeoEmail1;
	

	private String authTpCdValue;
	private String authTpCdText;
	
	private String Y;
	private String N;
	
	private String fileCouse;
	private String fileOriginName;
	
	
	private String updateFrm;
	
	private String buyerHistSpecNm;
	
	
	
	
	public String getBuyerHistSpecNm() {
		return buyerHistSpecNm;
	}
	public void setBuyerHistSpecNm(String buyerHistSpecNm) {
		this.buyerHistSpecNm = buyerHistSpecNm;
	}
	public String getUpdateFrm() {
		return updateFrm;
	}
	public void setUpdateFrm(String updateFrm) {
		this.updateFrm = updateFrm;
	}
	public String getFileCouse() {
		return fileCouse;
	}
	public void setFileCouse(String fileCouse) {
		this.fileCouse = fileCouse;
	}
	public String getFileOriginName() {
		return fileOriginName;
	}
	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	public String getY() {
		return Y;
	}
	public void setY(String y) {
		Y = y;
	}
	public String getN() {
		return N;
	}
	public void setN(String n) {
		N = n;
	}
	public String getAuthTpCdText() {
		return authTpCdText;
	}
	public void setAuthTpCdText(String authTpCdText) {
		this.authTpCdText = authTpCdText;
	}
	public String getAuthTpCdValue() {
		return authTpCdValue;
	}
	public void setAuthTpCdValue(String authTpCdValue) {
		this.authTpCdValue = authTpCdValue;
	}
	public String getEntprRespsibEmail1() {
		return entprRespsibEmail1;
	}
	public void setEntprRespsibEmail1(String entprRespsibEmail1) {
		this.entprRespsibEmail1 = entprRespsibEmail1;
	}
	public String getEntprCeoEmail1() {
		return entprCeoEmail1;
	}
	public void setEntprCeoEmail1(String entprCeoEmail1) {
		this.entprCeoEmail1 = entprCeoEmail1;
	}
	public String getSelboxDirect() {
		return selboxDirect;
	}
	public void setSelboxDirect(String selboxDirect) {
		this.selboxDirect = selboxDirect;
	}
	public String getSelboxDirect1() {
		return selboxDirect1;
	}
	public void setSelboxDirect1(String selboxDirect1) {
		this.selboxDirect1 = selboxDirect1;
	}
	public String getEnterpriseId() {
		return enterpriseId;
	}
	public void setEnterpriseId(String enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	public String getEnterpriseNm() {
		return enterpriseNm;
	}
	public void setEnterpriseNm(String enterpriseNm) {
		this.enterpriseNm = enterpriseNm;
	}
	public String getEnterpriseCeo() {
		return enterpriseCeo;
	}
	public void setEnterpriseCeo(String enterpriseCeo) {
		this.enterpriseCeo = enterpriseCeo;
	}
	public String getEnterpriseComRegNum() {
		return enterpriseComRegNum;
	}
	public void setEnterpriseComRegNum(String enterpriseComRegNum) {
		this.enterpriseComRegNum = enterpriseComRegNum;
	}
	public String getEnterpriseCeoEmail() {
		return enterpriseCeoEmail;
	}
	public void setEnterpriseCeoEmail(String enterpriseCeoEmail) {
		this.enterpriseCeoEmail = enterpriseCeoEmail;
	}
	public String getEnterpriseBusArea() {
		return enterpriseBusArea;
	}
	public void setEnterpriseBusArea(String enterpriseBusArea) {
		this.enterpriseBusArea = enterpriseBusArea;
	}
	public String getEnterpriseSite() {
		return enterpriseSite;
	}
	public void setEnterpriseSite(String enterpriseSite) {
		this.enterpriseSite = enterpriseSite;
	}
	public String getEnterpriseType() {
		return enterpriseType;
	}
	public void setEnterpriseType(String enterpriseType) {
		this.enterpriseType = enterpriseType;
	}
	public String getEnterpriseEmpCnt() {
		return enterpriseEmpCnt;
	}
	public void setEnterpriseEmpCnt(String enterpriseEmpCnt) {
		this.enterpriseEmpCnt = enterpriseEmpCnt;
	}
	public String getEnterpriseHeadAddr() {
		return enterpriseHeadAddr;
	}
	public void setEnterpriseHeadAddr(String enterpriseHeadAddr) {
		this.enterpriseHeadAddr = enterpriseHeadAddr;
	}
	public String getEnterpriseHeadDetailAddr() {
		return enterpriseHeadDetailAddr;
	}
	public void setEnterpriseHeadDetailAddr(String enterpriseHeadDetailAddr) {
		this.enterpriseHeadDetailAddr = enterpriseHeadDetailAddr;
	}
	public String getEnterpriseHeadTel() {
		return enterpriseHeadTel;
	}
	public void setEnterpriseHeadTel(String enterpriseHeadTel) {
		this.enterpriseHeadTel = enterpriseHeadTel;
	}
	public String getEnterpriseHeadFax() {
		return enterpriseHeadFax;
	}
	public void setEnterpriseHeadFax(String enterpriseHeadFax) {
		this.enterpriseHeadFax = enterpriseHeadFax;
	}
	public String getEnterpriseBranchAddr() {
		return enterpriseBranchAddr;
	}
	public void setEnterpriseBranchAddr(String enterpriseBranchAddr) {
		this.enterpriseBranchAddr = enterpriseBranchAddr;
	}
	public String getEnterpriseBranchDetailAddr() {
		return enterpriseBranchDetailAddr;
	}
	public void setEnterpriseBranchDetailAddr(String enterpriseBranchDetailAddr) {
		this.enterpriseBranchDetailAddr = enterpriseBranchDetailAddr;
	}
	public String getEnterpriseBranchTel() {
		return enterpriseBranchTel;
	}
	public void setEnterpriseBranchTel(String enterpriseBranchTel) {
		this.enterpriseBranchTel = enterpriseBranchTel;
	}
	public String getEnterpriseBranchFax() {
		return enterpriseBranchFax;
	}
	public void setEnterpriseBranchFax(String enterpriseBranchFax) {
		this.enterpriseBranchFax = enterpriseBranchFax;
	}
	public String getEnterpriseEstDt() {
		return enterpriseEstDt;
	}
	public void setEnterpriseEstDt(String enterpriseEstDt) {
		this.enterpriseEstDt = enterpriseEstDt;
	}
	public String getEnterpriseCapital() {
		return enterpriseCapital;
	}
	public void setEnterpriseCapital(String enterpriseCapital) {
		this.enterpriseCapital = enterpriseCapital;
	}
	public String getEnterpriseRegDt() {
		return enterpriseRegDt;
	}
	public void setEnterpriseRegDt(String enterpriseRegDt) {
		this.enterpriseRegDt = enterpriseRegDt;
	}
	public String getEnterpriseRegId() {
		return enterpriseRegId;
	}
	public void setEnterpriseRegId(String enterpriseRegId) {
		this.enterpriseRegId = enterpriseRegId;
	}
	public String getEnterpriseResultIdx() {
		return enterpriseResultIdx;
	}
	public void setEnterpriseResultIdx(String enterpriseResultIdx) {
		this.enterpriseResultIdx = enterpriseResultIdx;
	}
	public String getEnterpriseResultYear() {
		return enterpriseResultYear;
	}
	public void setEnterpriseResultYear(String enterpriseResultYear) {
		this.enterpriseResultYear = enterpriseResultYear;
	}
	public String getEnterpriseResultQta() {
		return enterpriseResultQta;
	}
	public void setEnterpriseResultQta(String enterpriseResultQta) {
		this.enterpriseResultQta = enterpriseResultQta;
	}
	public String getEnterpriseResultCapital() {
		return enterpriseResultCapital;
	}
	public void setEnterpriseResultCapital(String enterpriseResultCapital) {
		this.enterpriseResultCapital = enterpriseResultCapital;
	}
	public String getEnterpriseResultTake() {
		return enterpriseResultTake;
	}
	public void setEnterpriseResultTake(String enterpriseResultTake) {
		this.enterpriseResultTake = enterpriseResultTake;
	}
	public String getEnterpriseResultEmpCnt() {
		return enterpriseResultEmpCnt;
	}
	public void setEnterpriseResultEmpCnt(String enterpriseResultEmpCnt) {
		this.enterpriseResultEmpCnt = enterpriseResultEmpCnt;
	}
	public String getEnterpriseResultRegDt() {
		return enterpriseResultRegDt;
	}
	public void setEnterpriseResultRegDt(String enterpriseResultRegDt) {
		this.enterpriseResultRegDt = enterpriseResultRegDt;
	}
	public String getEnterpriseResultRegId() {
		return enterpriseResultRegId;
	}
	public void setEnterpriseResultRegId(String enterpriseResultRegId) {
		this.enterpriseResultRegId = enterpriseResultRegId;
	}
	public String getEnterpriseBusProStusIdx() {
		return enterpriseBusProStusIdx;
	}
	public void setEnterpriseBusProStusIdx(String enterpriseBusProStusIdx) {
		this.enterpriseBusProStusIdx = enterpriseBusProStusIdx;
	}
	public String getEnterpriseBusProStusNm() {
		return enterpriseBusProStusNm;
	}
	public void setEnterpriseBusProStusNm(String enterpriseBusProStusNm) {
		this.enterpriseBusProStusNm = enterpriseBusProStusNm;
	}
	public String getEnterpriseBusProStusCon() {
		return enterpriseBusProStusCon;
	}
	public void setEnterpriseBusProStusCon(String enterpriseBusProStusCon) {
		this.enterpriseBusProStusCon = enterpriseBusProStusCon;
	}
	public String getEnterpriseBusProStusStrDt() {
		return enterpriseBusProStusStrDt;
	}
	public void setEnterpriseBusProStusStrDt(String enterpriseBusProStusStrDt) {
		this.enterpriseBusProStusStrDt = enterpriseBusProStusStrDt;
	}
	public String getEnterpriseBusProStusEndDt() {
		return enterpriseBusProStusEndDt;
	}
	public void setEnterpriseBusProStusEndDt(String enterpriseBusProStusEndDt) {
		this.enterpriseBusProStusEndDt = enterpriseBusProStusEndDt;
	}
	public String getEnterpriseBusProStusExp() {
		return enterpriseBusProStusExp;
	}
	public void setEnterpriseBusProStusExp(String enterpriseBusProStusExp) {
		this.enterpriseBusProStusExp = enterpriseBusProStusExp;
	}
	public String getEnterpriseBusProStusSt() {
		return enterpriseBusProStusSt;
	}
	public void setEnterpriseBusProStusSt(String enterpriseBusProStusSt) {
		this.enterpriseBusProStusSt = enterpriseBusProStusSt;
	}
	public String getEnterpriseBusProStusRegDt() {
		return enterpriseBusProStusRegDt;
	}
	public void setEnterpriseBusProStusRegDt(String enterpriseBusProStusRegDt) {
		this.enterpriseBusProStusRegDt = enterpriseBusProStusRegDt;
	}
	public String getEnterpriseBusProStusRegId() {
		return enterpriseBusProStusRegId;
	}
	public void setEnterpriseBusProStusRegId(String enterpriseBusProStusRegId) {
		this.enterpriseBusProStusRegId = enterpriseBusProStusRegId;
	}
	public String getEnterpriseEmployeeIdx() {
		return enterpriseEmployeeIdx;
	}
	public void setEnterpriseEmployeeIdx(String enterpriseEmployeeIdx) {
		this.enterpriseEmployeeIdx = enterpriseEmployeeIdx;
	}
	public String getEnterpriseEmployeeNm() {
		return enterpriseEmployeeNm;
	}
	public void setEnterpriseEmployeeNm(String enterpriseEmployeeNm) {
		this.enterpriseEmployeeNm = enterpriseEmployeeNm;
	}
	public String getEnterpriseEmployeeDept() {
		return enterpriseEmployeeDept;
	}
	public void setEnterpriseEmployeeDept(String enterpriseEmployeeDept) {
		this.enterpriseEmployeeDept = enterpriseEmployeeDept;
	}
	public String getEnterpriseEmployeePosition() {
		return enterpriseEmployeePosition;
	}
	public void setEnterpriseEmployeePosition(String enterpriseEmployeePosition) {
		this.enterpriseEmployeePosition = enterpriseEmployeePosition;
	}
	public String getEnterpriseEmployeeId() {
		return enterpriseEmployeeId;
	}
	public void setEnterpriseEmployeeId(String enterpriseEmployeeId) {
		this.enterpriseEmployeeId = enterpriseEmployeeId;
	}
	public String getEnterpriseEmployeeEmail() {
		return enterpriseEmployeeEmail;
	}
	public void setEnterpriseEmployeeEmail(String enterpriseEmployeeEmail) {
		this.enterpriseEmployeeEmail = enterpriseEmployeeEmail;
	}
	public String getEnterpriseEmployeePhone() {
		return enterpriseEmployeePhone;
	}
	public void setEnterpriseEmployeePhone(String enterpriseEmployeePhone) {
		this.enterpriseEmployeePhone = enterpriseEmployeePhone;
	}
	public String getEnterpriseEmployeRegDt() {
		return enterpriseEmployeRegDt;
	}
	public void setEnterpriseEmployeRegDt(String enterpriseEmployeRegDt) {
		this.enterpriseEmployeRegDt = enterpriseEmployeRegDt;
	}
	public String getEnterpriseEmployeRegId() {
		return enterpriseEmployeRegId;
	}
	public void setEnterpriseEmployeRegId(String enterpriseEmployeRegId) {
		this.enterpriseEmployeRegId = enterpriseEmployeRegId;
	}
	public List<EnterpriseBuyerExpertVO> getList() {
		return list;
	}
	public void setList(List<EnterpriseBuyerExpertVO> list) {
		this.list = list;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyerCapital() {
		return buyerCapital;
	}
	public void setBuyerCapital(String buyerCapital) {
		this.buyerCapital = buyerCapital;
	}
	public String getBuyerRegDt() {
		return buyerRegDt;
	}
	public void setBuyerRegDt(String buyerRegDt) {
		this.buyerRegDt = buyerRegDt;
	}
	public String getBuyerRegId() {
		return buyerRegId;
	}
	public void setBuyerRegId(String buyerRegId) {
		this.buyerRegId = buyerRegId;
	}
	public String getBuyerHistIdData() {
		return buyerHistIdData;
	}
	public void setBuyerHistIdData(String buyerHistIdData) {
		this.buyerHistIdData = buyerHistIdData;
	}
	public String getBuyerHistIdxData() {
		return buyerHistIdxData;
	}
	public void setBuyerHistIdxData(String buyerHistIdxData) {
		this.buyerHistIdxData = buyerHistIdxData;
	}
	public String getBuyerHistNmData() {
		return buyerHistNmData;
	}
	public void setBuyerHistNmData(String buyerHistNmData) {
		this.buyerHistNmData = buyerHistNmData;
	}
	public String getBuyerHistInvtData() {
		return buyerHistInvtData;
	}
	public void setBuyerHistInvtData(String buyerHistInvtData) {
		this.buyerHistInvtData = buyerHistInvtData;
	}
	public String getBuyerHistSpecCdData() {
		return buyerHistSpecCdData;
	}
	public void setBuyerHistSpecCdData(String buyerHistSpecCdData) {
		this.buyerHistSpecCdData = buyerHistSpecCdData;
	}
	public String getBuyerHistDtData() {
		return buyerHistDtData;
	}
	public void setBuyerHistDtData(String buyerHistDtData) {
		this.buyerHistDtData = buyerHistDtData;
	}
	public String getBuyerHistContentData() {
		return buyerHistContentData;
	}
	public void setBuyerHistContentData(String buyerHistContentData) {
		this.buyerHistContentData = buyerHistContentData;
	}
	public String getBuyerHistProData() {
		return buyerHistProData;
	}
	public void setBuyerHistProData(String buyerHistProData) {
		this.buyerHistProData = buyerHistProData;
	}
	public String getBuyerHistRegDtData() {
		return buyerHistRegDtData;
	}
	public void setBuyerHistRegDtData(String buyerHistRegDtData) {
		this.buyerHistRegDtData = buyerHistRegDtData;
	}
	public String getBuyerHistRegIdData() {
		return buyerHistRegIdData;
	}
	public void setBuyerHistRegIdData(String buyerHistRegIdData) {
		this.buyerHistRegIdData = buyerHistRegIdData;
	}
	public String[] getBuyerHistId() {
		return buyerHistId;
	}
	public void setBuyerHistId(String[] buyerHistId) {
		this.buyerHistId = buyerHistId;
	}
	public String[] getBuyerHistPro() {
		return buyerHistPro;
	}
	public void setBuyerHistPro(String[] buyerHistPro) {
		this.buyerHistPro = buyerHistPro;
	}
	public String[] getBuyerHistRegDt() {
		return buyerHistRegDt;
	}
	public void setBuyerHistRegDt(String[] buyerHistRegDt) {
		this.buyerHistRegDt = buyerHistRegDt;
	}
	public String[] getBuyerHistRegId() {
		return buyerHistRegId;
	}
	public void setBuyerHistRegId(String[] buyerHistRegId) {
		this.buyerHistRegId = buyerHistRegId;
	}
	public String getTotcnt() {
		return totcnt;
	}
	public void setTotcnt(String totcnt) {
		this.totcnt = totcnt;
	}
	public String getMemberMytel1() {
		return memberMytel1;
	}
	public void setMemberMytel1(String memberMytel1) {
		this.memberMytel1 = memberMytel1;
	}
	public String getMemberMytel2() {
		return memberMytel2;
	}
	public void setMemberMytel2(String memberMytel2) {
		this.memberMytel2 = memberMytel2;
	}
	public String getMemberMytel3() {
		return memberMytel3;
	}
	public void setMemberMytel3(String memberMytel3) {
		this.memberMytel3 = memberMytel3;
	}
	public String getMemberFax1() {
		return memberFax1;
	}
	public void setMemberFax1(String memberFax1) {
		this.memberFax1 = memberFax1;
	}
	public String getMemberFax2() {
		return memberFax2;
	}
	public void setMemberFax2(String memberFax2) {
		this.memberFax2 = memberFax2;
	}
	public String getMemberFax3() {
		return memberFax3;
	}
	public void setMemberFax3(String memberFax3) {
		this.memberFax3 = memberFax3;
	}
	public String getMainphone1() {
		return mainphone1;
	}
	public void setMainphone1(String mainphone1) {
		this.mainphone1 = mainphone1;
	}
	public String getMainphone2() {
		return mainphone2;
	}
	public void setMainphone2(String mainphone2) {
		this.mainphone2 = mainphone2;
	}
	public String getMainphone3() {
		return mainphone3;
	}
	public void setMainphone3(String mainphone3) {
		this.mainphone3 = mainphone3;
	}
	public String getFax1() {
		return fax1;
	}
	public void setFax1(String fax1) {
		this.fax1 = fax1;
	}
	public String getFax2() {
		return fax2;
	}
	public void setFax2(String fax2) {
		this.fax2 = fax2;
	}
	public String getFax3() {
		return fax3;
	}
	public void setFax3(String fax3) {
		this.fax3 = fax3;
	}
	public String getEntprHeadTel1() {
		return entprHeadTel1;
	}
	public void setEntprHeadTel1(String entprHeadTel1) {
		this.entprHeadTel1 = entprHeadTel1;
	}
	public String getEntprHeadFax1() {
		return entprHeadFax1;
	}
	public void setEntprHeadFax1(String entprHeadFax1) {
		this.entprHeadFax1 = entprHeadFax1;
	}
	public String getEntprBranchTel1() {
		return entprBranchTel1;
	}
	public void setEntprBranchTel1(String entprBranchTel1) {
		this.entprBranchTel1 = entprBranchTel1;
	}
	public String getEntprBranchFax1() {
		return entprBranchFax1;
	}
	public void setEntprBranchFax1(String entprBranchFax1) {
		this.entprBranchFax1 = entprBranchFax1;
	}
	public String getBuyerHeadTel1() {
		return buyerHeadTel1;
	}
	public void setBuyerHeadTel1(String buyerHeadTel1) {
		this.buyerHeadTel1 = buyerHeadTel1;
	}
	public String getBuyerHeadFax1() {
		return buyerHeadFax1;
	}
	public void setBuyerHeadFax1(String buyerHeadFax1) {
		this.buyerHeadFax1 = buyerHeadFax1;
	}
	public String getBuyerBranchTel1() {
		return buyerBranchTel1;
	}
	public void setBuyerBranchTel1(String buyerBranchTel1) {
		this.buyerBranchTel1 = buyerBranchTel1;
	}
	public String getBuyerBranchFax1() {
		return buyerBranchFax1;
	}
	public void setBuyerBranchFax1(String buyerBranchFax1) {
		this.buyerBranchFax1 = buyerBranchFax1;
	}
	public String getExpertOffiTel3() {
		return expertOffiTel3;
	}
	public void setExpertOffiTel3(String expertOffiTel3) {
		this.expertOffiTel3 = expertOffiTel3;
	}
	public String getExpertOffiFax1() {
		return expertOffiFax1;
	}
	public void setExpertOffiFax1(String expertOffiFax1) {
		this.expertOffiFax1 = expertOffiFax1;
	}
	public String getExpertHeadTel1() {
		return expertHeadTel1;
	}
	public void setExpertHeadTel1(String expertHeadTel1) {
		this.expertHeadTel1 = expertHeadTel1;
	}
	public String getCompFaxNo1() {
		return compFaxNo1;
	}
	public void setCompFaxNo1(String compFaxNo1) {
		this.compFaxNo1 = compFaxNo1;
	}
	public String getCompFaxNo2() {
		return compFaxNo2;
	}
	public void setCompFaxNo2(String compFaxNo2) {
		this.compFaxNo2 = compFaxNo2;
	}
	public String getCompFaxNo3() {
		return compFaxNo3;
	}
	public void setCompFaxNo3(String compFaxNo3) {
		this.compFaxNo3 = compFaxNo3;
	}
	public String getCompHpNo1() {
		return compHpNo1;
	}
	public void setCompHpNo1(String compHpNo1) {
		this.compHpNo1 = compHpNo1;
	}
	public String getCompHpNo2() {
		return compHpNo2;
	}
	public void setCompHpNo2(String compHpNo2) {
		this.compHpNo2 = compHpNo2;
	}
	public String getCompHpNo3() {
		return compHpNo3;
	}
	public void setCompHpNo3(String compHpNo3) {
		this.compHpNo3 = compHpNo3;
	}
	public String getEntprHeadTel2() {
		return entprHeadTel2;
	}
	public void setEntprHeadTel2(String entprHeadTel2) {
		this.entprHeadTel2 = entprHeadTel2;
	}
	public String getEntprHeadTel3() {
		return entprHeadTel3;
	}
	public void setEntprHeadTel3(String entprHeadTel3) {
		this.entprHeadTel3 = entprHeadTel3;
	}
	public String getEntprHeadFax2() {
		return entprHeadFax2;
	}
	public void setEntprHeadFax2(String entprHeadFax2) {
		this.entprHeadFax2 = entprHeadFax2;
	}
	public String getEntprHeadFax3() {
		return entprHeadFax3;
	}
	public void setEntprHeadFax3(String entprHeadFax3) {
		this.entprHeadFax3 = entprHeadFax3;
	}
	public String getEntprBranchTel2() {
		return entprBranchTel2;
	}
	public void setEntprBranchTel2(String entprBranchTel2) {
		this.entprBranchTel2 = entprBranchTel2;
	}
	public String getEntprBranchTel3() {
		return entprBranchTel3;
	}
	public void setEntprBranchTel3(String entprBranchTel3) {
		this.entprBranchTel3 = entprBranchTel3;
	}
	public String getEntprBranchFax2() {
		return entprBranchFax2;
	}
	public void setEntprBranchFax2(String entprBranchFax2) {
		this.entprBranchFax2 = entprBranchFax2;
	}
	public String getEntprBranchFax3() {
		return entprBranchFax3;
	}
	public void setEntprBranchFax3(String entprBranchFax3) {
		this.entprBranchFax3 = entprBranchFax3;
	}
	public String getBuyerHeadTel2() {
		return buyerHeadTel2;
	}
	public void setBuyerHeadTel2(String buyerHeadTel2) {
		this.buyerHeadTel2 = buyerHeadTel2;
	}
	public String getBuyerHeadTel3() {
		return buyerHeadTel3;
	}
	public void setBuyerHeadTel3(String buyerHeadTel3) {
		this.buyerHeadTel3 = buyerHeadTel3;
	}
	public String getBuyerHeadFax2() {
		return buyerHeadFax2;
	}
	public void setBuyerHeadFax2(String buyerHeadFax2) {
		this.buyerHeadFax2 = buyerHeadFax2;
	}
	public String getBuyerHeadFax3() {
		return buyerHeadFax3;
	}
	public void setBuyerHeadFax3(String buyerHeadFax3) {
		this.buyerHeadFax3 = buyerHeadFax3;
	}
	public String getBuyerBranchTel2() {
		return buyerBranchTel2;
	}
	public void setBuyerBranchTel2(String buyerBranchTel2) {
		this.buyerBranchTel2 = buyerBranchTel2;
	}
	public String getBuyerBranchTel3() {
		return buyerBranchTel3;
	}
	public void setBuyerBranchTel3(String buyerBranchTel3) {
		this.buyerBranchTel3 = buyerBranchTel3;
	}
	public String getBuyerBranchFax2() {
		return buyerBranchFax2;
	}
	public void setBuyerBranchFax2(String buyerBranchFax2) {
		this.buyerBranchFax2 = buyerBranchFax2;
	}
	public String getBuyerBranchFax3() {
		return buyerBranchFax3;
	}
	public void setBuyerBranchFax3(String buyerBranchFax3) {
		this.buyerBranchFax3 = buyerBranchFax3;
	}
	public String getExpertOffiTel1() {
		return expertOffiTel1;
	}
	public void setExpertOffiTel1(String expertOffiTel1) {
		this.expertOffiTel1 = expertOffiTel1;
	}
	public String getExpertOffiTel2() {
		return expertOffiTel2;
	}
	public void setExpertOffiTel2(String expertOffiTel2) {
		this.expertOffiTel2 = expertOffiTel2;
	}
	public String getExpertOffiFax2() {
		return expertOffiFax2;
	}
	public void setExpertOffiFax2(String expertOffiFax2) {
		this.expertOffiFax2 = expertOffiFax2;
	}
	public String getExpertOffiFax3() {
		return expertOffiFax3;
	}
	public void setExpertOffiFax3(String expertOffiFax3) {
		this.expertOffiFax3 = expertOffiFax3;
	}
	public String getExpertHeadTel2() {
		return expertHeadTel2;
	}
	public void setExpertHeadTel2(String expertHeadTel2) {
		this.expertHeadTel2 = expertHeadTel2;
	}
	public String getExpertHeadTel3() {
		return expertHeadTel3;
	}
	public void setExpertHeadTel3(String expertHeadTel3) {
		this.expertHeadTel3 = expertHeadTel3;
	}
	public String getQuestionIdx() {
		return questionIdx;
	}
	public void setQuestionIdx(String questionIdx) {
		this.questionIdx = questionIdx;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getWriteNm() {
		return writeNm;
	}
	public void setWriteNm(String writeNm) {
		this.writeNm = writeNm;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getQuestionCont() {
		return questionCont;
	}
	public void setQuestionCont(String questionCont) {
		this.questionCont = questionCont;
	}
	public String getQuestionPw() {
		return questionPw;
	}
	public void setQuestionPw(String questionPw) {
		this.questionPw = questionPw;
	}
	public String getAnswerCont() {
		return answerCont;
	}
	public void setAnswerCont(String answerCont) {
		this.answerCont = answerCont;
	}
	public String getFaqIdx() {
		return faqIdx;
	}
	public void setFaqIdx(String faqIdx) {
		this.faqIdx = faqIdx;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqCont() {
		return faqCont;
	}
	public void setFaqCont(String faqCont) {
		this.faqCont = faqCont;
	}
	public String getFaqOpenYn() {
		return faqOpenYn;
	}
	public void setFaqOpenYn(String faqOpenYn) {
		this.faqOpenYn = faqOpenYn;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getFileCourse2() {
		return fileCourse2;
	}
	public void setFileCourse2(String fileCourse2) {
		this.fileCourse2 = fileCourse2;
	}
	public String getOrgFileNm2() {
		return orgFileNm2;
	}
	public void setOrgFileNm2(String orgFileNm2) {
		this.orgFileNm2 = orgFileNm2;
	}
	public String getUploadFileNm2() {
		return uploadFileNm2;
	}
	public void setUploadFileNm2(String uploadFileNm2) {
		this.uploadFileNm2 = uploadFileNm2;
	}
	public String getMemberHeadTel() {
		return memberHeadTel;
	}
	public void setMemberHeadTel(String memberHeadTel) {
		this.memberHeadTel = memberHeadTel;
	}
	public String getMemberCeo() {
		return memberCeo;
	}
	public void setMemberCeo(String memberCeo) {
		this.memberCeo = memberCeo;
	}
	public String getIdCnt() {
		return idCnt;
	}
	public void setIdCnt(String idCnt) {
		this.idCnt = idCnt;
	}
	public String getMngNo() {
		return mngNo;
	}
	public void setMngNo(String mngNo) {
		this.mngNo = mngNo;
	}
	public String getMngPw() {
		return mngPw;
	}
	public void setMngPw(String mngPw) {
		this.mngPw = mngPw;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	
	
	
	public String[] getMngId1() {
		return mngId1;
	}
	public void setMngId1(String[] mngId1) {
		this.mngId1 = mngId1;
	}
	public String getMngNm() {
		return mngNm;
	}
	public void setMngNm(String mngNm) {
		this.mngNm = mngNm;
	}
	public String getAuthTpCd() {
		return authTpCd;
	}
	public void setAuthTpCd(String authTpCd) {
		this.authTpCd = authTpCd;
	}
	public String getMngTel() {
		return mngTel;
	}
	public void setMngTel(String mngTel) {
		this.mngTel = mngTel;
	}
	public String getMngCel() {
		return mngCel;
	}
	public void setMngCel(String mngCel) {
		this.mngCel = mngCel;
	}
	public String getMngFlag() {
		return mngFlag;
	}
	public void setMngFlag(String mngFlag) {
		this.mngFlag = mngFlag;
	}
	
	public String getMngAddr() {
		return mngAddr;
	}
	public void setMngAddr(String mngAddr) {
		this.mngAddr = mngAddr;
	}
	
	public String getMngHp() {
		return mngHp;
	}
	public void setMngHp(String mngHp) {
		this.mngHp = mngHp;
	}
	public String getMngEmail() {
		return mngEmail;
	}
	public void setMngEmail(String mngEmail) {
		this.mngEmail = mngEmail;
	}
	
	public String getMngBelong() {
		return mngBelong;
	}
	public void setMngBelong(String mngBelong) {
		this.mngBelong = mngBelong;
	}
	public String getFacilityId() {
		return facilityId;
	}
	public String getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}
	public String getJoinTypeCd() {
		return joinTypeCd;
	}
	public void setJoinTypeCd(String joinTypeCd) {
		this.joinTypeCd = joinTypeCd;
	}
	
	public String getJoinTypeCdNm() {
		return joinTypeCdNm;
	}
	public void setJoinTypeCdNm(String joinTypeCdNm) {
		this.joinTypeCdNm = joinTypeCdNm;
	}
	public String getMemberStCd() {
		return memberStCd;
	}
	public void setMemberStCd(String memberStCd) {
		this.memberStCd = memberStCd;
	}
	
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getEntprRespsibNm() {
		return entprRespsibNm;
	}
	public void setEntprRespsibNm(String entprRespsibNm) {
		this.entprRespsibNm = entprRespsibNm;
	}
	public String getEntprRespsibHpNo() {
		return entprRespsibHpNo;
	}
	public void setEntprRespsibHpNo(String entprRespsibHpNo) {
		this.entprRespsibHpNo = entprRespsibHpNo;
	}
	public String getEntprRespsibEmail() {
		return entprRespsibEmail;
	}
	public void setEntprRespsibEmail(String entprRespsibEmail) {
		this.entprRespsibEmail = entprRespsibEmail;
	}
	public String getEntprNm() {
		return entprNm;
	}
	public void setEntprNm(String entprNm) {
		this.entprNm = entprNm;
	}
	public String getEntprCeo() {
		return entprCeo;
	}
	public void setEntprCeo(String entprCeo) {
		this.entprCeo = entprCeo;
	}
	public String getEntprCeoEmail() {
		return entprCeoEmail;
	}
	public void setEntprCeoEmail(String entprCeoEmail) {
		this.entprCeoEmail = entprCeoEmail;
	}
	public String getEntprTypeNm() {
		return entprTypeNm;
	}
	public void setEntprTypeNm(String entprTypeNm) {
		this.entprTypeNm = entprTypeNm;
	}
	public String getEntprComRegNum() {
		return entprComRegNum;
	}
	public void setEntprComRegNum(String entprComRegNum) {
		this.entprComRegNum = entprComRegNum;
	}
	public String getLargeBussAreaCd() {
		return largeBussAreaCd;
	}
	public void setLargeBussAreaCd(String largeBussAreaCd) {
		this.largeBussAreaCd = largeBussAreaCd;
	}
	public String getMediumBussAreaCd() {
		return mediumBussAreaCd;
	}
	public void setMediumBussAreaCd(String mediumBussAreaCd) {
		this.mediumBussAreaCd = mediumBussAreaCd;
	}
	public String getEntprSite() {
		return entprSite;
	}
	public void setEntprSite(String entprSite) {
		this.entprSite = entprSite;
	}
	public String getEntprHeadAddr() {
		return entprHeadAddr;
	}
	public void setEntprHeadAddr(String entprHeadAddr) {
		this.entprHeadAddr = entprHeadAddr;
	}
	public String getEntprHeadTel() {
		return entprHeadTel;
	}
	public void setEntprHeadTel(String entprHeadTel) {
		this.entprHeadTel = entprHeadTel;
	}
	public String getEntprHeadFax() {
		return entprHeadFax;
	}
	public void setEntprHeadFax(String entprHeadFax) {
		this.entprHeadFax = entprHeadFax;
	}
	public String getEntprBranchAddr() {
		return entprBranchAddr;
	}
	public void setEntprBranchAddr(String entprBranchAddr) {
		this.entprBranchAddr = entprBranchAddr;
	}
	public String getEntprBranchDetailAddr() {
		return entprBranchDetailAddr;
	}
	public void setEntprBranchDetailAddr(String entprBranchDetailAddr) {
		this.entprBranchDetailAddr = entprBranchDetailAddr;
	}
	public String getEntprBranchTel() {
		return entprBranchTel;
	}
	public void setEntprBranchTel(String entprBranchTel) {
		this.entprBranchTel = entprBranchTel;
	}
	public String getEntprBranchFax() {
		return entprBranchFax;
	}
	public void setEntprBranchFax(String entprBranchFax) {
		this.entprBranchFax = entprBranchFax;
	}
	public String getEntprEstDt() {
		return entprEstDt;
	}
	public void setEntprEstDt(String entprEstDt) {
		this.entprEstDt = entprEstDt;
	}
	
	
	
	
	public String getEntprCapitalAmt() {
		return entprCapitalAmt;
	}
	public void setEntprCapitalAmt(String entprCapitalAmt) {
		this.entprCapitalAmt = entprCapitalAmt;
	}
	public String getMoveinYn() {
		return moveinYn;
	}
	public void setMoveinYn(String moveinYn) {
		this.moveinYn = moveinYn;
	}
	public String getMoveinDt() {
		return moveinDt;
	}
	public void setMoveinDt(String moveinDt) {
		this.moveinDt = moveinDt;
	}
	public String getEntprResultYearCd() {
		return entprResultYearCd;
	}
	public void setEntprResultYearCd(String entprResultYearCd) {
		this.entprResultYearCd = entprResultYearCd;
	}
	public String getEntprResultQtaCd() {
		return entprResultQtaCd;
	}
	public void setEntprResultQtaCd(String entprResultQtaCd) {
		this.entprResultQtaCd = entprResultQtaCd;
	}
	public String getEntprResultTakeAmt() {			//최선권 20191210int -> String 변경
		return entprResultTakeAmt;
	}
	public void setEntprResultTakeAmt(String entprResultTakeAmt) { 	//최선권 20191210int -> String 변경
		this.entprResultTakeAmt = entprResultTakeAmt;
	}
	public int getEntprResultEmpCnt() {
		return entprResultEmpCnt;
	}
	public void setEntprResultEmpCnt(int entprResultEmpCnt) {
		this.entprResultEmpCnt = entprResultEmpCnt;
	}
	public String getEnterpriseIdx() {
		return enterpriseIdx;
	}
	public void setEnterpriseIdx(String enterpriseIdx) {
		this.enterpriseIdx = enterpriseIdx;
	}
	public String getNtltProptBussNm() {
		return ntltProptBussNm;
	}
	public void setNtltProptBussNm(String ntltProptBussNm) {
		this.ntltProptBussNm = ntltProptBussNm;
	}
	public String getNtltProptPerfNm() {
		return ntltProptPerfNm;
	}
	public void setNtltProptPerfNm(String ntltProptPerfNm) {
		this.ntltProptPerfNm = ntltProptPerfNm;
	}
	public String getIntltProptCd() {
		return intltProptCd;
	}
	public void setIntltProptCd(String intltProptCd) {
		this.intltProptCd = intltProptCd;
	}
	public String getRegFormCd() {
		return regFormCd;
	}
	public void setRegFormCd(String regFormCd) {
		this.regFormCd = regFormCd;
	}
	public String getRegNationCd() {
		return regNationCd;
	}
	public void setRegNationCd(String regNationCd) {
		this.regNationCd = regNationCd;
	}
	public String getIntltProptRegNo() {
		return intltProptRegNo;
	}
	public void setIntltProptRegNo(String intltProptRegNo) {
		this.intltProptRegNo = intltProptRegNo;
	}
	public String getIntltProptyDt() {
		return intltProptyDt;
	}
	public void setIntltProptyDt(String intltProptyDt) {
		this.intltProptyDt = intltProptyDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getBuyerNm() {
		return buyerNm;
	}
	public void setBuyerNm(String buyerNm) {
		this.buyerNm = buyerNm;
	}
	public String getBuyerEnm() {
		return buyerEnm;
	}
	public void setBuyerEnm(String buyerEnm) {
		this.buyerEnm = buyerEnm;
	}
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	public String getBuyerCeo() {
		return buyerCeo;
	}
	public void setBuyerCeo(String buyerCeo) {
		this.buyerCeo = buyerCeo;
	}
	public String getBuyerComRegNum() {
		return buyerComRegNum;
	}
	public void setBuyerComRegNum(String buyerComRegNum) {
		this.buyerComRegNum = buyerComRegNum;
	}
	public String getBuyerCeoEmail() {
		return buyerCeoEmail;
	}
	public void setBuyerCeoEmail(String buyerCeoEmail) {
		this.buyerCeoEmail = buyerCeoEmail;
	}
	public String getBuyerBusAreaCd() {
		return buyerBusAreaCd;
	}
	public void setBuyerBusAreaCd(String buyerBusAreaCd) {
		this.buyerBusAreaCd = buyerBusAreaCd;
	}
	public String getBuyerSite() {
		return buyerSite;
	}
	public void setBuyerSite(String buyerSite) {
		this.buyerSite = buyerSite;
	}
	public String getBuyerHeadAddr() {
		return buyerHeadAddr;
	}
	public void setBuyerHeadAddr(String buyerHeadAddr) {
		this.buyerHeadAddr = buyerHeadAddr;
	}
	public String getBuyerHeadTel() {
		return buyerHeadTel;
	}
	public void setBuyerHeadTel(String buyerHeadTel) {
		this.buyerHeadTel = buyerHeadTel;
	}
	public String getBuyerHeadFax() {
		return buyerHeadFax;
	}
	public void setBuyerHeadFax(String buyerHeadFax) {
		this.buyerHeadFax = buyerHeadFax;
	}
	public String getBuyerBranchAddr() {
		return buyerBranchAddr;
	}
	public void setBuyerBranchAddr(String buyerBranchAddr) {
		this.buyerBranchAddr = buyerBranchAddr;
	}
	public String getBuyerBranchDetailAddr() {
		return buyerBranchDetailAddr;
	}
	public void setBuyerBranchDetailAddr(String buyerBranchDetailAddr) {
		this.buyerBranchDetailAddr = buyerBranchDetailAddr;
	}
	public String getBuyerBranchTel() {
		return buyerBranchTel;
	}
	public void setBuyerBranchTel(String buyerBranchTel) {
		this.buyerBranchTel = buyerBranchTel;
	}
	public String getBuyerBranchFax() {
		return buyerBranchFax;
	}
	public void setBuyerBranchFax(String buyerBranchFax) {
		this.buyerBranchFax = buyerBranchFax;
	}
	public String getBuyerEstDt() {
		return buyerEstDt;
	}
	public void setBuyerEstDt(String buyerEstDt) {
		this.buyerEstDt = buyerEstDt;
	}
	
	
	
	public String getBuyerCapitalAmt() {
		return buyerCapitalAmt;
	}
	public void setBuyerCapitalAmt(String buyerCapitalAmt) {
		this.buyerCapitalAmt = buyerCapitalAmt;
	}
	public String getBuyerHistIdx() {
		return buyerHistIdx;
	}
	public void setBuyerHistIdx(String buyerHistIdx) {
		this.buyerHistIdx = buyerHistIdx;
	}
	public String getBuyerHistNm() {
		return buyerHistNm;
	}
	public void setBuyerHistNm(String buyerHistNm) {
		this.buyerHistNm = buyerHistNm;
	}
	public String getBuyerHistInvt() {
		return buyerHistInvt;
	}
	public void setBuyerHistInvt(String buyerHistInvt) {
		this.buyerHistInvt = buyerHistInvt;
	}
	public String getBuyerHistSpecCd() {
		return buyerHistSpecCd;
	}
	public void setBuyerHistSpecCd(String buyerHistSpecCd) {
		this.buyerHistSpecCd = buyerHistSpecCd;
	}
	public String getBuyerHistDt() {
		return buyerHistDt;
	}
	public void setBuyerHistDt(String buyerHistDt) {
		this.buyerHistDt = buyerHistDt;
	}
	public String getBuyerHistContent() {
		return buyerHistContent;
	}
	public void setBuyerHistContent(String buyerHistContent) {
		this.buyerHistContent = buyerHistContent;
	}
	public String getProcessCd() {
		return processCd;
	}
	public void setProcessCd(String processCd) {
		this.processCd = processCd;
	}
	public String getExpertNm() {
		return expertNm;
	}
	public void setExpertNm(String expertNm) {
		this.expertNm = expertNm;
	}
	public String getExpertEmail() {
		return expertEmail;
	}
	public void setExpertEmail(String expertEmail) {
		this.expertEmail = expertEmail;
	}
	public String getExpertGender() {
		return expertGender;
	}
	public void setExpertGender(String expertGender) {
		this.expertGender = expertGender;
	}
	public String getExpertCareerNum() {
		return expertCareerNum;
	}
	public void setExpertCareerNum(String expertCareerNum) {
		this.expertCareerNum = expertCareerNum;
	}
	public String getLargeSpecialAreaCd() {
		return largeSpecialAreaCd;
	}
	public void setLargeSpecialAreaCd(String largeSpecialAreaCd) {
		this.largeSpecialAreaCd = largeSpecialAreaCd;
	}
	public String getMediumSpecialAreaCd() {
		return mediumSpecialAreaCd;
	}
	public void setMediumSpecialAreaCd(String mediumSpecialAreaCd) {
		this.mediumSpecialAreaCd = mediumSpecialAreaCd;
	}
	public String getDetailSpecialAreaCd() {
		return detailSpecialAreaCd;
	}
	public void setDetailSpecialAreaCd(String detailSpecialAreaCd) {
		this.detailSpecialAreaCd = detailSpecialAreaCd;
	}
	public String getExpertInterestAreaCd() {
		return expertInterestAreaCd;
	}
	public void setExpertInterestAreaCd(String expertInterestAreaCd) {
		this.expertInterestAreaCd = expertInterestAreaCd;
	}
	
	public String getExpertDetailIntrtAreaCd() {
		return expertDetailIntrtAreaCd;
	}
	public void setExpertDetailIntrtAreaCd(String expertDetailIntrtAreaCd) {
		this.expertDetailIntrtAreaCd = expertDetailIntrtAreaCd;
	}
	public String getExpertIndsEduCd() {
		return expertIndsEduCd;
	}
	public void setExpertIndsEduCd(String expertIndsEduCd) {
		this.expertIndsEduCd = expertIndsEduCd;
	}
	public String getExpertStRegNo() {
		return expertStRegNo;
	}
	public void setExpertStRegNo(String expertStRegNo) {
		this.expertStRegNo = expertStRegNo;
	}
	public String getExpertRegNo() {
		return expertRegNo;
	}
	public void setExpertRegNo(String expertRegNo) {
		this.expertRegNo = expertRegNo;
	}
	public String getExpertFinalSchoolNm() {
		return expertFinalSchoolNm;
	}
	public void setExpertFinalSchoolNm(String expertFinalSchoolNm) {
		this.expertFinalSchoolNm = expertFinalSchoolNm;
	}
	public String getExpertMajorNm() {
		return expertMajorNm;
	}
	public void setExpertMajorNm(String expertMajorNm) {
		this.expertMajorNm = expertMajorNm;
	}
	public String getExpertFnalEduNm() {
		return expertFnalEduNm;
	}
	public void setExpertFnalEduNm(String expertFnalEduNm) {
		this.expertFnalEduNm = expertFnalEduNm;
	}
	public String getExpertHeadAddrNm() {
		return expertHeadAddrNm;
	}
	public void setExpertHeadAddrNm(String expertHeadAddrNm) {
		this.expertHeadAddrNm = expertHeadAddrNm;
	}
	public String getExpertDptmNm() {
		return expertDptmNm;
	}
	public void setExpertDptmNm(String expertDptmNm) {
		this.expertDptmNm = expertDptmNm;
	}
	public String getExpertOffiDutyNm() {
		return expertOffiDutyNm;
	}
	public void setExpertOffiDutyNm(String expertOffiDutyNm) {
		this.expertOffiDutyNm = expertOffiDutyNm;
	}
	public String getExpertOffiAddr() {
		return expertOffiAddr;
	}
	public void setExpertOffiAddr(String expertOffiAddr) {
		this.expertOffiAddr = expertOffiAddr;
	}
	public String getExpertOffiDetailAddr() {
		return expertOffiDetailAddr;
	}
	public void setExpertOffiDetailAddr(String expertOffiDetailAddr) {
		this.expertOffiDetailAddr = expertOffiDetailAddr;
	}
	public String getExpertOffiTel() {
		return expertOffiTel;
	}
	public void setExpertOffiTel(String expertOffiTel) {
		this.expertOffiTel = expertOffiTel;
	}
	public String getExpertOffiFax() {
		return expertOffiFax;
	}
	public void setExpertOffiFax(String expertOffiFax) {
		this.expertOffiFax = expertOffiFax;
	}
	public String getExpertHeadTel() {
		return expertHeadTel;
	}
	public void setExpertHeadTel(String expertHeadTel) {
		this.expertHeadTel = expertHeadTel;
	}
	public String getExpertHomeAddr() {
		return expertHomeAddr;
	}
	public void setExpertHomeAddr(String expertHomeAddr) {
		this.expertHomeAddr = expertHomeAddr;
	}
	
	public String getExpertHomeDetailAddr() {
		return expertHomeDetailAddr;
	}
	public void setExpertHomeDetailAddr(String expertHomeDetailAddr) {
		this.expertHomeDetailAddr = expertHomeDetailAddr;
	}
	public String getBenefitBankCd() {
		return benefitBankCd;
	}
	public void setBenefitBankCd(String benefitBankCd) {
		this.benefitBankCd = benefitBankCd;
	}
	public String getBenefitAccntNo() {
		return benefitAccntNo;
	}
	public void setBenefitAccntNo(String benefitAccntNo) {
		this.benefitAccntNo = benefitAccntNo;
	}
	public String getBenefitBirthDt() {
		return benefitBirthDt;
	}
	public void setBenefitBirthDt(String benefitBirthDt) {
		this.benefitBirthDt = benefitBirthDt;
	}
	public String getBenefitRespsibHpNo() {
		return benefitRespsibHpNo;
	}					
	public void setBenefitRespsibHpNo(String benefitRespsibHpNo) {
		this.benefitRespsibHpNo = benefitRespsibHpNo;
	}
	public String getFileCourse() {
		return fileCourse;
	}
	public void setFileCourse(String fileCourse) {
		this.fileCourse = fileCourse;
	}
	public String getOrgFileNm() {
		return orgFileNm;
	}
	public void setOrgFileNm(String orgFileNm) {
		this.orgFileNm = orgFileNm;
	}
	public String getUploadFileNm() {
		return uploadFileNm;
	}
	public void setUploadFileNm(String uploadFileNm) {
		this.uploadFileNm = uploadFileNm;
	}
	
	
	
	public String getExpertFnalEduCd() {
		return expertFnalEduCd;
	}
	public void setExpertFnalEduCd(String expertFnalEduCd) {
		this.expertFnalEduCd = expertFnalEduCd;
	}
	public String getExpertHistIdx() {
		return expertHistIdx;
	}
	public void setExpertHistIdx(String expertHistIdx) {
		this.expertHistIdx = expertHistIdx;
	}
	public String getExpertDelibrDt() {
		return expertDelibrDt;
	}
	public void setExpertDelibrDt(String expertDelibrDt) {
		this.expertDelibrDt = expertDelibrDt;
	}
	public String getExpertDelibrTitle() {
		return expertDelibrTitle;
	}
	public void setExpertDelibrTitle(String expertDelibrTitle) {
		this.expertDelibrTitle = expertDelibrTitle;
	}
	public String getEntprBussProStusNm() {
		return entprBussProStusNm;
	}
	public void setEntprBussProStusNm(String entprBussProStusNm) {
		this.entprBussProStusNm = entprBussProStusNm;
	}
	public String getEntprBussProStusCont() {
		return entprBussProStusCont;
	}
	public void setEntprBussProStusCont(String entprBussProStusCont) {
		this.entprBussProStusCont = entprBussProStusCont;
	}
	public String getEntprEmployeeNm() {
		return entprEmployeeNm;
	}
	public void setEntprEmployeeNm(String entprEmployeeNm) {
		this.entprEmployeeNm = entprEmployeeNm;
	}
	public String getEntprEmployeeDept() {
		return entprEmployeeDept;
	}
	public void setEntprEmployeeDept(String entprEmployeeDept) {
		this.entprEmployeeDept = entprEmployeeDept;
	}
	public String getEntprEmployeePosition() {
		return entprEmployeePosition;
	}
	public void setEntprEmployeePosition(String entprEmployeePosition) {
		this.entprEmployeePosition = entprEmployeePosition;
	}
	public String getEntprEmployeeEmail() {
		return entprEmployeeEmail;
	}
	public void setEntprEmployeeEmail(String entprEmployeeEmail) {
		this.entprEmployeeEmail = entprEmployeeEmail;
	}
	public String getEntprEmployeePhone() {
		return entprEmployeePhone;
	}
	public void setEntprEmployeePhone(String entprEmployeePhone) {
		this.entprEmployeePhone = entprEmployeePhone;
	}
	public String getBussAnncemntNo() {
		return bussAnncemntNo;
	}
	public void setBussAnncemntNo(String bussAnncemntNo) {
		this.bussAnncemntNo = bussAnncemntNo;
	}
	public int getEntprCreatJobCnt() {
		return entprCreatJobCnt;
	}
	public void setEntprCreatJobCnt(int entprCreatJobCnt) {
		this.entprCreatJobCnt = entprCreatJobCnt;
	}
	public String getEntprBussYn() {
		return entprBussYn;
	}
	public void setEntprBussYn(String entprBussYn) {
		this.entprBussYn = entprBussYn;
	}
	public String getBussAnncemntNm() {
		return bussAnncemntNm;
	}
	public void setBussAnncemntNm(String bussAnncemntNm) {
		this.bussAnncemntNm = bussAnncemntNm;
	}
	public String getBussFrDt() {
		return bussFrDt;
	}
	public void setBussFrDt(String bussFrDt) {
		this.bussFrDt = bussFrDt;
	}
	public String getBussToDt() {
		return bussToDt;
	}
	public void setBussToDt(String bussToDt) {
		this.bussToDt = bussToDt;
	}
	public int getBussCostAmt() {
		return bussCostAmt;
	}
	public void setBussCostAmt(int bussCostAmt) {
		this.bussCostAmt = bussCostAmt;
	}
	public String getBussDeptCd() {
		return bussDeptCd;
	}
	public void setBussDeptCd(String bussDeptCd) {
		this.bussDeptCd = bussDeptCd;
	}
	public String getOriginalUrl() {
		return originalUrl;
	}
	public void setOriginalUrl(String originalUrl) {
		this.originalUrl = originalUrl;
	}
	public String getBussCont() {
		return bussCont;
	}
	public void setBussCont(String bussCont) {
		this.bussCont = bussCont;
	}
	public String getBussDiviCd() {
		return bussDiviCd;
	}
	public void setBussDiviCd(String bussDiviCd) {
		this.bussDiviCd = bussDiviCd;
	}
	public String getAttchFileNo() {
		return attchFileNo;
	}
	public void setAttchFileNo(String attchFileNo) {
		this.attchFileNo = attchFileNo;
	}
	public String getSelectNo() {
		return selectNo;
	}
	public void setSelectNo(String selectNo) {
		this.selectNo = selectNo;
	}
	public String getSelectTitle() {
		return selectTitle;
	}
	public void setSelectTitle(String selectTitle) {
		this.selectTitle = selectTitle;
	}
	public String getSelectDt() {
		return selectDt;
	}
	public void setSelectDt(String selectDt) {
		this.selectDt = selectDt;
	}
	public String getEvaluationDt() {
		return evaluationDt;
	}
	public void setEvaluationDt(String evaluationDt) {
		this.evaluationDt = evaluationDt;
	}
	public int getEvaluationCnt() {
		return evaluationCnt;
	}
	public void setEvaluationCnt(int evaluationCnt) {
		this.evaluationCnt = evaluationCnt;
	}
	public String getSelectClassCd() {
		return selectClassCd;
	}
	public void setSelectClassCd(String selectClassCd) {
		this.selectClassCd = selectClassCd;
	}
	public String getBenefitPerformNm() {
		return benefitPerformNm;
	}
	public void setBenefitPerformNm(String benefitPerformNm) {
		this.benefitPerformNm = benefitPerformNm;
	}
	public int getEmpCreateStaff() {
		return empCreateStaff;
	}
	public void setEmpCreateStaff(int empCreateStaff) {
		this.empCreateStaff = empCreateStaff;
	}
	public String getResourFaciId() {
		return resourFaciId;
	}
	public void setResourFaciId(String resourFaciId) {
		this.resourFaciId = resourFaciId;
	}
	public String getResourceMngDeptCd() {
		return resourceMngDeptCd;
	}
	public void setResourceMngDeptCd(String resourceMngDeptCd) {
		this.resourceMngDeptCd = resourceMngDeptCd;
	}
	public String getResourceStCd() {
		return resourceStCd;
	}
	public void setResourceStCd(String resourceStCd) {
		this.resourceStCd = resourceStCd;
	}
	public String getIntltProptyNm() {
		return intltProptyNm;
	}
	public void setIntltProptyNm(String intltProptyNm) {
		this.intltProptyNm = intltProptyNm;
	}
	public String getIntltProptPerfNm() {
		return intltProptPerfNm;
	}
	public void setIntltProptPerfNm(String intltProptPerfNm) {
		this.intltProptPerfNm = intltProptPerfNm;
	}
	public String getAppliNo() {
		return appliNo;
	}
	public void setAppliNo(String appliNo) {
		this.appliNo = appliNo;
	}
	public String getResourFaciDiviCd() {
		return resourFaciDiviCd;
	}
	public void setResourFaciDiviCd(String resourFaciDiviCd) {
		this.resourFaciDiviCd = resourFaciDiviCd;
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
	
	public String getCompTelNo() {
		return compTelNo;
	}
	public void setCompTelNo(String compTelNo) {
		this.compTelNo = compTelNo;
	}
	public String getCompMail() {
		return compMail;
	}
	public void setCompMail(String compMail) {
		this.compMail = compMail;
	}
	public int getUsePersNum() {
		return usePersNum;
	}
	public void setUsePersNum(int usePersNum) {
		this.usePersNum = usePersNum;
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
	public String getApplicStCd() {
		return applicStCd;
	}
	public void setApplicStCd(String applicStCd) {
		this.applicStCd = applicStCd;
	}
	public String getContentPerformNm() {
		return contentPerformNm;
	}
	public void setContentPerformNm(String contentPerformNm) {
		this.contentPerformNm = contentPerformNm;
	}
	public String getContentDiviCd() {
		return contentDiviCd;
	}
	public void setContentDiviCd(String contentDiviCd) {
		this.contentDiviCd = contentDiviCd;
	}
	public String getContentNm() {
		return contentNm;
	}
	public void setContentNm(String contentNm) {
		this.contentNm = contentNm;
	}
	public String getOnestopSupportNo() {
		return onestopSupportNo;
	}
	public void setOnestopSupportNo(String onestopSupportNo) {
		this.onestopSupportNo = onestopSupportNo;
	}
	public String getApplicatDt() {
		return applicatDt;
	}
	public void setApplicatDt(String applicatDt) {
		this.applicatDt = applicatDt;
	}
	public String getProMemberId() {
		return proMemberId;
	}
	public void setProMemberId(String proMemberId) {
		this.proMemberId = proMemberId;
	}
	public String getSuppBussAreaCd() {
		return suppBussAreaCd;
	}
	public void setSuppBussAreaCd(String suppBussAreaCd) {
		this.suppBussAreaCd = suppBussAreaCd;
	}
	public String getBussAreaOthers() {
		return bussAreaOthers;
	}
	public void setBussAreaOthers(String bussAreaOthers) {
		this.bussAreaOthers = bussAreaOthers;
	}
	public int getCompEmplCnt() {
		return compEmplCnt;
	}
	public void setCompEmplCnt(int compEmplCnt) {
		this.compEmplCnt = compEmplCnt;
	}
	public String getCompApplNm() {
		return compApplNm;
	}
	public void setCompApplNm(String compApplNm) {
		this.compApplNm = compApplNm;
	}
	public String getCompPosit() {
		return compPosit;
	}
	public void setCompPosit(String compPosit) {
		this.compPosit = compPosit;
	}
	public String getCompFaxNo() {
		return compFaxNo;
	}
	public void setCompFaxNo(String compFaxNo) {
		this.compFaxNo = compFaxNo;
	}
	public String getCompHpNo() {
		return compHpNo;
	}
	public void setCompHpNo(String compHpNo) {
		this.compHpNo = compHpNo;
	}
	public String getAdviceHopeDt() {
		return adviceHopeDt;
	}
	public void setAdviceHopeDt(String adviceHopeDt) {
		this.adviceHopeDt = adviceHopeDt;
	}
	public String getAdvicePlaceCd() {
		return advicePlaceCd;
	}
	public void setAdvicePlaceCd(String advicePlaceCd) {
		this.advicePlaceCd = advicePlaceCd;
	}
	public String getAdviceAreaCd() {
		return adviceAreaCd;
	}
	public void setAdviceAreaCd(String adviceAreaCd) {
		this.adviceAreaCd = adviceAreaCd;
	}
	public String getAdviceApplicCont() {
		return adviceApplicCont;
	}
	public void setAdviceApplicCont(String adviceApplicCont) {
		this.adviceApplicCont = adviceApplicCont;
	}
	public String getBussAttractNm() {
		return bussAttractNm;
	}
	public void setBussAttractNm(String bussAttractNm) {
		this.bussAttractNm = bussAttractNm;
	}
	public String getEntprType() {
		return entprType;
	}
	public void setEntprType(String entprType) {
		this.entprType = entprType;
	}
	public String getFacilityMngDeptCd() {
		return facilityMngDeptCd;
	}
	public void setFacilityMngDeptCd(String facilityMngDeptCd) {
		this.facilityMngDeptCd = facilityMngDeptCd;
	}
	public String getFacilityFuncCd() {
		return facilityFuncCd;
	}
	public void setFacilityFuncCd(String facilityFuncCd) {
		this.facilityFuncCd = facilityFuncCd;
	}
	public String getFacilityStCd() {
		return facilityStCd;
	}
	public void setFacilityStCd(String facilityStCd) {
		this.facilityStCd = facilityStCd;
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
	
	
	
	
	
	
	public String getGroupCd() {
		return groupCd;
	}
	public void setGroupCd(String groupCd) {
		this.groupCd = groupCd;
	}
	public String getGroupNm() {
		return groupNm;
	}
	public void setGroupNm(String groupNm) {
		this.groupNm = groupNm;
	}
	public String getCommonCd() {
		return commonCd;
	}
	public void setCommonCd(String commonCd) {
		this.commonCd = commonCd;
	}
	public String getCommonNm() {
		return commonNm;
	}
	public void setCommonNm(String commonNm) {
		this.commonNm = commonNm;
	}
	public String getCommonEnm() {
		return commonEnm;
	}
	public void setCommonEnm(String commonEnm) {
		this.commonEnm = commonEnm;
	}
	public String getOrderNbr() {
		return orderNbr;
	}
	public void setOrderNbr(String orderNbr) {
		this.orderNbr = orderNbr;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(String noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public String getNoticeOpenYn() {
		return noticeOpenYn;
	}
	public void setNoticeOpenYn(String noticeOpenYn) {
		this.noticeOpenYn = noticeOpenYn;
	}
	public String getNoticeImptYn() {
		return noticeImptYn;
	}
	public void setNoticeImptYn(String noticeImptYn) {
		this.noticeImptYn = noticeImptYn;
	}
	public String getCntpartNo() {
		return cntpartNo;
	}
	public void setCntpartNo(String cntpartNo) {
		this.cntpartNo = cntpartNo;
	}
	public MultipartFile getNoticeFiles() {
		return noticeFiles;
	}
	public void setNoticeFiles(MultipartFile noticeFiles) {
		this.noticeFiles = noticeFiles;
	}
	
	
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_name_key() {
		return file_name_key;
	}
	public void setFile_name_key(String file_name_key) {
		this.file_name_key = file_name_key;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getIns_user_nm() {
		return ins_user_nm;
	}
	public void setIns_user_nm(String ins_user_nm) {
		this.ins_user_nm = ins_user_nm;
	}
	public String getIns_date() {
		return ins_date;
	}
	public void setIns_date(String ins_date) {
		this.ins_date = ins_date;
	}
	public String getUpd_user_id() {
		return upd_user_id;
	}
	public void setUpd_user_id(String upd_user_id) {
		this.upd_user_id = upd_user_id;
	}
	public Date getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
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
	public String getDatepicker2() {
		return datepicker2;
	}
	public void setDatepicker2(String datepicker2) {
		this.datepicker2 = datepicker2;
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
	
	
	public String getRegistrationnumber() {
		return registrationnumber;
	}
	public void setRegistrationnumber(String registrationnumber) {
		this.registrationnumber = registrationnumber;
	}
	
	
	
	public String getPerformance() {
		return performance;
	}
	public void setPerformance(String performance) {
		this.performance = performance;
	}
	public String getQuarteryear() {
		return quarteryear;
	}
	public void setQuarteryear(String quarteryear) {
		this.quarteryear = quarteryear;
	}
	public String getTouch() {
		return touch;
	}
	public void setTouch(String touch) {
		this.touch = touch;
	}
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
	}
	public String getProjectprogressnumber() {
		return projectprogressnumber;
	}
	public void setProjectprogressnumber(String projectprogressnumber) {
		this.projectprogressnumber = projectprogressnumber;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getProjectprogress() {
		return projectprogress;
	}
	public void setProjectprogress(String projectprogress) {
		this.projectprogress = projectprogress;
	}
	public String getProjectperiod() {
		return projectperiod;
	}
	public void setProjectperiod(String projectperiod) {
		this.projectperiod = projectperiod;
	}
	public String getProjectcosts() {
		return projectcosts;
	}
	public void setProjectcosts(String projectcosts) {
		this.projectcosts = projectcosts;
	}
	public String getProjectprogressstatus() {
		return projectprogressstatus;
	}
	public void setProjectprogressstatus(String projectprogressstatus) {
		this.projectprogressstatus = projectprogressstatus;
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
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getMemberAuthType() {
		return memberAuthType;
	}
	public void setMemberAuthType(String memberAuthType) {
		this.memberAuthType = memberAuthType;
	}
	public String getCheckRow() {
		return checkRow;
	}
	public void setCheckRow(String checkRow) {
		this.checkRow = checkRow;
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
	
	public String getSearchText1() {
		return searchText1;
	}
	public void setSearchText1(String searchText1) {
		this.searchText1 = searchText1;
	}
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
	
	public String getMemberHomepage() {
		return memberHomepage;
	}
	public void setMemberHomepage(String memberHomepage) {
		this.memberHomepage = memberHomepage;
	}
	
	public String getMemberRegistrationNumber() {
		return memberRegistrationNumber;
	}
	public void setMemberRegistrationNumber(String memberRegistrationNumber) {
		this.memberRegistrationNumber = memberRegistrationNumber;
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
	
	
	
	public String getEntprHeadDetailAddr() {
		return entprHeadDetailAddr;
	}
	public void setEntprHeadDetailAddr(String entprHeadDetailAddr) {
		this.entprHeadDetailAddr = entprHeadDetailAddr;
	}
	public String getBuyerHeadDetailAddr() {
		return buyerHeadDetailAddr;
	}
	public void setBuyerHeadDetailAddr(String buyerHeadDetailAddr) {
		this.buyerHeadDetailAddr = buyerHeadDetailAddr;
	}
	public String getAttendYn() {
		return attendYn;
	}
	public void setAttendYn(String attendYn) {
		this.attendYn = attendYn;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public String getApprovalDt() {
		return approvalDt;
		}
	public void setApprovalDt(String approvalDt) {
		this.approvalDt = approvalDt;
	}
}
