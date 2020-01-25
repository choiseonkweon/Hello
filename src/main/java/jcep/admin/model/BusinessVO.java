package jcep.admin.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @Class Name : BusinessVO.java
 * @Description : BusinessVO Class
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
public class BusinessVO extends PagingVO {

	private static final long serialVersionUID = 1L;

	private String searchType, searchText, searchFromDate,searchToDate,searchText1,bussAnncemntNo;
	private List<String> membersId;

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

	public String getSearchFromDate() {
		return searchFromDate;
	}

	public void setSearchFromDate(String searchFromDate) {
		this.searchFromDate = searchFromDate;
	}

	public String getSearchToDate() {
		return searchToDate;
	}

	public void setSearchToDate(String searchToDate) {
		this.searchToDate = searchToDate;
	}

	public String getSearchText1() {
		return searchText1;
	}

	public void setSearchText1(String searchText1) {
		this.searchText1 = searchText1;
	}

	public List<String> getMembersId() {
		return membersId;
	}

	public void setMembersId(List<String> membersId) {
		this.membersId = membersId;
	}

	public String getBussAnncemntNo() {
		return bussAnncemntNo;
	}

	public void setBussAnncemntNo(String bussAnncemntNo) {
		this.bussAnncemntNo = bussAnncemntNo;
	}
}
