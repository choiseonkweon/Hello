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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- <script type="text/javascript" src="../db/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../db/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../db/assets/js/ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	 #es{color: red}
</style>

<script type="text/javaScript" defer="defer">
	$(document).ready(function () {
		
		$("#cancel").click(function(){
			var result = confirm("취소하시겠습니까?");
			if(result){
				window.location.href="/db/main.do";
			}else{
				
			}
			
			
		 });

		$("#createBtn").click(function(){
			var agree = $("#agree").is(":checked");
			 if(!agree){
					alert("활용 동의를 체크해주세요");
					return false;
		        }
})
		/*  달력함수*/
		$(function() {
	           $("#adviceHopeDt").datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	            });                    
	            
	            //초기값을 오늘 날짜로 설정
	            $('#adviceHopeDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	        });

		
/* 	 	function checkValue(){
			var retValue = true;
			
			if($('#memberId').val() == ""){
				alert("아이디를 입력하세요.");
				$('#memberId').focus();
				return;
			}
			
			if($('#chkYn').val() != "Y"){
				alert("아이디를 중복체크 하세요.");
				return;
			}
			
			if($('#memberPw').val() == ""){
				alert("비밀번호를 입력하세요.");
				$('#memberPw').focus();
				return;
			}
			
			if($('#memPwdChk').val() == ""){
				alert("비밀번호 확인을 입력하세요.");
				$('#memPwdChk').focus();
				return;
			}
			
			if($('#memberPw').val() != $('#memPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if($('#memberNm').val() == ""){
				alert("이름을 입력하세요.");
				$('#memberNm').focus();
				return;
			}
			
			if($('#expertHeadTel').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#expertHeadTel').focus();
				return;
			}

			return retValue;
		}
	 	
		if($('#expertHeadTel').val() == ""){
			alert("휴대폰번호를 입력하세요.");
			$('#expertHeadTel').focus();
			return;
		} */
	 	
		///
/* 		serializeObject = function() {
    var obj = null; 
    try { 
        if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
            var arr = this.serializeArray(); 
            if(arr){ obj = {}; 
            jQuery.each(arr, function() { 
                obj[this.name] = this.value; }); 
            } 
        } 
    }catch(e) { 
        alert(‎e.message); 
    }finally {} 
    return obj; 
} */
		///
/* 		 $("#createBtn").click(function(){
//			if(checkValue()){
				 var params = $("#insertFrm").serializeObject();
				$.ajax({
					type : 'post',
					data: JSON.stringify(params),
					url:'/db/onlineInsert.do',
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
		                	window.location.href="/db/main2.do";
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
//			} 
		}); 
 */
	});

	$(document).ready(function () {

		var joinTypeCd = '${joinTypeCd}';
		if(joinTypeCd==000001){
			
			var entprHeadTel = '${detail.entprHeadTel}';
			if(entprHeadTel.substring(0,2)=='02'){
				var 	entprHeadTel1 = entprHeadTel.substring(0,2);
						entprHeadTel1 += "-";
						entprHeadTel1 += entprHeadTel.substring(2,6);
						entprHeadTel1 += "-";
						entprHeadTel1 += entprHeadTel.substring(6);
			
			}else{
				var 	entprHeadTel1 = entprHeadTel.substring(0,3);
						entprHeadTel1+= "-";
						entprHeadTel1 += entprHeadTel.substring(3,7);
						entprHeadTel1 += "-";
						entprHeadTel1 += entprHeadTel.substring(7);
			}
			$('#entprHeadTel').text(entprHeadTel1);
		}
	});
	</script>


<body>
	
<div id="wrap" class="sub s3">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
	<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><!-- <b>원스톱 지원 신청하기</b> --></h1>
					</div>
				</div>
		</c:if>
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
				<form id="insertFrm" name="insertFrm" action="/db/onlineInsert.do" method="post" enctype="multipart/form-data" onclick =""'>
<%-- 				<form id="insertFrm" name="insertFrm" action="/db/onlineInsert.do" method="post" > --%>
				<h3>온라인 지원 신청하기</h3>
				<div class="continner">
					<div class="daylist">
					
						<!-- 기업정보 -->
						<c:if test="${joinTypeCd==000001}">
							<h4>회사개요</h4>
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th class="essential">업체(기관)명</th>
									<td>
										<span id="entprNm" style="width: 100%">${detail.entprNm}</span>
									</td>
									<th class="essential">대표자 명</th>
									<td>
										<span id="entprCeo"  style="width: 100%" >${detail.entprCeo}</span>
									</td>
								</tr>
								<tr>
									<th class="essential">사업분야</th>
									<td colspan="3">
										<span>${detail.largeBussAreaCd}</span> > <span>${detail.mediumBussAreaCd}</span>
									</td>
								</tr>
								<tr>
									<th rowspan="1" class="essential">주소</th>
										<td colspan="2">
											<span id="entprHeadAddr" style="width:50%" >${detail.entprHeadAddr}</span>
											<span id="entprHeadDetailAddr" style="width:50%" >${detail.entprHeadDetailAddr}</span>
										</td>
								</tr>
								<tr>
									<th class="essential">대표전화</th>
									<td id="entprHeadTel">
									</td>
									<th class="essential">직원수</th>
									<td>
										<span  id="entprResultEmpCnt"   style="width: 100%;" > ${detail1.entprResultEmpCnt}명</span>
									</td>
								</tr>
							</table>
						</c:if>
						<!-- 전문가 정보 -->
						<c:if test="${joinTypeCd==000002}">
							<h4>회사개요</h4>
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th class="essential">업체(기관)명</th>
									<td>
										<span id="entprNm" style="width: 100%">${detail.entprNm}</span>
									</td>
									<th class="essential">대표자 명</th>
									<td>
										<span id="entprCeo"  style="width: 100%" >${detail.entprCeo}</span>
									</td>
								</tr>
								<tr>
									<th class="essential">사업분야</th>
									<td colspan="3">
										<span>${detail.largeBussAreaCd}</span> > <span>${detail.mediumBussAreaCd}</span>
									</td>
								</tr>
								<tr>
									<th rowspan="1" class="essential">주소</th>
										<td colspan="2">
											<span id="entprHeadAddr" style="width:50%" >${detail.entprHeadAddr}</span>
											<span id="entprHeadDetailAddr" style="width:50%" >${detail.entprHeadDetailAddr}</span>
										</td>
								</tr>
								<tr>
									<th class="essential">대표전화</th>
									<td id="entprHeadTel">
									</td>
									<th class="essential">직원수</th>
									<td>
										<span  id="entprResultEmpCnt"   style="width: 100%;" > ${detail1.entprResultEmpCnt}명</span>
									</td>
								</tr>
							</table>
						</c:if>
						
							<h4>신청인 정보</h4>
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th><span id="es">* </span>신청인 성명</th>
									<td>
										<input type="text" id="compApplNm" name="compApplNm" style="width: 100%;" required/>
									</td>
									<th><span id="es">* </span>직위</th>
									<td>
										<input type="text" id="compPosit" name="compPosit" style="width: 100%;" /> 
									</td>
								</tr>
								<tr>
									<th><span id="es">* </span>전화번호</th>
									<td>
										<input type="text" id="compTelNo" name="compTelNo" style="width: 100%;" required/>
									</td>
									<th>팩스번호</th>
									<td>
										<input type="text" id="compFaxNo" name="compFaxNo" style="width: 100%;" /> 
									</td>
								</tr>
								<tr>
									<th><span id="es">* </span>휴대폰번호</th>
									<td>
										<input type="text" id="compHpNo" name="compHpNo" style="width: 100%;" required/>
									</td>
									<th><span id="es">* </span>이메일</th>
									<td>
										<input type="text" id="compMail" name="compMail" style="width: 100%;" /> 
									</td>
								</tr>
							</table>
							<h4>자문, 신청내용</h4>
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="*" />
								</colgroup>
								<tr>
									<th><span id="es">* </span>희망일자</th>
									<td>
										<input type="text" id="adviceHopeDt" name="adviceHopeDt" class="cal" required/>
									</td>
								</tr>
								<tr>
									<th><span id="es" >* </span>희망장소</th>
									<td>
										<select id="advicePlaceCd" name="advicePlaceCd" >
											<c:forEach var="advicePlaceCd" items="${advicePlaceCdList}" varStatus="status" >
											 	<option value="${advicePlaceCd.commonCd}">${advicePlaceCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th><span id="es">* </span>자문 신청분야</th>
									<td><select name='adviceAreaCd' id='adviceAreaCd' style="width: 20%;">
											<c:forEach var="adviceAreaCd" items="${adviceAreaCdList}">
										         <option value='${adviceAreaCd.commonCd}'>${adviceAreaCd.commonNm}</option>
									         </c:forEach>
									         </select>
									</td>
								</tr>
								<tr>
									<th><span id="es">* </span>자문 신청내용</th>
									<td>
										<textarea id="adviceApplicCont" name="adviceApplicCont" style="width: 100%; height: 80px;"></textarea>
									</td>
								</tr>
								<tr>
									<th>사업자등록증</th>
									<td>
										<input type="file" id="file" name="file" style="width: 100%;"/>
									</td>
								</tr>

							</table>
							<div class="text1">
								<label class="">
									<input type="checkbox" id="agree" value="y"/> 전남콘텐츠 기업육성센터 원스톱 지원실 자문·컨설팅 이용을 위해 개인정보 활용에 대해 동의합니다.
								</label>
							</div>
							
							<div class="submitbtn">
								<button type="submit" id="createBtn" name="createBtn" class="ok"  >신청하기</button>
								<button type="button" id="cancel" name="cancel">취소</button>
							</div>

					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>

