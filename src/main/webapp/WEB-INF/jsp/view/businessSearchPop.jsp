<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<body>
			<div class="modal-body">
					<div class="table-responsive">
						<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"></h6>
						</div>
							<form role="form" id="bussSearchFrm" name="bussSearchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="30%">
										<col width="10%">
										<col width="50%"> 									
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">부서</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>시설명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>업체명</option>													
												</select>
											</td>										
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명</th>
											<td>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:200px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey('B');">
												<a href="javascript:goBussSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- data table -->
					<div class="well well-sm">
						<div class="table-responsive">
								<table class="table table-hover">
								<colgroup>
									<col>
									<col width="30%">
									<col width="30%">
								</colgroup>								
								<thead>
									<tr>
										<th>사업명</th>
										<th>사업기간</th>
										<th>사업부서</th>
									</tr>
								</thead>
									<tbody id="bussListBody">
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="5">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td style="vertical-align: middle;"><a href="javascript:selectBussAnncemnt( '${result.bussAnncemntNo}','${result.bussAnncemntNm }');">${result.bussAnncemntNm }</a></td>
													<td style="vertical-align: middle;"><c:out value="${result.bussFrDt}"/> ~ <c:out value="${result.bussToDt}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.bussDeptNm}"/></td>
												</tr>
											</c:forEach>
										</c:if>									
									
									</tbody>
								</table>
					</div>
						<div id="paging">
							<form:form commandName="searchVO" id="bussListForm" name="bussListForm" method="post">
				        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goBussSearchPage" />
				        		<input type="hidden" id="bussPageIndex" name="pageIndex" value=""/>
				        		<form:hidden path="bussSearchType" />
				        		<form:hidden path="searchType" />
				        		<form:hidden path="searchText" />
				        	</form:form>	
			        	</div>			
				</div>	
</body>
</html>