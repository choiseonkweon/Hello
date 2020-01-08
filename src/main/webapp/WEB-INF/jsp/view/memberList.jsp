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

		$("#checkAll").click(function() {
			if ($("#checkAll").is(':checked')) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});

	});

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/member/memberList.do'/>";
		document.listForm.submit();
	}

	function enterKey() {
		if (window.event.keyCode == 13) {
			goSearch();
		}
	}

	function goSearch() {
		$('#searchFrm').attr('action', "/db/member/memberList.do").submit();
	}

	function moveDetailView(memberId,joinTypeCd) {
		$('#memberId').val(memberId);
		//alert($('#memberId'));
		$('#joinTypeCd').val(joinTypeCd);
		$('#memberDetailFrm').attr('action', "/db/member/memberDetail.do").submit();
	}

	function checkValue() {
		var retValue = true;
		var checklength = $('input:checkbox[id="checkRow"]:checked').length;

		if (!$('input:checkbox[id="checkRow"]').is(":checked")) {
			alert("가입을 승인 할 대상을 선택하세요.");
			return;
		}

		return retValue;
	}

	function memberOkay() {
		if (checkValue()) {
			if (confirm("회원을 승인 처리하시겠습니까?")) {
				$.ajax({
					type : 'post',
					url : '/db/member/memberConfirm.do',
					data : $("#memberListFrm").serialize(),
					dataType : 'json',
					success : function(data) {
						alert("승인 처리가 완료 되었습니다.");
						location.reload();
						return false;
					},
					error : function(request, status, error) { //ajax 오류인경우  
						alert("작업중 에러가 발생했습니다.");
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});
			}
		}
	}
	
	function memberCreate(){
		//var joinTypeCdNm = $("joinTypeCdNm").find("option:selected").val;
		var joinTypeCdNm = $("select[name='joinTypeCdNm']").val();
		if(joinTypeCdNm==000001){
			//alert("가");
			$('#memberListFrm').attr('action', "/db/member/memberCreate.do").submit();
		}
		else if(joinTypeCdNm==000002){
			//alert("나");
			$('#memberListFrm').attr('action', "/db/member/memberCreate1.do").submit();
		}
		else if(joinTypeCdNm==000003){
			//alert("다");
			$('#memberListFrm').attr('action', "/db/member/memberCreate2.do").submit();
		}
		else{
			alert("가입유형을 선택하시고 등록 버튼 누르세요");
			return false;
		} 
	}
	
	
</script>


<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>회원 관리</li><li><b>회원 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>회원 관리</b></h1>
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
											<th style="text-align:center;background:#eee;vertical-align:middle;" width="5%">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:100px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>아이디</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>이름</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th  style="text-align:center;background:#eee;vertical-align:middle;" width="100px">가입유형</th>
											<!-- <td class="select" name="radioTest" id="radioTest" style="width:100px; height: 31.5px;">
												<input type="radio" name="radio" id="000000" value="전체" checked="checked" ><span class="up">전체</span></input>
												<input type="radio" name="radio" id="000001" value="기업"><span class="up">기업</span></input>
												<input type="radio" name="radio" id="000002" value="전문가" ><span class="up">전문가</span></input>
												<input type="radio" name="radio" id="000003" value="바이어" ><span class="up">바이어</span></input>
											</td> -->
											<td>
												<select name="joinTypeCdNm" id="joinTypeCdNm" class="select" style="width:100px; height: 31.5px;">
													<option value="">전체</option>
													<option value="000001" ${searchVO.joinTypeCdNm eq 000001 ? 'selected="selected"' : '' }>기업회원</option>
													<option value="000002" ${searchVO.joinTypeCdNm eq 000002 ? 'selected="selected"' : '' }>전문가</option>
													<option value="000003" ${searchVO.joinTypeCdNm eq 000003 ? 'selected="selected"' : '' }>바이어</option>
												</select>
											</td>
												
											<th style="text-align:center;background:#eee;vertical-align:middle;" width="100px">상태</th>
											<td>
												<select name="memberAuthType" id="memberAuthType" class="select" style="width:100px; height: 31.5px;">
													<option value="">전체</option>
													<option value="N" ${searchVO.memberAuthType eq N ? 'selected="selected"' : '' }>미승인</option>
													<option value="Y" ${searchVO.memberAuthType eq Y ? 'selected="selected"' : '' }>승인</option>
												</select>
											</td>
											<td>
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
							</div> 
							<form id="memberListFrm" name="memberListFrm">
								<table class="table table-hover" id="tree">
									 <thead>
										<tr>
											<th scope="row"><input type="checkbox" name="checkAll" id="checkAll"></th>
											<th>No.</th>
											<th>아이디</th>
											<th>이름</th>
											<th>가입유형</th>
											<th>휴대폰번호</th>
											<th>E-mail</th>
											<th>가입일</th>
											<th>가입상태</th>
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
													<td><input type="checkbox" name="checkRow" id="checkRow" value="<c:out value='${result.memberId}' />" /></td>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td>
														<a href="javascript:moveDetailView('${result.memberId}','${result.joinTypeCd}');">
															<c:out value="${result.memberId}"/>
														</a>
													</td>
													<td>
														<a href="javascript:moveDetailView('${result.memberId}','${result.joinTypeCd}');">
															<c:out value="${result.memberNm}"/>
														</a>	
													</td>
													<td><c:out value="${result.joinTypeCd}"/></td>
													<td><c:out value="${result.memberHp}"/></td>
													<td><c:out value="${result.memberMail}"/></td>
													<td><c:out value="${result.regDt}"/></td>
													<td><c:out value="${result.memberStCd}"/></td>
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
				<a href="javascript:memberOkay();" class="btn btn-primary" ><b>가입승인</b></a>
				<!-- <a href="/db/member/memberCreate.do" class="btn btn-primary" ><b>등록</b></a> -->
				<a href="javascript:memberCreate();" class="btn btn-primary" ><b>등록</b></a>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="memberIdx" id="memberIdx" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="joinTypeCd" id="joinTypeCd" value="">
    </form>
    
</body>
</html>