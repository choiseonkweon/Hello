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
<div id="wrap" class="sub s5">
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
				<span>마이페이지</span>
				<span class="now">시설 및 자원 사용신청현황</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">시설 및 자원 사용신청현황 - 전전남콘텐츠기업육성센터의 시설 및 자원 사용신청 내용을 확인할 수 있습니다.</h2>
			<div class="cont">
				<h3>시설 및 자원 사용신청현황</h3>
				<div class="continner">
					<div class="datelist">
						<div class="clearfix col888">
							총 게시글 : 00,000 건
							<select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select>
						</div>
						<table class="table01 datetable">
							<colgroup>
								<col width="80px" class="mdel" /><col width="13%" /><col width="*" /><col width="13%" /><col width="13%" /><col width="13%" /><col width="13%" />
							</colgroup>
							<tr>
								<th class="mdel">NO</th>
								<th>시설명</th>
								<th>예약일</th>
								<th>냉난방기</th>
								<th>빔프로젝트</th>
								<th>신청일</th>
								<th>상태</th>
							</tr>
							<tr>
								<td class="mdel">
									000
								</td>
								<td>
									지식나눔터
								</td>
								<td>
									2019-07-05 00시 - 2019-07-05 00시
								</td>
								<td>
									사용
								</td>
								<td>
									사용
								</td>
								<td>
									2019-07-05
								</td>
								<td>
									대기
								</td>
							</tr>
						</table>
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