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
	<style>
		.hidden { display: none;  }
 	</style>
</head>
<body>
<div id="wrap" class="sub s2">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>시설 및 자원 신청</span>
				<span class="now">자원 사용 신청</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">자원 사용 신청 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>자원 사용 신청</h3>
				<div class="continner">
					<div class="tab">
						<ul class="tab01_2 clearfix">
							<li class="on"><a href="#none">자원정보</a></li>
							<li><a href="#none">자원예약</a></li>
						</ul>
					</div>
					<div class="s2list tabBtn">
						<div class="s2sch clearfix">
							<input type="text" />
							<button type="button" class="btnsch">검색</button>
						</div>
						<ul>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<li>
									<div class="img">
										<img src="<c:out value="${result.resourceImg}"/>" width="367" height="245"/>
									</div>
									<table class="table01">
										<colgroup>
											<col width="30%" /><col width="*" />
										</colgroup>
										<tr>
											<th>장비명</th>
											<td>
												<c:out value="${result.resourceNm}"/>  
											</td>
										</tr>
										<tr>
											<th>비용(1일기준)</th>
											<td>
												1일 8시간 이내 90,000 / 1일 4시간 이내 50,000
											</td>
										</tr>
										<tr>
											<th>구성</th>
											<td>
												빔 프로젝터,
											</td>
										</tr>
									</table>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="daylist tabBtn hidden">
						<div class="yearw">
							<button type="button" class="prev">이전</button>
							2019.08
							<button type="button" class="next">다음</button>
						</div>
						<div class="dcal">
							<table class="table01">
								<tr>
									<th>일요일</th>
									<th>월요일</th>
									<th>화요일</th>
									<th>수요일</th>
									<th>목요일</th>
									<th>금요일</th>
									<th>토요일</th>
								</tr>
								<tr>
									<td>
										<div>
											<p class="num"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num in"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
									<td>
										<div>
											<p class="num on"><a href="#none">1</a></p>
											<ul class="reg">
												<li><a href="#none">지능형 </a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
												<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
											</ul>
											<p class="num2"><a href="#none">+1</a></p>
										</div>
									</td>
								</tr>
							</table>
							<div class="mreg">
								<ul class="reg">
									<li><a href="#none">지능형 </a></li>
									<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
									<li><a href="#none">지능형 드론 융복합 SW교육 전문강사 양 진흥원 회의 진행</a></li>
								</ul>
							</div>
						</div>
						<div class="morew">
							<button type="button" class="btnlist" id="resourceBtn">예약하기<span></span></button>
						</div>
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

	<script type="text/javaScript" >
		$(document).ready(function () {
			 $(".tab > ul li").click(function(){
				   var now_tab = $(this).index();
				   $(this).parent().find("li").removeClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").addClass("hidden");
				   $(this).parent().find("li").eq(now_tab).addClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").eq(now_tab).removeClass("hidden"); 
			 });
			 
			 $("#resourceBtn").click(function(){
					$("#resourcePop").show();
			 });	
			 
			 $(".closeBtn").click(function(){
					$("#resourcePop").hide();
			 });	
			 
		});
		
    </script>
        
    </script>
</body>
</html>