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
	<jsp:include page="../view/frontView/menu.jsp"></jsp:include>
<%-- <a>세션값 확인하기${memberId}</a> --%>

	<div id="contents">
		<div class="layout01">
			<ul class="mainList01 clearfix">
				<li>
					<a href="/db/facilityUseList.do">
						<span class="ico ico01"></span>
						<span>시설 사용신청하기</span>
					</a>
				</li>
				<li>
					<a href="/db/resourceUseList.do" >
						<span class="ico ico02"></span>
						<span>자원 사용신청하기</span>
					</a>
				</li>
				<li>
					<a href="/db/onlineApply.do">
						<span class="ico ico03"></span>
						<span>온라인 상담신청하기</span>
					</a>
				</li>
				<li>
					<a href="/db/myCompanyInformation.do">
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

				<a href="/db/businessList.do" class="btnMore" title="사업공고">더보기</a>
			</div>
			<!-- EOD : mainNotice -->
		</div>
		<!-- EOD : layout01 -->
	</div>
	<!-- EOD : contents -->

</div>
<!-- EOD : wrap -->
</body>
</html>