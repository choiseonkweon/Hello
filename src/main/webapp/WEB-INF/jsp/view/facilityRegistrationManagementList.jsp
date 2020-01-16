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
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>시설 및 자원 관리</li><li><b>시설 등록 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>시설 등록 관리</b></h1>
				</div>
			</div>
			<!-- widget grid -->
			<section id="widget-grid" class="">
					<div class="well well-sm">
						<div class="table-responsive">
							<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="35%">
										<col width="10%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>시설명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>위치</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
												
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">관리부서</th>
											<td>
												<select name="mngDeptType" id="mngDeptType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<c:forEach var="mngDeptCd" items="${mngDeptCd}" varStatus="status">
														<option value="${mngDeptCd.commonCd}" ${searchVO.mngDeptType eq mngDeptCd.commonCd  ? 'selected="selected"' : '' }><c:out value="${mngDeptCd.commonNm}"/></option>
													</c:forEach>
												</select>	
												<a href="javascript:goSearch();" class="btn btn-primary" style="margin-left: 5px;"><b>검색</b></a>
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
							<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"><b>전체 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
							</div>
							<form role="form" id="facilityFrm" name="facilityFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>썸네일</th>
											<th>시설명</th>
											<th>위치</th>
											<th>규모(인원)</th>
											<th>보유장비</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="6">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td style="vertical-align: middle;"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td style="vertical-align: middle;"><img src="<c:out value="${result.facilityImg}"/>"  width="150" height="125"/></td>
													
													<td style="vertical-align: middle;">
														<a href="javascript:moveDetailView('${result.facilityId}');">
															<c:out value="${result.facilityNm}"/>
													   </a>
													</td>
													<td style="vertical-align: middle;"><c:out value="${result.facilityLoc}"/>
													
													</td>
													<td style="vertical-align: middle;"><c:out value="${result.facilityScale}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.facilityEquip}"/></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</form>
						</div>
						<c:if test="${paginationInfo.totalRecordCount ne 0 }">
							<div id="paging">
								<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
					        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					        		<form:hidden path="pageIndex" />
					        	</form:form>	
				        	</div>
			        	</c:if>
					</div>
			</section>
			<div style="padding-bottom:5px;text-align:right;">
				<a href="/db/facility/facilityRegistrationManagementReg.do" class="btn btn-primary" id="insertBtn" ><b>등록</b></a>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	<form role="form" id="facilityDetailFrm" action="#" class="form-horizontal" method="post">	 
	   <input type="hidden" name="facilityId" id="facilityId" value="">
    </form>	
	
	
	<script type="text/javaScript" >
		$(document).ready(function () {
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/facility/facilityRegistrationManagementList.do'/>";
           	document.listForm.submit();
        }
        
        function enterKey(){
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
        }
        
        function goSearch(){
   			$('#searchFrm').attr('action', "/db/facility/facilityRegistrationManagementList.do").submit();
        }
        
        function moveDetailView(facilityId){        
        	$('#facilityId').val(facilityId);
        	$('#facilityDetailFrm').attr('action', "/db/facility/facilityRegistrationManagementReg.do").submit();
        }       
        
    </script>
</body>
</html>