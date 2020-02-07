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
			
			$("#checkAll").click(function(){ 
				if( $("#checkAll").is(':checked') ){
					$("input[type=checkbox]").prop("checked",true); 
				} else { 
					$("input[type=checkbox]").prop("checked",false); 
				} 
			});
			
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/enterprise/enterpriseInformationManagementList.do'/>";
           	document.listForm.submit();
        }
        
        function enterKey(){
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
        }
        
        function goSearch(){
   			$('#searchFrm').attr('action', "/db/enterprise/enterpriseInformationManagementList.do").submit();
        }
        
        function moveDetailView(memberId){
        	$('#memberId').val(memberId);
        	$('#memberDetailFrm').attr('action', "/db/enterprise/enterpriseInformationManagementDetail.do").submit();
        }
        
        function checkValue(){ 
	 		var retValue = true;
	 		var checklength = $('input:checkbox[id="checkRow"]:checked').length;
	 		
			if(!$('input:checkbox[id="checkRow"]').is(":checked")){
				alert("가입을 승인 할 대상을 선택하세요.");
				return ;
			}
			
			return retValue;
		}  
        
</script>

<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>기업정보 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업정보 관리</b></h1>
				</div>
			</div>
			<!-- widget grid -->
			<section id="widget-grid" class="">
					<div class="well well-sm">
						<div class="table-responsive">
							<form role="form" id="searchFrm" action="/member/memberList.do" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>기업명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>대표자</option>
													<%-- <option value="3" ${searchVO.searchType eq 3 ? 'selected="selected"' : '' }>소속</option> --%>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">분야</th>
											<td>
												<select name="searchSelect" id="searchSelect"  class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status">
														<option value="${largeBussAreaCd.commonCd}" <c:if test="${largeBussAreaCd.commonCd eq searchVO.searchSelect}"> selected</c:if>>${largeBussAreaCd.commonNm}</option>
													</c:forEach>
												</select>
												<a href="javascript:goSearch();" class="btn btn-primary" style="margin-left: 200px;"><b>검색</b></a>
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
								<%-- <h6 class="page-title txt-color-blueDark"><b>전체 : <fmt:formatNumber value="2" pattern="#,###" /> 건</b></h6> --%>
							</div>
							<form id="memberListFrm" name="memberListFrm">
								<table class="table table-hover">
									<thead>
										<tr>
											<!-- <th scope="row"><input type="checkbox" name="checkAll" id="checkAll"></th> -->
											<th>No.</th>
											<th>기업명</th>
											<th>대표자</th>
											<th>분야</th>
											<th>고용인원</th>
											<th>대표전화</th>
											<th>소재지</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="9">조회 결과가 없습니다.</td>
											</tr>
										</c:if>	
										 <c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<%-- <td><input type="checkbox" name="checkRow" id="checkRow" value="<c:out value='${result.memberId}' />" /></td> --%>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td>
														<a href="javascript:moveDetailView('${result.memberId}');">
															<c:out value="${result.entprNm}"/>
														</a>														
													</td>
													<td>
														<a href="javascript:moveDetailView('${result.memberId}');">
															<c:out value="${result.entprCeo}"/>
														</a>														
													</td>
													<td><c:out value="${result.largeBussAreaCd}"/></td>
													<td><c:out value="${result.entprResultEmpCnt}명"/></td>
													<td><c:out value="${result.entprHeadTel}"/></td>
													<td><c:out value="${result.entprHeadAddr}"/></td>
												</tr>
											</c:forEach>
										</c:if> 
									</tbody>
								</table>
							</form>
						</div>
						
						<!-- 페이징처리 -->
						<c:if test="${paginationInfo.totalRecordCount == 0 }">
						</c:if>
						<c:if test="${paginationInfo.totalRecordCount > 1 }">
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
				<!-- <a href="/db/enterprise/enterpriseInformationManagementRegister.do" class="btn btn-primary" ><b>등록</b></a> -->
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="memberId" id="memberId" value="">
    </form>
     
	
</body>
</html>


