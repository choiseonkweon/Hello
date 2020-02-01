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
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>시설 등록</b></h1>
				</div>
			</div>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
						<div class="table-responsive">
						<form id="insertFrm" name="insertFrm" action="#" method="POST" enctype="multipart/form-data">
						    <input type="hidden" id="facilityId" name="facilityId"  value="<c:out value='${facilityDetailResult.facilityId}'/>"/> 
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">시설명 * </th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityNm" name="facilityNm" class="input-sm" value="<c:out value="${facilityDetailResult.facilityNm}"/>" style="width:100%;" maxlength="30">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">위치 * </th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityLoc" name="facilityLoc" class="input-sm" value="<c:out value="${facilityDetailResult.facilityLoc}"/>" style="width:100%;" maxlength="30">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">규모(인원) * </th>
											<td>
												<label class="input">
													<input type="text" id="facilityScale" name="facilityScale" class="input-sm" value="<c:out value="${facilityDetailResult.facilityScale}"/>" maxlength="10" style="width:250px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">관리부서</th>
											<td>
												<select id="facilityMngDeptCd" name="facilityMngDeptCd" style="width: 250px; height: 30px;">
												<option value="">선택</option>
													<c:forEach var="mngDeptCd" items="${mngDeptCd}" varStatus="status">
														<option value="${mngDeptCd.commonCd}" ${mngDeptCd.commonCd eq facilityDetailResult.facilityMngDeptCd  ? 'selected="selected"' : '' }>${mngDeptCd.commonNm}</option>
													</c:forEach>													
												</select>
											</td>
										</tr>										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비용</th>
											<td>
												<label class="input">
													<input type="text" id="facilityCost" name="facilityCost" class="input-sm" value="<c:out value="${facilityDetailResult.facilityCost}"/>" style="width:250px;" maxlength="10">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">보유장비</th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityEquip" name="facilityEquip" class="input-sm" value="${facilityDetailResult.facilityEquip}" style="width:100%;" maxlength="30">
												</label>
											</td>
										</tr>
										<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">썸네일 *</th>
												<td>
													<c:if  test="${empty facilityDetailResult.facilityImg}">
															<input type="file" name="facilityImgFile" id="facilityImgFile" onchange="getThumbnailPrivew(this,$('#image'))"><br>
															<input type="hidden" id="chkImg" name="chkImg" value="" />
															<div id='image'></div>
													</c:if>
													<c:if  test="${!empty facilityDetailResult.facilityImg}">
															<input type="hidden" id="chkImg" name="chkImg" value="Y" />
															<input type="button" style="margin-bottom:15px;" class="fileBtn" onclick="$('#facilityImgFile').click();" value="파일 선택"/> <span id="fileName" class="fileBtn"><c:out value="${facilityDetailResult.facilityImg.replace('/','')}"/></span>
															<input type="file" name="facilityImgFile" style="display:none;" id="facilityImgFile" onchange="fileChange(this,$('#image'))"><br>
															<input type="hidden" id="facilityImg" name="facilityImg" value="${facilityDetailResult.facilityImg}" />
															<div id='image'>
																<img src="${pageContext.request.contextPath }<spring:message code="file.facilityImgPath"/><c:out value="${facilityDetailResult.facilityImg}"/>" border="0" alt="" />
															</div>
													</c:if>													
												</td>
											</tr>										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">기능(유형)</th>
											<td>
												<select id="facilityFuncCd" name="facilityFuncCd" style="width: 250px; height: 30px;">
												<option value="">선택</option>
													<c:forEach var="facilityFuncCd" items="${facilityFuncCd}" varStatus="status">
														<option value="<c:out value="${facilityFuncCd.commonCd}"/>" ${facilityFuncCd.commonCd eq facilityDetailResult.facilityFuncCd  ? 'selected="selected"' : '' }>${facilityFuncCd.commonNm}</option>
													</c:forEach>		
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상태 * </th>
											<td>
												<select id="facilitySt" name="facilitySt" style="width: 250px; height: 30px;">
													<c:forEach var="facilityStCd" items="${facilityStCd}" varStatus="status">
														<option value="<c:out value="${facilityStCd.commonCd}" />" ${facilityStCd.commonCd eq facilityDetailResult.facilitySt  ? 'selected="selected"' : '' }> ${facilityStCd.commonNm}</option>
													</c:forEach>		
												</select>
											</td>
										</tr>
									</tbody>
							</table>
							</form>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="#" id="cancelBtn" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="createBtn" class="btn btn-primary" ><b>저장</b></a>
							</div>
						</div>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
	
	<script type="text/javaScript" language="javascript" defer="defer">
		$(document).ready(function () {

			$("#createBtn").click(function(){
				if(checkValue()){
					var formData = new FormData(document.insertFrm);

					 $.ajax({
							type : 'post',
							url:'/db/facility/facilitySave.do',
							enctype: 'multipart/form-data',
							data: formData,
							dataType: 'json',
							contentType : false,
					        processData : false,  
							success : function(data) {
			                		alert("저장이 완료 되었습니다.");
			                		location.href = "/db/facility/facilityRegistrationManagementList.do";
									return false;
							},  
						    error:function(request,status,error){ //ajax 오류인경우  
					            alert("작업중 에러가 발생했습니다.");      
					            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   		} 
					 });
				}
			});
			
			$("#cancelBtn").click(function(){
				if(confirm("이 페이지에서 나가시겠습니까?")){
					location.href = "/db/facility/facilityRegistrationManagementList.do";
				}
			});			
			
			
			
		});
		
		function checkValue(){
			var retValue = true;
			
			if($('#facilityNm').val() == ""){
				alert("시설명을 입력하세요.");
				$('#facilityNm').focus();
				return;
			}
			
			if($('#facilityLoc').val() == ""){
				alert("위치를 입력하세요.");
				$('#facilityLoc').focus();
				return;
			}
			
			if($('#facilityScale').val() == ""){
				alert("규모(인원)를 입력하세요.");
				$('#facilityScale').focus();
				return;
			}
			
			if($('#facilityCost').val() == ""){
				alert("비용을 입력하세요.");
				$('#facilityCost').focus();
				return;
			}			
			
			if($('#chkImg').val() != 'Y'){
				alert('시설 이미지(썸네일)를 업로드하세요.');
				return;
			}
			
			return retValue;
		}
		
		function fileChange(html,$target){
			$("#facilityImgFile").css("display","");
			$(".fileBtn").css("display","none");
			getThumbnailPrivew(html,$target)
			
		}
    </script>
</body>
</html>