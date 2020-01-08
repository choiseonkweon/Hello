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
				<li>Home</li><li>사업 관리</li><li><b>사업 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 등록</b></h1>
					</div>
				</div>
			</c:if>	
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<c:if test="${viewType eq 'modify'}">
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록자 </th>
											<td style="vertical-align:middle;">
												<c:out value="사업담당자"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록일 </th>
											<td style="vertical-align:middle;">
												<c:out value="2019.05.10"/>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 </th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 *</th>
											<td>
												<label class="input"> 
													<input class="input-sm" type="text" name="startdate" id="startdate" placeholder=""   />
													<i class="icon-append fa fa-calendar"></i>
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
													<i class="icon-append fa fa-calendar"></i>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<textarea class="ckeditor" name="shipnotice" id="shipnotice" style="width:100%;height:250px;"></textarea>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<form method="post" enctype="multipart/form-data" action="imgup.jsp">
													<input type="file" name="filename1" size=100>
												</form>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 * </th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="startdate" id="startdate" placeholder=""   />
													<i class="icon-append fa fa-calendar"></i>
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
													<i class="icon-append fa fa-calendar"></i>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 </th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">주요공지</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<textarea class="ckeditor" name="shipnotice" id="shipnotice" style="width:100%;height:250px;"></textarea>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<form method="post" enctype="multipart/form-data" action="imgup.jsp">
													<input type="file" name="filename1" size=100>
												</form>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>등록</b></a>
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
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
	<script type="text/javaScript" language="javascript" defer="defer">
		$(document).ready(function () {

			$("#saveBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/member/memberUpdate.do',
						data: $('#updateFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("저장을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("저장이 완료 되었습니다.");
								location.reload();
								return false;
			                }
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 });
			});
			
			$("#createBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/member/memberInsert.do',
						data: $('#insertFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("등록을 실패 하였습니다.");
			                    return;
			                }else{
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
			});
			
		});
    </script>
</body>
</html>