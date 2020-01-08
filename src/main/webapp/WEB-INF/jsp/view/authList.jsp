<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

</head>
<script type="text/javaScript" >
$(document).ready(function () {
	
	$("#checkAll").click(function(){ 
		if( $("#checkAll").is(':checked') ){
			$("input[type=checkbox]").prop("checked",true); 
		} else { 
			$("input[type=checkbox]").prop("checked",false); 
		} 
	});

	 $("#saveBtn").click(function(){
		if(checkValue()){
			 $.ajax({
					type : 'post',
					url:'/db/member/memberAuthSave.do',
					data: $('#memberListFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						alert("저장이 완료 되었습니다.");
						location.reload();
						return false;
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });
		}
	}); 
	
});


function checkValue(){ 
	var retValue = true;
	var checklength = $('input:checkbox[id="checkRow"]:checked').length;
	var obj;
	
	if(!$('input:checkbox[id="checkRow"]').is(":checked")){
		alert("권한을 변경 할 대상을 선택하세요.");
		return ;
	}else{
		
	}
	
	return retValue;
}  

function getSelectValue(obj){
	
	confirm("tetet");
	
	var authTpCdValue = (obj.options[obj.selectedIndex].value);
	var authTpCdText = (obj.options[obj.selectedIndex].text);
	var memberId = $('#mngId').val(memberId);
	
	alert("authTpCdValue :: " + authTpCdValue);
	alert("authTpCdText :: " + authTpCdText);
	alert("memberId :: " + memberId);
	
	 if(confirm("권한 변경 합니까")){
		$('#memberDetailFrm').attr('action', "/db/member/memberAuthSave.do").submit();
	} 
	
	//memberOkay(obj);
}

function memberOkay(obj) {

	/* var authTpCdValue = (obj.options[obj.selectedIndex].value);
	var authTpCdText = (obj.options[obj.selectedIndex].text);
	var memberId = $('#mngId').val(memberId);
	
	alert("authTpCdValue ::: " + authTpCdValue);
	alert("authTpCdText ::: " + authTpCdText);
	alert("memberId :: " + memberId); */
	//getSelectValue(obj);
	
	if (checkValue()) {
		if (confirm("권한 변경 하시겠습니까?")) {
			$.ajax({
				type : 'post',
				url : '/db/member/memberAuthSave.do',
				data : $("#memberListFrm").serialize(),
				dataType : 'json',
				success : function(data,authTpCdValue,authTpCdText) {
					//alert("authTpCdValue ::: : " + authTpCdValue);
					//alert("authTpCdText ::: : " + authTpCdText);
					alert("권한 변경 처리가 완료 되었습니다.");
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


function moveDetailView(memberId,authTpCd) {
	$('#mngId').val(memberId);
	$('#authTpCd').val(authTpCd);
	$('#memberDetailFrm').attr('action', "/db/member/memberDetailAuthList.do").submit();
}
  
      /* pagination 페이지 링크 function */
      function fn_egov_link_page(pageNo){
      	document.listForm.pageIndex.value = pageNo;
      	document.listForm.action = "<c:url value='/member/authList.do'/>";
         	document.listForm.submit();
      }
      
      function enterKey(){
      	if(window.event.keyCode == 13){
      		goSearch();
  		}
      }
      
      function goSearch(){
      	$('#searchType').val();
      	$('#searchText').val();
      	$('#authTpCd').val();
		$('#searchFrm').attr('action', "/db/member/authList.do").submit();
      }
      
      
</script>

<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>회원 관리</li><li><b>관리자 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>관리자 관리</b></h1>
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
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>아이디</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>이름</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">권한</th>
											<td>
												<select id="authTpCd" name="authTpCd" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="마스터" ${searchVO.authTpCd eq '000001' ? 'selected="selected"' : '' }>마스터</option>
													<option value="사업담당자" ${searchVO.authTpCd eq '000002' ? 'selected="selected"' : '' }>사업담당자</option>
													<option value="시설담당자" ${searchVO.authTpCd eq '000003' ? 'selected="selected"' : '' }>시설담당자</option>
													<option value="자문담당자" ${searchVO.authTpCd eq '000004' ? 'selected="selected"' : '' }>자문담당자</option>
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
							</div>
							<form role="form" id="memberListFrm" name="memberListFrm" action="#" class="form-horizontal" method="post">
							<input type="hidden" name="mngId" value="<c:out value='${searchVO.mngId}'/>"/>  
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="row"><input type="checkbox" name="checkAll" id="checkAll"></th>
											<th>No.</th>
											<th>아이디</th>
											<th>이름</th>
											<th>소속</th>
											<th>휴대폰번호</th>
											<th>가입일</th>
											<th>권한</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="8">조회 결과가 없습니다.</td>
											</tr>
										</c:if>	
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td><input type="checkbox" name="checkRow" id="checkRow" value="<c:out value='${result.mngId}' />"/></td>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td>
														<a href="javascript:moveDetailView('${result.mngId}','${result.authTpCd}');">
															<c:out value="${result.mngId}"/>
														</a>	
													</td>
													<td>
														<a href="javascript:moveDetailView('${result.mngId}','${result.authTpCd}');">
															<c:out value="${result.mngNm}"/>
														</a>	
													</td>
													<td>
														<a href="javascript:moveDetailView('${result.mngId}','${result.authTpCd}');">
															<c:out value="${result.mngBelong}"/>
														</a>	
													</td>
													<td><c:out value="${result.mngTel}"/></td>
													<td><c:out value="${result.regDt}"/></td>
													<td>
														<!-- <select id="authTpCd" class="authTpCd" name="authTpCd" style="width: 150px; height: 30px;" onchange="getSelectValue(this);"> -->
														<select id="authTpCd" class="authTpCd" name="authTpCd" style="width: 150px; height: 30px;">
															<option value="000001" ${result.authTpCd eq '마스터' ? 'selected="selected"' : '' }>마스터</option>
															<option value="000002" ${result.authTpCd eq '사업담당자' ? 'selected="selected"' : '' }>사업담당자</option>
															<option value="000003" ${result.authTpCd eq '시설담당자' ? 'selected="selected"' : '' }>시설담당자</option>
															<option value="000004" ${result.authTpCd eq '자문담당자' ? 'selected="selected"' : '' }>자문담당자</option>
														</select>
													</td>
												</tr>
												
											</c:forEach>
											<!-- 텍스트값: <input type="text" name="textValue">&nbsp;&nbsp;옵션값: <input type="text" name="optionValue"> -->
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
				<a href="javascript:memberOkay(this);" class="btn btn-primary" ><b>저장</b></a>
				<!-- <a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a> -->
				<a href="/db/member/memberDetailAuth.do" class="btn btn-primary" ><b>등록</b></a>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
    <form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="mngId" id="mngId" value="">
	   <input type="hidden" name="memberIdx" id="memberIdx" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="authTpCd" id="authTpCd" value="">
	   <input type="hidden" id="authTpCdValue" name="authTpCdValue" value=""/>
	   <input type="hidden" id="authTpCdText" name="authTpCdText" value=""/>
	   
	   <input type="hidden" id="searchType" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
	    <input type="hidden" id="searchText" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
	    <input type="hidden" id="memberSt" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
	    <input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

	   
    </form>
    
</body>
</html>


