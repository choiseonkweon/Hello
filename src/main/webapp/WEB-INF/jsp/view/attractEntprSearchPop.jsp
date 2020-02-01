<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<script type="text/javaScript" >
	$(document).ready(function () {
		betweenPicker("searchFromDate","searchToDate");
	});
</script>	
<body>
		<div class="modal-body">
				<div class="table-responsive">
					<div class="col-xs-12">
							<h6 class="page-title txt-color-blueDark"></h6>
					</div>
						<form role="form" id="entprSearchFrm" name="entprSearchFrm" action="#" class="form-horizontal" method="post">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">설립일 </th>
											<td>
												<label class="input"> 
													<input class="input-sm" type="text" name="searchFromDate" id="searchFromDate" style="width:100px;" placeholder=""  value="${searchVO.searchFromDate}" data-dateformat="yy-mm-dd"  />
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="searchToDate" id="searchToDate" style="width:100px;" placeholder="" value="${searchVO.searchToDate}" data-dateformat="yy-mm-dd">
												</label>
											</td>									
										<th style="text-align:center;background:#eee;vertical-align:middle;">기업명</th>
										<td>
											<select name="searchType1" id="searchType1" class="select" style="width:100px; height: 31.5px;">
												<option value="">전체</option>
												<c:forEach var="largeBussAreaCd" items="${largeBussAreaList}" varStatus="status">
													<option value="${largeBussAreaCd.commonCd}" ${searchVO.searchType1 eq largeBussAreaCd.commonCd  ? 'selected="selected"' : '' }><c:out value="${largeBussAreaCd.commonNm}"/></option>
												</c:forEach>													
											</select>	
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
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>								
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheck" name="allCheck" value="all" onclick="entprAllCheck(this);"/></th>
									<th>업종</th>
									<th>업체명</th>
									<th>설립일</th>
									<th>자본금</th>
									<th>고용인원</th>
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
													<td style="vertical-align: middle;"><c:out value="${result.entprType}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.entprNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.entprEstDt}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.entprCapitalAmt}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.entprResultEmpCnt}"/></td>
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
			        		<form:hidden path="searchType1" />
			        		<form:hidden path="searchFromDate" />
			        		<form:hidden path="searchToDate" />
			        	</form:form>	
		        	</div>						
			</div>
</body>
</html>