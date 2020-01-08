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
				<span>사업공고</span>
				<span class="now">사업공고</span>
			</div>
		</div>
		<div class="layout01">
			<div class="cont">
				<h3>사업공고</h3>
				<div class="continner">
					<div class="publicsch clearfix">
						<div class="ti">사업공고 검색하기</div>
						<div class="cal">
							<input type="text" value="2019-06-24" />
							<button type="button">달력보기</button>
						</div>
						<div class="cal">
							<input type="text" value="2019-06-24" />
							<button type="button">달력보기</button>
						</div>
						<div>
							<select style="width: 120px;">
								<option>전체</option>
							</select>
						</div>
						<div>
							<input type="text" placeholder="검색어를 입력해주세요." />
						</div>
						<button type="button" class="btnSch"></button>
					</div>
					<div class="daylist">
						<div class="yearw">
							<button type="button" class="prev">이전</button>
							2019
							<button type="button" class="next">다음</button>
						</div>
						<div class="monthw">
							<a href="#none">1</a>
							<a href="#none">2</a>
							<a href="#none">3</a>
							<a href="#none">4</a>
							<a href="#none">5</a>
							<a href="#none">6</a>
							<a href="#none">7</a>
							<a href="#none" class="on">8</a>
							<a href="#none">9</a>
							<a href="#none">10</a>
							<a href="#none">11</a>
							<a href="#none">12</a>
						</div>
						<div class="dlist">
							<div class="col888">총 게시글 : 00,000 건</div>
							<ul>
								<li class="ing">
									<div class="mon">
										<strong>08</strong>
										2019
									</div>
									<div class="textw">
										<p class="txt1">공고번호 2019-06-24</p>
										<p class="txt2">
											<a href="/db/businessDetail.do">ICT Standard Insight[ISI] 에너지 IoT/나주 개최 </a>
										</p>
										<p class="txt3">2019-06-24~2019-06-24</p>
									</div>
									<div class="state state1">진행중</div>
								</li>
								<li>
									<div class="mon">
										<strong>08</strong>
										2019
									</div>
									<div class="textw">
										<p class="txt1">공고번호 2019-06-24</p>
										<p class="txt2">
											<a href="/db/businessDetail.do">ICT Standard Insight[ISI] 에너지 IoT/나주 개최 </a>
										</p>
										<p class="txt3">2019-06-24~2019-06-24</p>
									</div>
									<div class="state state2">진행예정</div>
								</li>
								<li>
									<div class="mon">
										<strong>08</strong>
										2019
									</div>
									<div class="textw">
										<p class="txt1">공고번호 2019-06-24</p>
										<p class="txt2">
											<a href="/db/businessDetail.do">ICT Standard Insight[ISI] 에너지 IoT/나주 개최 </a>
										</p>
										<p class="txt3">2019-06-24~2019-06-24</p>
									</div>
									<div class="state state3">진행완료</div>
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
	</div>
	<script type="text/javaScript" >
		$(document).ready(function () {
		});
        
    </script>
</body>
</html>