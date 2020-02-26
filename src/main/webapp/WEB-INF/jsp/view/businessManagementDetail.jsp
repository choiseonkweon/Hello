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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">
var bussAnncemntNo = '${result.bussAnncemntNo}';
var insert = '000004'; // 승인 
var reset = '000003'; // 반려


function bussAnncemntApplList(){
	var formData = new FormData();
	formData.append('bussAnncemntNo',bussAnncemntNo);		 
	$.ajax({
		type: 'post',
		data: formData,
		processData:false,
		dataType: 'json',
		contentType : false,
		url: "/db/bussAnncemntApplList.do",
		success: function(data) {
			var htmls = "";
			var cnt =0;
			var row=1;
			if(data.data.length < 1){
                htmls +='<tr>'; 
                htmls += '<td></td>'
                htmls += '<td></td>'
                htmls += '<td></td>'
                htmls += '<td></td>'
                htmls += '<td></td>'
                htmls += '<td></td>'
                htmls += '</tr>';
			} else {
				console.log(data.data);
	                $(data.data).each(function(){
 						console.log(data.data);
	                    htmls +='<tr>'; 
	                    htmls += '<td style="text-align:center;"><input type="hidden"  id="memberId' + cnt + '" value="' + this.memberId + '"/><span>' +this.entprNm + '</span></td>';
						if(this.orgFileNm==null){
						    htmls += '<td style="text-align:center;">없음</td>';
						}
						else{
		                    htmls += '<td style="text-align:center;"><span><a href="/db/businessManagementDetailFileDownload.do?fileNum='+this.attchFileNo+'">' + this.orgFileNm + '</a></span></td>';						
						}
	                    htmls += '<td style="text-align:center;"><span>' + this.applicatDt + '</span></td>';
						if(this.applicSt=='N'){//데이터가 진행 / 진행예정일때
		                    htmls +="<td style='text-align:center;' id='btnSuccess"+cnt+"'><button type='button' id='resetBtn" + cnt + " class='txtbtn floatR' onclick='fn_return(\"" + this.memberId + "\", \"" + reset + "\", \"" + this.remark + "\", \"" + this.applicatDt + "\", \"" + this.entprNm + "\")'>반려</button>"+
		                                     									"<button type='button' id='insertBtn" + cnt + " class='txtbtn floatR' onclick='fn_ApplUpdate(\"" + this.memberId + "\", \"" + insert +"\", \"" + this.remark + "\")'>승인</button></td>";
						}
 						if(this.applicSt=='Y'){//데이터가 반려 / 승인일때
		                    htmls += '<td style="text-align:center;" id="btnSuccess'+cnt+'"><span>' + this.applicStCd + '</span></td>';							
						}
	                    htmls +="<td style='text-align:center; display:none;' id='btnUpdate"+cnt+"'><button type='button' id='resetBtn" + cnt + " class='txtbtn floatR' onclick='fn_return(\"" + this.memberId + "\", \"" + reset + "\", \"" + this.remark + "\", \"" + this.applicatDt + "\", \"" + this.entprNm + "\")'>반려</button>"+
							"<button type='button' id='insertBtn" + cnt + " class='txtbtn floatR' onclick='fn_ApplUpdate(\"" + this.memberId + "\", \"" + insert +"\", \"" + this.remark + "\")'>승인</button></td>";

 						htmls += '</td>';	
	                    htmls += '<td style="text-align:center;"><span>' + this.remark + '</span></td>';
	                    htmls +="<td style='text-align:center;'>"+
	                                	"<button type='button' class='txtbtn floatR delBtn' id='btnDel"+cnt+"' onclick='fn_delEr(\"" + this.memberId +"\" )'>삭제</button>"+
	                                	"<button style='display:none;' type='button' class='txtbtn floatR ' id='reBtn"+cnt+"' onclick='fn_resetEr(\"" + cnt +"\" )''>취소</button>"+
	                                	"<button type='button' onclick='fn_updateEr(\"" + cnt +"\" )' class='txtbtn floatR uptBtn'  id='upBtn"+cnt+"'>수정</button>"+
	                                "</td>";
	                    htmls += '</tr>';
	                    cnt++;
	            	});	//each end

			};
//			alert(htmls);
			$("#resultTbody").html(htmls);

	           
       }	   // Ajax success end
});	// Ajax end
}//bussAnncemntApplList() end

function fn_ApplUpdate(memberId,applicStCd,remark){
		alert(applicStCd);
		var formData = new FormData();
		formData.append('memberId',memberId);
		formData.append('bussAnncemntNo',bussAnncemntNo);	
		formData.append('applicStCd',applicStCd);	
		if(applicStCd=='000004'){
			formData.append('remark',"");				
		}if(applicStCd=='000003'){
			formData.append('remark',remark);				
		}
		$.ajax({
			type: 'post',
			data: formData,
			processData:false,
			dataType: 'json',
			contentType : false,
			url: "/db/bussAnncemntApplUpdate.do",
			success : function(data) {
				if(data.returnCode == 0){
	                alert("등록을 실패 하였습니다.");
	                return;
	            }else{
	            	alert("등록이 완료 되었습니다.");
	            	$("#returnPop").hide();
	            	bussAnncemntApplList();
	            }
			},  //success
		    error:function(request,status,error){ //ajax 오류인경우  
	            alert("작업중 에러가 발생했습니다.");      
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   		}//error
		})//ajax
}//fn_ApplUpdate
function fn_return(memberId,applicStCd,remark,applicatDt,entprNm){
	$('#memberId').val(memberId);
	$('#applicStCd').val(applicStCd);
	$('#remark').val(remark);
	$('#applicatDt').text(applicatDt);
	$('#entprNm').text(entprNm);
	$("#returnPop").show();
};

function fn_updateEr(cnt){
	$("#btnSuccess"+cnt).css('display','none');	
	$("#btnUpdate"+cnt).css('display','block');	

	$("#btnDel"+cnt).css('display','none');	
	$("#upBtn"+cnt).css('display','none');	
	$("#reBtn"+cnt).css('display','block');	
	
	
};

function fn_resetEr(cnt){
	$("#btnSuccess"+cnt).css('display','block');	
	$("#btnUpdate"+cnt).css('display','none');	

	$("#btnDel"+cnt).css('display','block');	
	$("#upBtn"+cnt).css('display','block');	
	$("#reBtn"+cnt).css('display','none');	
	
	
};
//삭제
function fn_delEr(memberId){
	var formData = new FormData();
	formData.append('memberId',memberId);
	formData.append('bussAnncemntNo',bussAnncemntNo);	
	$.ajax({
		type: 'post',
		data: formData,
		processData:false,
		dataType: 'json',
		contentType : false,
		url: "/db/bussAnncemntApplDelete.do",
		success : function(data) {
			if(data.returnCode == 0){
                alert("삭제를 실패 하였습니다.");
                return;
            }else{
            	alert("삭제를 완료 되었습니다.");
            	bussAnncemntApplList();
            }
		},  //success
	    error:function(request,status,error){ //ajax 오류인경우  
            alert("작업중 에러가 발생했습니다.");      
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   		}//error
	})//ajax
}//fn_ApplUpdate



$(document).ready(function () {
	bussAnncemntApplList();
		
	
	$('#returnBtn').click(function(){
		var memberId = $('#memberId').val(),applicStCd = $('#applicStCd').val(),remark = $('#remark').val();
		fn_ApplUpdate(memberId,applicStCd,remark);
	});
	


	$(".closeBtn").click(function(){
		$("#returnPop").hide();
	});
	
	$(".closeBtn").click(function(){
		$("#returnPop").hide();
	});
	
	
}); 
</script>


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
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업관리 상세화면</b></h1>
					</div>
				</div>
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" enctype="multipart/form-data" method="POST">
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
											<th style="text-align:center;background:#eee;vertical-align:middle; ">사업명 * </th>
											<td colspan="3"><span>${result.bussAnncemntNm}</span>&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${result.bussDiviCd=='Y'}"><span>(진흥원수혜사업)</span></c:if></td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 *</th>
											<td><span>${result.bussAnncemntNo}</span></td>

											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 * </th>
											<td colspan="3">${result.bussFrDt}&nbsp;~&nbsp;${result.bussToDt}</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당부서 *</th>
											<td><span>${result.bussDeptCd}</span></td>

											<th style="text-align:center;background:#eee;vertical-align:middle;">사업비용 *</th>
											<td><span><fmt:formatNumber value="${result.bussCostAmt}" pattern="#,###"/> 원</span></td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
											<c:set var = "fileCount" value="1"/>
												<c:forEach var="files" items="${files}" varStatus="status" >
												<span style="color: black;">[붙임${fileCount}]</span>&nbsp;&nbsp;
												<a style="color: black;"href="/db/businessManagementfileDownload.do?attchFileNo=${files.attchFileNo}">${files.orgFileNm}</a><br/>
												<c:set var="fileCount" value="${fileCount + 1}" /> <!-- 한사이클돌면 1씩 증가시킨다 -->
												</c:forEach>
											</td>
										</tr>
										<tr style="width:100%; height: 300px">
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3" ><c:out escapeXml="false" value="${result.bussCont}"/></td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/business/businessManagementList.do" class="btn" ><b>목록</b></a>&nbsp;
									<a href="/db/business/businessManagementUpdate.do?bussAnncemntNo=${result.bussAnncemntNo}"id="updateBtn" class="btn btn-primary" ><b>수정</b></a>
								</div>


								
								<table id="resultTable" class="table table-hover" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="15%"><col width="20%"><col width="15%"><col width="10%"><col width="30%"><col width="10%">
									</colgroup>
									<thead>
										<tr>
										</tr>
											<tr>
											<th style="text-align:center;">회사명</th>
											<th style="text-align:center;">증빙서류</th>
											<th style="text-align:center;">승인요청일</th>
											<th style="text-align:center;">상태</th>
											<th style="text-align:center;">비고</th>
											<th style="text-align:center;"></th>
										</tr>
									</thead>
									<tbody id="resultTbody">
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</section>
</div>
			

	<!-- 검색조건 유지 -->
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	
	
	<!-- 반려 팝업 -->
<div class="layer" style="display: none;" id="returnPop">
	<div class="box boxw600" style="height: 530px; margin-top: -245px;">
			<input type="hidden" name ="memberId" id="memberId" value="">
			<input type="hidden" name ="applicStCd" id="applicStCd" value="">
			<input type="hidden" name ="entprNm"  value="">
			<input type="hidden" name ="applicStCd" value="">
			<div class="ti">실적 반려사유</div>
			<div class="mgt30">
				<table class="table01">
					<colgroup>
						<col width="25%" /><col width="75%" />
					</colgroup>
					<tr>
						<th>업체(기관)명</th>
						<td><span  id="entprNm"></span></td>
					</tr>
					<tr>
						<th>사업명</th>
						<td>${result.bussAnncemntNm}</td>
					</tr>
					<tr>
						<th>신청일</th>
						<td><span id="applicatDt"></span></td>
					</tr>
				</table>
				<br/>
				<table class="table01">
					<colgroup>
						<col width="25%" /><col width="75%" />
					</colgroup>
					<tr>
						<th>반려 사유</th>
						<td><textarea cols="45" rows="7" maxlength="190" id="remark"></textarea></td>
					</tr>
				</table>
				
				<div class="submitbtn">
					<button type="button" id="returnBtn" name="returnBtn">반려</button>
					<button type="button" class="closeBtn">취소</button>	
				</div>
				<button type="button" class="btn_close closeBtn">X</button>
			</div>
	</div>	



<form id="updateFrm" name="updateFrm" enctype="multipart/form-data" method="POST"></form>
</div>
</body>
</html>


