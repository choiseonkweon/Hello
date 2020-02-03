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
<div id="wrap" class="sub s5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>마이페이지</span>
				<span class="now">시설 및 자원 사용신청현황</span>

			</div>

		</div>
		<div class="layout01">
			<h2 class="">시설 및 자원 사용신청현황 - 전전남콘텐츠기업육성센터의 시설 및 자원 사용신청 내용을 확인할 수 있습니다.</h2>
			<div class="cont">
				<h3>시설 및 자원 사용신청현황</h3>
				<div class="continner">
					<div class="datelist">

						<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">	
						<div class="clearfix col888">
							총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" />건
							<select class="floatR" name="searchType" id="searchType"style="width: 150px;"onchange="ListOnchange('')">
							<option value="" >전체</option>
							<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>접수</option>
							<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>진행중</option>
							<option value="3" ${searchVO.searchType eq 3 ? 'selected="selected"' : '' }>반려</option>
							<option value="4" ${searchVO.searchType eq 4 ? 'selected="selected"' : '' }>완료</option>
						</select>
						</div>
						<table class="table01 datetable">
							<colgroup>
								<col width="80px" class="mdel" />
								<col width="13%" />
								<col width="*" />
								<col width="13%" />
								<col width="13%" />
							</colgroup>
							<thead>
								<tr>
									<th class="mdel">NO</th>
									<th>시설명</th>
									<th>예약일</th>
									<th>신청일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="4">조회 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount ne 0 }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td class="mdel"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
											<td>${result.facilityNm}</td>
											<td>${result.useFrDt} ${result.useFrTm} ~ ${result.useToDt} ${result.useToTm}</td>
											<td>${result.regDt}</td>
											<td>${result.applicStCd}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<br/>
						<c:if test="${paginationInfo.totalRecordCount ne 0 }">
							<div class="paging">
								<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
					        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					        		<form:hidden path="pageIndex" />
					        	</form:form>	
							</div>
						</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javaScript" >
	function ListOnchange(){
	$('#searchFrm').attr('action', "/db/facilitiesResourcesApplicationStatus.do").submit();	
	}
	
    /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	document.listForm.pageIndex.value = pageNo;
    	document.listForm.action = "<c:url value='/facilitiesResourcesApplicationStatus.do'/>";
       	document.listForm.submit();
    }
	$(document).ready(function () {
		});
        
    </script>
</body>
</html>