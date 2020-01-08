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
	<meta charset="UTF-8">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<title>전남콘텐츠기업육성센터</title>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../db/assets/css/reset.css">
	<link rel="stylesheet" href="../db/assets/css/common.css">
	<script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../db/assets/js/ui.js"></script>
</head>
<body>
<div id="skipnav"><a href="#contents">본문바로가기</a></div>
<div id="wrap" class="sub s6 visualnone">
	<div class="headerWrap">
		<header id="header" class="subheader clearfix">
			<div id="gnbWrapper" class="gnbWrapper">
				<div id="gnbWrap" class="gnbWrap">
					<div class="layout01">
						<h1><a href="/db/main.do"><img src="../db/css/img/logo.png" alt="jcap 전남콘텐츠기업육성센터"></a></h1>

						<!-- Mobile Burger Menu -->
						<button class="btnBurgerMenu">
							<span class="menu-global menu-top"></span>
							<span class="menu-global menu-middle"></span>
							<span class="menu-global menu-bottom"></span>
						</button>
						<!-- EOD : Mobile Burger Menu -->

						<nav id="gnb">
							<ul class="depth1">
								<li>
									<a href="#none">사업공고</a>
									<ul class="depth2">
										<li><a href="/db/businessList.do">사업공고</a></li>
										<li><a href="/db/companyInformationList.do">기업 정보</a></li>
										<li><a href="/db/buyerInformationList.do">바이어 정보</a></li>
										<li><a href="/db/expertInformationList.do">전문가 정보</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">시설 및 자원 신청</a>
									<ul class="depth2">
										<li class="menu2"><a href="/db/facilityUseList.do">시설 사용신청</a></li>
										<li class="menu2"><a href="/db/resourceUseList.do">자원 사용신청</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">원스톱 지원실</a>
									<ul class="depth2">
										<li><a href="/db/onlineApply.do">온라인 상담신청</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">고객광장</a>
									<ul class="depth2">
										<li><a href="/db/noticeList.do">공지사항</a></li>
										<li><a href="/db/faqList.do">FAQ</a></li>
										<li><a href="/db/contactUsList.do">문의하기</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">마이페이지</a>
									<ul class="depth2">
										<li><a href="/db/myCompanyInformation.do">내 기업 정보</a></li>
										<li><a href="/db/facilitiesResourcesApplicationStatus.do">시설 사용신청 현황</a></li>
										<li><a href="/db/onlineCounselingStatus.do">온라인 상담신청 현황</a></li>
									</ul>
								</li>
							</ul>
						</nav>

						<!-- 로그인 후 -->
						<div class="loginInfo" style="display:none;">
							<a href="#none">회원정보수정</a>
							<span class="bar"></span>
							<a href="#none">로그아웃</a>
							<span class="bar"></span>
							<button type="button" class="btnSearch01">검색</button>
						</div>
						<!-- EOD : 로그인 후 -->

						<!-- 로그인 전 -->
						<div class="loginInfo">
							<a href="#none">회원가입</a>
							<span class="bar"></span>
							<a href="/db/frontLogin.do">로그인</a>
							<span class="bar"></span>
							<button type="button" class="btnSearch01">검색</button>
						</div>
						<!-- EOD : 로그인 전 -->
					</div>
					<!-- EOD : layout01 -->
				</div>
				<!-- EOD : gnbWrap -->
			</div>
			<!-- EOD : gnbWrapper -->
		</header>
	</div>
	<div id="contents" class="bg_gray">
		<div class="layout01">
			<h2 class="">로그인 - 더 새로워진 전남콘테츠기업육성센터 홈페이지를 만나보세요!</h2>
			<div class="cont">
				<div class="login_box">
					<div class="login_title">
						<h3>로그인</h3>
						<p>
							전남콘텐츠기업육성센터에 오신 것을 환영합니다.<br>
							<span>전남콘텐츠기업육성센터를 이용하시기 위해서는 아이디,비밀번호<br class="mo"> 입력 후 로그인을 클릭하십시오</span>
						</p>
					</div>

					<div class="login_form">
						<form>
							<fieldset>
								<legend>로그인 입력 양식</legend>
								<ul>
									<li>
										<input type="text" placeholder="아이디">
									</li>
									<li>
										<input type="password" placeholder="비밀번호">
									</li>
									<li>
										<a href="#none" class="btn login">로그인</a>
									</li>
									<li class="dashed">
										<a href="#none" class="btn join">회원가입</a>
									</li>
									<li class="infosearch">
										<a href="#">아이디 찾기</a>
										<a href="#">비밀번호 찾기</a>
									</li>
								</ul>
							</fieldset>
						</form>
					</div>

					<div class="login_info">
						<div>
							<strong>로그인 안내</strong>
							<ul>
								<li>비밀번호 입력 시 대소문자를 구분하여 입력하세요.</li>
								<li>자리를 비우게 될 경우에는 정보보호를 위해 반드시 로그아웃을 하시기 바랍니다.</li>
								<li>비밀번호는 주기적으로 변경 관리하고 타인에게 노출되지 않도록 주의하시기 바랍니다.</li>
							</ul>
							<p><a href="#none" class="loginmorebtn">토글 버튼</a></p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('.loginmorebtn').on('click', function(){
			if($('.login_info').hasClass('open')){
				$('.login_info').removeClass('open');
				$('.login_info ul').stop().slideUp(300);	
			}else{
				$('.login_info').addClass('open');
				$('.login_info ul').stop().slideDown(300);
			}
		});
	});
</script>

</body>
</html>