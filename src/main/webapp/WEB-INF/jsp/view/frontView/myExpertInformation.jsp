<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="../../db/js/myExpertInformation.js"></script>
<script type="text/javascript">
/*데이터값 입력*/
		$(document).ready(function () {

			/* 자동시작함수 */

			/* 데이터 정보 보여주기 */
			var memberId = '${data.memberId}';
			//이름
			var expertNm = '${data.expertNm}';
			$('#expertNm').html(expertNm);
			//성별
			var expertGender = '${data.expertGender}';
			$('#expertGender').html(expertGender);
			//경력년수
			var expertCareerNum = '${data.expertCareerNum}';
			$('#expertCareerNum').val(expertCareerNum);
			//전문분야
			var largeSpecialAreaCd = '${data.largeSpecialAreaCd}';
			$('#largeSpecialAreaCd').val(largeSpecialAreaCd);
			var detailSpecialAreaCd = '${data.detailSpecialAreaCd}';
			largeSpecialAreaCdSelectBox(detailSpecialAreaCd);
			//관심분야
			var expertInterestAreaCd = '${data.expertInterestAreaCd}';
			$('#expertInterestAreaCd').val(expertInterestAreaCd);
			var expertDetailIntrtAreaCd = '${data.expertDetailIntrtAreaCd}';
			expertInterestAreaCdSelectBox(expertDetailIntrtAreaCd);
			//산학연관s
			var expertIndsEduCd = '${data.expertIndsEduCd}';
			$('#expertIndsEduCd').val(expertIndsEduCd);
			//과학기술인
			var expertStRegNo = '${data.expertStRegNo}';
			$('#expertStRegNo').val(expertStRegNo);
			//사업자등록번호
			var expertRegNo = '${data.expertRegNo}';
			$('#expertRegNo').html(expertRegNo);
			//출신학교
			var expertFinalSchoolNm = '${data.expertFinalSchoolNm}';
			$('#expertFinalSchoolNm').val(expertFinalSchoolNm);
			//전공
			var expertMajorNm = '${data.expertMajorNm}';
			$('#expertMajorNm').val(expertMajorNm);			
			//학력
			var expertFnalEduCd = '${data.expertFnalEduCd}';
			$('#expertFnalEduCd').val(expertFnalEduCd);
			//소속기관
			var expertHeadAddrNm = '${data.expertHeadAddrNm}';
			$('#expertHeadAddrNm').val(expertHeadAddrNm);
			//해당부서
			var expertDptmNm = '${data.expertDptmNm}';
			$('#expertDptmNm').val(expertDptmNm);
			//직책
			var expertOffiDutyNm = '${data.expertOffiDutyNm}';
			$('#expertOffiDutyNm').val(expertOffiDutyNm);
			//직장주소
			var expertOffiAddr = '${data.expertOffiAddr}';
			$('#expertOffiAddr').val(expertOffiAddr);
			var expertOffiDetailAddr = '${data.expertOffiDetailAddr}';
			$('#expertOffiDetailAddr').val(expertOffiDetailAddr);
			//휴대폰
			var expertOffiTel = '${data.expertOffiTel}';
			var expertOffiTel1 = expertOffiTel.substring(0,3);
			var expertOffiTel2 = expertOffiTel.substring(3,7);
			var expertOffiTel3 = expertOffiTel.substring(7);				
			$('#expertOffiTel1').val(expertOffiTel1);
			$('#expertOffiTel2').val(expertOffiTel2);
			$('#expertOffiTel3').val(expertOffiTel3);
			//자택주소
			var expertHomeAddr = '${data.expertHomeAddr}';
			$('#expertHomeAddr').val(expertHomeAddr);
			var expertHomeDetailAddr = '${data.expertHomeDetailAddr}';
			$('#expertHomeDetailAddr').val(expertHomeDetailAddr);
			//팩스
			var expertOffiFax = '${data.expertOffiFax}';
			var expertOffiFax1 = expertOffiFax.substring(0,3);
			var expertOffiFax2 = expertOffiFax.substring(3,7);
			var expertOffiFax3 = expertOffiFax.substring(7);				
			$('#expertOffiFax1').val(expertOffiFax1);
			$('#expertOffiFax2').val(expertOffiFax2);
			$('#expertOffiFax3').val(expertOffiFax3);
			//은행
			var benefitBankCd = '${data.benefitBankCd}';
			$('#benefitBankCd').val(benefitBankCd);
			//계좌번호
			var benefitAccntNo = '${data.benefitAccntNo}';
			$('#benefitAccntNo').val(benefitAccntNo);
			//생년월일
			var benefitBirthDt = '${data.benefitBirthDt}';
			$('#benefitBirthDt').val(benefitBirthDt);
			//담당자 전화
			var benefitRespsibHpNo = '${data.benefitRespsibHpNo}';
			var benefitRespsibHpNo1 = benefitRespsibHpNo.substring(0,3);
			var benefitRespsibHpNo2 = benefitRespsibHpNo.substring(3,7);
			var benefitRespsibHpNo3 = benefitRespsibHpNo.substring(7);				
			$('#benefitRespsibHpNo1').val(benefitRespsibHpNo1);
			$('#benefitRespsibHpNo2').val(benefitRespsibHpNo2);
			$('#benefitRespsibHpNo3').val(benefitRespsibHpNo3);
			
			
			expertDeliberateList();
			
			
/*심의자문, 평가 등 이력) 추가 */
			$("#expertBtn").click(function(){
				var	 formData = new FormData();
				formData.append("memberId",$('#memberId').val());
				formData.append("expertDelibrDt",$('#expertDelibrDt').val());
				formData.append("expertDelibrTitle",$('#expertDelibrTitle').val());
				formData.append("remark",$('#remark').val());
				$.ajax({
					type : 'post',
					url:'/db/mypageExpertDeliberateInsert.do',
					enctype: 'multipart/form-data',
					data: formData,
					contentType:false,
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0 || data.returnCode1 == 0){
							alert("등록을 실패 하였습니다.");
							return;
						}else{
							alert("등록이 완료 되었습니다.");
							//expertDeliberateList();
						}
					},  
					error:function(request,status,error){ //ajax 오류인경우  
						alert("작업중 에러가 발생했습니다.");      
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});

});
//조회
function expertDeliberateList(){
var formData = new FormData();
formData.append('memberId','${data.memberId}');			
$.ajax({
	type: 'post',
	data: formData,
	processData:false,
	dataType: 'json',
	contentType : false,
	url: "/db/mypageExpertDeliberateList.do",
	success: function(data) {
		var htmls = "";
		var cnt =0;
		if(data.length < 1){
		} else {
                $(data.data).each(function(){

                    htmls +='<tr>'; 
                    
                    htmls += '<td><input type="hidden"  id="totcnt' + cnt + '" value="' + this.expertHistIdx + '"/><span>' + this.expertDelibrDt + '</span></td>';
                    htmls += '<td><span>' + this.expertDelibrTitle + '</span></td>';
                    htmls += '<td><span>' + this.remark + '</span></td>';
                    htmls +="<td><button type='button' class='txtbtn floatR delBtn'>삭제</button><button type='button' onclick='fn_updateEr(\"" + this.expertHistIdx + "\", \"" + this.expertDelibrDt + "\", \"" + this.expertDelibrTitle + "\", \"" + this.remark +  "\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
                    htmls += '</tr>';
                    cnt++;

            	});	//each end

		};
		console.log(data.data);
		//alert(htmls);
		$("#resultTbody").html(htmls);
           
       }	   // Ajax success end
});	// Ajax end
}
</script>
<title>전남콘텐츠기업육성센터</title>
</head>
<body>
<div id="skipnav"><a href="#contents">본문바로가기</a></div>
<div id="wrap" class="sub s5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>기업정보</span>
				<span class="now">기업정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">MY 전문가 이력 관리하기 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>MY 전문가 이력 관리하기</h3>
				<div class="continner">
					<div class="daylist">
						<h4>기본정보</h4>
						<form id="updateFrm" name="updateFrm" method="POST" >
							<table class="table01">
								<colgroup>
									<col width="7%" /><col width="7%" /><col width="32%" /><col width="13%" /><col width="14%" /><col width="13%" /><col width="14%" />
								</colgroup>
								<tr>
									<th colspan="2">이름*</th>
									<td>
										<span id="expertNm"></span>
									</td>
									<th>성별</th>
									<td>
										<span id="expertGender"></span>
									</td>
									<th>경력년수</th>
									<td>
										<input type="text" id="expertCareerNum" name="expertCareerNum"  maxlength="2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:30px; text-align: center;"/> 년
									</td>
								</tr>
								<tr>
									<th colspan="2">프로필사진</th>
									<td colspan="5">
										프로필이미지.png <button type="button" style="margin-left: 10px;"><img src="img/btn_close.png" width="10" height="10" alt="삭제" /></button>
									</td>
								</tr>
								<tr>
									<th colspan="2">전문분야*</th>
									<td>
										<select id="largeSpecialAreaCd" name="largeSpecialAreaCd" onchange="largeSpecialAreaCdSelectBox('')" >
											<c:forEach var="largeSpecialAreaCd" items="${largeSpecialAreaCd}" varStatus="status" >
											 	<option value="${largeSpecialAreaCd.commonCd}">${largeSpecialAreaCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
									<th>세부 전문분야*</th>
									<td colspan="3">
											<select id="detailSpecialAreaCd" name="detailSpecialAreaCd" style="position:relative;">
											</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">관심분야</th>
									<td>
										<select id="expertInterestAreaCd" name="expertInterestAreaCd" onchange="expertInterestAreaCdSelectBox('')" >
											<c:forEach var="expertInterestAreaCd" items="${expertInterestAreaCd}" varStatus="status" >
											 	<option value="${expertInterestAreaCd.commonCd}">${expertInterestAreaCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
									<th>세부 관심분야</th>
									<td colspan="3">
											<select id="expertDetailIntrtAreaCd" name="expertDetailIntrtAreaCd" style="position:relative;">
											</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">산학연관</th>
									<td>
										<select id="expertIndsEduCd" name="expertIndsEduCd">
											<c:forEach var="expertIndsEduCd" items="${expertIndsEduCd}" varStatus="status" >
											 	<option value="${expertIndsEduCd.commonCd}">${expertIndsEduCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
									<th>과학기술인</th>
									<td>
										<input type="text" id="expertStRegNo" name ="expertStRegNo" size="5" maxlength="8"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
									</td>
									<th>사업자등록번호</th>
									<td>
										<span id="expertRegNo" ></span>
									</td>
								</tr>
								<tr>
									<th colspan="2">출신학교</th>
									<td>
										<input type="text" id="expertFinalSchoolNm" name="expertFinalSchoolNm"  size="10" maxlength="10"/>
									</td>
									<th>전공</th>
									<td>
										<input type="text" id="expertMajorNm" name="expertMajorNm"  size="5" maxlength="10"/>
									</td>
									<th>학력</th>
									<td>
										<select id="expertFnalEduCd" name="expertFnalEduCd" >
											<c:forEach var="expertFnalEduCd" items="${expertFnalEduCd}" varStatus="status" >
											 	<option value="${expertFnalEduCd.commonCd}">${expertFnalEduCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">소속기관*</th>
									<td>
										<input type="text" id="expertHeadAddrNm" name ="expertHeadAddrNm" size="10" maxlength="20"/>
									</td>
									<th>해당부서</th>
									<td>
										<input type="text" id="expertDptmNm" name="expertDptmNm" size="5" maxlength="10"/>
									</td>
									<th>직책</th>
									<td>
										<input type="text" id="expertOffiDutyNm" name="expertOffiDutyNm" size="5" maxlength="10"/>
									</td>
								</tr>
								<tr>
									<th rowspan="2">주소</th>
									<th>직장*</th>
									<td>
										<input type="text" id="expertOffiAddr" name="expertOffiAddr" style="width: 190px; margin-right: 4px;">
										<button type="button" class="txtbtn" style="width: 110px; " onclick="javascript:openDaumPostcode()">주소검색</button>
										<input type="text" id="expertOffiDetailAddr" name="expertOffiDetailAddr" maxlength="38" style="width: 307px; margin-top: 3px;">
									</td>
									<th>휴대폰</th>
									<td colspan="3">
										<select id="expertOffiTel1" name="expertOffiTel1"style="widdth: 20px;">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select>-
										<input type="text" id="expertOffiTel2" name="expertOffiTel2" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
										<input type="text" id="expertOffiTel3" name="expertOffiTel3"  size="4" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
									</td>
								</tr>
								<tr>
									<th>자택</th>
									<td>
										<input type="text" id="expertHomeAddr" name="expertHomeAddr" style="width: 190px; margin-right: 4px;">
										<button type="button" class="txtbtn" style="width: 110px; " onclick="javascript:openDaumPostcode1()">주소검색</button>
										<input type="text" id="expertHomeDetailAddr" name="expertHomeDetailAddr" maxlength="38" style="width: 307px; margin-top: 3px;">
									</td>
									<th>대표FAX</th>
									<td colspan="3">
										<input type="text" id="expertOffiFax1" name="expertOffiFax1" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
										<input type="text" id="expertOffiFax2" name="expertOffiFax2" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
										<input type="text" id="expertOffiFax3" name="expertOffiFax3"  size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
									</td>
								</tr>
							</table>
							
							
							<h4 class="clearfix">
								심의(자문, 평가 등) 이력
								<button type="button" id="experetBtn" class="txtbtn floatR">추가</button>
							</h4>
							<table class="table01 datetable" id="resultTable">
								<colgroup>
									<col width="10%" /><col width="40%" /><col width="40%" /><col width="10%" />
								</colgroup>
								<thead>
								<tr>
									<th >심의일자</th>
									<th >심의내용</th>
									<th >심의비고</th>
									<th ></th>
								</thead>
								<tbody id="resultTbody">
								</tbody>
							</table>
							
							
							
							<h4>전문가 수당 지급정보</h4>
							<table class="table01">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
								</colgroup>
								<tr>
									<th>은행</th>
									<td>
										<select id="benefitBankCd" name="benefitBankCd" >
											<c:forEach var="benefitBankCd" items="${benefitBankCd}" varStatus="status" >
											 	<option value="${benefitBankCd.commonCd}">${benefitBankCd.commonNm}</option>
											 </c:forEach>
										</select>
									</td>
									<th>계좌번호</th>
									<td>
										<input type="text"  id="benefitAccntNo" name ="benefitAccntNo" size="15" maxlength="15" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input type="text" id="benefitBirthDt" name ="benefitBirthDt" class="date" size="10" maxlength="10"/>
									</td>
									<th>담당자 전화*</th>
									<td>
										<select id="benefitRespsibHpNo1" name="benefitRespsibHpNo1"style="widdth: 20px;">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select>-
										<input type="text" id="benefitRespsibHpNo2" name="benefitRespsibHpNo2" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
										<input type="text" id="benefitRespsibHpNo3" name="benefitRespsibHpNo3"  size="4"maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
									</td>
								</tr>
							</table>
						</form>
						<div class="submitbtn">
							<button type="button">취소<span></span></button>
							<button type="button" class="ok">저장<span></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="memberId" id="memberId" value="${data.memberId}"/>
</div>


<div class="layer" style="display: none;" id="experetPop">
	<div class="box boxw600" style="height: 355px; margin-top: -150px;">
		<div class="ti">심의(자문, 평가 등) 이력 추가</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>심의일자</th>
					<td>
						<input type="text" name="expertDelibrDt" id="expertDelibrDt" class="date" value=""maxlength="10"style="width:50%" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>심의제목</th>
					<td>
						<input type="text" name="expertDelibrTitle" id="expertDelibrTitle" value=""maxlength="90"style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" name="remark" id="remark" value="" maxlength="180" style="width:75%"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="expertBtn" name="expertBtn">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>	
</div>


<div class="layer" style="display: none;" id="upexperetPop">
	<div class="box boxw600" style="height: 355px; margin-top: -150px;">
		<input type="hidden" name ="enterpriseIdx" id="upexpertHistIdx" value="">
		<div class="ti">심의(자문, 평가 등) 이력 수정</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>심의일자</th>
					<td>
						<input type="text" name="expertDelibrDt" id="upexpertDelibrDt" class="date" maxlength="10"value=""style="width:50%"/>
					</td>
				</tr>
				<tr>
					<th>심의제목</th>
					<td>
						<input type="text" name="expertDelibrTitle" id="upexpertDelibrTitle" value="" maxlength="95"style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" name="remark" id="upremark" value=""style="width:75%"maxlength="180"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="upexpertBtn" name="upexpertBtn">저장하기</button>
				<button type="button" class="upcloseBtn">취소</button>	
			</div>
			<button type="button" class="btn_close upcloseBtn">X</button>
		</div>
	</div>	
</div>
</body>
</html>