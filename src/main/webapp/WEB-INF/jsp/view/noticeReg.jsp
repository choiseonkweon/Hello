<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../ckeditor/ckeditor.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function () {
		
		
		
		$("#saveBtn").click(function(){
			var formData = new FormData();
			 formData.append("noticeIdx",$('#noticeIdx').val());
			 var noticeCont = CKEDITOR.instances.upnoticeCont.getData();	
			 var radioVal = $('input[name="upnoticeImptYn"]:checked').val()
			 formData.append("noticeTitle",$('#upnoticeTitle').val());
			 formData.append("noticeImptYn",$('#upnoticeImptYn').val());
				formData.append("noticeOpenYn",$('#upnoticeOpenYn').val());
				formData.append("noticeImptYn",radioVal); 
				formData.append("noticeCont",noticeCont);
				formData.append("entprEmployeePhone",$('#upentprEmployeePhone').val());
				formData.append("fileupload", $("input[name=upnoticeFiles]")[0].files[0]);
			 $.ajax({
					type : 'post',
					url:'/db/site/noticeUpdate.do',
					enctype: 'multipart/form-data',
					data: formData,
					contentType:false,		
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("저장을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("저장이 완료 되었습니다.");
		                	window.location.href="/db/site/noticeList.do"	
		                	}
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });
		});
		
		$("#createBtn").click(function(){
			if(checkValue()){
				var formData = new FormData();
				 var noticeCont = CKEDITOR.instances.noticeCont.getData();	
				 var radioVal = $('input[name="noticeImptYn"]:checked').val()
				 formData.append("noticeTitle",$('#noticeTitle').val());
				 formData.append("noticeImptYn",$('#noticeImptYn').val());
					formData.append("noticeOpenYn",$('#noticeOpenYn').val());
					formData.append("noticeImptYn",radioVal); 
					formData.append("noticeCont",noticeCont);
					formData.append("entprEmployeePhone",$('#entprEmployeePhone').val());
					formData.append("fileupload", $("input[name=noticeFiles]")[0].files[0]);		
				 $.ajax({
						type : 'post',
						url:'/db/site/noticeInsert.do',
						enctype: 'multipart/form-data',
						data: formData,
						contentType:false,		
						processData:false,
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("등록을 실패 하였습니다.");
			                    return;
			                }else{
			                	if($('#chkFile').val() == 'Y'){
			                		alert("등록이 완료 되었습니다.");
			                		location.reload();
			                	}else{
			                		alert("등록이 완료 되었습니다.");
			                		window.location.href="/db/site/noticeList.do"	
			                	}	
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
		
		if($('#noticeTitle').val() == ""){
			alert("제목을 입력하세요.");
			$('#noticeTitle').focus();
			return;
		}
		
		return retValue;
	}
	
	function fileUpload(){
		var form = $('#noticeFileFrm')[0];
		var formData = new FormData(form);
		$.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/db/site/noticeFileUpload.do",
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
	            alert("업로드가 실패하였습니다.")
	        }
	    });
	}
   </script>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사이트 관리</li><li><b>공지사항</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>공지사항 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>공지사항 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" enctype="multipart/form-data" method="POST">
						<input type="hidden" name="noticeIdx" id="noticeIdx" value="<c:out value="${detail.noticeIdx}"/>"/>
						<div class="table-responsive">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">제목 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="upnoticeTitle" name="upnoticeTitle" class="input-sm" value="<c:out value="${detail.noticeTitle}"/>" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공개여부</th>
											<td>
												<select id="upnoticeOpenYn" name="upnoticeOpenYn" style="width: 250px; height: 30px;">
													<option value="Y" ${detail.noticeOpenYn eq 'Y' ? 'selected="selected"' : '' }>공개</option>
													<option value="N" ${detail.noticeOpenYn eq 'N' ? 'selected="selected"' : '' }>비공개</option>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">중요공지</th>
											<td>
												<input type="radio"  name="upnoticeImptYn" id="upnoticeImptYn" value="Y" ${detail.noticeImptYn eq 'Y' ? 'checked="checked"'  : ''}> <label for="noticeImptYn">예</label>&nbsp;&nbsp;
												<input type="radio"  name="upnoticeImptYn" id="upnoticeImptYn2" value="N"  ${detail.noticeImptYn eq 'N' ? 'checked="checked"'  : ''}> <label for="noticeImptYn2">아니오</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<textarea class="ckeditor" id="upnoticeCont"name="upnoticeCont" rows="6" cols="6" style="width:100%; height:100px;"><c:out value="gaa2${detail.noticeCont}" escapeXml="true"/></textarea>
												</div>
											</td>
										</tr>
									
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
										<td colspan="3">
											<input type="file" id="upnoticeFiles" name="upnoticeFiles" size=100>
										</td>
									</tr>
								</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/db/site/noticeList.do" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="saveBtn" class="btn btn-primary" ><b>수정</b></a>
							</div>
						</div>
					</form>	
					</div>
				</section>
			</c:if>
			
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
					<form id="insertFrm" name="insertFrm" action="#" method="POST">
						<div class="table-responsive">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
									
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">제목 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="noticeTitle" name="noticeTitle" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공개여부</th>
											<td>
												<select id="noticeOpenYn" name="noticeOpenYn" style="width: 250px; height: 30px;">
													<option value="Y">공개</option>
													<option value="N">비공개</option>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">중요공지</th>
											<td>
												<input type="radio"  name="noticeImptYn" id="noticeImptYn" value="Y"> <label for="noticeImptYn">예</label>&nbsp;&nbsp;
												<input type="radio"  name="noticeImptYn" id="noticeImptYn2" value="N" checked="checked"> <label for="noticeImptYn2">아니오</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<textarea class="ckeditor" name="noticeCont" id="noticeCont" ></textarea>
												</div>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<input type="file" name="noticeFiles" id="noticeFiles" >
												<input type="hidden" id="chkFile" name="chkFile" value="" />
											</td>
										</tr>
									
								</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/db/site/noticeList.do" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
							</div>
						</div>
					</form>
					</div>
				</section>
			</c:if>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
    
</body>
</html>


