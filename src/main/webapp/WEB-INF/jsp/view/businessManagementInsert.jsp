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
//유효성검사
function Nomber_Validate_Check(a){
	var formData = new FormData();
	formData.append("bussAnncemntNo",$('#bussAnncemntNo').val());
	var check = 0;
	$.ajax({
		type : 'post',
		url:'/db/NomberValidateCheck.do',
		data: formData,
		enctype: 'multipart/form-data',
		contentType:false,		
		processData:false, 
		async: false,
		dataType: 'json',
		success : function(data) {
			console.log(data.returnCode);
			if(data.returnCode == 0){
			}else if(data.returnCode == 1){
				alert("이미 등록된 공고번호입니다.");
				check++;
            }
			return check;
		},  
	    error:function(request,status,error){ //ajax 오류인경우  
            alert("작업중 에러가 발생했습니다.");      
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   		} 
		
 	});
	return check;
}

$(document).ready(function () {

	$("#createBtn").click(function(){//저장버튼을 클릭했을때
			if(!checkValue()){
				return false;
			}
				var check = null;
				var bussCostAmt = $('#bussCostAmt').val();
				if($('#bussDiviCd').prop("checked")==false){
					check = 'N';
				}else{
					check = 'Y';
				}
				var formData = new FormData();
				formData.append("bussDiviCd",check);
				formData.append("bussAnncemntNo",$('#bussAnncemntNo').val());
				formData.append("bussAnncemntNm",$('#bussAnncemntNm').val());
				formData.append("bussFrDt",$('#bussFrDt').val());
				formData.append("bussToDt",$('#bussToDt').val()); 
				formData.append("bussCostAmt",bussCostAmt.replace(/,/g,''));
				formData.append("bussDeptCd",$('#bussDeptCd').val());
				formData.append("originalUrl",$('#originalUrl').val());
				formData.append("bussCont",$('#bussCont').val());
				formData.append("applicStCd",$('#applicStCd').val());
				formData.append("memberId",$('#memberId').val());
				formData.append("regDt",$('#regDt').val());
				formData.append("regId",$('#regId').val());
				var files = $("input[name=orgFileNm]");
				for(var i =0; i<=document.getElementById("orgFileNm").files.length;i++){
					//console.log(files[0].files[i]);
					formData.append("multiFiles[]",files[0].files[i]);
				}
				alert("ok");
				$.ajax({
					type : 'post',
					url:'/db/business/businessManagementRegisterInsert.do',
					data: formData,
					enctype: 'multipart/form-data',
					contentType:false,		
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
		    				window.location.href="/db/business/businessManagementList.do";
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });
			
	});

		//input을 datepicker로 선언
        $("#bussFrDt").datepicker({
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
            ,onSelect : function(selectedDate) {
				$('#bussToDt').datepicker('option', 'minDate', selectedDate);
			}
        }); 

		$("#bussToDt").datepicker({
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
            ,onSelect : function(selectedDate) {
				$('#bussFrDt').datepicker('option', 'maxDate', selectedDate);
			}
        });
		
	});
	
	function checkValue(){
		var retValue = true;
		
		if($('#bussAnncemntNm').val() == ""){
			alert("사업명을 입력하세요.");
			$('#bussAnncemntNm').focus();
			retValue = false;
		}

		if($('#bussFrDt').val() == ""){
			alert("사업기간을 입력하세요.");
			$('#bussFrDt').focus();
			retValue = false;
		}

		if($('#bussToDt').val() == ""){
			alert("사업기간을 입력하세요.");
			$('#bussToDt').focus();
			retValue = false;
		}

		if($('#bussCostAmt').val() == ""){
			alert("사업비용을 입력하세요.");
			$('#bussCostAmt').focus();
			retValue = false;
		}

		if($('#bussAnncemntNo').val() == ""){
			alert("공고번호을 입력하세요.");
			$('#bussAnncemntNo').focus();
			retValue = false;
		}
		if($('#bussAnncemntNo').val() != ""){
			var i = 0;
			var check = Nomber_Validate_Check(i)
			console.log("check:"+check);
			if(check===0){
					retValue= true;
			}
			if(check===1){
				$('#bussAnncemntNo').focus();
				retValue = false;
				return false;
			}
		}
		return retValue;
	}

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
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 등록</b></h1>
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="bussAnncemntNm" name="bussAnncemntNm" class="input-sm" value="" style="width:50%;" maxlength="29">&nbsp;&nbsp;
													<input  type="checkbox" name="bussDiviCd" id="bussDiviCd" value="Y" >&nbsp;
													<span> 진흥원수혜사업</span>
												</label>
												
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 * </th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="bussFrDt" id="bussFrDt" readOnly/>
													<!-- <i class="icon-append fa fa-calendar"></i> -->
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="bussToDt" id="bussToDt" readOnly/>
													<!-- <i class="icon-append fa fa-calendar"></i> -->
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업비용 *</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussCostAmt" name="bussCostAmt" class="input-sm" value=""style="width:100%;" maxlength="11" onkeyup="inputNumberFormat(this)">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업부서 *</th>
											<td>
												<select id="bussDeptCd" name="bussDeptCd" >
													<c:forEach var="bussDeptCd" items="${bussDeptCd}" varStatus="status" >
													 	<option value="${bussDeptCd.commonCd}">${bussDeptCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 *</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussAnncemntNo" name="bussAnncemntNo" class="input-sm" value="" style="width:100%;" maxlength="30">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">원문Url</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="originalUrl" name="originalUrl" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<label class="input" style="width: 100%;">
														<textarea class="ckeditor" name="bussCont" id="bussCont" style="width:100%;height:250px;"></textarea>
													</label>
												</div>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<input type="file" name="orgFileNm"id="orgFileNm" multiple="multiple" size=100>
 											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/business/businessManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a id="createBtn" class="btn btn-primary" ><b>등록</b></a>
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
	
</body>
</html>


