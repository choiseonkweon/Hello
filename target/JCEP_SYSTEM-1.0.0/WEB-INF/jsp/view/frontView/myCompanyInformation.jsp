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
				<span class="now">내 기업 정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">마이페이지 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>내 기업 정보</h3>
				<div class="continner">
					<div class="daylist">
						<h4>기본정보</h4>
						<table class="table01">
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
							</colgroup>
							<tr>
								<th>업체(기관)명</th>
								<td>
									업체(기관)명
								</td>
								<th>홈페이지</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>사업자등록번호</th>
								<td>
									000-0000-00
								</td>
								<th>사업분야</th>
								<td>
									공기청정기
								</td>
							</tr>
							<tr>
								<th>대표자</th>
								<td>
									조여정
								</td>
								<th>대표자이메일</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>본사주소</th>
								<td colspan="3">
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>본사 대표전화</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>지사주소</th>
								<td colspan="3">
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<th>지사 대표전화</th>
								<td colspan="3">
									<input type="text" style="width: 380px;" />
								</td>
							</tr>
							<tr>
								<th>설립일</th>
								<td>
									2019-06-25
								</td>
								<th>자본금</th>
								<td>
									<input type="text" style="width: 100%;" />
								</td>
							</tr>
						</table>
						<h4 class="clearfix">
							성과관리
							<button type="button" class="txtbtn floatR" id="resultBtn">추가</button>
						</h4>
						<table class="table01 datetable">
							<colgroup>
								<col width="*" /><col width="20%" /><col width="20%" /><col width="20%" /><col width="20%" />
							</colgroup>
							<tr>
								<th>수행연도</th>
								<th>분기</th>
								<th>자본금</th>
								<th>매출액</th>
								<th>지원수</th>
							</tr>
							<tr>
								<td>0000년</td>
								<td>1분기</td>
								<td>000</td>
								<td>000</td>
								<td>000</td>
							</tr>
						</table>
						<h4 class="clearfix">
							사업 진행 현황
							<button type="button" class="txtbtn floatR" id="businessBtn">추가</button>
						</h4>
						<!-- pc 테이블 -->
						<table class="table01 datetable pct">
							<colgroup>
								<col width="15%" /><col width="*" /><col width="15%" /><col width="15%" /><col width="15%" /><col width="15%" />
							</colgroup>
							<tr>
								<th>NO</th>
								<th>사업명</th>
								<th>사업내용</th>
								<th>사업기간</th>
								<th>사업비</th>
								<th>진행상태</th>
							</tr>
							<tr>
								<td>000</td>
								<td>수요맞춤형 마케팅 지원사업</td>
								<td>마케팅 지원사업 검토</td>
								<td>미검수</td>
								<td>000만원</td>
								<td>승인</td>
							</tr>
						</table>
						<!-- 모바일 테이블
						<div class="mobileta">
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th>사업명</th>
									<td>수요맞춤형 마케팅 지원사업</td>
								</tr>
								<tr>
									<th>사업내용</th>
									<td>마케팅 지원사업 검토</td>
								</tr>
								<tr>
									<th>사업기간</th>
									<td>미검수</td>
								</tr>
								<tr>
									<th>사업비</th>
									<td>000만원</td>
								</tr>
								<tr>
									<th>진행상태</th>
									<td>승인</td>
								</tr>
							</table>
						</div> -->

						<h4>직원정보</h4>
						<table class="table01 datetable pct">
							<colgroup>
								<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="*" /><col width="10%" /><col width="10%" />
							</colgroup>
							<tr>
								<th>NO</th>
								<th>성명</th>
								<th>부서</th>
								<th>직책</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>연락처</th>
								<th></th>
							</tr>
							<tr>
								<td>000</td>
								<td>지원사</td>
								<td>부서</td>
								<td>직책</td>
								<td>adfasdf</td>
								<td>asdfasdf@asdfasdf.ccc</td>
								<td>010-0000-0000</td>
								<td><button type="button" class="txtbtn">삭제</button></td>
							</tr>
						</table>
						<!-- 모바일 테이블 
						<div class="mobileta">
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th>성명</th>
									<td>지원사</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>부서</td>
								</tr>
								<tr>
									<th>직책</th>
									<td>직책</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>아이디</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>이메일</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>승인연락처</td>
								</tr>
								<tr>
									<th></th>
									<td><button type="button" class="txtbtn">삭제</button></td>
								</tr>
							</table>
						</div>-->
						<div class="text1">
							<label class="">
								<input type="checkbox" /> 전남콘텐츠 기업육성센터 원스톱 지원실 자문·컨설팅 이용을 위해 개인정보 활용에 대해 동의합니다.
							</label>
						</div>
						<div class="submitbtn">
							<a href="#" onclick="javascript:alert('준비중 입니다.');">
								<button type="button" class="ok">목록</button>
							</a>
							<a href="#" onclick="javascript:alert('준비중 입니다.');">
								<button type="button">저장하기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 기업성과 추가하기 -->
<div class="layer" style="display: none;" id="resultPop">
	<div class="box boxw600" style="height: 490px; margin-top: -245px;">
		<div class="ti">기업 성과 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
		</div>
			<button type="button" class="btn_close closeBtn">X</button>
	</div>
</div>

<!-- 사업 수주 현황 추가하기 -->
<div class="layer" style="display: none;" id="businessPop">
	<div class="box boxw600" style="height: 380px; margin-top: -190px;">
		<div class="ti">사업 수주 현황 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>사업명</th>
					<td>
						<input type="text" style="width: 255px;" />
						<button type="button" class="txtbtn">사업검색</button>
					</td>
				</tr>
				<tr>
					<th>사업기간</th>
					<td>
						2019-06-25 ~ 2019-06-25
					</td>
				</tr>
				<tr>
					<th>사업비용</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">저장하기</button>
				<button type="button" class="closeBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn2">X</button>
		</div>
	</div>
</div>
	<script type="text/javaScript" >
		$(document).ready(function () {
			$("#resultBtn").click(function(){
				$("#resultPop").show();
		 	});	
			
			$("#businessBtn").click(function(){
				$("#businessPop").show();
		 	});	
			
			$(".closeBtn").click(function(){
				$("#resultPop").hide();
		 	});
			
			$(".closeBtn2").click(function(){
				$("#businessPop").hide();
		 	});	
		});
        
    </script>
</body>
</html>