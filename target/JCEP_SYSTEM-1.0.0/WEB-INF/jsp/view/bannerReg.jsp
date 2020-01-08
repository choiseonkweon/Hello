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
				<li>Home</li><li>사이트 관리</li><li><b>배너 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>배너 등록</b></h1>
				</div>
			</div>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
					<form id="insertFrm" name="insertFrm" action="#" method="POST">
						<div class="table-responsive">
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">배너명 * </th>
										<td>
											<label class="input" style="width: 100%">
												<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width: 100%">
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">노출기간 * </th>
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
										<th style="text-align:center;background:#eee;vertical-align:middle;">배너파일 *</th>
										<td>
											<form method="post" enctype="multipart/form-data" action="imgup.jsp">
												<input type="file" name="filename1" size=100>
											</form>
										</td>
									</tr>
									<%-- <tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
										<td>
											<label class="input">
												<input type="password" id="memPwdChk" name="memPwdChk" class="input-sm" value="${detail.memberPw }" maxlength="20" style="width:250px;">
											</label>
										</td>
									</tr> --%>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">URL * </th>
										<td>
											<label class="input" >
												<input type="text" id="memberId" name="memberId" class="input-sm" value="" style="width:250px;">&nbsp;&nbsp;&nbsp;
												<input type="radio"  name="notivisibleyn" id="notivisibleyn" value="1" > <label for="notivisibleyn">새창</label>&nbsp;&nbsp;&nbsp;
												<input type="radio"  name="notivisibleyn" id="notivisibleyn" value="1" > <label for="notivisibleyn">이동</label>
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;" >배너설명</th>
										<td>
											<label class="input" style="width: 100%;">
												<textarea class="ckeditor" name="shipnotice" id="shipnotice" style="width:100%;height:100px;"></textarea>
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">상태 *</th>
										<td>
											<select id="memberJoinType" name="memberJoinType" style="width: 250px; height: 30px;">
												<option value="">활성</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
							</div>
						</div>
					</form>
				</div>
			</section>
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