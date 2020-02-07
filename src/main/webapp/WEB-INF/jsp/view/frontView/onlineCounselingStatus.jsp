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
		$("#closeBtn").click(function(){
			$("#onlineModal").hide();
		});

		$("#closeBtnX").click(function(){
			$("#onlineModal").hide();
		});		
	});

	
	function ListOnchange(){
		$('#searchFrm').attr('action', "/db/onlineCounselingStatus.do").submit();	
		}

	/* pagenation*/
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/view/frontView/onlineCounselingStatus.do'/>";
		document.listForm.submit();
	}
	
	//상세보기 페이지
	function busPopTest(memberId,onestopSupportNo ){
		var JoinType = $('#JoinType').val();

		$.ajax({
			type : 'post',
			url:'/db/onlineCounselingStatusDetail.do',
			data: {"memberId"  : memberId,
				 	 "onestopSupportNo"	: onestopSupportNo
			},
			dataType: 'html',
			success : function(data) {
				$("#DetailShow").empty().append(data);
				
				$("#onlineModal").show();
				if(JoinType ==2){
					$('#expertFile').css('display','block');
				}
				
			},  
		    error:function(request,status,error){ //ajax 오류인경우  
	            alert("작업중 에러가 발생했습니다.");      
	            window.event.preventDefault();
	        } 
		});
	}
</script>

<body>
<div id="wrap" class="sub s5">
<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>마이페이지</span>
				<span class="now">온라인 상담신청 현황</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">마이페이지 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>MY 온라인 상담신청 현황</h3>
				<div class="continner">
					<div class="datelist">
						<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">	
						<input type="hidden" id="JoinType" value="${JoinType}"/>
						<div class="clearfix col888">
							총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" />건
							<select class="floatR" name="searchText" id="searchText"style="width: 150px;"onchange="ListOnchange('')">
							<option value="" >전체</option>
							<option value="1" ${searchVO.searchText eq 1 ? 'selected="selected"' : '' }>접수</option>
							<option value="2" ${searchVO.searchText eq 2 ? 'selected="selected"' : '' }>진행중</option>
							<option value="3" ${searchVO.searchText eq 3 ? 'selected="selected"' : '' }>반려</option>
							<option value="4" ${searchVO.searchText eq 4 ? 'selected="selected"' : '' }>완료</option>
						</select>
						</div>
						<table class="table01 datetable">
								<colgroup>
									<col width="180px" />
									<col width="*" />
									<col width="180px" />
								</colgroup>
							<thead>
									<tr>
										<th class="mdel">NO</th>
										<th>
											<c:if test="${JoinType==1}">신청기업명</c:if>
											<c:if test="${JoinType==2}">담당자</c:if>
											</th>
										<th>지원분야</th>
										<th>전문가</th>
										<th>신청일</th>
										<th>진행상태</th>
									</tr>
							</thead>
							<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="6">조회 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount > 0 }">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr>
											<td class=""><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
											<td>
												<a href = "javascript:busPopTest('${list.memberId}','${list.onestopSupportNo}');">
													<c:if test="${JoinType == 1}"><c:out value="${list.entprNm}"/></c:if>
													<c:if test="${JoinType == 2}"><c:out value="${list.entprRespsibNm}"/></c:if>
												</a>
											</td>
											<td>
												<c:out value="${list.suppBussAreaCd}"/>
											</td>
											<td>
												<c:out value="${list.proMemberId}"/>
											</td>
											<td>
												<c:out value="${list.regDt}"/>
											</td>
											<td>
												<c:out value="${list.applicStCd}"/>
											</td>
										</tr>
										
									</c:forEach>
								</c:if>
							</tbody> 
						</table>
						</form>
						
						<c:if test="${paginationInfo.totalRecordCount ne 0 }">
						<center>
							<div id="paging">
								<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
					        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					        		<form:hidden path="pageIndex" />
					        	</form:form>	
				        	</div>
				        	</center>
			        	</c:if> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="layer" style="display: none;" id="onlineModal">
	<div class="box boxw650" style="width:55%; height: 95%; margin-top: -465px; margin-left:-556px; overflow:scroll">s
		<div id="DetailShow">
		
		</div>

		<div class="submitbtn">
			<a href="#" id="closeBtn">
				<button type="button">확인</button>	
			</a>

		</div>
		<a href="#" id="closeBtnX">
			<button type="button" class="btn_close">X</button>
		</a>
	</div>
</div>



</body>
</html>




