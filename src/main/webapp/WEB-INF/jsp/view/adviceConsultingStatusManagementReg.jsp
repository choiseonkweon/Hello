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
				<li>Home</li><li>원스톱지원실 이용 관리</li><li><b>자문컨설팅 현황 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>자문컨설팅 등록</b></h1>
				</div>
			</div>
			
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
										<th style="text-align:center;background:#eee;vertical-align:middle;">신청일 *</th>
										<td>
											<label class="input"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
												<i class="icon-append fa fa-calendar"></i>
											</label>											
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전문가 *</th>
										<td>
											<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
												<option value="">선택</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">업체명 *</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder=""  style="width: 100%">
											</label>											
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 명 *</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder=""  style="width: 100%">
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">사업분야 *</th>
										<td colspan="3">
											<label class="input" style="width: 100%"> 
												<span style="width: 60%">
													<input type="checkbox" name="visibleynChk" id="visibleynChk" value="1" style="width: 2%"> <label for="visibleynChk">ICT</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk2" id="visibleynChk2" value="1" style="width: 2%"> <label for="visibleynChk2">콘텐츠</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk3" id="visibleynChk3" value="1" style="width: 2%"> <label for="visibleynChk3">1인창조</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk4" id="visibleynChk4" value="1" style="width: 2%"> <label for="visibleynChk4">기타</label>&nbsp;&nbsp;
													<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder=""  style="width: 35%">
												</span>
											</label>											
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">주소</th>
										<td colspan="3">
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder=""  style="width: 90%">
												<a href="/member/memberList.do" class="btn" ><b>주소검색</b></a>
											</label>											
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<label class="input" style="width: 50%"> 
												상세주소&nbsp;&nbsp;<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder=""  style="width: 50%">
											</label>											
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">대표전화</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>											
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">종업원수</th>
										<td>
											<label class="input" style="width: 97%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 97%">&nbsp; 명
											</label>	
										</td>
									</tr>
								</tbody>
							</table><br>
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 신청인 정보</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">신청인 성명 *</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>										
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">직위</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전화번호</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>											
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">팩스번호</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">핸드폰</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>											
										</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">이메일</th>
										<td>
											<label class="input" style="width: 100%"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="" style="width: 100%">
											</label>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 자문 신청내용</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="5">신청 내용</th>
										<th style="text-align:center;background:#eee;vertical-align:middle;">희망일자</th>
										<td colspan="3">
											<label class="input"> 
												<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
												<i class="icon-append fa fa-calendar"></i>
											</label>												
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">희망장소</th>
										<td colspan="3">
											<label class="input" style="width: 100%"> 
												<span style="width: 60%">
													<input type="checkbox" name="visibleynChk" id="visibleynChk" value="1" style="width: 2%"> <label for="visibleynChk">전남콘텐츠기업육성 센터(나주)</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk2" id="visibleynChk2" value="1" style="width: 2%"> <label for="visibleynChk2">목포벤처문화산업지원센터(목포)</label>&nbsp;&nbsp;
												</span>
											</label>											
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">자문신청분야</th>
										<td colspan="3">
											<label class="input" style="width: 100%"> 
												<span style="width: 60%">
													<input type="checkbox" name="visibleynChk" id="visibleynChk" value="1" style="width: 2%"> <label for="visibleynChk">법률</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk2" id="visibleynChk2" value="1" style="width: 2%"> <label for="visibleynChk2">세무회계</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk3" id="visibleynChk3" value="1" style="width: 2%"> <label for="visibleynChk3">인사·노무</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk4" id="visibleynChk4" value="1" style="width: 2%"> <label for="visibleynChk4">자금·금융</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk5" id="visibleynChk5" value="1" style="width: 2%"> <label for="visibleynChk5">인력·교육</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk6" id="visibleynChk6" value="1" style="width: 2%"> <label for="visibleynChk6">기술(특허) 인증</label>&nbsp;&nbsp;
												</span>
												<span style="width: 10%">
													<input type="checkbox" name="visibleynChk7" id="visibleynChk7" value="1" style="width: 2%"> <label for="visibleynChk7">투자유치(관로·수출)</label>&nbsp;&nbsp;
												</span>
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">자문신청내용</th>
										<td colspan="3">
											<label class="input" style="width: 100%;">
												<textarea class="ckeditor" name="shipnotice" id="shipnotice" style="width:100%;height:100px;"></textarea>
											</label>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록증</th>
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