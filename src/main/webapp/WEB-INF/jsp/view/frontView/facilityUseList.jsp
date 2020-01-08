<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    

<!DOCTYPE html>

<html>
<link rel='stylesheet' type='text/css' href='css/fullcalendar.css' />
<script type='text/javascript' src='js/jqueryjquery.js'></script>
<script type='text/javascript' src='js/jqueryjquery-ui-custom.js'></script>
<script type='text/javascript' src='js/fullcalendar.min.js'></script>

<head>

<style type='text/css'>

	body {
		/* margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; */
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>

	<style>
		.hidden { display: none;  }
		
 	</style>
 	
</head>

	<script type="text/javaScript" >
		$(document).ready(function () {
			 $(".tab > ul li").click(function(){
				   var now_tab = $(this).index();
				   $(this).parent().find("li").removeClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").addClass("hidden");
				   $(this).parent().find("li").eq(now_tab).addClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").eq(now_tab).removeClass("hidden"); 
			 });
			 
			 $("#facilityBtn").click(function(){
					$("#facilityPop").show();
			 });	
			 
			 $(".closeBtn").click(function(){
					$("#facilityPop").hide();
			 });
			 
			 var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				
				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,basicWeek,basicDay'
					},
					editable: true,
					events: [
						{
							title: 'All Day Event',
							start: new Date(y, m, 1)
						},
						{
							title: 'Long Event',
							start: new Date(y, m, d-5),
							end: new Date(y, m, d-2)
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: new Date(y, m, d-3, 16, 0),
							allDay: false
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: new Date(y, m, d+4, 16, 0),
							allDay: false
						},
						{
							title: 'Meeting',
							start: new Date(y, m, d, 10, 30),
							allDay: false
						},
						{
							title: 'Lunch',
							start: new Date(y, m, d, 12, 0),
							end: new Date(y, m, d, 14, 0),
							allDay: false
						},
						{
							title: 'Birthday Party',
							start: new Date(y, m, d+1, 19, 0),
							end: new Date(y, m, d+1, 22, 30),
							allDay: false
						},
						{
							title: 'Click for Google',
							start: new Date(y, m, 28),
							end: new Date(y, m, 29),
							url: 'http://google.com/'
						}
					]
				});
			 
		});
		
		function enterKey(){
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
        }
		 
		function goSearch(){
   			$('#searchFrm').attr('action', "/db/facilityUseList.do").submit();
        }
		
    </script>



 	
<body>
<div id="wrap" class="sub s2">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>시설 및 자원 신청</span>
				<span class="now">시설 사용 신청</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">시설 사용 신청 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>시설 사용 신청</h3>
				<div class="continner">
					<div class="tab">
						<ul class="tab01_3 clearfix">
							<li class="on"><a href="#none">시설정보</a></li>
							<li><a href="#none">시설예약안내</a></li>
							<li><a href="#none">시설예약</a></li>
						</ul>
					</div>
					<div class="tabBtn s2list">
						<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
							<div class="s2sch clearfix">
								<input type="text" name="searchText" id="searchText" value="${searchVO.searchText}" onkeydown="javascript:enterKey();" />
								<button type="button" class="btnsch" onclick="javascript:goSearch();">검색</button>
							</div>
						</form>
						<ul>
							<c:if test="${paginationInfo.totalRecordCount eq 0 }">
								<tr style="text-align:center;">
									<td colspan="6">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${paginationInfo.totalRecordCount ne 0 }">
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<li>
										<div class="img">
											<img src="<c:out value="${result.facilityImg}"/>" width="367" height="277" />
										</div>
										<table class="table01">
											<colgroup>
												<col width="30%" /><col width="*" />
											</colgroup>
											<tr>
												<th>시설명</th>
												<td>
													<c:out value="${result.facilityNm}"/>
												</td>
											</tr>
											<tr>
												<th>위치</th>
												<td>
													<c:out value="${result.facilityLoc}"/>
												</td>
											</tr>
											<tr>
												<th>규모</th>
												<td>
													<c:out value="${result.facilityScale}"/>
												</td>
											</tr>
											<tr>
												<th>비용(1일기준)</th>
												<td>
													<c:out value="${result.facilityCost}"/>
												</td>
											</tr>
											<tr>
												<th>보유장비</th>
												<td>
													<c:out value="${result.facilityEquip}"/>
												</td>
											</tr>
										</table>
									</li>
								</c:forEach>
							</c:if>
						</ul>
						<c:if test="${paginationInfo.totalRecordCount >= 11}">
							<div class="morew">
								<button type="button" class="btnmore">더보기<span></span></button>
							</div>
						</c:if>
					</div>
					<div class="tabInBox tabBtn hidden">
						<div class="request_wrap">
							<p class="point"> ※ 전남콘텐츠기업육성센터 시설관리 지침(다운로드)을 반드시 숙지하여 주시기 바랍니다.</p>
							<span class="line_row"></span>
							<div class="request_list">
								<ul>
									<li>
										<div class="num num01">1</div>
										<dl>
											<dt>예약문의 및 안내</dt>
											<dd>
												<span>- 사용 전 사용 가능 여부 확인</span>
												<span>(전화문의 061-339-6995)</span>
											</dd>
										</dl>
									</li>
									<li>
										<div class="num num02">2</div>
										<dl>
											<dt>사용신청서 제출</dt>
											<dd>
												<span>- 온라인을 통한 사용신청서 제출</span>
												<span>- 제출기한: 사용일 5일 전까지</span>
											</dd>
										</dl>
									</li>
									<li>
										<div class="num num03">3</div>
										<dl>
											<dt>신청서 검토</dt>
											<dd>
												<span>- 사용신청서 검토 후</span>
												<span>사용료 납부 유선안내</span>
											</dd>
										</dl>
									</li>
									<li>
										<div class="num num04">4</div>
										<dl>
											<dt>사용료 납부</dt>
											<dd>
												<span>- 결제방법: 계좌이체</span>
												<span>- 입금계좌</span>
												<span>광주은행 1107-020-650440</span>
												<span>(재)전남정보문화산업진흥원)</span>
												<span>- 납부기한: 사용일 1일 전까지</span>
											</dd>
										</dl>
									</li>
									<li>
										<div class="num num05">5</div>
										<dl>
											<dt>사용승인</dt>
											<dd>
												<span>- 홈페이지 '신청현황'</span>
												<span>확인 및 유선 안내</span>
											</dd>
										</dl>
									</li>
									<li>
										<div class="num num06">6</div>
										<dl>
											<dt>시설 사용 및 행사 진행</dt>
											<dd>
												<span>- 추가 사용료 발생시 별도 정산</span>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div class="board_mb"></div>
							<div class="btn_wrap">
								<a href="/db/download.do" class="btn"><span class="icon icon_down"></span>시설관리 지침</a>
							</div>
						</div>
					</div>
		
					<div class="daylist tabBtn hidden">
					<div id='calendar'>13</div>
						<div class="yearw">
							<button type="button" class="prev">이전</button>
							${year}.${mon}
							<button type="button" class="next">다음</button>
						</div>
						<%-- <div class="dcal">
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
											<p class="num"><a href="#none">${day}</a></p>
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
						</div> --%>
						<div class="morew">
							<button type="button" class="btnlist"  id="facilityBtn">예약하기<span></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

<div class="layer" style="display: none;" id="facilityPop">
	<div class="box boxw600" style="height: 860px; margin-top: -430px;">
		<div class="ti">시설 예약하기</div>
		<div class="">
			<div class="sti">신청인</div>
			<table class="table01">
				<colgroup>
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td>케이비시스</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" style="width: 210px; margin-right: 4px;" />
						<button class="txtbtn" style="width: 120px;">우편번호검색</button>
					</td>
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
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>자원이름</th>
					<td>
						<input type="text" style="width: 100%" />
					</td>
				</tr>
				<tr>
				<tr>
					<th>사용목적</th>
					<td>
						<select style="width: 100%;">
							<option></option>
						</select>
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

        
</body>
</html>