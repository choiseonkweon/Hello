<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<link rel='stylesheet' type='text/css' href='css/reset.css' />
<link rel='stylesheet' type='text/css' href='css/common.css' />
<link rel='stylesheet' type='text/css' href='css/sub.css' />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../ckeditor/ckeditor.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">	
	$(document).ready(function () {
		var proMemberId = '${detail.proMemberId}';
		$('#proMemberId').val(proMemberId);

		
		$("#saveBtn").click(function(){
			
			$('#proMemberId').val()
			var memberId = $('#memberId').val();
			var proMemberId = $('#proMemberId').val();
			var onestopSupportNo = $('#onestopSupportNo').val();

			$.ajax({
					type : 'post',
					url:'/db/oneStop/adviceOnlineStatusManagementUpdate.do',
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
	
	//function moveDetailViewPaging(memberId, pageNum) {	
	function moveDetailViewPaging(memberId) {	
		$('#memberId').val(memberId);
//		$('#pageNum').val(pageNum);
		alert("memberId : " + memberId);
//		alert("memberId : " + memberId + "\n" + "pageNum : " + pageNum);
		
		$('#memberDetailFrm').attr('action', "/db/oneStop/adviceOnlineStatusManagementDetail.do").submit();
		}	
	
	function fileUpload(){
		var form = $('#FileFrm')[0];
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
			<%-- <div class="tab">
				<ul class="tab01_4 clearfix">
					<li class="on"><a href="javascript:moveDetailView('${detail.memberId}','${detail.onestopSupportNo}');">지원 신청내용</a></li>
					<li><a href="/db/oneStop/adviceOnlineStatusBusiness.do">원스톱 업무일지</a></li>					
				</ul>
			</div> --%>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
					<form id="updateFrm" name="updateFrm" action="#" method="POST">	
					<input type="hidden" name="memberId" id="memberId" value="<c:out value='${detail.memberId}'/>"/>
					<input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="<c:out value='${detail.onestopSupportNo}'/>"/>
						<div class="table-responsive">
							<ul class="tab01_4 clearfix">
								<li class="on"><a href="javascript:moveDetailView('${detail.memberId}','${detail.onestopSupportNo}');">지원 신청내용</a></li>
								<li><a href="javascript:moveDetailView1('${detail.memberId}','${detail.onestopSupportNo}');">원스톱 업무일지</a></li>					
							</ul>
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
										<td><c:out value="${detail.regDt}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전문가 *</th>
										<td>
										<select id="proMemberId" name="proMemberId">
											<c:forEach var="proMemberId" items="${proMemberId}" varStatus="status" >
											 	<option value="${proMemberId.memberId}">${proMemberId.memberNm}</option>
											 </c:forEach>
										</select>
											<a  id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
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
										<td><c:out value="${detail.memberId}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 명 *</th>
										<td><c:out value="${detail.entprCeo}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">사업분야 *</th>
										<td colspan="3"><c:out value="${detail.largeBussAreaCd}"/> > <c:out value="${detail.mediumBussAreaCd}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">주소</th>
										<td colspan="3">
											<c:out value="${detail.entprHeadAddr}"/>
											<c:out value="${detail.entprHeadDetailAddr}"/>
										</td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">대표전화</th>
										<td><c:out value="${detail.entprHeadTel}"/>	</td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">종업원수</th>
										<td><c:out value="${detail1.entprResultEmpCnt}"/></td>
									</tr>
								</tbody>
							</table>
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
										<td><c:out value="${detail.compApplNm}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">직위</th>
										<td><c:out value="${detail.compPosit}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전화번호</th>
										<td><c:out value="${detail.compHpNo}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">팩스번호</th>
										<td><c:out value="${detail.compFaxNo}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">핸드폰</th>
										<td><c:out value="${detail.compHpNo}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">이메일</th>
										<td><c:out value="${detail.compMail}"/></td>
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
										<td colspan="3"><c:out value="${detail.adviceHopeDt}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">희망장소</th>
										<td colspan="3"><c:out value="${detail.advicePlaceCd}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">자문신청분야</th>
										<td colspan="3"><c:out value="${detail.adviceAreaCd}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">자문신청내용</th>
										<td colspan="3"><c:out value="${detail.adviceApplicCont}"/></td>
									</tr>
									<tr>
										<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록증</th>
										<td colspan="3"><a href="/db/adviceOnlineStatusManagementDetailfileDownload.do?fileNum=${detail.onestopSupportNo}">${detail.orgFileNm}</a>
									</tr>
								</tbody>
							</table>	
														
							<!-- 목록 -->
							<div class="morew">
								<div style="padding-top:5px;padding-bottom:5px;text-align:center;width:99%">
									<a href="/db/oneStop/adviceOnlineStatusManagementList.do" class="btn btn-primary"><b>목록</b></a>	
								</div>
							</div>
							<!-- 목록 -->
						</div>
					</form>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->		
	</div>
	 
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="">
	   <input type="hidden" name="snominus" id="snominus" value="<c:out value="${detail.sno-1}"/>">
	   <input type="hidden" name="snoplus" id="snoplus" value="<c:out value="${detail.sno+1}"/>">
	   <input type="hidden" name="title" id="title" value="<c:out value="${detail.titleminus}"/>">
	   <input type="hidden" name="titleminus" id="titleminus" value="<c:out value="${detail.titleplus}"/>">
	   <input type="hidden" name="titleplus" id="titleplus" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="applicatDt" id="applicatDt" value="">	   
	   <input type="hidden" name="proMemberId" id="proMemberId" value="">
	   <input type="hidden" name="suppBussAreaCd" id="suppBussAreaCd" value="">
	   <input type="hidden" name="bussAreaOthers" id="bussAreaOthers" value="">
	   <input type="hidden" name="compApplNm" id="compApplNm" value="">
	   <input type="hidden" name="compPosit" id="compPosit" value="">	   
	   <input type="hidden" name="compTelNo" id="compTelNo" value="">
	   <input type="hidden" name="compFaxNo" id="compFaxNo" value="">
	   <input type="hidden" name="compHpNo" id="compHpNo" value="">
	   <input type="hidden" name="compMail" id="compMail" value="">
	   <input type="hidden" name="adviceHopeDt" id="adviceHopeDt" value="">
	   <input type="hidden" name="advicePlaceCd" id="advicePlaceCd" value="">	   
	   <input type="hidden" name="adviceAreaCd" id="adviceAreaCd" value="">
	   <input type="hidden" name="fileCourse" id="fileCourse" value="">
	   <input type="hidden" name="orgFileNm" id="orgFileNm" value="">
	   <input type="hidden" name="uploadFileNm" id="uploadFileNm" value="">
	   <input type="hidden" name="applicStCd" id="applicStCd" value="">	   
	   <input type="hidden" name="regDt" id="regDt" value="">
	   <input type="hidden" name="regId" id="regId" value="">
    </form>

<!-- 검색조건 유지 -->
 <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
 <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
 <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
    
</body>
</html>


