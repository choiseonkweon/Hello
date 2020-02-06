<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<script type="text/javaScript" defer="defer">
var member = {}; 

$(document).ready(function () {
	oneDatepicker2("date");
	
	$("#idChkBtn").click(function(){
		var pMember = $("#memberId");

		if(pMember.val() == ''){
			alert('아이디를 입력하세요.');
			pMember.focus();
			return false;
		}else{
			$.ajax({
				type : 'post',
				url:'/db/member/memberIdChk.do',
				data: {memberId : pMember.val()},
				dataType: 'json',
				success : function(data) {
					if(data.idCnt != 0){
						member = {chkMemberId : "",chkYn : "N"};
						$("#able").hide();
						$("#enable").show();
					}else{
						member = {chkMemberId :pMember.val(),chkYn : "Y"};
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
	
	
	$("#memberId").change(function(){
		member = {chkMemberId : "",chkYn : "N"};
		$("#able").hide();
		$("#enable").hide();
	});	
		

		function checkValue(){
			var retValue = true;
			
			if($('#memberId').val() == ""){
				alert("아이디를 입력하세요.");
				$('#memberId').focus();
				return;
			}
			
			if(member.chkMemberId != $('#memberId').val() || member.chkMemberId === "" || member.chkYn != "Y"){
				alert("아이디를 중복체크 하세요.");
				return;
			}

			var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
			
	        if( !idReg.test($('#memberId').val() ) ) {
	            alert("아이디는 영문자로 시작하는 8~20자 영문자 또는 숫자이어야 합니다.");
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
				$('#memPwdChk').val();
				return;
			}
			
			if($('#buyerNm').val() == ""){
				alert("이름을 입력하세요.");
				$('#buyerNm').focus();
				return;
			}
			if($('#companyNm').val() == ""){
				alert("휴대전화번호를 입력하세요.");
				$('#entprNm').focus();
				return;
			}
			if($('#buyerEmail').val() == ""){
				alert("이메일을 입력하세요.");
				$('#buyerEmail').focus();
				return;
			}
			if($('#selboxDirect1').val() == ""){
				alert("이메일을 입력하세요.");
				$('#selboxDirect1').focus();
				return;
			}

			return retValue;
		}
		
		$("#createBtn").click(function(){
			if(checkValue()){
				$("#joinTypeCd").val("000003");
				var formData = new FormData(document.insertFrm);
				$.ajax({
					type : 'post',
					url:'/db/memberInsert.do',
					data: formData,
					enctype: 'multipart/form-data',
					dataType: 'json',
					contentType : false,
			        processData : false, 					
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	window.location.href="/db/joinStep04.do";
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
				url:'/db/memberBuyerUpdate.do',
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

		 $("#cancel1").click(function(){
				var result = confirm("취소하시겠습니까?");
				if(result){
					var memberId = $('#memberId').val();
					var memberPw = $('#memberPw').val();
					
					$.ajax({
						type : 'post',
						url:'/db/frontView/loginCheck.do',
						data: {
							//memberId : memberId,
							memberId : $('#memberId').val(),
							memberPw : memberPw,
						},
						dataType: 'json',
						success : function(data) {
							if(data.idCnt == 0){
								alert("아이디 패스워드를 확인하세요.");
							}else{
								alert("로그인 합니다.");
								fn_login();
								return false;
							}
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		}
					});
				}else{
					
				}
			 });
		 

	$('#selbox1').change(function() { 
		$("#selbox1 option:selected").each(function() { 
			if($(this).val()== '1') { //직접입력일 경우 
				$("#selboxDirect1").val(''); //값 초기화 
				$("#selboxDirect1").attr("disabled",false); //활성화 
		} else { //직접입력이 아닐경우 
				$("#selboxDirect1").val($(this).text()); //선택값 입력 
				$("#selboxDirect1").attr("disabled",false); //비활성화 
				} 
		}); 
	}); 
	
	$('#selbox').change(function() { 
		$("#selbox option:selected").each(function() { 
			if($(this).val()== '1') { //직접입력일 경우 
				$("#selboxDirect").val(''); //값 초기화 
				$("#selboxDirect").attr("disabled",false); //활성화 
		} else { //직접입력이 아닐경우 
				$("#selboxDirect").val($(this).text()); //선택값 입력 
				$("#selboxDirect").attr("disabled",false); //비활성화 
				} 
			}); 
		}); 
	
		 		
	});
	

	function fn_login(){
		window.location.href="/db/main2.do";
	}
	
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
			            document.getElementById('buyerHeadAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
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
			            document.getElementById('buyerBranchAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			  }
		}).open();
	}
	
	
</script>
        
	<style>
		.hidden { display: none;  }
 	</style>

<head>

</head>
<body>

<div id="wrap" class="sub s6">
<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		
		
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span class="now">회원가입</span>
				<span class="now">회원 가입 및 수정</span>
				<span class="now">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>회원정보 등록</b></h1>
						</div>
					</div>
				</span>
			</div>
		</div>
		<div class="layout01">
		
			<h2 class="">회원가입 - 더 새로워진 전남콘테츠기업육성센터 홈페이지를 만나보세요!</h2>
			<div class="cont">
				<h3>회원</h3>
			
							
			<section id="widget-grid" class="">			
				<div class="continner">
				<form id="insertFrm" name="insertFrm" action="#" method="POST" enctype="multipart/form-data">
					<input type="hidden" id="joinTypeCd" name="joinTypeCd" value="" />
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="/db/joinStep01.do">가입유형</a></li>
							<li class="step"><a href="/db/joinStep02.do">약관동의</a></li>
							<li class="on"><a href="#none">정보입력</a></li>
							<li><a href="#none">가입완료</a></li>
						</ul>
					</div>
					
			
					<div class="joininfobox">
						<h4>바이어정보입력</h4>
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
									<th colspan="2" class="essential">아이디</th>
									<td colspan="2">
										<input type="text" id="memberId" name="memberId" style="width: 50%;" maxlength="20" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');" />
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
										<input type="password" style="width: 100%;" id="memberPw" name="memberPw" maxlength="30">
									</td>
									<th class="essential">비밀번호 확인</th>
									<td>
										<input type="password" style="width: 100%;" id="memPwdChk" name="memPwdChk" maxlength="30">
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">이름</th>
									<td colspan="3">
										<input type="text" style="width: 100%;" id="memberNm" name="memberNm" maxlength="30">
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">휴대폰번호</th>
									<td>
										<select style="width: 25%;" id="buyerCelNo1" name="buyerCelNo1">
											<option value="">선택</option>
											<c:forEach var="hpNoList" items="${hpNoList}" varStatus="status">
												<option value="${hpNoList.commonCd}"><c:out value="${hpNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerCelNo2" name="buyerCelNo2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerCelNo3" name="buyerCelNo3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">										
									</td>
									<th class="essential">이메일</th>
									<td id = 'entprRespsibEmail1'>
										
										<input type="text" name="buyerEmail" id="buyerEmail" title="이메일 앞자리주소"  style="width: 30%;" maxlength="30" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"/>
								        @
								        <input type="text" name="selboxDirect1" id="selboxDirect1" title="이메일 뒷자리주소" style="width: 30%;" maxlength="30" /> 
								            <select id="selbox1" title="이메일 뒷자리 선택">
								                <option value="1">직접입력</option>
								                <option value="naver.com">naver.com</option>
								                <option value="daum.net">daum.net</option>
								                <option value="hanmail.net">hanmail.net</option>
								                <option value="gmail.com">gmail.com</option>
								                <option value="hotmail.com">hotmail.com</option>
								                <option value="dreamwiz.com">dreamwiz.com</option>
								                <option value="freechal.com">freechal.com</option>
								                <option value="hanmir.com">hanmir.com</option>
								            </select>
								        <span class="desc"></span>
										
									</td>
								</tr>								
																
								<tr>
									<th colspan="2">회사명</th>
									<td>
										<input type="text" style="width: 100%;" id="companyNm" name="companyNm" maxlength="30" >
									</td>
									<th>대표자</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerCeo" name="buyerCeo" maxlength="30" >
									</td>
								</tr>
								<tr>
									<th colspan="2">사업자등록번호</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerComRegNum" name="buyerComRegNum" maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
									<th >대표자이메일</th>
									<td id="entprCeoEmail1">
										<input type="text" name="buyerCeoEmail" id="buyerCeoEmail" title="이메일 앞자리주소"  style="width: 30%;" maxlength="30" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"/>
								        @
								        <input type="text" name="selboxDirect" id="selboxDirect" title="이메일 뒷자리주소" style="width: 30%;" maxlength="30" /> 
								            <select id="selbox" title="이메일 뒷자리 선택">
								                <option value="1">직접입력</option>
								                <option value="naver.com">naver.com</option>
								                <option value="daum.net">daum.net</option>
								                <option value="hanmail.net">hanmail.net</option>
								                <option value="gmail.com">gmail.com</option>
								                <option value="hotmail.com">hotmail.com</option>
								                <option value="dreamwiz.com">dreamwiz.com</option>
								                <option value="freechal.com">freechal.com</option>
								                <option value="hanmir.com">hanmir.com</option>
								            </select>
								        <span class="desc"></span>
										
										
									</td>
								</tr>
								<tr>
									<th colspan="2">관심분야</th>
									<td>
										<select  id="buyerBusAreaCd" name="buyerBusAreaCd">
											<option value="">선택</option>
											<c:forEach var ="areaList" items="${areaList}" varStatus="status">
												<option value="${areaList.commonCd}">${areaList.commonNm}</option>
											</c:forEach>
										</select>
									</td>
									<th>홈페이지</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerSite" name="buyerSite">
									</td>
								</tr>
								<tr>
									<th colspan="2">설립일</th>
									<td>
										<input class="date" type="text" style="width: 40%;" id="buyerEstDt" name="buyerEstDt" readonly="readonly">
									</td>
									<th>자본금</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerCapitalAmt" name="buyerCapitalAmt" onkeydown="this.value=this.value.replace(/[^0-9]/g,'');" onkeyup="this.value=this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');" maxlength="10">
									</td>
								</tr>										
								<tr>
									<th rowspan="4">주소</th>
									<th rowspan="2" class="row">본사</th>
									<td>
										<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="" readonly="readonly" onclick="javascript:openDaumPostcode()" maxlength="50" style="width:70%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 100px;" onclick="javascript:openDaumPostcode()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="buyerHeadTel" name="buyerHeadTel">
											<option value="">선택</option>
											<c:forEach var="telNoList" items="${telNoList}" varStatus="status">
												<option value="${telNoList.commonCd}"><c:out value="${telNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerHeadTel2" name="buyerHeadTel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerHeadTel3" name="buyerHeadTel3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="buyerHeadDetailAddr" name="buyerHeadDetailAddr" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="buyerHeadFax" name="buyerHeadFax">
											<option value="">선택</option>
											<c:forEach var="telNoList" items="${telNoList}" varStatus="status">
												<option value="${telNoList.commonCd}"><c:out value="${telNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerHeadFax2" name="buyerHeadFax2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerHeadFax3" name="buyerHeadFax3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row">지사</th>
									<td>
										<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="" readonly="readonly" onclick="javascript:openDaumPostcode1()" maxlength="50" style="width:70%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 100px;" onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="buyerBranchTel" name="buyerBranchTel">
											<option value="">선택</option>
											<c:forEach var="totTelNoList" items="${totTelNoList}" varStatus="status">
												<option value="${totTelNoList.commonCd}"><c:out value="${totTelNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerBranchTel2" name="buyerBranchTel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerBranchTel3" name="buyerBranchTel3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="buyerBranchDetailAddr" name="buyerBranchDetailAddr" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="buyerBranchFax" name="buyerBranchFax">
											<option value="">선택</option>
											<c:forEach var="telNoList" items="${telNoList}" varStatus="status">
												<option value="${telNoList.commonCd}"><c:out value="${telNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerBranchFax2" name="buyerBranchFax2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="buyerBranchFax3" name="buyerBranchFax3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<th colspan="2">정책정보 제공을 위한 <br> 수집 및 이용동의</th>
									<td colspan="3">
										<select style="width: 8%;" id="conllentPublicYn" name="conllentPublicYn">
											<option value="Y" ${resultList.conllentPublicYn == 'Y' ? 'selected="selected"' : '' }>동의</option>
											<option value="N" ${resultList.conllentPublicYn != 'Y' ? 'selected="selected"' : '' }>미동의</option>
										</select>
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
			</div>
		</div>
	</div>
</div>
</body>

</html>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 