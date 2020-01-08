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
	<title>전남콘텐츠기업육성센터</title>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../assets/css/reset.css">
	<link rel="stylesheet" href="../assets/css/common.css">
	<link rel="stylesheet" href="../assets/css/main.css">
	<link rel="stylesheet" href="../assets/css/sub01.css">
	<script type="text/javascript" src="../assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../assets/js/ui.js"></script>
</head>
<body>
	<div id="skipnav"><a href="#contents">본문바로가기</a></div>

<div id="wrap">
	<div class="headerWrap">
		<header id="header" class="subheader clearfix">
			<div id="gnbWrapper" class="gnbWrapper">
				<div id="gnbWrap" class="gnbWrap">
					<div class="layout01">
						<h1><a href="/mngNew/front/main.do"><img src="../css/img/logo.png" alt="jcap 전남콘텐츠기업육성센터"></a></h1>

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
										<li><a href="/mngNew/front/businessList.do">사업공고</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">시설 및 자원 신청</a>
									<ul class="depth2">
										<li class="menu2"><a href="/mngNew/front/facilityUseList.do">시설 사용신청</a></li>
										<li class="menu2"><a href="#none" onclick="javascript:alert('준비중 입니다.');">자원 사용신청</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">원스톱 지원실</a>
									<ul class="depth2">
										<li><a href="/mngNew/front/onlineApply.do">온라인 상담신청</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">고객광장</a>
									<ul class="depth2">
										<li><a href="/mngNew/front/noticeList.do">공지사항</a></li>
										<li><a href="/mngNew/front/faqList.do">FAQ</a></li>
										<li><a href="#none" onclick="javascript:alert('준비중 입니다.');">문의하기</a></li>
									</ul>
								</li>
								<li>
									<a href="#none">마이페이지</a>
									<ul class="depth2">
										<li><a href="#none" onclick="javascript:alert('준비중 입니다.');">시설 사용신청 현황</a></li>
										<li><a href="/mngNew/front/onlineCounselingStatus.do">온라인 상담신청 현황</a></li>
										<li><a href="/mngNew/front/myCompanyInformation.do">내 기업 정보</a></li>
										<li><a href="#none" onclick="javascript:alert('준비중 입니다.');">전문가 정보</a></li>
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
							<a href="#none">로그인</a>
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



	<div id="contents">
		<div class="layout01">
			<ul class="mainList01 clearfix">
				<li>
					<a href="/mngNew/front/facilityUseList.do">
						<span class="ico ico01"></span>
						<span>시설 사용신청하기</span>
					</a>
				</li>
				<li>
					<a href="#none" onclick="javascript:alert('준비중 입니다.');">
						<span class="ico ico02"></span>
						<span>자원 사용신청하기</span>
					</a>
				</li>
				<li>
					<a href="/mngNew/front/onlineApply.do">
						<span class="ico ico03"></span>
						<span>온라인 상담신청하기</span>
					</a>
				</li>
				<li>
					<a href="/mngNew/front/myCompanyInformation.do">
						<span class="ico ico04"></span>
						<span>내 기업 관리</span>
					</a>
				</li>
			</ul>


			<div class="mainNotice">
				<h2>사업공고</h2>

				<ol class="mainNoticeList clearfix">
					<li>
						<a href="#none">
							<span class="subject">2019년 전남 SW교육 UCC 공모전 시작합니다. 다음세대를 이어갈 2019년도</span>
							<p>
								<!--
									class Name : status1	진행중
									class Name : status2	진행예정
									class Name : status3	진행종료
								-->
								<span class="tagStatus status1">진행중</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
					<li>
						<a href="#none">
							<span class="subject">[전남글로벌게임센터]시장진출 게임 제작지원, 현재 대한민국 게임산업을 이끌어갈</span>
							<p>
								<span class="tagStatus status2">진행예정</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
					<li>
						<a href="#none">
							<span class="subject">2019년 수요창출형 SW융합 R&D 지원사업, 중소기업의 수요창출을 위한 대국민</span>
							<p>
								<span class="tagStatus status2">진행예정</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
					<li>
						<a href="#none">
							<span class="subject">해외시장 공동개척단 참가기업 추가 모집</span>
							<p>
								<span class="tagStatus status1">진행중</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
					<li>
						<a href="#none">
							<span class="subject">저작권 서비스 지원 공고</span>
							<p>
								<span class="tagStatus status3">진행종료</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
					<li>
						<a href="#none">
							<span class="subject">[전남글로벌게임센터] 게임 제작지원 사업</span>
							<p>
								<span class="tagStatus status2">진행예정</span>
								<time datetime="2019-05-01 00:00">2019-05-01</time> ~ <time datetime="2019-06-01 00:00">2019.06-01</time>
							</p>
						</a>
					</li>
				</ol>

				<a href="/mngNew/front/businessList.do" class="btnMore" title="사업공고">더보기</a>
			</div>
			<!-- EOD : mainNotice -->
		</div>
		<!-- EOD : layout01 -->
	</div>
	<!-- EOD : contents -->

	<footer>
			<div class="inner01">
				<div class="layout01">
					<ul class="clearfix">
						<li><a href="#none">개인정보취급방침</a></li>
						<li><a href="#none">이메일무단수집거부</a></li>
						<li><a href="#none">찾아오시는 길</a></li>
					</ul>

					<a href="#none" role="button" class="familySite" title="레이어팝업 열기">관련기관 웹사이트</a>
				</div>

			</div>
			<!-- EOD : inner01 -->

			<div class="inner02 layout01 clearfix">
				<div class="footerLogo">jcap 전남콘텐츠기업육성센터</div>
				<div class="contactUs">
					<address>
						<span>주소:전라남도 나주시 우정로 10 전남콘텐츠기업육성센터 (우)58322 <span class="bar">|</span> 구주소:빛가람동 186-1</span>
						<span>전화번호 : 061-339-6994 <span class="bar">|</span> 팩스 : 061-336-7079</span>
						<span>Jeonnam Content Enterprise Promotion Center(JCEP) 10, Ujeong-ro, Naji-si, Jeollanam-do, KOREA, 58322</span>
					</address>

					<p>Copyright JCEP. All Rights Reserved. </p>
				</div>
				<!-- EOD : details -->
			</div>
			<!-- EOD : inner02 -->
	</footer>
</div>
<!-- EOD : wrap -->
</body>
</html>