package jcep.admin.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : SiteVO.java
 * @Description : SiteVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.19           최초생성
 *
 * @since 2019.07.19
 * @version 1.0
 * @see
 *
 */
public class SiteVO extends PagingVO {

	private static final long serialVersionUID = 1L;

	private String searchType;
	private String searchText;
	
	private String noticeIdx;
	private String noticeTitle;
	private String noticeContent;
	private String noticeOpenYn;
	private String noticeImptYn;
	private String noticeFile;
	private String noticeRegDt;
	private String noticeRegId;
	private MultipartFile noticeFiles;
	
	
	private String groupCd;
	private String groupNm;
	private String commonCd;
	private String commonNm;
	private String commonEnm;
	private String orderNbr;
	private String useFlag;
	
	private String noticeCont;
	
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

	private String faq_idx;
	private String faqTitle;
	private String faqCont;
	private String faqOpenYn;
	
	private String fileCourse;					
	private String orgFileNm;				
	private String uploadFileNm;
	private String expertFnalEduCd;	
	private String regDt;
	private String regId;

	
	
	
	
	
	
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
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
	public String getFileCourse() {
		return fileCourse;
	}
	public void setFileCourse(String fileCourse) {
		this.fileCourse = fileCourse;
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
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public String getCntpartNo() {
		return cntpartNo;
	}
	public void setCntpartNo(String cntpartNo) {
		this.cntpartNo = cntpartNo;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
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
	public String getTotcnt() {
		return totcnt;
	}
	public void setTotcnt(String totcnt) {
		this.totcnt = totcnt;
	}
	public String getFaqIdx() {
		return faq_idx;
	}
	public void setFaqIdx(String faq_idx) {
		this.faq_idx = faq_idx;
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
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
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
	public String getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}
	public String getNoticeRegDt() {
		return noticeRegDt;
	}
	public void setNoticeRegDt(String noticeRegDt) {
		this.noticeRegDt = noticeRegDt;
	}
	public String getNoticeRegId() {
		return noticeRegId;
	}
	public void setNoticeRegId(String noticeRegId) {
		this.noticeRegId = noticeRegId;
	}
	public MultipartFile getNoticeFiles() {
		return noticeFiles;
	}
	public void setNoticeFiles(MultipartFile noticeFiles) {
		this.noticeFiles = noticeFiles;
	}


}
