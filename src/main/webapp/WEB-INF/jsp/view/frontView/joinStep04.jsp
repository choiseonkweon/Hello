<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
	<style>
		.hidden { display: none;  }
 	</style>

<head>
<script  type="text/javaScript">
	function fn_return(){
		window.location.href = "/db/main.do";
	}
		
</script>
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
				<h3>회원가입 완료</h3>
				<div class="continner">
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="step"><a href="#none">가입유형</a></li>
							<li class="step"><a href="#none">약관동의</a></li>
							<li class="step"><a href="#none">정보입력</a></li>
							<li class="on"><a href="#none">가입완료</a></li>
						</ul>
					</div>

					<p class="commatitle">전남콘텐츠기업육성센터 회원가입이<br>완료되었습니다.</p>
					<div class="join_desc">
						<p>회원가입이 정상적으로 완료 되었습니다.</p>
						<p>전남콘텐츠기업육성센터 입주기업 및 도내 콘텐츠 기업의 성장발판 마련과 융합콘텐츠 산업시장 경쟁력 강화를<br class="pc">위해 항상 최선을 다하겠습니다.</p>
						<p class="point">※ 전남콘텐츠 기업육성센터의 승인 후 로그인이 가능합니다.</p>
						<p>감사합니다.</p>
					</div>

					<div class="submitbtn">
						<button type="button" class="ok" onclick="javascript:fn_return();">메인으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

</body>

</html>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 