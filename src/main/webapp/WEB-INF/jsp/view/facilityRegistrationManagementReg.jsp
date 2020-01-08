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
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
									<form id="insertFrm" name="insertFrm" action="#" method="POST">
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">시설명 * </th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityNm" name="facilityNm" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">위치 * </th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityLoc" name="facilityLoc" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">규모(인원) * </th>
											<td>
												<label class="input">
													<input type="text" id="facilityScale" name="facilityScale" class="input-sm" value="" maxlength="20" style="width:250px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비용</th>
											<td>
												<label class="input">
													<input type="text" id="facilityCost" name="facilityCost" class="input-sm" value="" maxlength="20" style="width:250px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">보유장비 * </th>
											<td>
												<label class="input" style="width:100%;">
													<input type="text" id="facilityEquip" name="facilityEquip" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상태</th>
											<td>
												<select id="facilitySt" name="facilitySt" style="width: 250px; height: 30px;">
													<option value="Y">활성</option>
													<option value="N">비활성</option>
												</select>
											</td>
										</tr>
										</form>
										<form id="imageFrm" name="imageFrm" action="#" method="POST" enctype="multipart/form-data">	
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">썸네일 *</th>
												<td>
													<input type="file" name="facilityImgFile" id="facilityImgFile" onchange="getThumbnailPrivew(this,$('#image'))"><br>
													<input type="hidden" id="chkImg" name="chkImg" value="" />
													<div id='image'></div>
												</td>
											</tr>
										</form>
									</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/db/facility/facilityRegistrationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
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
					 $.ajax({
							type : 'post',
							url:'/db/facility/facilityInsert.do',
							data: $('#insertFrm').serialize(),
							dataType: 'json',
							success : function(data) {
								if(data.returnCode == 0){
				                    alert("등록을 실패 하였습니다.");
				                    return;
				                }else{
				                	imageUpload();
			                		alert("등록이 완료 되었습니다.");
			                		location.reload();
									return false;
				                }
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

			if($('#facilityEquip').val() == ""){
				alert("보유장비를 입력하세요.");
				$('#facilityEquip').focus();
				return;
			}
			
			if($('#chkImg').val() != 'Y'){
				alert('시설 이미지(썸네일)를 업로드하세요.');
				return;
			}
			
			return retValue;
		}
		
		function imageUpload(){
			var form = $('#imageFrm')[0];
			var formData = new FormData(form);
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "/db/facility/facilityImgUpload.do",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        async: false,
		        success: function (data) {
		        	if(data == '100'){
				       console.log('업로드가 완료되었습니다.');
			        }
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		            alert("사진 업로드가 실패하였습니다.")
		        }
		    });
		}
    </script>
</body>
</html>