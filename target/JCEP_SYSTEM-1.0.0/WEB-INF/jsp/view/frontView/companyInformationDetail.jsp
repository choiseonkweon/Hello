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
				<span>기업정보</span>
				<span class="now">기업정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">기업정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>기업정보</h3>
				<div class="continner">
					<div class="daylist">
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th colspan="4">주식회사 케이비시스</th>
							</tr><tr>
								<th>홈페이지</th>
								<td>
									www.xxxx.xx.xx
								</td>
								<th>사업분야</th>
								<td>
									모바일콘텐츠
								</td>
							</tr>
							<tr>
								<th>대표전화</th>
								<td>
									02-0000-0000
								</td>
								<th>팩스</th>
								<td>
									02-0000-0000
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									서울특별시 구로구 디지털로 288 0000호
								</td>
							</tr>
						</table>
						<h4>기업 세부정보</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>매출액</th>
								<td>
									00,000만원
								</td>
								<th>자본금</th>
								<td>
									00,000만원
								</td>
							</tr>
							<tr>
								<th>직원수</th>
								<td>
									000명
								</td>
								<th>성립일</th>
								<td>
									2019-07-04
								</td>
							</tr>
							<tr>
								<th>비고</th>
								<td colspan="3">
									회사소개.pdf
								</td>
							</tr>
						</table>
						<ul class="listpn">
							<li>
								<strong>이전글</strong>
								<span>이전글이 존재하지 않습니다.</span>
							</li>
							<li>
								<strong>다음글</strong>
								<a href="#none">다음글이 입니다.</a>
							</li>
						</ul>
						<div class="morew">
							<a href="/db/companyInformationList.do">
								<button type="button" class="btnlist">목록<span></span></button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="layer" style="display: none;" id="busPop">
	<div class="box boxw600" style="height: 650px; margin-top: -325px;">
		<div class="ti">사업 신청하기</div>
		<div class="">
			<div class="sti">기업정보</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td>케이비시스</td>
				</tr>
				<tr>
					<th>담당자성명</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select style="width: 95px;">
							<option></option>
						</select>
						<em>-</em>
						<input type="text" style="width: 100px;" />
						<em>-</em>
						<input type="text" style="width: 100px;" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" style="width: 120px;" />
						<em>@</em>
						<select style="width: 195px">
							<option></option>
						</select>
					</td>
				</tr>
			</table>
			<div class="sti">사용자원</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>회사소개서</th>
					<td>
						<input type="file" style="width: 100%" />
					</td>
				</tr>
				<tr>
					<th>제안서</th>
					<td>
						<input type="file" style="width: 100%" />
					</td>
				</tr>
			</table>
			<div class="submitbtn">
				<a href="#" onclick="javascript:alert('준비중 입니다.');">
					<button type="button" class="ok">신청하기</button>
				</a>
				<a href="/db/businessDetail.do">
					<button type="button">취소</button>	
				</a>

			</div>
			<a href="/db/businessDetail.do">
				<button type="button" class="btn_close">X</button>
			</a>
		</div>
	</div>
</div> 

	<script type="text/javaScript" >
		$(document).ready(function () {
			$("#busApplyBtn").click(function(){
				$("#busPop").show();
			});			
		});
    </script>
</body>
</html>