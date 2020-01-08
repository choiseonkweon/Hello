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

<script type="text/javaScript" >
	
	/* var memberId = document.getElementById("memberId1");
	alert("memberId1 :: " + memberId);
	var mememeem = $('#memberId1').val();
	alert("mememeem :: " + mememeem); */
	
	/* $(document).ready(function () {
		var memberId = $('#memberId1').text();
		var tetss = $('#memberId').val();
		alert("memberId2 :: " + memberId);
		alert("tetss2 :: " + tetss);
		
		$("#memberId1").click(function(){
			alert("memberId3 :: " + $('#memberId1').val());
			alert("memberId4 :: " + $('#memberHp1').val());
			if($('#memberId').val(memberId) == ''){
				alert('아이디를 입력하세요.');
				$('#memberId').focus();
				return false;
			}else{
				$.ajax({
					type : 'post',
					url:'/db/joinStep03Detail.do',
					data: {"memberId1" : $('#memberId1').val()},
					//dataType: 'json',
					success : function(data) {
						/* if(data.authList == 0){
		                    alert("수정을 실패 하였습니다.");
		                    return;
		                }else{
		                	//location.href='/db/joinStep03Detail.do';
		                	alert("수정이 완료 되었습니다.");
		                	alert("$('#memberId').val(memberId); :: " + $("#memberId1").val());
		                	alert("memberId555 : " + data.returnCode);
		                	$('#memberId1').val();
		                	location.href='/db/joinStep03Detail.do';
		                	//location.reload();
							return;
		                } */
						/* alert("수정이 완료 되었습니다.");
	                	alert("$('#memberId').val(memberId); :: " + $("#memberId1").val());
	                	alert("memberId555 : " + data.returnCode);
	                	$('#memberId1').val();
	                	location.href='/db/joinStep03Detail12.do';
	                	//location.reload();
						return;
		                
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
				return false;
			}
			 
		}); */
	/*}); */
	
	function moveDetailView(memberIdx){
		$('#memberIdx').val(memberIdx);
		//$('#memberId').val(memberId);
		//$('#memberId1').val(memberId1);
		//alert("memberIdx :: " + memberIdx);
		//alert("memberId :: " + memberId);
		//alert("memberId1 :: " + memberId1);
		$('#memberDetailFrm').attr('action', "/db/joinStep03Detail.do").submit();
	}
	
	// 시설 사용신청 현황 이동
	function moveDetailViewMy(memberIdx){
		$('#memberIdx').val(memberIdx);
		//$('#memberId').val(memberId);
		//$('#memberId1').val(memberId1);
		//alert("memberIdx :: " + memberIdx);
		//alert("memberId :: " + memberId);
		//alert("memberId1 :: " + memberId1);
		$('#memberDetailFrm').attr('action', "/db/facilitiesResourcesApplicationStatus.do").submit();
	}

	// 원스톰 지원실 온라인 상담 신청 이동 
	function onlineMoveDetailView(memberIdx){
		$('#memberIdx').val(memberIdx);
		//$('#memberId').val(memberId);
		//$('#memberId1').val(memberId1);
		//alert("memberIdx :: " + memberIdx);
		//alert("memberId :: " + memberId);
		//alert("memberId1 :: " + memberId1);
		$('#memberDetailFrm').attr('action', "/db/onlineApply.do").submit();
	}
	

	// 마이페이지 온라인 상담신청 현황 이동
	function onlineMoveDetailViewMy(memberIdx){
		$('#memberIdx').val(memberIdx);
		//$('#memberId').val(memberId);
		//$('#memberId1').val(memberId1);
		//alert("memberIdx :: " + memberIdx);
		//alert("memberId :: " + memberId);
		//alert("memberId1 :: " + memberId1);
		$('#memberDetailFrm').attr('action', "/db/onlineCounselingStatus.do").submit();
	}
	
		
	

	function myMoveDetailView(memberIdx){
		$('#memberIdx').val(memberIdx);
		//$('#memberId').val(memberId);
		//$('#memberId1').val(memberId1);
		//alert("memberIdx :: " + memberIdx);
		//alert("memberId :: " + memberId);
		//alert("memberId1 :: " + memberId1);
		$('#memberDetailFrm').attr('action', "/db/myCompanyInformationList.do").submit();
	}
	
	
	
</script>	
	
	
</head>
<body>

<form:form commandName="memberDetailFrm" id="memberDetailFrm" method="post">
   <input type="hidden" id="memberIdx" name="memberIdx" value="">
   <input type="hidden" id="memberId" name="memberId" value="">
   <input type="hidden" id="memberId1" name="memberId1" value="">
   <input type="hidden" id="idCnt" name="idCnt" value="">
</form:form>

<div id="skipnav"><a href="#contents">본문바로가기</a></div>

<div id="wrap">
	<div class="headerWrap">
		<header id="header" class="subheader clearfix">
			<div id="gnbWrapper" class="gnbWrapper">
				<div id="gnbWrap" class="gnbWrap">
					<div class="layout01">
						
						<%-- <jsp:forward page="/db/main.do"></jsp:forward> --%>
						<%
							/* String memberId = request.getParameter("memberId");
							String memeberPw = request.getParameter("memeberPw");
							
							request.setAttribute("memberId", memberId);
							request.setAttribute("memeberPw", memeberPw); */
							
							String memberId = (String)session.getAttribute("memberId");
							String memeberPw = (String)session.getAttribute("memeberPw");
							String memberId1 = (String)session.getAttribute("memberId1");
							String memberIdx = (String)session.getAttribute("memberIdx");
							String idCnt = (String)session.getAttribute("idCnt");
							
							request.setAttribute("memberId", memberId);
							request.setAttribute("memeberPw", memeberPw);
							request.setAttribute("memberId1", memberId1);
							request.setAttribute("memberIdx", memberIdx);
							request.setAttribute("idCnt", idCnt);
							
						%>
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
										<%-- <li><a href="javascript:onlineMoveDetailView('<%=memberId%>');">내 기업 정보</a></li> --%>
										<li><a href="javascript:onlineMoveDetailView('<%=memberId%>');" >온라인 상담신청</a></li>
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
										<li><a href="javascript:moveDetailView('<%=memberId%>');">내 기업 정보</a></li>
										<!-- <li><a href="/db/facilitiesResourcesApplicationStatus.do">시설 사용신청 현황</a></li> -->
										<li><a href="javascript:moveDetailViewMy('<%=memberId%>');">시설 사용신청 현황</a></li>
										<!-- <li><a href="/db/onlineCounselingStatus.do">온라인 상담신청 현황</a></li> -->
										<li><a href="javascript:onlineMoveDetailViewMy('<%=memberId%>');" >온라인 상담신청 현황</a></li>
									</ul>
								</li>
							</ul>
						</nav>
						
						
						<form role="form" id="searchFrm" action="/main2.do" method="post" class="form-horizontal">
						<%-- <c:forEach var="result" items="${resultList}" varStatus="status"> --%>
						<!-- 로그인 후 -->
						<div class="loginInfo">
							<input type="text" id="memberId1" value="<%=memberId%>" style="font-size: 7.5px;" disabled="disabled"><br/>
							<a href="javascript:moveDetailView('<%=memberId%>');" style="font-size: 10px;"> 님 회원정보수정</a>
							<!-- <a href="#" style="font-size: 10px;"> 님 회원정보수정</a> -->
							<span class="bar"></span>
							<a href="/db/main.do">로그아웃</a>
							<!-- <span class="bar"></span>
							<button type="button" class="btnSearch01">검색</button> -->
						</div>
						<!-- EOD : 로그인 후 -->
						<%-- </c:forEach> --%>
						</form>

						<!-- 로그인 전 -->
						<div class="loginInfo" style="display:none;">
							<a href="#none">회원가입</a>
							<span class="bar"></span>
							<a href="/db/login.do">로그인</a>
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
					<!-- <a href="/db/onlineApply.do"> -->
					<a href="javascript:onlineMoveDetailView('${memberId}');" > 
						<span class="ico ico03"></span>
						<span>온라인 상담신청하기</span>
					</a>
				</li>
				<li>
					<a href="javascript:moveDetailView(${memberId});">
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