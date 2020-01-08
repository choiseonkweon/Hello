<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<link rel='stylesheet' type='text/css' href='css/reset.css' />
<link rel='stylesheet' type='text/css' href='css/common.css' />
<link rel='stylesheet' type='text/css' href='css/sub.css' />
<script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../db/assets/js/ui.js"></script>


<head>


<script type="text/javaScript" >
	$(document).ready(function () {
	//$('#loginLogin').click(function () {	
		
		/*  $(".tab > ul li").click(function(){
			   var now_tab = $(this).index();
			   $(this).parent().find("li").removeClass("on");
			   $(this).parent().parent().parent().find(".tabBtn").addClass("hidden");
			   $(this).parent().find("li").eq(now_tab).addClass("on");
			   $(this).parent().parent().parent().find(".tabBtn").eq(now_tab).removeClass("hidden"); 
		 }); */
		 
		 $("#resourceBtn").click(function(){
				$("#resourcePop").show();
		 });	
		 
		 $(".closeBtn").click(function(){
				$("#resourcePop").hide();
		 });	
		 
		 $("#enterprise").click(function(){
			 window.location.href="/db/joinStep021.do";
		 });
		 $("#expert").click(function(){
			 window.location.href="/db/joinStep02.do";
		 });
		 $("#buyer").click(function(){
			 window.location.href="/db/joinStep022.do";
		 });
		 
		 
		 
		
		$("#loginLogin").click(function() {
			if($.trim($('#memberId').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$('#memberId').focus();
				return;
			}else if($.trim($('#memberPw').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#memberPw').focus();
				return;
			}else{
				var memberId = $('#memberId').val();
				var memberPw = $('#memberPw').val();
				
				//confirm("memberId :: " + memberId);
				//confirm("memberPw :: " + memberPw); 
				
				$.ajax({
					type : 'post',
					url:'/db/frontView/loginCheck.do',
					data: {
						//memberId : memberId,
						memberId : $('#memberId').val(),
						memberPw : memberPw,
					},
					dataType: 'json',
					success : function(data) {
						if(data.idCnt == 0){
							alert("아이디 패스워드를 확인하세요.");
						}else{
							alert("로그인 합니다.");
							fn_login();
							return false;
						}
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		}
				});
			}
			
			//전송
			$('#loginFrm').submit();
			
		});
	});
	
	function fn_login(){
		window.location.href="/db/main2.do";
	}
	
	
</script>
        
	<style>
		.hidden { display: none;  }
 	</style>
</head>
<body>
<input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
<input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
<input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
<div id="wrap" class="sub s4">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span class="now">회원가입</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">회원가입 - 더 새로워진 전남콘테츠기업육성센터 홈페이지를 만나보세요!</h2>
			<div class="cont">
				<h3>회원가입</h3>
				<div class="continner">
					<div class="tab">
						<ul class="tab01_4 clearfix">
							<li class="on"><a href="/db/joinStep01.do">가입유형</a></li>
							<li><a href="#">약관동의</a></li>
							<li><a href="#">정보입력</a></li>
							<li><a href="#">가입완료</a></li>
						</ul>
					</div>
					<p class="commatitle">환영합니다! 전남콘텐츠기업육성센터<br class="mo"> ID를 만든 후<br>다양한 서비스를 만나 보세요.</p>
					<div class="join_menu">
						<p>다음 중 어디에 해당되는지 선택해 주시기 바랍니다.</p>
						<ul>
							<li>
								<div class="join_box">
									<img src="css/img/icon_join_menu01.png" alt="">
									<strong>기업회원</strong>
									<button type="button" id="enterprise">회원 가입하기</button>
								</div>
							</li>
							<li>
								<div class="join_box">
									<img src="css/img/icon_join_menu02.png" alt="">
									<strong>전문가회원</strong>
									<button type="button" id="expert">회원 가입하기</button>
								</div>
							</li>
							<li>
								<div class="join_box">
									<img src="css/img/icon_join_menu03.png" alt="">
									<strong>바이어회원</strong>
									<button type="button" id="buyer">회원 가입하기</button>
								</div>
							</li>
						</ul>
						<div class="morew">
							<button type="button" class="joinbtn mo">회원가입하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

<div class="layer" style="display: none;" id="resourcePop">
	<div class="box boxw600" style="height: 860px; margin-top: -430px;">
		<div class="ti">자원 예약하기</div>
		<div class="">
			<div class="sti">신청인</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관명)</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" style="width: 210px; margin-right: 4px;" />
						<button class="txtbtn" style="width: 120px;">우편번호검색</button>
					</td>
				</tr>
				<tr>
					<th>성명</th>
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
				<tr>
					<th>인원수</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
			</table>
			<div class="sti">사용자원</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>자원이름</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>사용목적</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>사용시간</th>
					<td>
						<div class="set">
							<input type="text" style="width: 210px; margin-right: 4px;" />
							<select style="width: 120px;">
								<option></option>
							</select>
						</div>
						<div class="set">
							<input type="text" style="width: 210px; margin-right: 4px;" />
							<select style="width: 120px;">
								<option></option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">신청하기</button>
				<button type="button" class="closeBtn">취소</button>

			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>
</div>
</div>
</body>
</html>