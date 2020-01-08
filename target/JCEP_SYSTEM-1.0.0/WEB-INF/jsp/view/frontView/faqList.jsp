<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<body>
<div id="wrap" class="sub s4">
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
						<!-- <div class="loginInfo">
							<a href="#none">회원가입</a>
							<span class="bar"></span>
							<a href="#none">로그인</a>
							<span class="bar"></span>
							<button type="button" class="btnSearch01">검색</button>
						</div> -->
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
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>고객광장</span>
				<span class="now">FAQ</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">고객광장 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>FAQ</h3>
				<div class="continner">
					<div class="publicsch clearfix">
						<div class="ti">FAQ 검색하기</div>
						<div>
							<select style="width: 120px;">
								<option>전체</option>
							</select>
						</div>
						<div>
							<input type="text" placeholder="검색어를 입력해주세요." style="width: 300px;" />
						</div>
						<button type="button" class="btnSch"></button>
					</div>
					<div class="datelist">
						<div class="col888">총 게시글 : 00,000 건</div>
						<ul class="faqlist">
							<li>
								<div class="faqq">사업 선정은 어떤 과정을 통해 선발되는 건가요?</div>
								<div class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</div>
							</li>
							<li class="open">
								<div class="faqq">사업 선정은 어떤 과정을 통해 선발되는 건가요?</div>
								<div class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</div>
							</li>
						</ul>
						<div class="paging">
							<a href="" class="pbtn">prev</a>
							<a href="" class="on">1</a>
							<a href="">2</a>
							<a href="">3</a>
							<a href="">4</a>
							<a href="">5</a>
							<a href="">6</a>
							<a href="">7</a>
							<a href="">8</a>
							<a href="">9</a>
							<a href="">10</a>
							<a href="" class="pbtn">next</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javaScript" >
		$(document).ready(function () {
		});
        
    </script>
</body>
</html>