<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>

<script type="text/javaScript" >
$(document).ready(function () {
	 $(function(){ //전체선택 체크박스 클릭
		    $("#joinAgreeAll").click(function(){
		    	//alert("terstestet");//만약 전체 선택 체크박스가 체크된상태일경우
		        if($("#joinAgreeAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
		            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우
		        } else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
		            $("input[type=checkbox]").prop("checked",false);
		        }
		    });
		    
	 		$(".chk").click(function(){
		    	if($(":checkbox:checked").not("#joinAgreeAll").length == 3){
		    		$("#joinAgreeAll").prop("checked", true);
		    	}else{
		    		$("#joinAgreeAll").prop("checked", false);
		    	}
		    });
		
	 });
	 $("#okok").click(function(){
		 if($('#joinAgree1').prop('checked') == false){
	            alert('필수 약관에 동의 하셔야 합니다.');
	            $('#joinAgree1').focus();
	            
		 }else if($('#joinAgree2').prop('checked') == false){
	            alert('필수 약관에 동의 하셔야 합니다.');
	            $('#joinAgree2').focus();				 
			 
		 }else{
		   if($("#joinAgree3").prop("checked")){
			   $("#conllentPublicYn").val("Y");
		   }else{
			   $("#conllentPublicYn").val("N");
		   }
		       	$('#requestFrm').attr('action', "/db/joinStep032.do").submit();				 
		 }
	 });

	 $("#cancel").click(function(){
		 
		 if(confirm("취소하시겠습니까?")){
		 	window.location.href="/db/main.do";
		 }
	 });
	 
	
});
	
	
	
</script>
        
	<style>
		.hidden { display: none;  }
 	</style>
</head>
<body>

<div id="wrap" class="sub s6">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
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
				<div class="continner">
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="/db/joinStep01.do">가입유형</a></li>
							<li class="on"><a href="/db/joinStep02.do">약관동의</a></li>
							<li><a href="#">정보입력</a></li>
							<li><a href="#">가입완료</a></li>
						</ul>
					</div>

					<div class="agree_desc">
						<p>전남콘텐츠기업육성센터'는(이하 '센터'는) 고객님들의 개인정보를 중요시하며, "정보통신망이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.</p>
						<p>개인정보취급방침을 통하여 고객님께서 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
					</div>

					<h4 class="blind">동의내용 첫번째</h4>
					<div class="designcheckbox">
						<input type="checkbox" id="joinAgree1" class="chk">
						<label for="joinAgree1">약관동의(필수)</label>
					</div>
					<div class="scroll_box" tabindex="0">
						<h5>제1장 총칙</h5>
						<h6>제1조(목적)</h6>
						<p>본 약관은 전남콘텐츠기업육성센터가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

						<h6>제2조(목적)</h6>
						<p>본 약관은 전남콘텐츠기업육성센터가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

						<h6>제3조(목적)</h6>
						<p>본 약관은 전남콘텐츠기업육성센터가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

						<h6>제4조(목적)</h6>
						<p>본 약관은 전남콘텐츠기업육성센터가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

						<h6>제5조(목적)</h6>
						<p>본 약관은 전남콘텐츠기업육성센터가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 관리시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
					</div>

					<h4 class="blind">동의내용 두번째</h4>
					<div class="designcheckbox">
						<input type="checkbox" id="joinAgree2" class="chk">
						<label for="joinAgree2">개인정보 수집 및 이용에 관한 안내(필수)</label>
					</div>
					<div class="scroll_box" tabindex="0">
						<p>전남콘텐츠기업육성센터는 개인정보를 중요시하며, “정보통신망 이용촉진 및 정보보호 등에 관한 법률”, “개인정보보호법” 등 개인 정보와 관련된 법령 상의 개인정보보호규정 및 방송통신위원회가 제정한 “개인정보보호지침”을 준수하고 있습니다.</p>
						<p>개인정보취급방침을 통하여 고객님께서 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
					</div>

					<h4 class="blind">동의내용 세번째</h4>
					<div class="designcheckbox">
						<input type="checkbox" id="joinAgree3" class="chk">
						<label for="joinAgree3">정책정보 제공을 위한 수집 및 이용 동의(선택)</label>
					</div>
					<div class="scroll_box" tabindex="0">
						<h5>1. 개인정보의 수집 및 이용 목적</h5>
						<p>- 정부 및 지자체의 중소·중견기업 분야별 지원정책 및 참여기회 제공</p>

						<h5>2. 수집하는 개인정보의 항목 </h5>
						<p>- 필수항목 : 이름, 이메일, 휴대폰전화번호</p>
						<p>- 선택항목 : 소속정보</p>
					</div>

					<div class="designcheckbox center">
						<input type="checkbox" id="joinAgreeAll">
						<label for="joinAgreeAll">모두 동의합니다.</label>
					</div>

					<div class="submitbtn">
						<button type="button" id="okok" class="ok">확인</button>
						<button type="button" id="cancel">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<form role="form" id="requestFrm" action="#" class="form-horizontal" method="post">	 
	   <input type="hidden" name="conllentPublicYn" id="conllentPublicYn" value="">
    </form>		
</body>
</html>