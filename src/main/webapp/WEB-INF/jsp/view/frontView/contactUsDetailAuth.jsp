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
<!-- <script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../db/assets/js/ui.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->

<script type="text/javaScript" defer="defer">
	$(document).ready(function () {
		
		

		function checkValue(){
			var retValue = true;
			
			if($('#questionTitle').val() == ""){
				alert("제목을 입력하세요.");
				$('#questionTitle').focus();
				return;
			}
			else if($('#writeNm').val() == ""){
				alert("작성자를 입력하세요.");
				$('#writeNm').focus();
				return;
			}
			else if($('#questionPw').val() == ""){
				alert("비밀번호를 입력하세요.");
				$('#questionPw').focus();
				return;
			}
			else if($('#writeDt').val() == ""){
				alert("등록일자를 입력하세요.");
				$('#writeDt').focus();
				return;
			}
			

			return retValue;
		}

		/*  달력함수*/
		$(function() {
	           $("#writeDt").datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	            });                    
	            
	            //초기값을 오늘 날짜로 설정
	            $('#writeDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	        });

		$("#createBtn").click(function(){
			/* alert("testetete"); */
			if(checkValue()){
				$.ajax({
					type : 'post',
					url:'/db/contactUsDetailInsert.do',
					data: $('#insertFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
		                	window.location.href="/db/contactUsList.do";
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
			} 
		});
		
		$("#saveBtn").click(function(){
			$.ajax({
				type : 'post',
				url:'/db/memberExpertUpdate.do',
				data: $('#updateFrm').serialize(),
				dataType: 'json',
				success : function(data) {
					if(data.returnCode == 0){
	                    alert("등록을 실패 하였습니다.");
	                    return;
	                }else{
	                	alert("수정이 완료 되었습니다.");
	                	window.location.href="/db/login.do";
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

<body>
<div id="wrap" class="sub s4">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
	
	<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>문의하기 등록</b></h1>
					</div>
				</div>
		</c:if>
		<c:if test="${viewType eq 'modify'}">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>문의하기 수정</b></h1>
				</div>
			</div>
		</c:if>
	
	<!-- 	<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>고객광장</span>
				<span class="now">문의하기</span>
			</div>
		</div>
		 -->
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>고객광장</span>
				<span class="now">문의하기</span>
			</div>
		</div>
	
	<!--  문의하기 등록 form -->	

	<c:if test="${viewType eq 'create'}">
		<form id="insertFrm" name="insertFrm" action="#" method="POST">
		<div class="layout01">
			<h2 class="">문의하기 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>문의하기</h3>
				<div class="continner">
					<div class="daylist">
						<div class="dview">
						<h4>문의하기</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>제목*</th>
								<td>
									<input type="text" id="questionTitle" name="questionTitle">
								</td>
								<th>비밀번호*</th>
								<td colspan="2">
									<input type="password" id="questionPw" name="questionPw">
								</td>
							</tr>
							<tr>
								<th>작성자*</th>
								<td>
									<input type="text" id="writeNm" name="writeNm">
								</td>
								<th>등록일</th>
								<td colspan="2">
									<input type="text" id="writeDt" name="writeDt" class="cal">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="4">
									<textarea id="questionCont" name="questionCont" rows="6" cols="6" style="width:100%; height: 100px;" >
									</textarea>
								</td>
							</tr>
						</table>
						
						
							<!-- <ul class="listpn">
								<li>
									<strong>이전글</strong>
									<span>이전글이 존재하지 않습니다.</span>
								</li>
								<li>
									<strong>다음글</strong>
									<a href="#none">다음글이 입니다.</a>
								</li>
							</ul> -->
						</div>
						<div class="morew">
							
							<a href="#">
								<button id="createBtn" name="createBtn" type="button" class="submitbtn btnlist" style="background-color: blue;">저장<span></span></button>
							</a>
							<a href="/db/contactUsList.do">
								<button type="button" class="submitbtn btnlist">목록<span></span></button>
							</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		</c:if>
		
		
		
		
		
		<%-- <c:if test="${viewType eq 'modify'}">
		<form id="updateFrm" name="updateFrm" action="#" method="POST">
		<div class="layout01">
			<h2 class="">문의하기 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>문의하기</h3>
				<div class="continner">
					<div class="daylist">
						<div class="dview">
							<h4>문의하기 세부정보</h4>
								<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>제목*</th>
								<td colspan="4">
									<c:out value="${detail.entprResultTakeAmt}" />
								</td>
								<th></th>
								<td>
									<c:out value="${detail.entprCapitalAmt}" /> 만원
								</td>
							</tr>
							<tr>
								<th>작성자*</th>
								<td>
									<c:out value="${detail.entprResultTakeAmt}" /> 만원
								</td>
								<th>등록일</th>
								<td colspan="2">
									<c:out value="${detail.entprResultTakeAmt}" /> 만원
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="4">
									<textarea rows="6" cols="6" style="width:100%; height: 100px;">
										<c:out value="${detail.entprResultTakeAmt}" />
									</textarea>
								</td>
							</tr>
							
							<tr>
								<th>답변 내용</th>
								<td colspan="4">
									<textarea rows="6" cols="6" style="width:100%; height: 100px;">
										<c:out value="${detail.entprResultTakeAmt}" />
									</textarea>
								</td>
							</tr>
							
						</table>						


						</div>
						<div class="morew">
							<!-- <a href="/db/contactUsList.do">
								<button type="button" id="saveBtn" class="saveBtn">수정<span></span></button>
							</a> -->
						
							<a href="/db/contactUsList.do">
								<button type="button" class="btnlist">목22록<span></span></button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		</c:if>
		 --%>
	</div>
</div>


</body>
</html>




  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 