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
	
	});


	/* pagenation*/
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/view/frontView/onlineCounselingStatus.do'/>";
		document.listForm.submit();
	}
	
	function busPopTest(memberId,onestopSupportNo,compTelNo,adviceHopeDt,advicePlaceCd,adviceAreaCd,adviceApplicCont){
		//alert("test");
		
		$('#memberId').val(memberId);
		$('#onestopSupportNo').val(onestopSupportNo);
		$('#compTelNo').val(compTelNo);
		$('#adviceHopeDt').val(adviceHopeDt);
		$('#advicePlaceCd').val(advicePlaceCd);
		$('#adviceAreaCd').val(adviceAreaCd);
		$('#adviceApplicCont').val(adviceApplicCont);
		
		//alert("memberId :: " + memberId);
		//alert("onestopSupportNo :: " + onestopSupportNo);
		//alert("compTelNo :: " + compTelNo);
		//alert("adviceHopeDt :: " + adviceHopeDt);
		//alert("advicePlaceCd :: " + advicePlaceCd);
		//alert("adviceAreaCd :: " + adviceAreaCd);
		//alert("adviceApplicCont :: " + adviceApplicCont);
		
		$("#busPop").show();
		
		$("#closeBtn").click(function(){
			$("#busPop").hide();
		});

		$("#closeBtnX").click(function(){
			$("#busPop").hide();
		});

		//$('#searchDetail').attr('action', "/db/onlineCounselingStatusPopup").submit();		
		$('.onestopSupportNo').html(onestopSupportNo);
		$('.compTelNo').html(compTelNo);
		$('.adviceHopeDt').html(adviceHopeDt);
		$('.advicePlaceCd').html(advicePlaceCd);
		$('.adviceAreaCd').html(adviceAreaCd);
		$('.adviceApplicCont').html(adviceApplicCont);
		
		//alert("test2");

	}
	
	
	
</script>

<body>
	<jsp:include page="menu.jsp"></jsp:include>
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
						<div class="clearfix col888">
							총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건
							<select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select>
						</div>
						
						<form role="form" id="searchDetail" action="/frontView/companyListSearch.do" class="form-horizontal" method="post">
						
						<table class="table01 datetable">
							<thead>
								<colgroup>
									<col width="180px" /><col width="*" /><col width="180px" />
								</colgroup>
									<tr>
										<th class="mdel">NO</th>
										<th>담당자</th>
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
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>
												<c:out value="${result.pageNum}"/>
											</td>
											<td>
												<a href = "javascript:busPopTest('${result.memberId}','${result.onestopSupportNo}','${result.compTelNo}','${result.adviceHopeDt}','${result.advicePlaceCd}','${result.adviceAreaCd}','${result.adviceApplicCont}');">
													<c:out value="${result.compApplNm}"/>
												</a>
											</td>
											<td>
												<c:out value="${result.suppBussAreaCd}"/>
											</td>
											<td>
												<c:out value="${result.proMemberId}"/>
											</td>
											<td>
												<c:out value="${result.applicatDt}"/>
											</td>
											<td>
												<c:out value="${result.applicStCd}"/>
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


<div class="layer" style="display: none;" id="busPop">
	<div class="box boxw600" style="width:5000%; height: 5000%; margin-top: -425px;">
		<form role="form" id="searchDetail" action="/frontView/companyListSearch.do" class="form-horizontal" method="post">
		   <input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="${detail.onestopSupportNo}">
			<input type="hidden" name="memberId" id="memberId" value="${detail.memberId}">
		
		<div class="ti">온라인 상담내역</div>
		<div class="">
		
			<div class="sti">신청내용</div>
			<table class="table01">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<c:forEach var="result" items="${resultList1}" varStatus="status">
				<tr>
					<th>업체(기관)명</th>
					<td colspan="2">
						<c:out value="${result.joinTypeCdNm}"/>
					</td>
					<th>대표자명</th>
					<td>
						<c:out value="${result.memberNm}"/>
					</td>
				</tr>
				<tr>
					<th>사업분야</th>
					<td colspan="2">
						<c:out value=""/>
					</td>
					<th>종업원수</th>
					<td>
						<c:out value="${result.entprResultEmpCnt}"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="4">
						<c:out value="${result.memberAddr}"/>
					</td>
				</tr>
				
				<tr>
					<th rowspan="3">신청인</th>
					<th>성명</th>
					<td>
						<c:out value="${result.memberNm}" />
					</td>
					<th>직위</th>
					<td>
						<c:out value="${result.entprEmployeePosition}" />
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<c:out value="${result.memberHeadTel}" />
					</td>
					<th>팩스번호</th>
					<td>
						<c:out value="${result.memberTel}" />
					</td>
				</tr>	
					
				<tr>
					<th>핸드폰</th>
					<td>
						<c:out value="${result.memberHp}" />
					</td>
					<th>이메일</th>
					<td>
						<c:out value="${result.memberMail}" />
					</td>
				</tr>
				
			</c:forEach>
			</table>
		
			
		<div class="sti">사용자원</div>
		
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>희망일자</th>
					<td class="adviceHopeDt">
						<c:out value="${result.adviceHopeDt}" />
					</td>
				</tr>
 				<tr>
					<th>희망장소</th>
					<td class="advicePlaceCd">
						<c:out value="${result.advicePlaceCd}" />
					</td>
				</tr>
 				<tr>
					<th>자문신청분야</th>
					<td class="adviceAreaCd">
						<c:out value="${result.adviceAreaCd}" />
					</td>
				</tr>
 				<tr>
					<th>자문내용</th>
					<td class="adviceApplicCont">
						<c:out value="${result.adviceApplicCont}" />
					</td>
				</tr>
			</table>
		


			<div class="submitbtn">
<!-- 				<a href="#" id="createBtn">
 -->					<!-- <button type="submit" class="ok">신청하기</button> -->
<!-- 				</a> -->
				<a href="#" id="closeBtn">
					<button type="button">확인</button>	
				</a>

			</div>
			
			<a href="#" id="closeBtnX">
				<button type="button" class="btn_close">X</button>
			</a>
		</div>
		</form>
	</div>
</div>



<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
	<input type="hidden" name="memberIdx" id="memberIdx" value="">
	<input type="hidden" name="memberId" id="memberId" value="">
	<input type="hidden" name="memberPw" id="memberPw" value="">
	<input type="hidden" name="memberNm" id="memberNm" value="">
	<input type="hidden" name="memberAddr" id="memberAddr" value="">
	<input type="hidden" name="memberTel" id="memberTel" value="">
	<input type="hidden" name="memberHp" id="memberHp" value="">
	<input type="hidden" name="memberMail" id="memberMail" value="">
	<input type="hidden" name="memberBelong" id="memberBelong" value="">
	<input type="hidden" name="memberJoinDt" id="memberJoinDt" value="">
	<input type="hidden" name="memberJoinType" id="memberJoinType" value="">
	<input type="hidden" name="memberSt" id="memberSt" value="">
	<input type="hidden" name="memberSchool" id="memberSchool" value="">
	<input type="hidden" name="memberMajor" id="memberMajor" value="">
	<input type="hidden" name="memberAffiliation" id="memberAffiliation" value="">
	<input type="hidden" name="memberDepartment" id="memberDepartment" value="">
	<input type="hidden" name="memberSpecialty" id="memberSpecialty" value="">
	<input type="hidden" name="memberDetails" id="memberDetails" value="">
	<input type="hidden" name="memberInterests" id="memberInterests" value="">
	<input type="hidden" name="memberFieldinterest" id="memberFieldinterest" value="">
	<input type="hidden" name="memberFax" id="memberFax" value="">
	<input type="hidden" name="memberMyaddr" id="memberMyaddr" value="">
	<input type="hidden" name="memberMyfax" id="memberMyfax" value="">
	
	<input type="hidden" name="applicatDt" id="applicatDt" value="">
	<input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="">
	<input type="hidden" name="compTelNo" id=compTelNo value="">
	<input type="hidden" name="adviceHopeDt" id=adviceHopeDt value="">
	<input type="hidden" name="advicePlaceCd" id=advicePlaceCd value="">
	<input type="hidden" name="adviceAreaCd" id=adviceAreaCd value="">
	<input type="hidden" name="adviceApplicCont" id=adviceApplicCont value="">
	
	
</form>

</body>
</html>




