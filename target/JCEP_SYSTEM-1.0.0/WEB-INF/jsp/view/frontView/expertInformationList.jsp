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
<div id="wrap" class="sub s1">
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
				<span>전문가 정보</span>
				<span class="now">전문가 정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">전문가 정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>전문가 정보</h3>
				<div class="continner">
					<div class="publicsch clearfix">
						<div class="ti">전문가 정보 검색하기</div>
						<div class="sel">
							<select style="width: 120px;">
								<option>전체</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" placeholder="검색어를 입력해주세요." style="width: 300px;" />
						</div>
						<button type="button" class="btnSch"></button>
					</div>
					<div class="namelist">
						<div class="col888">총 게시글 : 00,000 건</div>
						<ul>
							<li>
								<div class="textw">
									<p><strong>홍갈동</strong></p>
									<p>소속: 주식회사 케이비시스 ㅣ 전문분야 : 지식정보산업/e-learning업 ㅣ 관심분야: 지식서비스/법률정보</p>
								</div>
								<a href="#none" class="nview">상세보기</a>
							</li>
							<li>
								<div class="textw">
									<p><strong>홍갈동</strong></p>
									<p>소속: 주식회사 케이비시스 ㅣ 전문분야 : 지식정보산업/e-learning업 ㅣ 관심분야: 지식서비스/법률정보</p>
								</div>
								<a href="#none" class="nview">상세보기</a>
							</li>
							<li>
								<div class="textw">
									<p><strong>홍갈동</strong></p>
									<p>소속: 주식회사 케이비시스 ㅣ 전문분야 : 지식정보산업/e-learning업 ㅣ 관심분야: 지식서비스/법률정보</p>
								</div>
								<a href="#none" class="nview">상세보기</a>
							</li>
						</ul>
						<div class="morew">
							<button type="button" class="btnmore">더보기<span></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<div class="layer" style="display: none;" id="expertPop">
	<div class="box boxw600" style="height: 550px; margin-top: -280px;">
		<div class="ti">전문가 정보</div>
		<div class="">
			
			<div class="sti">기본자원</div>
			<table class="table01 namet">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>소속기관</th>
					<td>주식회사 케이비시스</td>
				</tr>
				<tr>
					<th>대표자</th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td>법학연구소</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td><a href="#none">www.xxxx.xx</a></td>
				</tr>
			</table>
			<div class="sti">히스토리</div>
			<table class="table01 namet">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>투자 이력</th>
					<td>
						- 2018 콘텐츠 창작&일자리창출 활성화 공모전 <br />
						- 2018 에너지ICT 콘텐츠기업 사업화 지원<br />
						- 2017 VR콘텐츠 제작 육성기업 지원<br />
						- 2017 E-learning 산업 활성화 지원
					</td>
				</tr>
			</table>
			<div class="submitbtn">
				<button type="button" class="ok closeBtn">확인</button>

			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>
</div>
	<script type="text/javaScript" >
		$(document).ready(function () {
			
			 $(".nview").click(function(){
					$("#expertPop").show();
			 });	
			 
			 $(".closeBtn").click(function(){
					$("#expertPop").hide();
			 });	
		});
        
    </script>
    
	<script type="text/javaScript" >
		$(document).ready(function () {
		});
        
    </script>
</body>
</html>