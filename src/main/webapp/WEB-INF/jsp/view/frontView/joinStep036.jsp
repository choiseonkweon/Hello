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
<script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../db/assets/js/ui.js"></script>


<head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javaScript" defer="defer">
	$(document).ready(function () {
		var memberId = $('#memberId').val();
		
		$("#idChkBtn").click(function(){
			//alert($('#memberId').val());
			//alert($('#memberHp1').val());
			if($('#memberId').val() == ''){
				alert('아이디를 입력하세요.');
				$('#memberId').focus();
				return false;
			}else{
				$.ajax({
					type : 'post',
					url:'/db/member/memberIdChk.do',
					data: {memberId : $('#memberId').val()},
					dataType: 'json',
					success : function(data) {
						if(data.idCnt != 0){
							$("#chkYn").val("N");
							$("#able").hide();
							$("#enable").show();
						}else{
							$("#chkYn").val("Y");
							$("#able").show();
							$("#enable").hide();
						}
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
				return false;
			}
			 
		});
		

		function checkValue(){
			var retValue = true;
			
			if($('#memberId').val() == ""){
				alert("아이디를 입력하세요.");
				$('#memberId').focus();
				return;
			}
			
			if($('#chkYn').val() != "Y"){
				alert("아이디를 중복체크 하세요.");
				return;
			}
			
			if($('#memberPw').val() == ""){
				alert("비밀번호를 입력하세요.");
				$('#memberPw').focus();
				return;
			}
			
			if($('#memPwdChk').val() == ""){
				alert("비밀번호 확인을 입력하세요.");
				$('#memPwdChk').focus();
				return;
			}
			
			if($('#memberPw').val() != $('#memPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if($('#memberNm').val() == ""){
				alert("이름을 입력하세요.");
				$('#memberNm').focus();
				return;
			}
			
			if($('#memberHp1').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#memberHp1').focus();
				return;
			}

			if($('#memberHp2').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#memberHp2').focus();
				return;
			}
			
			if($('#memberHp3').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#memberHp3').focus();
				return;
			}
			return retValue;
		}
		
		$("#createBtn").click(function(){
			if(checkValue()){
				$.ajax({
					type : 'post',
					url:'/db/memberExpertInsert.do',
					data: $('#insertFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
		                	window.location.href="/db/login.do";
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
	                	alert("등록이 완료 되었습니다.");
	                	window.location.href="/db/login.do";
	                }
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
		 	});
		});
		
		 
		 $("#resourceBtn").click(function(){
				$("#resourcePop").show();
		 });	
		 
		 $(".closeBtn").click(function(){
				$("#resourcePop").hide();
		 });
		 
		 $("#cancel").click(function(){
			var result = confirm("취소하시겠습니까?");
			if(result){
				window.location.href="/db/main.do";
			}else{
				
			}
		 });
  $(function(){
      //직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
                //직접입력을 누를 때 나타남
				if($("#selbox").val() == "direct") {
					$("#selboxDirect").show();
				}  else {
					$("#selboxDirect").hide();
				}
			}) 
		});
		 		
	});
	

	function openDaumPostcode(){
		
		new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('memberAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			  }
		}).open();
	}
	

	function openDaumPostcode1(){
		
		new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('memberMyAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			  }
		}).open();
	}
	
	
</script>
        
	<style>
		.hidden { display: none;  }
 	</style>
</head>
<body>
	
<input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
<input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
<input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
<input type="hidden" name="chkYn" id="chkYn" value="">

<div id="wrap" class="sub s6">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>회원정보 등록</b></h1>
					</div>
				</div>
		</c:if>
		<c:if test="${viewType eq 'modify'}">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>회원정보 수정</b></h1>
				</div>
			</div>
		</c:if>
		
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span class="now">회원가입</span>
			</div>
		</div>
		<div class="layout01">
		
			<h2 class="">회원가입 - 더 새로워진 전남콘테츠기업육성센터 홈페이지를 만나보세요!</h2>
			<div class="cont">
				<h3>회원가입</h3>
			
							
			<!--  회원정보 가입 form S -->
			<c:if test="${viewType eq 'create' }">
			<section id="widget-grid" class="">			
				<div class="continner">
				<form id="insertFrm" name="insertFrm" action="#" method="POST">
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="/db/joinStep01.do">가입유형</a></li>
							<li class="step"><a href="/db/joinStep02.do">약관동의</a></li>
							<li class="on"><a href="#none">정보입력</a></li>
							<li><a href="#none">가입완료</a></li>
						</ul>
					</div>
					
			
					<div class="joininfobox">
						<h4>전문가정보입력</h4>
						<table class="table01 tb_pc">
							<colgroup>
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2" class="essential">아1이디</th>
									<td colspan="3">
										<input type="text" id="memberId" name="memberId" style="width: 50%;">
										<button class="txtbtn" id="idChkBtn" style="width: 100px;">중복확인</button>
										<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
											사용가능한 아이디입니다.
										</div>
										<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
											사용 불가능한 아이디입니다.
										</div>
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">비밀번호</th>
									<td>
										<input type="password" style="width: 100%;" id="memberPw" name="memberPw">
									</td>
									<th class="essential">비밀번호 확인</th>
									<td>
										<input type="password" style="width: 100%;" id="memPwdChk" name="memPwdChk">
									</td>
								</tr>
								<tr>
									<th colspan="2">이름</th>
									<td colspan="3">
										<input type="text" style="width: 50%;" id="memberNm" name="memberNm">
									</td>
								</tr>
								<tr>
									<th colspan="2">휴대폰번호</th>
									<td>
										<input type="text" style="width: 25%;" id="memberHp1" name="memberHp1">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberHp2" name="memberHp2">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberHp3" name="memberHp3">
									</td>
									<th>이메일</th>
									<td>
										<input type="text" style="width: 40%;" id="memberMail" name="memberMail">
										<em>@</em>
										<!-- 상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스 -->
										<input type="text" id="selboxDirect" name="selboxDirect" style="width: 40%;"/>
										<select style="width: 40%;" id="selbox" name="selbox">
											<option value="nate.com">nate.com</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="direct">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">출신학교</th>
									<td>
										<input type="text" style="width: 100%;" id="memberSchool" name="memberSchool">
									</td>
									<th>전공</th>
									<td>
										<input type="text" style="width: 100%;" id="memberMajor" name="memberMajor">
									</td>
								</tr>
								<tr>
									<th colspan="2">소속기관</th>
									<td>
										<input type="text" style="width: 100%;" id="memberAffiliation" name="memberAffiliation">
									</td>
									<th>해당부서</th>
									<td>
										<input type="text" style="width: 100%;" id="memberDepartment" name="memberDepartment">
									</td>
								</tr>
								<tr>
									<th colspan="2" colspan="2">전문분야</th>
									<td>
										<input type="text" style="width: 100%;" id="memberSpecialty" name="memberSpecialty">
									</td>
									<th>세부전문분야</th>
									<td>
										<input type="text" style="width: 100%;" id="memberDetails" name="memberDetails">
									</td>
								</tr>
								<tr>
									<th colspan="2">관심분야</th>
									<td>
										<input type="text" style="width: 100%;" id="memberInterests" name="memberInterests">
									</td>
									<th>세부관심분야</th>
									<td>
										<input type="text" style="width: 100%;" id="memberFieldinterest" name="memberFieldinterest">
									</td>
								</tr>
								<tr>
									<th rowspan="4">주소</th>
									<th rowspan="2" class="row">본사</th>
									<td>
										<input type="text" id="memberAddr" name="memberAddr" class="input-sm" value="" maxlength="50" style="width:90%" readonly="readonly">
										<button class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="memberTel" name="memberTel">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberTel1" name="memberTel1">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberTel2" name="memberTel2">
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="memberAddr1" name="memberAddr1" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="memberFax" name="memberFax">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberFax1" name="memberFax1">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberFax2" name="memberFax2">
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row">자택</th>
									<td>
										<input type="text" id="memberMyAddr" name="memberMyAddr" class="input-sm" value="" maxlength="50" style="width:90%" readonly="readonly">
										<button class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="memberMyTel" name="memberMyTel">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyTel1" name="memberMyTel1">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyTel2" name="memberMyTel2">
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="memberMyAddr1" name="memberMyAddr1" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="memberMyFax" name="memberMyFax">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyFax1" name="memberMyFax1">
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyFax2" name="memberMyFax2">
									</td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="submitbtn">
						<button type="button" id="createBtn" name="createBtn" class="ok">신청하기</button>
						<button type="button" id="cancel" name="cancel" class="no">취소</button>
					</div>
					</form>
				</div>
				
				</section>
			</c:if>
			
			
			<!--  회원정보 수정 form S -->
			<c:if test="${viewType eq 'modify' }">
				<section id="widget-grid" class="">
						
				<div class="continner">
				<form id="updateFrm" name="updateFrm" action="#" method="POST">
					
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="/db/joinStep01.do">가입유형</a></li>
							<li class="step"><a href="/db/joinStep02.do">약관동의</a></li>
							<li class="on"><a href="#none">정보입력</a></li>
							<li><a href="#none">가입완료</a></li>
						</ul>
					</div>
					
			
					<div class="joininfobox">
						<h4>전문가정보입력</h4>
						<table class="table01 tb_pc">
							<colgroup>
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2" class="essential">아이2디</th>
									<td colspan="3">
										<c:out value="${detail.memberId}"/>
									</td>
								</tr>

							</tbody>
						</table>
					</div>


					<div class="submitbtn">
						<button type="button" id="saveBtn" name="saveBtn" class="ok">신청하기</button>
						<button type="button" id="cancel" name="cancel" class="no">취소</button>
					</div>
					</form>
				</div>
				
				</section>
			</c:if>
			
				
			</div>
		</div>
	</div>
	
</div>

<form role="form" id="insertFrm" action="#" class="form-horizontal" method="post">
	<input type="hidden" name="member_idx" id="member_idx" value="">
	<input type="hidden" name="member_id" id="member_id" value="">
	<input type="hidden" name="member_pw" id="member_pw" value="">
	<input type="hidden" name="member_nm" id="member_nm" value="">
	<input type="hidden" name="member_addr" id="member_addr" value="">
	<input type="hidden" name="member_tel" id="member_tel" value="">
	<input type="hidden" name="member_hp" id="member_hp" value="">
	<input type="hidden" name="member_mail" id="member_mail" value="">
	<input type="hidden" name="member_belong" id="member_belong" value="">
	<input type="hidden" name="member_join_dt" id="member_join_dt" value="">
	<input type="hidden" name="member_join_type" id="member_join_type" value="">
	<input type="hidden" name="member_st" id="member_st" value="">
	<input type="hidden" name="member_school" id="member_school" value="">
	<input type="hidden" name="member_major" id="member_major" value="">
	<input type="hidden" name="member_affiliation" id="member_affiliation" value="">
	<input type="hidden" name="member_department" id="member_department" value="">
	<input type="hidden" name="member_specialty" id="member_specialty" value="">
	<input type="hidden" name="member_details" id="member_details" value="">
	<input type="hidden" name="member_interests" id="member_interests" value="">
	<input type="hidden" name="member_fieldinterest" id="member_fieldinterest" value="">
	<input type="hidden" name="member_fax" id="member_fax" value="">
	<input type="hidden" name="member_myaddr" id="member_myaddr" value="">
	<input type="hidden" name="member_myfax" id="member_myfax" value="">
</form>


</body>
</html>






