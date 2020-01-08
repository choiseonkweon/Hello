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
<div id="wrap" class="sub s3">
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
				<span>원스톱 지원실</span>
				<span class="now">원스톱 지원실
				</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">원스톱 지원실 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>온라인 지원 신청하기</h3>
				<div class="continner">
					<div class="daylist">
						<h4>회사개요</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>업체(기관)명</th>
								<td>
									업체(기관)명
								</td>
								<th>대표자 명</th>
								<td>
									대표자
								</td>
							</tr>
							<tr>
								<th>사업분야</th>
								<td colspan="3">
									<div class="chkwrap">
									<label><input type="checkbox"  /> ICT</label>
									<label><input type="checkbox"  /> 콘텐츠</label>
									<label><input type="checkbox"  /> 1인창조</label>
									<label>
										<input type="checkbox"  /> 기타 &nbsp;
										<input type="text" style="width: 250px;" />
									</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>대표전화</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
								<th>종업원수</th>
								<td>
									<input type="text" style="width: 100%;" /> 
								</td>
							</tr>
						</table>
						<h4>신청인 정보</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>신청인 성명</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
								<th>직위</th>
								<td>
									<input type="text" style="width: 100%;" /> 
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
								<th>팩스번호</th>
								<td>
									<input type="text" style="width: 100%;" /> 
								</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
								<th>이메일</th>
								<td>
									<input type="text" style="width: 100%;" /> 
								</td>
							</tr>
						</table>
						<h4>자문, 신청내용</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>희망일자</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>희망장소</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>자문 신청분야</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>자문 신청내용</th>
								<td>
									<textarea style="width: 100%; height: 80px;"></textarea>
								</td>
							</tr>
							<tr>
								<th>사업자등록증</th>
								<td>
									<input type="file" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>참고자료</th>
								<td>
									<input type="file" style="width: 100%;" />
								</td>
							</tr>
						</table>
						<div class="text1">
							<label class="">
								<input type="checkbox" /> 전남콘텐츠 기업육성센터 원스톱 지원실 자문·컨설팅 이용을 위해 개인정보 활용에 대해 동의합니다.
							</label>
						</div>
						<div class="submitbtn">
							<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">신청하기</button>
							<button type="button" onclick="javascript:alert('준비중 입니다.');">취소</button>
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