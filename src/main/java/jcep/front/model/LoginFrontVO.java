package jcep.front.model;

import org.springframework.web.multipart.MultipartFile;

import jcep.admin.model.PagingVO;

/**
 * @Class Name : LoginFrontVO.java
 * @Description : LoginFrontVO Class
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
public class LoginFrontVO extends PagingVO {

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
	
	// 20191017 신승원
	// 아이디 비번 추가
	private String userId;
	private String passwd;
	
	
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
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

}
