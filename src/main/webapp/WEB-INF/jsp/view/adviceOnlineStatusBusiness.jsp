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
		/*저장하기*/
		$("#saveBtn").click(function(){
			var	formData = new FormData();

					//upload file 
					var j = 5;
					for(var i =1; i<j; i++){
						formData.append("fileName"+i, $("input[name=fileName"+i+"]")[0].files[0]);						
					 	formData.append("originFileName"+i, $("input[name=originFileName"+i+"]").val());
					 	formData.append("attchFileNo"+i, $("#attchFileNo"+i).val());

					 	if(!fileSizeChk('fileName'+i)){
					 		return false;
					 	}
					}
					formData.append("memberId",$('#memberId').val());
		         	formData.append("onestopSupportNo",onestopSupportNo);
	         	$.ajax({
					type : 'post',
					url:'/db/oneStop/adviceOnlineStatusBusinessUpdate.do',
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
    	alert(memberId);
    	alert(onestopSupportNo);
    	$('#updateFrm').attr('action', "/db/oneStop/adviceOnlineStatusBusiness.do").submit();
    }
	
function chageFile(fn){
	
	var con_test = confirm("삭제하시겠습니까?");
	if(con_test == false){
		return false;;
	}
	
	if(fn =='fn1'){
		$("#fileName1").css('display','block');	
		$("#originFileName1").val('N');
		$("#uploadFileName1").css('display','none');	
	}
	if(fn =='fn2'){
		$("#fileName2").css('display','block');	
		$("#originFileName2").val('N');
		$("#uploadFileName2").css('display','none');	
	}
	if(fn =='fn3'){
		$("#fileName3").css('display','block');	
		$("#originFileName3").val('N');
		$("#uploadFileName3").css('display','none');	
	}
	if(fn =='fn4'){
		$("#fileName4").css('display','block');	
		$("#originFileName4").val('N');
		$("#uploadFileName4").css('display','none');	
	}
	
}

function fileSizeChk(inputFileId){
	if(document.getElementById(inputFileId).value){
		 var fileSize  = document.getElementById(inputFileId).files[0].size;
		 var maxSize = 5 * 1024 * 1024;//5MB
			 if(fileSize > maxSize){
				 
			 	alert(fileSize + "|"+ maxSize);
			       alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
			       document.getElementById(inputFileId).focus();
					//location.reload();
			       return false;
			 }else if(fileSize == 0){
			       alert("0MB사이즈의 첨부파일는 등록이 불가능합니다. ");
					//location.reload();
			       return false;
			 }
		 }
	return true;
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
					<input type="hidden" name="memberId" id="memberId" value="${detail.memberId}"/>
					<input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="${detail.onestopSupportNo}"/>
					
					
						<div class="table-responsive">								
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
				<div class="tab">
					<ul class="tab01_4 clearfix">
								<li><a href="javascript:moveDetailView('${detail.memberId}','${detail.onestopSupportNo}');">지원 신청내용</a></li>
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
										<td><c:out value="${detail.applicatDt}"/></td>
										<th style="text-align:center;background:#eee;vertical-align:middle;">전문가</th>
										<td><c:out value="${detail.proMemberId}"/></td>
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
										<input type="file"   <c:if test="${File1.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName1"        id="fileName1" size=100>
										<input type="hidden" class="" name="originFileName1" id="originFileName1" readonly value="Y">
										<c:if test="${File1.orgFileNm!=null}">
										<p  id="uploadFileName1">
											<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File1.attchFileNo}">${File1.orgFileNm}</a></span>
											<input type="hidden" class="" name="attchFileNo1" id="attchFileNo1" value="${File1.attchFileNo}">
											<span style="cursor: pointer;" onClick="chageFile('fn1');" >x</span>
										</p>
										</c:if>
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
										<input type="file"   <c:if test="${File2.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName2"        id="fileName2" size=100>
										<input type="hidden" class="" name="originFileName2" id="originFileName2" readonly value="Y">
										<c:if test="${File2.orgFileNm!=null}">
										<p  id="uploadFileName2">
											<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File2.attchFileNo}">${File2.orgFileNm}</a></span>
											<input type="hidden" class="" name="attchFileNo2" id="attchFileNo2" value="${File2.attchFileNo}">
											<span style="cursor: pointer;" onClick="chageFile('fn2');" >x</span>
										</p>
										</c:if>
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
										<input type="file"   <c:if test="${File3.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName3"        id="fileName3" size=100>
										<input type="hidden" class="" name="originFileName3" id="originFileName3" readonly value="Y">
										<c:if test="${File3.orgFileNm!=null}">
										<p  id="uploadFileName3">
											<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File3.attchFileNo}">${File3.orgFileNm}</a></span>
											<input type="hidden" class="" name="attchFileNo3" id="attchFileNo3" value="${File3.attchFileNo}">
											<span style="cursor: pointer;" onClick="chageFile('fn3');" >x</span>
										</p>
										</c:if>
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
										<input type="file"   <c:if test="${File4.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName4"        id="fileName4" size=100>
										<input type="hidden" class="" name="originFileName4" id="originFileName4" readonly value="Y">
										<c:if test="${File4.orgFileNm!=null}">
										<p  id="uploadFileName4">
											<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File4.attchFileNo}">${File4.orgFileNm}</a></span>
											<input type="hidden" class="" name="attchFileNo4" id="attchFileNo4" value="${File4.attchFileNo}">
											<span style="cursor: pointer;" onClick="chageFile('fn4');" >x</span>
										</p>
										</c:if>
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


