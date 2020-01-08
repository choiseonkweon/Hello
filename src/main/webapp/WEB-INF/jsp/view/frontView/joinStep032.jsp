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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javaScript" defer="defer">
	$(document).ready(function () {
		
/* 		var memberId = $('#memberId').val();
		alert("memberId :: " + memberId); */
		
		$("#idChkBtn").click(function(){
			//alert($('#memberId').val());
			//alert($('#expertHeadTel1').val());
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

			var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
			
	        if( !idReg.test($('#memberId').val() ) ) {
	            alert("아이디는 영문자로 시작하는 8~20자 영문자 또는 숫자이어야 합니다.");
	            return;
	        }
	        
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
			
			if($('#buyerHeadTel').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#buyerHeadTel').focus();
				return;
			}

/* 			if($('#expertHeadTel2').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#expertHeadTel2').focus();
				return;
			}
			
			if($('#expertHeadTel3').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#expertHeadTel3').focus();
				return;
			} */
			return retValue;
		}
		
		$("#createBtn").click(function(){
			if(checkValue()){
				$.ajax({
					type : 'post',
					url:'/db/memberBuyerInsert.do',
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
					
					//confirm("memberId :: " + memberId);
					//confirm("memberPw :: " + memberPw); 
					
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
		 
  /* $(function(){
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
   */

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

<input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
<input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
<input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
<input type="hidden" name="chkYn" id="chkYn" value="">

<div id="wrap" class="sub s6">
<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		
		
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span class="now">회원가입</span>
				<span class="now">회원 가입 및 수정</span>
				<span class="now">
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
				</span>
			</div>
		</div>
		<div class="layout01">
		
			<h2 class="">회원가입 - 더 새로워진 전남콘테츠기업육성센터 홈페이지를 만나보세요!</h2>
			<div class="cont">
				<h3>회원</h3>
			
							
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
									<td colspan="3">
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
										<input type="text" style="width: 50%;" id="memberNm" name="memberNm">
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">휴대폰번호</th>
									<td>
										<input type="text" id="buyerHeadTel" name="buyerHeadTel" maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
<!-- 										<em>-</em>
										<input type="text" style="width: 25%;" id="expertHeadTel2" name="expertHeadTel2">
										<em>-</em>
										<input type="text" style="width: 25%;" id="expertHeadTel3" name="expertHeadTel3"> -->
									</td>
									<th>대표자 이메일</th>
									<td>
										<!-- <input type="text" style="width: 40%;" id="buyerCeoEmail" name="buyerCeoEmail">
										<em>@</em>
										상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스
										<input type="text" id="selboxDirect" name="selboxDirect" style="width: 40%;"/>
										<select style="width: 40%;" id="selbox" name="selbox">
											<option value="nate.com">nate.com</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="direct">기타</option>
										</select> -->
										<input type="text" name="buyerCeoEmail" id="buyerCeoEmail" title="이메일 앞자리주소"  style="width: 40%;" maxlength="30"/>
								        @
								        <input type="text" name="selboxDirect" id="selboxDirect" title="이메일 뒷자리주소" style="width: 40%;" maxlength="30" /> 
								        <div class="select-box">
								            <label for="selbox">이메일 뒷자리 선택</label>
								            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
								        </div>
								        <span class="desc"></span>
										
									</td>
								</tr>
								<tr>
									<th colspan="2">회사명</th>
									<td>
										<input type="text" style="width: 100%;" id="companyNm" name="companyNm">
									</td>
									<th>대표자</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerCeo" name="buyerCeo">
									</td>
								</tr>
								<tr>
									<th colspan="2">사업자등록번호</th>
									<td colspan="3">
										<input type="text" style="width: 25%;" id="buyerComRegNum" name="buyerComRegNum" maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
									<!-- <th>대표자이메일</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerCeoEmail" name="buyerCeoEmail">
										<input type="text" name="buyerCeoEmail" id="buyerCeoEmail" title="이메일 앞자리주소"  style="width: 40%;" maxlength="30"/>
								        @
								        <input type="text" name="selboxDirect1" id="selboxDirect1" title="이메일 뒷자리주소" style="width: 40%;" maxlength="30" /> 
								        <div class="select-box">
								            <label for="selbox1">이메일 뒷자리 선택</label>
								            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
								        </div>
								        <span class="desc"></span>
										
										</td> -->
								</tr>
								
								<tr>
									<th colspan="2">관심분야</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerBusArea" name="buyerBusArea">
									</td>
									<th>홈페이지</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerSite" name="buyerSite">
									</td>
								</tr>
								<tr>
									<th rowspan="4">주소</th>
									<th rowspan="2" class="row">본사</th>
									<td>
										<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="" maxlength="50" style="width:90%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="buyerHeadTel1" name="buyerHeadTel1">
											<option></option>
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
										<input type="text" style="width: 25%;" id="expertOffiTel1" name="expertOffiTel1" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<em>-</em>
										<input type="text" style="width: 25%;" id="expertOffiTel2" name="expertOffiTel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
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
											<option></option>
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
										<input type="text" style="width: 25%;" id="expertOffiFax1" name="expertOffiFax1" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="expertOffiFax2" name="expertOffiFax2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row">자택</th>
									<td>
										<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="" maxlength="50" style="width:90%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="entprBranchTel" name="entprBranchTel">
											<option></option>
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
										<input type="text" style="width: 25%;" id="memberMyTel1" name="memberMyTel1" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyTel2" name="memberMyTel2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
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
											<option></option>
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
										<input type="text" style="width: 25%;" id="memberMyFax1" name="memberMyFax1" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										<em>-</em>
										<input type="text" style="width: 25%;" id="memberMyFax2" name="memberMyFax2" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
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
					<input type="hidden" name="memberIdx" id="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="/db/joinStep01.do">가입유형</a></li>
							<li class="step"><a href="/db/joinStep02.do">약관동의</a></li>
							<li class="on"><a href="#none">정보입력</a></li>
							<li><a href="#none">가입완료</a></li>
						</ul>
					</div>
					
			
					<div class="joininfobox">
						<h4>바이어정보수정</h4>
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
										<input type="text" id="memberId" name="memberId" value="${detail.memberId}" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">비밀번호</th>
									<td>
										<label class="input">
											<input type="password" id="memberPw" name="memberPw" value="${detail.memberPw}" />
										</label>
									</td>
									<th class="essential">비밀번호 확인</th>
									<td>
										<label class="input">
											<input type="password" id="memPwdChk" name="memPwdChk" value="${detail.memberPw}" />
										</label>
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">이름</th>
									<td colspan="3">
										<input type="text" id="buyerNm" name="buyerNm" value="${detail.memberNm}" />
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">휴대폰번호</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id="buyerHeadTel" name="buyerHeadTel" value="${detail.buyerHeadTel}" maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										</label>
									</td>
									<th>이메일</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id=buyerCeoEmail name="buyerCeoEmail" value="${detail.buyerCeoEmail}" />
										</label>	
									</td>
								</tr>
								<tr>
									<th colspan="2">회사명</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id="companyNm" name="companyNm" value="${detail.companyNm}" />
										</label>	
									</td>
									<th>대표자</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id="buyerCeo" name="buyerCeo" value="${detail.buyerCeo}" />
										</label>	
									</td>
								</tr>
								<tr>
									<th colspan="2">사업자등록번호</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id="buyerComRegNum" name="buyerComRegNum" value="${detail.buyerComRegNum}" maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
										</label>	
									</td>
									<th>대표자이메일</th>
									<td>
										<label class="input">
										 	<input type="text" style="width: 100%;" id="buyerCeoEmail1" name="buyerCeoEmail1" value="${detail.buyerCeoEmail} " />
										</label> 
									</td>
								</tr>
								<tr>
									<th colspan="2">관심분야</th>
									<td>
										<label class="input">
											<input type="text" style="width: 100%;" id="buyerBusArea" name="buyerBusArea" value="${detail.buyerBusArea} "/>
										</label>	
									</td>
									<th>홈페이지</th>
									<td>
										<label class="input">
										 	<input type="text" style="width: 100%;" id="buyerSite" name="buyerSite" value="${detail.buyerSite} " />
										</label> 
									</td>
								</tr>
								
								<tr>
									<th rowspan="4">주소</th>
									<th rowspan="2" class="row">본사</th>
									<td>
										<label class="input">
											<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="${detail.buyerHeadAddr}" maxlength="50" style="width:90%" readonly="readonly">
											<button type="button" class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode()">우편번호 검색</button>
										</label>
									</td>
									<th>대표전화</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerHeadTel1" name="buyerHeadTel1" value="${detail.buyerHeadTel}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="buyerHeadDetailAddr" name="buyerHeadDetailAddr" value="${detail.buyerHeadDetailAddr}" />
									</td>
									<th>대표FAX</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerHeadFax" name="buyerHeadFax" value="${detail.buyerHeadFax}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row">지사</th>
									<td>
										<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="${detail.buyerBranchAddr}" maxlength="50" style="width:90%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 120px;" onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerBranchTel" name="buyerBranchTel" value="${detail.buyerBranchTel}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="buyerBranchDetailAddr" name="buyerBranchDetailAddr" value="${detail.buyerBranchDetailAddr}">
									</td>
									<th>대표FAX</th>
									<td>
										<input type="text" style="width: 100%;" id="buyerBranchFax" name="buyerBranchFax" value="${detail.buyerBranchFax}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="submitbtn">
						<button type="button" id="saveBtn" name="saveBtn" class="ok">수정하기</button>
						<button type="button" id="cancel1" name="cancel1" class="no">취소</button>
					</div>
					</form>
				</div>
				
				</section>
			</c:if>
			
				
			</div>
		</div>
	</div>
	
</div>
<%-- 
<form role="form" id="insertFrm" action="#" class="form-horizontal" method="post">
	<input type="hidden" name="memberIdx" id="memberIdx" value="">
	<input type="hidden" id="memberId" name="memberId" value="">
	<input type="hidden" name="memberPw" id="memberPw" value="">
	<input type="hidden" name="memberNm" id="memberNm" value="">
	<input type="hidden" name="expertOffiAddr" id="expertOffiAddr" value="">
	<input type="hidden" name="expertOffiDetailAddr" id="expertOffiDetailAddr" value="">
	<input type="hidden" name="expertOffiTel" id="expertOffiTel" value="">
	<input type="hidden" name="expertHeadTel" id="expertHeadTel" value="">
	<input type="hidden" name="expertEmail" id="expertEmail" value="">
	<input type="hidden" name="memberBelong" id="memberBelong" value="">
	<input type="hidden" name="memberJoinDt" id="memberJoinDt" value="">
	<input type="hidden" name="memberJoinType" id="memberJoinType" value="">
	<input type="hidden" name="memberSt" id="memberSt" value="">
	<input type="hidden" name="expertFinalSchoolNm" id="expertFinalSchoolNm" value="">
	<input type="hidden" name="expertMajorNm" id="expertMajorNm" value="">
	<input type="hidden" name="expertHeadAddrNm" id="expertHeadAddrNm" value="">
	<input type="hidden" name="expertDptmNm" id="expertDptmNm" value="">
	<input type="hidden" name="memberSpecialty" id="memberSpecialty" value="">
	<input type="hidden" name="detailSpecialAreaCd" id="detailSpecialAreaCd" value="">
	<input type="hidden" name="expertInterestAreaCd" id="expertInterestAreaCd" value="">
	<input type="hidden" name="expertDetailIntrtAreaCd" id="expertDetailIntrtAreaCd" value="">
	<input type="hidden" name="expertOffiFax" id="expertOffiFax" value="">
	<input type="hidden" name="expertHomeAddr" id="expertHomeAddr" value="">
	<input type="hidden" name="memberMytel" id="memberMytel" value="">
	<input type="hidden" name="memberMyfax" id="memberMyfax" value="">
	<input type="hidden" name="	expertHomeDetailAddr" id="expertHomeDetailAddr" value="">
</form>
 --%>

</body>

</html>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 