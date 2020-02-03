package jcep.admin.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : FacilityResourceVO.java
 * @Description : FacilityResourceVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.18           최초생성
 *
 * @since 2019.06.18
 * @version 1.0
 * @see
 *
 */
public class FacilityResourceVO extends PagingVO {

	private static final long serialVersionUID = 1L;

	private String searchType, searchText, mngDeptType;
	private String facilityId,facilityNm,facilityLoc,facilityScale,facilityCost,facilityEquip,facilityImg,facilitySt,facilityRegDt,facilityRegId,facilityMngDeptCd,facilityFuncCd
	                    ,resourceId,resourceNm,resourceImg,resourceSt,resourceRegDt,resourceRegId,resourceMngDeptCd
	                    ,appliNo,resourFaciId,memberId,resourFaciDiviCd,compNm,useFrDt,useFrTm,useToDt,useToTm,applicStCd
	                    ,useObj,compMail,compTelNo,compApplNm,compAddr1,compAddr2,searchFromDate,searchToDate,regDt
	;

	private int usePersNum;
	private MultipartFile facilityImgFile,resourceImgFile;


	
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
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
	public String getMngDeptType() {
		return mngDeptType;
	}
	public void setMngDeptType(String mngDeptType) {
		this.mngDeptType = mngDeptType;
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
	public String getAppliNo() {
		return appliNo;
	}
	public void setAppliNo(String appliNo) {
		this.appliNo = appliNo;
	}
	public String getResourFaciId() {
		return resourFaciId;
	}
	public void setResourFaciId(String resourFaciId) {
		this.resourFaciId = resourFaciId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getResourceMngDeptCd() {
		return resourceMngDeptCd;
	}
	public void setResourceMngDeptCd(String resourceMngDeptCd) {
		this.resourceMngDeptCd = resourceMngDeptCd;
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
	public String getCompMail() {
		return compMail;
	}
	public void setCompMail(String compMail) {
		this.compMail = compMail;
	}
	public String getCompTelNo() {
		return compTelNo;
	}
	public void setCompTelNo(String compTelNo) {
		this.compTelNo = compTelNo;
	}
	public String getCompApplNm() {
		return compApplNm;
	}
	public void setCompApplNm(String compApplNm) {
		this.compApplNm = compApplNm;
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
	public String getSearchFromDate() {
		return searchFromDate;
	}
	public void setSearchFromDate(String serachFromDate) {
		this.searchFromDate = serachFromDate;
	}
	public String getSearchToDate() {
		return searchToDate;
	}
	public void setSearchToDate(String searchToDate) {
		this.searchToDate = searchToDate;
	}

}
