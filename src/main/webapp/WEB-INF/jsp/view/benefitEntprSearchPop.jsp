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
						<form role="form" id="entprSearchFrm" name="entprSearchFrm" action="#" class="form-horizontal" method="post">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="15%">
									<col width="85%">
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">기업명</th>
										<td>
											<input type="text" name=searchText1 id="searchText1" class="input-sm not-kor" style="width:200px;" value="${searchVO.searchText1}" onkeydown="javascript:enterKey('E');">
											<a href="javascript:goEntprSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
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
								<col width="3%">
								<col width="30%">
								<col width="30%">
								<col width="30%">
							</colgroup>								
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheck" name="allCheck" value="all" onclick="entprAllCheck(this);"/></th>
									<th>사업명</th>
									<th>참여기업</th>
									<th>사업부서</th>
								</tr>
							</thead>
								<tbody id="entprListBody">
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="5">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td><input type='checkbox' id='chk_${status.index}' name='chk_${status.index}' value="${result.memberId}" onclick="entprCheck(this)"/>												
													<td style="vertical-align: middle;"><c:out value="${result.bussAnncemntNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.entprNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.bussDeptNm}"/></td>
												</tr>
											</c:forEach>
										</c:if>									
								</tbody>
						</table>
				</div>
					<div id="paging">
						<form:form commandName="searchVO" id="enptrListForm" name="enptrListForm" method="post">
			        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goEntprSearchPage" />
			        		<input type="hidden" id="entprPageIndex" name="pageIndex" value=""/>
			        		<form:hidden path="searchText1" />
			        	</form:form>	
		        	</div>						
			</div>
</body>
</html>