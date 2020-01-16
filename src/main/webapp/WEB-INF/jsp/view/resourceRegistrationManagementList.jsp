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
				<li>Home</li><li>시설 및 자원 관리</li><li><b>자원 등록 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>자원 등록 관리</b></h1>
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
										<col width="30%">
										<col width="10%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자원명</th>
											<td>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											<th style="text-align:center;background:#eee;vertical-align:middle;">관리부서</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<c:forEach var="resourceStCd" items="${resourceStCd}" varStatus="status">
														<option value="${resourceStCd.commonCd}" ${searchVO.searchType eq resourceStCd.commonCd  ? 'selected="selected"' : '' }><c:out value="${resourceStCd.commonNm}"/></option>
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
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>썸네일</th>
											<th>자원</th>
											<th>상태</th>
											<th>수정일자</th>
											<th>삭제</th>
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
													<td style="vertical-align: middle;"><img src="<c:out value="${result.resourceImg}"/>"  width="177" height="125" /></td>
													<td style="vertical-align: middle;" >
														<a href="javascript:goPopView('${result.resourceId}');">
															<c:out value="${result.resourceNm}"/>
														</a>
													</td>
													<td style="vertical-align: middle;"><c:out value="${result.resourceSt}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.resourceRegDt}"/></td>
													<td style="vertical-align: middle;"><a href="javascript:resourceDelete('<c:out value="${result.resourceId}"/>','<c:out value="${result.resourceImg}"/>')" class="btn btn-primary" ><b>삭제</b></a></td>
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
			
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
						 <b>자원 등록 관리</b>
						</h4>
					</div>
					<div class="modal-body">
							<div class="table-responsive">
								<div class="col-xs-12">
										<h6 class="page-title txt-color-blueDark"></h6>
									</div>
									<form id="insertFrm" name="insertFrm" action="#" method="POST" enctype="multipart/form-data">
									<input type="hidden" id="resourceId" name="resourceId" value="" />
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="20%">
											<col width="*">
										</colgroup>
										<tbody>
												<tr>
													<th style="text-align:center;background:#eee;vertical-align:middle;">썸네일 *</th>
													<td>
														<input type="file" name="resourceImgFile" id="resourceImgFile" onchange="getThumbnailPrivew(this,$('#image'))"><br>
														<input type="hidden" id="chkImg" name="chkImg" value="" />
														<div id='image'></div>
													</td>
												</tr>		
												<tr>
													<th style="text-align:center;background:#eee;vertical-align:middle;">자원명 *</th>
													<td>
														<label class="input">
															<input type="text" id="resourceNm" name="resourceNm" class="input-sm" value="" maxlength="20" style="width:250px;">
														</label>
													</td>
												</tr>
												<tr>
													<th style="text-align:center;background:#eee;vertical-align:middle;">관리부서 </th>
													<td>
														<select id="resourceMngDeptCd" name="resourceMngDeptCd" style="width: 250px; height: 30px;">
															<option value="">선택</option>
																<c:forEach var="mngDeptCd" items="${mngDeptCd}" varStatus="status">
																	<option value="${mngDeptCd.commonCd}">${mngDeptCd.commonNm}</option>
																</c:forEach>																
														</select>
													</td>
												<tr>
													<th style="text-align:center;background:#eee;vertical-align:middle;">자원 상태 </th>
													<td>
														<select id="resourceSt" name="resourceSt" style="width: 250px; height: 30px;">
																<c:forEach var="resourceStCd" items="${resourceStCd}" varStatus="status">
																	<option value="${resourceStCd.commonCd}">${resourceStCd.commonNm}</option>
																</c:forEach>																
														</select>
													</td>
												</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>	
						<footer>
						<div class="modal-footer" style="align-items: center;">
					        <button type="button" class="btn btn-primary" onclick="resoureSave();">저장</button>
			            </div>
						</footer>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->			
			
			<div style="padding-bottom:5px;text-align:right;">
				<a href="#" class="btn btn-primary" id="createBtn" ><b>등록</b></a>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<script type="text/javaScript" >
		$(document).ready(function () {
			$("#createBtn").click(function(){
				goPopView();
			});
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/resource/resourceRegistrationManagementList.do'/>";
           	document.listForm.submit();
        }
        
        function goSearch(){
   			$('#searchFrm').attr('action', "/db/resource/resourceRegistrationManagementList.do").submit();
        }
        
        function checkValue(){
			var retValue = true;
			
			if($('#resourceNm').val() == ""){
				alert("자원명을 입력하세요.");
				$('#resourceNm').focus();
				return;
			}
			
			if($('#chkImg').val() != 'Y'){
				alert('자원 이미지(썸네일)를 업로드하세요.');
				return;
			}
			
			return retValue;
		}
		
        function goPopView(resourceId){
        	
        	if(resourceId === undefined || resourceId === ""){
        		inputClear();
	        	$('#myModal').modal('show');
        		
        	}else{
   			 $.ajax({
					type : 'post',
					url:'/db/resource/resourceRegistrationManagementReg.do',
					enctype: 'multipart/form-data',
					data: "resourceId="+resourceId,
					dataType: 'json',
					success : function(data) {
		         		var resultData = data.resourceDetailResult;
		         		$("#resourceId").val(resultData.resourceId);
						$("#resourceNm").val(resultData.resourceNm);
						$("#resourceMngDeptCd").val(resultData.resourceMngDeptCd);
						$("#resourceSt").val(resultData.resourceSt);
						
		         		$('#myModal').modal('show');
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });				
        		
        	}
        }   
        
        function inputClear(){
        	$("#resourceId").val("");
			$("#resourceNm").val("");
			$("#resourceMngDeptCd").val("");
			$("#resourceSt option:eq(0)").prop("selected","true");
        	
        }
        
        function resoureSave(){
    		if(checkValue()){
    			 $.ajax({
    					type : 'post',
    					url:'/db/resource/resourceSave.do',
    					enctype: 'multipart/form-data',
    					data: $('#insertFrm').serialize(),
    					dataType: 'json',
    					success : function(data) {
    		         		alert("저장이 완료 되었습니다.");
    		         		location.reload();
    					},  
    				    error:function(request,status,error){ //ajax 오류인경우  
    			            alert("작업중 에러가 발생했습니다.");      
    			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			   		} 
    			 });
    		}        	
        }        
		
		function resourceDelete(resourceId,resourceImg){
			if(confirm("정말로 삭제 하시겠습니까?")){
				$.ajax({
					type : 'post',
					url:'/db/resource/resourceDelete.do',
					data: {
						resourceId : resourceId,
						resourceImg : resourceImg
					},
					dataType: 'json',
					success : function(data) {
	                		alert("삭제가 완료 되었습니다.");
	                		location.reload();
							return false;
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
			}
		}
        
    </script>
</body>
</html>