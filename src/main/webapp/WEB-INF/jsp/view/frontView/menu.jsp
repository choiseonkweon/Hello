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
 	<script type="text/javascript">
		function moveDetailView(memberId,joinTypeCd){
			if(joinTypeCd === "000001"){ // 기업
				window.location.href = "/db/myCompanyInformation.do";
			}else if(joinTypeCd === "000002"){ // 전문가
				window.location.href = "/db/myExpertInformation.do";
				
			}else if(joinTypeCd === "000003"){ // 바이어
				window.location.href = "/db/myBuyerInformation.do";
			}
		}
	</script>
</head>
<body>
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
									<a href="#none">시장정보</a>
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
								<c:if test="${memberId != null}">
									<a href="#none">마이페이지</a>
									<ul class="depth2">
										<c:if test="${joinTypeCd==000001}">
										<li><a href="/db/myCompanyInformation.do">내 기업 정보</a></li>
										</c:if>
										<c:if test="${joinTypeCd==000002}">
										<li><a href="/db/myExpertInformation.do">내 전문가 정보</a></li>
										</c:if>
										<c:if test="${joinTypeCd==000003}">
										<li><a href="/db/myBuyerInformation.do">내 바이어 정보</a></li>
										</c:if>
										<li><a href="/db/facilitiesResourcesApplicationStatus.do">시설 사용신청 현황</a></li>
<%-- 										<li><a href="javascript:moveDetailViewMy('${memberId}');">시설 사용신청 현황</a></li> --%>
										<li><a href="/db/onlineCounselingStatus.do">온라인 상담신청 현황</a></li>
<%-- 										<li><a href="javascript:onlineMoveDetailViewMy('${memberId}');" >온라인 상담신청 현황</a></li> --%>
									</ul>
									</c:if>
								</li>
							</ul>
						</nav>

						<!-- 로그인 전 -->
						<c:if test="${memberId==null}">
							<div class="loginInfo">
								<a href="/db/joinStep01.do">회원가입</a>
								<span class="bar"></span>
								<a href="/db/login.do">로그인</a>
<!-- 								<span class="bar"></span>
								<button type="button" class="btnSearch01">검색</button>
 -->							</div>
						</c:if>
						<!-- EOD : 로그인 전 -->

						<!-- 로그인 후 -->
						<c:if test="${memberId != null}">
							<div class="loginInfo">
							<input type="text" id="memberId1" value="${memberId}" style="font-size: 10px;" disabled="disabled"><br/>
							<a href="javascript:moveDetailView('${memberId}','${joinTypeCd}')" style="font-size: 11px;"> 회원정보수정</a>
							<a>/</a>
							<!-- <a href="#" style="font-size: 10px;"> 님 회원정보수정</a> -->
							<a href="logout.do">로그아웃</a>
<!-- 								<span class="bar"></span>
								<button type="button" class="btnSearch01">검색</button>
-->						</div>
						</c:if>
						<!-- EOD : 로그인 후 -->

					</div>
					<!-- EOD : layout01 -->
				</div>
				<!-- EOD : gnbWrap -->
			</div>
			<!-- EOD : gnbWrapper -->
		</header>
	</div>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>전남콘텐츠기업육성센터</title>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../db/assets/css/reset.css">
	<link rel="stylesheet" href="../db/assets/css/common.css">
	<link rel="stylesheet" href="../db/assets/css/main.css">
	<link rel="stylesheet" href="../db/assets/css/sub01.css">
	<script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../db/assets/js/ui.js"></script>
</head>
<body>
<div id="skipnav"><a href="#contents">본문바로가기</a></div>

<div id="wrap">
	<div class="headerWrap">
		<header id="header" class="subheader clearfix">
			<div id="gnbWrapper" class="gnbWrapper">
				<div id="gnbWrap" class="gnbWrap">
					<div class="layout01">
						<h1><a href="/db/main2.do"><img src="../db/css/img/logo.png" alt="jcap 전남콘텐츠기업육성센터"></a></h1>
	
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
				<a href="#none">시장정보</a>
				<ul class="depth2">
					<li><a href="/db/businessList.do">사업공고</a></li>
					<!-- <li><a href="/db/companyInformationList.do">기업 정보</a></li> -->
	<li><a href="/db/login.do">기업 정보</a></li>
	<!-- <li><a href="/db/buyerInformationList.do">바이어 정보</a></li> -->
	<li><a href="/db/login.do">바이어 정보</a></li>
	<!-- <li><a href="/db/expertInformationList.do">전문가 정보</a></li> -->
			<li><a href="/db/login.do">전문가 정보</a></li>
		</ul>
	</li>
	<li>
		<a href="#none">시설 및 자원 신청</a>
		<ul class="depth2">
			<!-- <li class="menu2"><a href="/db/facilityUseList.do">시설 사용신청</a></li> -->
	<li class="menu2"><a href="/db/login.do">시설 사용신청</a></li>
	<!-- <li class="menu2"><a href="/db/resourceUseList.do">자원 사용신청</a></li> -->
			<li class="menu2"><a href="/db/login.do">자원 사용신청</a></li>
		</ul>
	</li>
	<li>
		<a href="#none">원스톱 지원실</a>
		<ul class="depth2">
			<!-- <li><a href="/db/onlineApply.do">온라인 상담신청</a></li> -->
			<li><a href="/db/login.do">온라인 상담신청</a>
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
			<!-- <li><a href="/db/myCompanyInformation.do">내 기업 정보</a></li> -->
	<li><a href="/db/login.do">내 기업 정보</a></li>
	<!-- <li><a href="/db/facilitiesResourcesApplicationStatus.do">시설 사용신청 현황</a></li> -->
	<li><a href="/db/login.do">시설 사용신청 현황</a></li>
	<!-- <li><a href="/db/onlineCounselingStatus.do">온라인 상담신청 현황</a></li> -->
	<li><a href="/db/login.do">온라인 상담신청 현황</a></li>
	</ul>
	</li>
	</ul>
	</nav>
	
	<!-- 로그인 후 -->
	<div class="loginInfo" style="display:none;">
	<a href="#none">회원정보수정</a>
	<span class="bar"></span>
	<a href="#none">로그아웃</a>
	<!-- <span class="bar"></span>
	<button type="button" class="btnSearch01">검색</button> -->
	</div>
	<!-- EOD : 로그인 후 -->
	
	<!-- 로그인 전 -->
	<div class="loginInfo">
		<a href="/db/joinStep01.do">회원가입</a>	

		<a href="/db/login.do">로그인</a>

		<a href="/db/login.do">로그아웃</a>

		<span class="bar"></span>
		<!-- <span class="bar"></span>
	<button type="button" class="btnSearch01">검색</button> -->
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
</div> --%>

