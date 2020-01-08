<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<script src="../ckeditor/ckeditor.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">	
	$(document).ready(function () {
		var onestopSupportNo = $('#onestopSupportNo').val();
		//alert(onestopSupportNo);	
		/*저장하기*/
		$("#saveBtn").click(function(){
			 $.ajax({
					type : 'post',
					url:'/db/oneStop/adviceOnlineStatusBusinessUpdate.do',
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
	});	

	
		/*자문계획서 추가완료 버튼 클릭시*/
	      $("#saveBtn1").click(function(){
	    	  alert("g2");
	    	  var no = 1;//자문계획서
	         var formData = new FormData();
	         formData.append("memberId",$('#memberId').val());
	         formData.append("onestopUupportNo",$('#onestopUupportNo').val());
	         formData.append("no",no);
	         formData.append("fileupload", $("input[name=fileupload]")[0].files[0]);
	         $.ajax({
	            type : 'post',
	            url:'/db/oneStop/adviceOnlineStatusBussLogFileUpload.do',
	            enctype: 'multipart/form-data',
	            data: formData,
	            contentType:false,      
	            processData:false,
	            dataType: 'json',
	            success : function(data) {
	               if(data.returnCode == 0 || data.returnCode1 == 0){
	                  alert("등록을 실패 하였습니다.");
	                  return;
	               }else{
	                  showemployeesList();
	                  alert("등록이 완료 되었습니다.");
	               }
	            },  
	            error:function(request,status,error){ //ajax 오류인경우  
	               alert("작업중 에러가 발생했습니다.");      
	               console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	          });
		});
	//function moveDetailViewPaging(memberId, pageNum) {	
	function moveDetailViewPaging(memberId) {
		$('#memberId').val(memberId);
//		$('#pageNum').val(pageNum);
		alert("memberId : " + memberId);
//		alert("memberId : " + memberId + "\n" + "pageNum : " + pageNum);
		$('#memberDetailFrm').attr('action', "/db/oneStop/adviceOnlineStatusBusiness.do").submit();
		}
	

	function moveDetailView(memberId,onestopSupportNo){
    	$('#memberId').val(memberId);
    	$('#onestopSupportNo').val(onestopSupportNo);
    	$('#updateFrm').attr('action', "/db/oneStop/adviceOnlineStatusManagementDetail.do").submit();
    }
	
	function moveDetailView1(memberId,onestopSupportNo){
    	$('#memberId').val(memberId);
    	$('#onestopSupportNo').val(onestopSupportNo);
    	$('#updateFrm').attr('action', "/db/oneStop/adviceOnlineStatusBusiness.do").submit();
    }
	

</script>

<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">
		<!-- RIBBON -->
		<div id="ribbon">		
			<ol class="breadcrumb">
				<li>Home</li><li>원스톱지원실 이용 관리</li><li><b>온라인 현황 관리</b></li>
			</ol>			
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">				
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>온라인상담 신청내용</b></h1>
				</div>
			</div>
			<div class="layout01">
			<section id="widget-grid" class="">
				<div class="well well-sm">
					<form id="updateFrm" name="updateFrm" action="#" method="POST">		
					<input type="hidden" name="memberId" id="memberId" value="<c:out value='${memberId}'/>"/>
					<input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="<c:out value='${onestopSupportNo}'/>"/>				
					
					
					<%-- <input type="text" name="memberId" id="memberId" value="<c:out value='${memberId}'/>"/>
					<input type="text" name="onestopSupportNo" id="onestopSupportNo" value="<c:out value='${onestopSupportNo}'/>"/>				 --%>

						<div class="table-responsive">								
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
				<div class="tab">
					<ul class="tab01_4 clearfix">
								<li><a href="javascript:moveDetailView('${memberId}','${onestopSupportNo}');">지원 신청내용</a></li>
								<li class="on"><a href="javascript:moveDetailView1('${detail.memberId}','${detail.onestopSupportNo}');">원스톱 업무일지</a></li>					
							</ul>
				</div>
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%"> 
								</colgroup>
								<tbody>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">신청일</th>
										<td><c:out value="${detail.regDt}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전문가</th>
										<td><c:out value=""/></td>
									</tr>
								</tbody>
							</table>							
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 자문 계획서</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
								</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;background:#eee;vertical-align:middle;">자문 계획서</th>
									<td>
									<form method="post" enctype="multipart/form-data" action="imgup.jsp">
										<input type="file" name="filename1" size=100>
										<button id="saveBtn1" name="saveBtn1">업로드</button>
									</form>
									</td>
								</tr>
							</tbody>
							</table>
							
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 업무보고서(회의록,주간보고서,월간보고서 등)</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
								</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;background:#eee;vertical-align:middle;">업무보고서<br>(주간보고,회의록,<br>업무보고 등)</th>
									<td>
										<form method="post" enctype="multipart/form-data" action="imgup.jsp">
											<input type="file" name="filename1" size=100>
										</form>
									</td>
								</tr>
							</tbody>
							</table>
								
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 완료보고서</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
								</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;background:#eee;vertical-align:middle;">완료 보고서</th>
									<td>											
											<form method="post" enctype="multipart/form-data" action="imgup.jsp">
												<input type="file" name="filename1" size=100>
											</form>
									</td>
								</tr>
							</tbody>
							</table>
							
							<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
								&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 산출물</b></h5>
							</div>
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
								<colgroup>
									<col width="10%">
								</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;background:#eee;vertical-align:middle;">산출물</th>
									<td>
											<form method="post" enctype="multipart/form-data" action="imgup.jsp">
												<input type="file" name="filename1" size=100>
											</form>
									</td>
								</tr>
							</tbody>
							</table>								
							
							<!-- 버튼 -->
							<div class="morew">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">	
										<a href="/db/oneStop/adviceOnlineStatusManagementList.do" class="btn btn-primary"><b>취소</b></a>&nbsp;
										<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>&nbsp;
										<a href="/enterprise/enterpriseInformationManagementList.do" class="btn btn-primary" ><b>지원완료</b></a>
									</div>
								</div>
							<!-- 버튼 -->
						</div>
					</form>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->	
		</div>	
	</div>

<!-- 검색조건 유지 -->
 <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
 <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
 <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
    
</body>
</html>


