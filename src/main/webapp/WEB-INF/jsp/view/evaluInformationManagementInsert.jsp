 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
    <script src="http://malsup.github.com/jquery.form.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../ckeditor/ckeditor.js"></script>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">
function goExperEvaluSearch(flag){
	if(checkValue()){	
    var chkArray = new Array();
    $('input:checkbox[name=selectClassCd]:checked').each(function() {
        chkArray.push(this.value);
    });

    $.ajax({
		type : 'post',
		url:'/db/evalu/selectExpertList.do',
		data: {"evaluationCnt"  : $('#evaluationCnt').val(),
			 	 "selectClassCd"	: chkArray
		},
		dataType: 'html',
		success : function(data) {
			$("#expertEvaluList").empty().append(data);

			$("#selectTitle1").html($("#selectTitle").val());
			$("#evaluationDt1").html($("#evaluationDt").val());
			$("#evaluationCnt1").html($("#evaluationCnt").val());
			
			$("#evaluShow").css('display','none');//기본 html 숨김
			$("#evaluShow2").css('display','block');//추출된 html show

		},  
	    error:function(request,status,error){ //ajax 오류인경우  
            alert("작업중 에러가 발생했습니다.");      
            window.event.preventDefault();
        } 
	});
	}
}


function checkValue(){
	var retValue = true;
	var chkArray = new Array();

	$('input:checkbox[name=selectClassCd]:checked').each(function() {
        chkArray.push(this.value);
    });
	
	
	if($('#selectTitle').val() == ""){
		alert("추출 제목을 입력하세요.");
		$('#selectTitle').focus();
		retValue = false;
	}

	if($('#evaluationDt').val() == ""){
		alert("평가일을 입력해주세요");
		$('#evaluationDt').focus();
		retValue = false;
	}

	if($('#evaluationCnt').val() == ""){
		alert("추출 인원을 입력하세요.");
		$('#evaluationCnt').focus();
		retValue = false;
	}


	
	if(chkArray.length==0){
		alert("전문가 분류를 선택해주세요");
		retValue = false;
	}
	return retValue;
}

$(document).ready(function () {

	//input을 datepicker로 선언
        $("#evaluationDt").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
        }); 


	});
	
function fn_save(){
		var listData = new Array();
		var chkArray = new Array();

		$('input:checkbox[name=selectClassCd]:checked').each(function() {
	        chkArray.push(this.value);
	    });

	    var selectTitle 		=  $('#selectTitle').val(); 		// 제목
		var evaluationDt 		=  $('#evaluationDt').val();// 추출일자
		var evaluationCnt 	=  $('#evaluationCnt').val(); // 인원
		
		$("#resultTbody tr").each(function(i){
			var mapData = {
					"memberId"		: $(this).attr('value'),
					"expertNm"		: $(this).find("td:eq(0)").text(),					//전문가 이름
					"attendYn"		: $(this).find("td:eq(1)").find("select").val(),	//참석여부
					"remark"			: $(this).find("td:eq(2)").find("input").val()	//비고
			}
			listData.push(mapData);
		});
		
		 $.ajax({
				type : 'post',
				url:'/db/evalu/ExpertEvaluInsertOk.do',
				data: {"params" : JSON.stringify(listData),
					      "selectTitle" 		: selectTitle,
					      "evaluationDt" 		: evaluationDt,
					      "evaluationCnt" 	: evaluationCnt,
					      "selectClassCd" 	: JSON.stringify(chkArray)
				         },
				dataType: 'json',
				success : function(data) {
            		alert("저장이 완료 되었습니다.");
            		location.reload();
					return false;							
					
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            window.event.preventDefault();
		   		} 
		 }); 								
		
}		

function excelDownload(){
	var listData = new Array();
	var chkArray = new Array();

	$('input:checkbox[name=selectClassCd]:checked').each(function() {
        chkArray.push(this.value);
    });

    var selectTitle 		=  $('#selectTitle').val(); 		// 제목
	var evaluationDt 		=  $('#evaluationDt').val(); 	// 추출일자
	var evaluationCnt 	=  $('#evaluationCnt').val(); 	// 인원
	
	$("#resultTbody tr").each(function(i){
		var mapData = {
				"memberId"		: $(this).attr('value'),
				"expertNm"		: $(this).find("td:eq(0)").text(),					//전문가 이름
				"attendYn"		: $(this).find("td:eq(1)").find("select").val(),	//참석여부
				"remark"			: $(this).find("td:eq(2)").find("input").val()	//비고
		}
		listData.push(mapData);
	});
	location.href = "/db/evalu/ExpertEvaluExcelDownload.do?selectTitle="+encodeURI(selectTitle)+"&evaluationDt="+encodeURI(evaluationDt)+"&evaluationCnt="+encodeURI(evaluationCnt)+"&params="+encodeURI(JSON.stringify(listData))+"&selectClassCd="+encodeURI(JSON.stringify(chkArray));
	
	
/* 	 $.ajax({
			type : 'post',
			url:'/db/evalu/ExpertEvaluExcelDownload.do',
			data: {"params" : JSON.stringify(listData),
				      "selectTitle" 		: selectTitle,
				      "evaluationDt" 		: evaluationDt,
				      "evaluationCnt" 	: evaluationCnt,
				      "selectClassCd" 	: JSON.stringify(chkArray)
			         },
			dataType: 'json',
			success : function(data) {
				return false;							
				
			},  
		    error:function(request,status,error){ //ajax 오류인경우  
	            alert("작업중 에러가 발생했습니다.");      
	            window.event.preventDefault();
	   		} 
	 }); 			 */
}

	
	
</script>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사업 관리</li><li><b>사업	관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>평가위원 추출</b></h1>
					</div>
				</div>
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" enctype="multipart/form-data" method="POST">
							<div class="table-responsive">
							<div id="evaluShow" style="display:block;">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">제목</th>
											<td colspan="3">
													<input class="input-sm" type="text" name="selectTitle" id="selectTitle" maxlength="29" style="width:40%;"/>
											</td>
										</tr>

										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">분류</th>
											<td>
													<c:forEach var="selectClassCd" items="${selectClassCd}" varStatus="status" >
													<input type="checkbox" name="selectClassCd" id="selectClassCd" value="${selectClassCd.commonCd}" /><label>${selectClassCd.commonNm}</label>&nbsp;&nbsp;
													 </c:forEach>
											</td>
										</tr>

										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">평가일</th>
											<td colspan="3">
													<input class="input-sm" type="text" name="evaluationDt" id="evaluationDt" readOnly/>
													<!-- <i class="icon-append fa fa-calendar"></i> -->
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">인원</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="evaluationCnt" name="evaluationCnt" size="3" style="width:10%"class="input-sm" value="" maxlength="3" onkeydown="inputNumberFormat(this)"> 명  
												</label>
											</td>
										</tr>
									</tbody>
								</table>

								<div style="padding-top:5px;padding-bottom:5px;text-align:center;width:99%">
									<button type="button" class="btn btn-primary btn-sm" id="btnExtraction" onclick="goExperEvaluSearch('Y');">추출하기</button>
								</div>
							</div>


							<div id="evaluShow2" style="display:none;">
								<div id="expertEvaluList">


								</div>
								<div>
									<div style="padding-top:5px;padding-bottom:5px;width:99%">
											<div style="text-align: left;width:20%; float: left" >
												<button type="button" class="btn btn-primary btn-sm" id="btnExtraction" onclick="excelDownload('')">엑셀 다운로드</button>
											</div>
											<div style="text-align: center ;width:60%; float: left">
												<a id="replayBtn" class="btn btn-primary"  onclick="goExperEvaluSearch('Y');"><b>재 추출</b></a>&nbsp;
												<a id="createBtn" class="btn btn-primary" onclick="fn_save()"><b>저장</b></a>	
											</div>
											<div style="text-align: right;width:-5%">
												<a href="/db/evalu/evaluInformationManagementList.do" class="btn" ><b>목록</b></a>&nbsp;
											</div>
									</div>
								</div>
								<!-- END evaluInsert-->
								
							</div>
							<!-- END evaluShow2-->
						</div>
					</form>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	 <form id="ExcelFrm" method="POST">
	 
	 </form>
	<!-- 검색조건 유지 -->
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	
</body>
</html>


