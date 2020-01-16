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
			// calendar 호출
			setReservMonth(new Date(),'F'); // F: 시설 , R : 자원
			
			$("#postBtn").click(function(){
				openDaumPostcode();
			});
			
			 $(".tab > ul li").click(function(){
				   var now_tab = $(this).index();
				   $(this).parent().find("li").removeClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").addClass("hidden");
				   $(this).parent().find("li").eq(now_tab).addClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").eq(now_tab).removeClass("hidden"); 
			 });
			 
			 $("#facilityBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/db/front/facilityUseList2.do',
						dataType: 'json',
						success : function(data) {
							var rData = data.resultList;
							var rDataLength = rData.length;
							for(var i=0;i < rDataLength;i++){
								document.insertFrm.facilityNm.options[i+1] = new Option(rData[i].facilityNm,rData[i].facilityId);
							}
							resetResrv();
							$("#facilityPop").show();
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 });				 
				 
				 
			 });	
			 
			 $(".closeBtn").click(function(){
					$("#facilityPop").hide();
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
		
		function facilityApplSave(){
			if(checkValue()){
				 $.ajax({
						type : 'post',
						url:'/db/front/resourFacilityApplInsert.do',
						data: $('#insertFrm').serialize(),
						dataType: 'json',
						success : function(data) {
		                		alert("등록이 완료 되었습니다.");
		                		location.reload();
								return false;
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 });				
				
			}
			
		}
		
		function checkValue(){
			var retValue = true;
			
			if($('#compNm').val() == ""){
				alert("업체(기관)명을 입력하세요.");
				$('#compNm').focus();
				return;
			}
			
			if($('#compAddr1').val() == ""){
				alert("주소를 입력하세요.");
				openDaumPostcode();
				return;
			}
			
			if($('#compAddr2').val() == ""){
				alert("상세주소를 입력하세요.");
				$('#compAddr2').focus();
				return;
			}
			
			if($('#compApplNm').val() == ""){
				alert("담당자성명을 입력하세요.");
				$('#compApplNm').focus();
				return;
			}			

			if($('#compTelNo').val() == ""){
				alert("연락처를 입력하세요.");
				$('#compTelNo').focus();
				return;
			}	
			
			if($('#compMail1').val() == ""){
				alert("이메일 아이디를 입력하세요.");
				$('#compMail1').focus();
				return;
			}			
			
			if($('#compMail2').val() == ""){
				alert("이메일 도메인을 입력하세요.");
				$('#compMail2').focus();
				return;
			}		
			
			if($('#usePersNum').val() == ""){
				alert("인원수를 입력하세요.");
				$('#usePersNum').focus();
				return;
			}	
			
			if($('#facilityNm').val() == ""){
				alert("시설명을 입력하세요.");
				$('#facilityNm').focus();
				return;
			}				
			if($('#useObj').val() == ""){
				alert("사용목적을 입력하세요.");
				$('#useObj').focus();
				return;
			}	
			
			if($('#useFrDt').val() == ""){
				alert("사용시작일을 입력하세요.");
				$('#useFrDt').focus();
				return;
			}	
			
			if($('#useFrTm').val() == ""){
				alert("사용시작시간을 입력하세요.");
				$('#useFrTm').focus();
				return;
			}			
			
			if($('#useToDt').val() == ""){
				alert("사용종료일을 입력하세요.");
				$('#useToDt').focus();
				return;
			}		
			
			if($('#useToTm').val() == ""){
				alert("사용종료시간을 입력하세요.");
				$('#useToTm').focus();
				return;
			}				
			
			return retValue;
		}
		

	  	function changeEmail() {
	  		var obj = $('#emailSelect').find('option:selected');
	  		
	  		if(obj.val() == '') {
	  			//nothing
	  		} else if(obj.val() == 'M') {
	  			$('#compMail2').val('');
	  		} else {
		  		$('#compMail2').val(obj.text());
	  		}
	  	}	
	  	
	  	function resetResrv(){
	  		$("#insertFrm input").val('');
	  		
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
						<div class="yearw">
							<button type="button" class="prev" onclick="changeReservMonth(-1)">이전</button>
							<span class="current" id="reservMonth">2019.08</span>
							<button type="button" class="next" onclick="changeReservMonth(1)">다음</button>
						</div>
						
					<div class="dcal">
							<table class="table01 week">
							<thead>
									<tr>
										<th>일요일</th>
										<th>월요일</th>
										<th>화요일</th>
										<th>수요일</th>
										<th>목요일</th>
										<th>금요일</th>
										<th>토요일</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>		


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
			<form id="insertFrm" name="insertFrm" action="#" method="POST">
			<input type="hidden" id="resourFaciDiviCd" name="resourFaciDiviCd" value="F"/>
			<table class="table01">
				<colgroup>
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td><input type="text" id="compNm" name="compNm" style="width: 100%;" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input class="extraRoadAddr" id="compAddr1" name="compAddr1"  readonly="readonly" onclick="javascript:openDaumPostcode()" value="" type="text" style="width: 275px; margin-right: 4px;" />
						<button class="txtbtn" id="postBtn" style="width: 100px;">우편번호검색</button>
						<input type="text" id="compAddr2" name="compAddr2" style="width: 275px;  margin-right: 4px;" />
					</td>
				</tr>
				<tr>
					<th>담당자성명</th>
					<td>
						<input type="text" id="compApplNm" name="compApplNm" value="" style="width: 150px;" />
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" id="compTelNo" name="compTelNo" value="" style="width: 150px;" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="compMail1" name="compMail1" value="" style="width: 120px;" />
						<em>@</em>
						<input type="text" id="compMail2" name="compMail2" value="" style="width: 120px;" />
						<select id="emailSelect" name="emailSelect" onchange="changeEmail()" style="width: 120px">
							<option value="">선택</option>
							<option value="M">직접 입력</option>
							<option value="N">naver.com</option>
							<option value="D">daum.net</option>
							<option value="H">hotmail.com</option>
							<option value="N">nate.com</option>
							<option value="E">empas.com</option>
							<option value="D">dreamwiz.com</option>
							<option value="G">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>인원수</th>
					<td>
						<input type="text" id="usePersNum" name="usePersNum" value="" style="width: 100px;" />
					</td>
				</tr>
			</table>
			<div class="sti">사용시설</div>
			<table class="table01">
				<colgroup>
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>시설명</th>
					<td>
						<select id="facilityNm" name="facilityNm" style="width: 100%;">
							<option value="">선택</option>
						</select>
					</td>
				</tr>
				<tr>
				<tr>
					<th>사용목적</th>
					<td>
						<input type="text" id="useObj" name="useObj" value="" style="width: 100%" />
					</td>
				</tr>
				<tr>
					<th>사용시간</th>
					<td>
						<div class="set">
							<input type="text" class="date" data-dateformat="yyyy-mm-dd" id="useFrDt" name="useFrDt" value="" style="width: 110px; margin-right: 4px;" />
							<select name="useFrTm" id="useFrTm" style="width: 100px;">
								<option value="0900">9시</option>
								<option value="1000">10시</option>
								<option value="1100">11시</option>
								<option value="1200">12시</option>
								<option value="1300">13시</option>
								<option value="1400">14시</option>
								<option value="1500">15시</option>
								<option value="1600">16시</option>
								<option value="1700">17시</option>
							</select>
						</div>
						<div class="set">
							<input type="text" class="date" data-dateformat="yyyy-mm-dd" id="useToDt" name="useToDt" style="width: 110px; margin-right: 4px;" />
							<select name="useToTm" id="useToTm" style="width: 100px;">
								<option value="1000">10시</option>
								<option value="1100">11시</option>
								<option value="1200">12시</option>
								<option value="1300">13시</option>
								<option value="1400">14시</option>
								<option value="1500">15시</option>
								<option value="1600">16시</option>
								<option value="1700">17시</option>
								<option value="1800">18시</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			</form>
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:facilityApplSave();">신청하기</button>
				<button type="button" class="closeBtn">취소</button>	

			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>
</div>

        
</body>
</html>