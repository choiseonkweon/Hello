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
			
			if($('#entprNm').val() == ""){
				alert("회사명을 입력하세요.");
				$('#entprNm').focus();
				return;
			}
			
			if($('#entprCeo').val() == ""){
				alert("대표자를 입력하세요.");
				$('#entprCeo').focus();
				return;
			}
			
			if($('#entprComRegNum').val() == ""){
				alert("사업자등록번호를 입력하세요.");
				$('#entprComRegNum').focus();
				return;
			}
			
			if($('#entprCeoEmail').val() == ""){
				alert("대표자이메일을 입력하세요.");
				$('#entprCeoEmail').focus();
				return;
			}
			if($('#selboxDirect').val() == ""){
				alert("대표자이메일을 입력하세요.");
				$('#selboxDirect').focus();
				return;
			}
			
			if($('#largeBussAreaCd').val() == ""){
				alert("사업분야 대분류를 선택하세요.");
				$('#largeBussAreaCd').focus();
				return;
			}
			if($('#midiumBussAreaCd').val() == ""){
				alert("사업분야 중분류를 선택하세요.");
				$('#midiumBussAreaCd').focus();
				return;
			}
			if($('#entprEstDt').val() == ""){
				alert("설립일을 선택하세요.");
				$('#entprEstDt').focus();
				return;
			}
			if($('#entprHeadAddr').val() == ""){
				alert("본사 주소를 입력하세요.");
				$('#entprHeadAddr').focus();
				return;
			}
			if($('#entprHeadDetailAddr').val() == ""){
				alert("본사 상세주소를 선택하세요.");
				$('#entprHeadDetailAddr').focus();
				return;
			}
			if($('#entprHeadTel').val() == ""){
				alert("대표전화를 입력하세요.");
				$('#entprHeadTel').focus();
				return;
			}
			if($('#expertOffiTel1').val() == ""){
				alert("대표전화를 선택하세요.");
				$('#expertOffiTel1').focus();
				return;
			}
			if($('#expertOffiTel2').val() == ""){
				alert("대표전화를 선택하세요.");
				$('#expertOffiTel2').focus();
				return;
			}

			return retValue;
		}
		
		$("#createBtn").click(function(){
			if(checkValue()){
				$("#joinTypeCd").val("000001");
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
			            document.getElementById('entprHeadAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
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
			            document.getElementById('entprBranchAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			  }
		}).open();
	}
	
	function inNumber(){
		if(event.keyCode<48 || event.keyCode>57){
			event.returnValue=false;
		}
	}
	
	//대분류 변경 -> 중분류 조회 
	function largeBussCdChange(target){
		var largeCdValue = target.value; 
		var medium = $("#mediumBussAreaCd");
		if("" === largeCdValue || undefined === largeCdValue){
			medium.find("option:gt(0)").remove();
		}else{
			
			$.ajax({
				type : 'post',
				url:'/db/selectOnchange.do',
				data: {
					"selectBoxData" : largeCdValue
				},
				dataType: 'json',
				success : function(data) {
		              var htmls = "";
			              if(data.data.length > 0){
	                         $(data.data).each(function(){
	                            htmls +='<option value="' + this.commonCd + '">' + this.commonNm + '</>'; 
	                        });   //each end 
	                        medium.find("option:gt(0)").remove();
	                        medium.append(htmls);  
			              }else{
			            	  medium.find("option:gt(0)").remove();
			              }		
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		   		}
			});			
			
		}
		
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
			</div><!-- layout01 clearfix -->
		</div><!-- location -->
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
						<h4>기업정보입력</h4>
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
										<input type="password" style="width: 100%;" id="memberPw" name="memberPw"  maxlength="30">
									</td>
									<th class="essential">비밀번호 확인</th>
									<td>
										<input type="password" style="width: 100%;" id="memPwdChk" name="memPwdChk" maxlength="30">
									</td>
								</tr>
								<tr>
									<th colspan="2">이름</th>
									<td colspan="3">
										<input type="text" style="width: 100%;" id="memberNm" name="memberNm" maxlength="30">
									</td>
								</tr>
								<tr>
									<th colspan="2">휴대폰번호</th>
									<td>
										<select style="width: 25%;" id="entprRespsibHpNo" name="entprRespsibHpNo">
											<option value="">선택</option>
											<c:forEach var="hpNoList" items="${hpNoList}" varStatus="status">
												<option value="${hpNoList.commonCd}"><c:out value="${hpNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprRespsibHpNo2" name="entprRespsibHpNo2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprRespsibHpNo3" name="entprRespsibHpNo3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">										
									</td>
									<th>이메일</th>
									<td id = 'entprRespsibEmail1'>
										
										<input type="text" name="entprRespsibEmail" id="entprRespsibEmail" title="이메일 앞자리주소"  style="width: 30%;" maxlength="30" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"/>
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
									<th colspan="2" class="essential">회사명</th>
									<td>
										<input type="text" style="width: 100%;" id="entprNm" name="entprNm" maxlength="30" >
									</td>
									<th class="essential">대표자</th>
									<td>
										<input type="text" style="width: 100%;" id="entprCeo" name="entprCeo" maxlength="30" >
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">사업자등록번호</th>
									<td>
										<input type="text" style="width: 100%;" id="entprComRegNum" name="entprComRegNum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10">
									</td>
									<th class="essential">대표자이메일</th>
									<td id="entprCeoEmail1">
										<input type="text" name="entprCeoEmail" id="entprCeoEmail" title="이메일 앞자리주소"  style="width: 30%;" maxlength="30" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"/>
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
									<th colspan="2" class="essential">사업분야</th>
									<td>
										<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="javascript:largeBussCdChange(this);" >
											<option value="">대분류</option>
											<c:forEach var ="areaList" items="${areaList}" varStatus="status">
												<option value="${areaList.commonCd}">${areaList.commonNm}</option>
											</c:forEach>
										</select>
										<select id="mediumBussAreaCd" name="mediumBussAreaCd" style="width:150px;">
											<option value="">중분류</option>
										</select>										
									</td>
									<th>홈페이지</th>
									<td>
										<input type="text" style="width: 100%;" id="entprSite" name="entprSite">
									</td>
								</tr>
								<tr>
									<th colspan="2" class="essential">설립일</th>
									<td>
										<input class="date" type="text" style="width: 40%;" id="entprEstDt" name="entprEstDt" readonly="readonly">
									</td>
									<th>자본금</th>
									<td>
										<input type="text" style="width: 100%;" id="entprCapitalAmt" name="entprCapitalAmt" onkeydown="this.value=this.value.replace(/[^0-9]/g,'');" onkeyup="this.value=this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');" maxlength="10">
									</td>
								</tr>								
								
								<tr>
									<th rowspan="4">주소</th>
									<th rowspan="2" class="row essential">본사</th>
									<td>
										<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="input-sm" value="" readonly="readonly" onclick="javascript:openDaumPostcode()" maxlength="50" style="width:70%" readonly="readonly">
										<button type="button" class="txtbtn" style="width: 100px;" onclick="javascript:openDaumPostcode()">우편번호 검색</button>
									</td>
									<th class="essential">대표전화</th>
									<td>
										<select style="width: 25%;" id="entprHeadTel" name="entprHeadTel">
											<option value="">선택</option>
											<c:forEach var="totTelNoList" items="${totTelNoList}" varStatus="status">
												<option value="${totTelNoList.commonCd}"><c:out value="${totTelNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprHeadTel2" name="entprHeadTel2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprHeadTel3" name="entprHeadTel3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="entprHeadDetailAddr" name="entprHeadDetailAddr" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="entprHeadFax" name="entprHeadFax">
											<option value="">선택</option>
											<c:forEach var="telNoList" items="${telNoList}" varStatus="status">
												<option value="${telNoList.commonCd}"><c:out value="${telNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprHeadFax2" name="entprHeadFax2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprHeadFax3" name="entprHeadFax3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row">자택</th>
									<td>
										<input type="text" id="entprBranchAddr" name="entprBranchAddr" class="input-sm" value="" readonly="readonly" onclick="javascript:openDaumPostcode1()" maxlength="50" style="width:70%">
										<button type="button" class="txtbtn" style="width: 100px;" onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									</td>
									<th>대표전화</th>
									<td>
										<select style="width: 25%;" id="entprBranchTel" name="entprBranchTel">
											<option value="">선택</option>
											<c:forEach var="totTelNoList" items="${totTelNoList}" varStatus="status">
												<option value="${totTelNoList.commonCd}"><c:out value="${totTelNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprBranchTel2" name="entprBranchTel2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprBranchTel3" name="entprBranchTel3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
									</td>
								</tr>
								<tr>
									<td>
										상세주소
										<input type="text" style="width: 70%;" id="entprBranchDetailAddr" name="entprBranchDetailAddr" maxlength="40">
									</td>
									<th>대표FAX</th>
									<td>
										<select style="width: 25%;" id="entprBranchFax" name="entprBranchFax">
											<option value="">선택</option>
											<c:forEach var="telNoList" items="${telNoList}" varStatus="status">
												<option value="${telNoList.commonCd}"><c:out value="${telNoList.commonCd}"/></option>
											</c:forEach>
										</select>
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprBranchFax2" name="entprBranchFax2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
										<em>-</em>
										<input type="text" style="width: 25%;" id="entprBranchFax3" name="entprBranchFax3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
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

			</div><!-- cont -->
		</div><!-- layout01 -->
	</div><!--contents  -->
</div><!-- wrap -->
	<form role="form" id="requestFrm" action="#" class="form-horizontal" method="post">	 
	   <input type="hidden" name="conllentPublicYn" id="conllentPublicYn" value="">
    </form>		
</body>

</html>
 
