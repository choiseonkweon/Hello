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
						<form role="form" id="resourFaciSearchFrm" name="resourFaciSearchFrm" action="#" class="form-horizontal" method="post">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">장비명</th>
										<td>
											<select name="searchType" id="searchType" class="select" style="width:100px; height: 31.5px;">
												<option value="">전체</option>
												<c:forEach var="resourFaciList" items="${resourFaciList}" varStatus="status">
													<option value="${resourFaciList.commonCd}" ${searchVO.searchType eq resourFaciList.commonCd  ? 'selected="selected"' : '' }><c:out value="${resourFaciList.commonNm}"/></option>
												</c:forEach>													
											</select>	
										</td>		
										<th style="text-align:center;background:#eee;vertical-align:middle;">유형</th>
										<td>
											<select name="searchType1" id="searchType1" class="select" style="width:100px; height: 31.5px;">
												<option value="">전체</option>
												<c:forEach var="codeList" items="${codeList}" varStatus="status">
													<option value="${codeList.commonCd}" ${searchVO.searchType1 eq codeList.commonCd  ? 'selected="selected"' : '' }><c:out value="${codeList.commonNm}"/></option>
												</c:forEach>													
											</select>	
										</td>
										</tr>
										<tr>		
											<th style="text-align:center;background:#eee;vertical-align:middle;">활용일</th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="searchFromDate" id="searchFromDate" readonly="readonly" style="width:100px;" placeholder=""  value="${searchVO.searchFromDate}" data-dateformat="yy-mm-dd"  />
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="searchToDate" id="searchToDate" readonly="readonly" style="width:100px;" placeholder="" value="${searchVO.searchToDate}" data-dateformat="yy-mm-dd">
												</label>
											<a href="javascript:goResourFaciSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
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
									<th><input type="checkbox" id="allCheck" name="allCheck" value="all" onclick="resourFaciAllCheck(this);"/></th>
									<th>장비명</th>
									<th>활용기관</th>
									<th>활용일</th>
								</tr>
							</thead>
								<tbody id="resourFaciListBody">
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="5">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td><input type='checkbox' id='chk_${status.index}' name='chk_${status.index}' value="${result.resourFaciId}${result.memberId}${result.appliNo}" value2="${result.resourFaciId}" onclick="resourFaciCheck(this)"/>												
													<td style="vertical-align: middle;"><c:out value="${result.resourFaciNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.compNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.useFrDt}"/>~<c:out value="${result.useToDt}"/></td>
												</tr>
											</c:forEach>
										</c:if>									
								</tbody>
						</table>
				</div>
					<div id="paging">
						<form:form commandName="searchVO" id="resourFaciListForm" name="resourFaciListForm" method="post">
			        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goEntprSearchPage" />
			        		<input type="hidden" id="resourFaciPageIndex" name="pageIndex" value=""/>
			        		<form:hidden path="searchType" />
			        		<form:hidden path="searchType1" />
			        		<form:hidden path="searchFromDate" />
			        		<form:hidden path="searchToDate" />
			        	</form:form>	
		        	</div>						
			</div>
</body>
</html>