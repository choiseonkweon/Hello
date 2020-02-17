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
			 formData.append("faq_idx",$('#faq_idx').val());
			 var faq_cont = CKEDITOR.instances.upfaqCont.getData();	
			 formData.append("faq_title",$('#upfaqTitle').val());
				formData.append("faq_open_yn",$('#upfaqOpenYn').val());
				formData.append("faq_cont",faq_cont);
				formData.append("entprEmployeePhone",$('#upentprEmployeePhone').val());
				formData.append("fileupload", $("input[name=upfaqFiles]")[0].files[0]);
			 $.ajax({
					type : 'post',
					url:'/db/site/faqUpdate.do',
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
		                	window.location.href="/db/site/faqList.do"	
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
				 var faq_cont = CKEDITOR.instances.faq_cont.getData();	
				 formData.append("faq_title",$('#faq_title').val());
					formData.append("faq_open_yn",$('#faq_open_yn').val());
					formData.append("faq_cont",faq_cont);
					formData.append("entprEmployeePhone",$('#entprEmployeePhone').val());
					formData.append("fileupload", $("input[name=faqFiles]")[0].files[0]);	
					console.log(formData.get("faq_cont"))
				 $.ajax({
						type : 'post',
						url:'/db/site/faqInsert.do',
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
			                		window.location.href="/db/site/faqList.do"	
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
		
		$("#deleteFile").click(function(){
			var con_test = confirm("삭제하시겠습니까?");
				if(con_test){
				var formData = new FormData();
				 formData.append("faq_idx",$('#faq_idx').val());
				 var faq_cont = CKEDITOR.instances.upfaqCont.getData();	
				 formData.append("faq_title",$('#upfaqTitle').val());
					formData.append("faq_open_yn",$('#upfaqOpenYn').val());
					formData.append("faq_cont",faq_cont);
					formData.append("entprEmployeePhone",$('#upentprEmployeePhone').val());
				 $.ajax({
						type : 'post',
						url:'/db/site/deleteFile.do',
						enctype: 'multipart/form-data',
						data: formData,
						contentType:false,		
						processData:false,
						dataType: 'json',
						success : function(data) {
		                	alert("파일을 삭제하였습니다.");
		                	location.reload();
		                	
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
		
		if($('#faq_title').val() == ""){
			alert("제목을 입력하세요.");
			$('#faq_title').focus();
			return;
		}
		
		return retValue;
	}
	
	function fileUpload(){
		var form = $('#faqFileFrm')[0];
		var formData = new FormData(form);
		$.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/db/site/faqFileUpload.do",
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

	
	function fileDown(orgFileNm, fileCourse){
		$.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/site/faqFileDown.do",
	        data: { "orgFileNm" : orgFileNm
	        	      ,"fileCourse" : fileCourse },
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
				<li>Home</li><li>사이트 관리</li><li><b>FAQ</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>FAQ 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>FAQ 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" enctype="multipart/form-data" method="POST">
						<input type="hidden" name="faq_idx" id="faq_idx" value="<c:out value="${detail.faq_idx}"/>"/>
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
													<input type="text" id="upfaqTitle" name="upfaqTitle" class="input-sm" value="<c:out value="${detail.faq_title}"/>" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공개여부</th>
											<td>
												<select id="upfaqOpenYn" name="upfaqOpenYn" style="width: 250px; height: 30px;">
													<option value="Y" ${detail.faq_open_yn eq 'Y' ? 'selected="selected"' : '' }>공개</option>
													<option value="N" ${detail.faq_open_yn eq 'N' ? 'selected="selected"' : '' }>비공개</option>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<textarea class="ckeditor" id="upfaqCont"name="upfaqCont" rows="6" cols="6" style="width:100%; height:100px;"><c:out value="${detail.faq_cont}" escapeXml="true"/></textarea>
												</div>
											</td>
										</tr>
									
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
										<td colspan="3">
											<input type="file" name="upfaqFiles" id="upfaqFiles" >
												<input type="hidden" id="chkFile" name="chkFile" value="" />
<%-- 										<c:out value="${detail.orgFileNm }" /> --%>
										    <a style="color: black;"href="/db/site/faqFileDown.do?orgFileNm=${detail.orgFileNm}">${detail.orgFileNm}</a>
<%-- 										    <span style="cursor: pointer; display:none;" id="nonFile${fileCount}"onClick="Nonfile('${fileCount}');">삭제 취소</span> --%>
											<c:if test="${detail.orgFileNm ne '' and detail.orgFileNm ne null}">
												<span style="cursor: pointer;" id="deleteFile">x</span><br/>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/db/site/faqList.do" class="btn" ><b>취소</b></a>&nbsp;
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
													<input type="text" id="faq_title" name="faq_title" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공개여부</th>
											<td>
												<select id="faq_open_yn" name="faq_open_yn" style="width: 250px; height: 30px;">
													<option value="Y">공개</option>
													<option value="N">비공개</option>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<textarea class="ckeditor" name="faq_cont" id="faq_cont" ></textarea>
												</div>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<input type="file" name="faqFiles" id="faqFiles" >
												<input type="hidden" id="chkFile" name="chkFile" value="" />
											</td>
										</tr>
									
								</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/db/site/faqList.do" class="btn" ><b>취소</b></a>&nbsp;
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


