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
				<li>Home</li><li>회원 관리</li><li><b>권한 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>권한 관리</b></h1>
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
													<option value="3" ${searchVO.searchType eq 3 ? 'selected="selected"' : '' }>소속</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">권한</th>
											<td>
												<select name="memberAuthType" id="memberAuthType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="AA" ${searchVO.memberAuthType eq 'AA' ? 'selected="selected"' : '' }>마스터</option>
													<option value="BB" ${searchVO.memberAuthType eq 'BB' ? 'selected="selected"' : '' }>일반회원</option>
													<option value="CC" ${searchVO.memberAuthType eq 'CC' ? 'selected="selected"' : '' }>사업담당자</option>
													<option value="DD" ${searchVO.memberAuthType eq 'DD' ? 'selected="selected"' : '' }>기업회원</option>
													<option value="EE" ${searchVO.memberAuthType eq 'EE' ? 'selected="selected"' : '' }>전문가</option>
													<option value="FF" ${searchVO.memberAuthType eq 'FF' ? 'selected="selected"' : '' }>바이어</option>
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
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
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
													<td><input type="checkbox" name="checkRow" id="checkRow" value="<c:out value='${result.memberIdx}' />"/></td>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td><c:out value="${result.memberId}"/></td>
													<td><c:out value="${result.memberNm}"/></td>
													<td><c:out value="${result.memberBelong}"/></td>
													<td><c:out value="${result.memberHp}"/></td>
													<td><c:out value="${result.memberJoinDt}"/></td>
													<td>
														<select id="memberAuth" name="memberAuth" style="width: 150px; height: 30px;">
															<option value="AA" ${result.memberAuth eq '마스터' ? 'selected="selected"' : '' }>마스터</option>
															<option value="BB" ${result.memberAuth eq '일반회원' ? 'selected="selected"' : '' }>일반회원</option>
															<option value="CC" ${result.memberAuth eq '사업담당자' ? 'selected="selected"' : '' }>사업담당자</option>
															<option value="DD" ${result.memberAuth eq '기업회원' ? 'selected="selected"' : '' }>기업회원</option>
															<option value="EE" ${result.memberAuth eq '전문가' ? 'selected="selected"' : '' }>전문가</option>
															<option value="FF" ${result.memberAuth eq '바이어' ? 'selected="selected"' : '' }>바이어</option>
														</select> 
													</td>
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
				<a href="#" class="btn btn-primary" id="saveBtn" ><b>저장</b></a>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
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
							data: $('#authFrm').serialize(),
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
        	$('#memberAuthType').val();
        	
   			$('#searchFrm').attr('action', "/db/member/authList.do").submit();
        }
        
        
        function checkValue(){ 
     		var retValue = true;
     		
    		if(!$('input:checkbox[id="checkRow"]').is(":checked")){
    			alert("권한을 변경 할 대상을 선택하세요.");
    			return ;
    		}
    		
    		return retValue;
    	}  
        
    </script>
</body>
</html>