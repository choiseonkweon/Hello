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
<script type="text/javascript" src="../../db/js/myBuyerInformation.js"></script>
<script type="text/javascript">
/*데이터값 입력*/
		$(document).ready(function () {

			/* 자동시작함수 */

			/* 데이터 정보 보여주기 */
			var memberId = '${data.memberId}';
			
			//회사명
			var companyNm = '${data.companyNm}';
			$('#companyNm').html(companyNm);
			//바이어명
			var buyerNm = '${data.buyerNm}';
			$('#buyerNm').html(buyerNm);
			//사업자등록번호
			var buyerComRegNum = '${data.buyerComRegNum}';
			$('#buyerComRegNum').html(buyerComRegNum);
			//이메일
			var buyerCeoEmailData = '${data.buyerCeoEmail}';
			var buyerCeoEmail = buyerCeoEmailData.split('@');
			$('#buyerCeoEmail1').val(buyerCeoEmail[0]);
			$('#buyerCeoEmail2').val(buyerCeoEmail[1]);
			//관심분야
			var buyerBusAreaCd = '${data.buyerBusAreaCd}';
			$('#buyerBusAreaCd').val(buyerBusAreaCd);			
			//홈페이지
			var buyerSite = '${data.buyerSite}';
			$('#buyerSite').val(buyerSite);			
			//대표전화
			var buyerHeadTel = '${data.buyerHeadTel}';
			if(buyerHeadTel.substring(0,2)=='02'){
				var buyerHeadTel1 = buyerHeadTel.substring(0,2);
				var buyerHeadTel2 = buyerHeadTel.substring(2,6);
				var buyerHeadTel3 = buyerHeadTel.substring(6);				
			}else{
				var buyerHeadTel1 = buyerHeadTel.substring(0,3);
				var buyerHeadTel2 = buyerHeadTel.substring(3,7);
				var buyerHeadTel3 = buyerHeadTel.substring(7);
			}
			
			$('#buyerHeadTel1').val(buyerHeadTel1);
			$('#buyerHeadTel2').val(buyerHeadTel2);
			$('#buyerHeadTel3').val(buyerHeadTel3);
			//본사주소
			var buyerHeadAddr = '${data.buyerHeadAddr}';
			$('#buyerHeadAddr').val(buyerHeadAddr);
			var buyerHeadDetailAddr = '${data.buyerHeadDetailAddr}';
			$('#buyerHeadDetailAddr').val(buyerHeadDetailAddr);
			//대표팩스
			var buyerHeadFax = '${data.buyerHeadFax}';
			if(buyerHeadFax.substring(0,2)=='02'){
				var buyerHeadFax1 = buyerHeadFax.substring(0,2);
				var buyerHeadFax2 = buyerHeadFax.substring(2,6);
				var buyerHeadFax3 = buyerHeadFax.substring(6);				
			}else{
				var buyerHeadFax1 = buyerHeadFax.substring(0,3);
				var buyerHeadFax2 = buyerHeadFax.substring(3,7);
				var buyerHeadFax3 = buyerHeadFax.substring(7);
			}
			$('#buyerHeadFax1').val(buyerHeadFax1);
			$('#buyerHeadFax2').val(buyerHeadFax2);
			$('#buyerHeadFax3').val(buyerHeadFax3);
			//자사주소
			var buyerBranchAddr = '${data.buyerBranchAddr}';
			$('#buyerBranchAddr').val(buyerBranchAddr);
			var buyerBranchDetailAddr = '${data.buyerBranchDetailAddr}';
			$('#buyerBranchDetailAddr').val(buyerBranchDetailAddr);
			//자사전화
			var buyerBranchTel = '${data.buyerBranchTel}';
			if(buyerBranchTel.substring(0,2)=='02'){
				var buyerBranchTel1 = buyerBranchTel.substring(0,2);
				var buyerBranchTel2 = buyerBranchTel.substring(2,6);
				var buyerBranchTel3 = buyerBranchTel.substring(6);				
			}else{
				var buyerBranchTel1 = buyerBranchTel.substring(0,3);
				var buyerBranchTel2 = buyerBranchTel.substring(3,7);
				var buyerBranchTel3 = buyerBranchTel.substring(7);
			}
			$('#buyerBranchTel1').val(buyerBranchTel1);
			$('#buyerBranchTel2').val(buyerBranchTel2);
			$('#buyerBranchTel3').val(buyerBranchTel3);
			//자사팩스
			var buyerBranchFax = '${data.buyerBranchFax}';
			if(buyerBranchFax.substring(0,2)=='02'){
				var buyerBranchFax1 = buyerBranchFax.substring(0,2);
				var buyerBranchFax2 = buyerBranchFax.substring(2,6);
				var buyerBranchFax3 = buyerBranchFax.substring(6);				
			}else{
				var buyerBranchFax1 = buyerBranchFax.substring(0,3);
				var buyerBranchFax2 = buyerBranchFax.substring(3,7);
				var buyerBranchFax3 = buyerBranchFax.substring(7);
			}
			$('#buyerBranchFax1').val(buyerBranchFax1);
			$('#buyerBranchFax2').val(buyerBranchFax2);
			$('#buyerBranchFax3').val(buyerBranchFax3);
			
			
			//바이어히스토리 자동실행
			buyerHistList();
			
			
/*히스토리 추가 */
			$("#histBtn").click(function(){
				var	 formData = new FormData();
				var one = $('#buyerHistDt').val()
				var two = one.replace("-","");
				var buyerHistDt = two.replace("-","");
				formData.append("memberId",$('#memberId').val());
				formData.append("buyerHistNm",$('#buyerHistNm').val());
				formData.append("buyerHistInvt",$('#buyerHistInvt').val());
				formData.append("buyerHistSpecCd",$('#buyerHistSpecCd').val());
				formData.append("buyerHistDt",buyerHistDt);
				formData.append("buyerHistContent",$('#buyerHistContent').val());
				formData.append("processCd",$('#processCd').val());
				$.ajax({
					type : 'post',
					url:'/db/mypageBuyerHistInsert.do',
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
							buyerHistList();
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
function buyerHistList(){
var formData = new FormData();
formData.append('memberId','${data.memberId}');			
$.ajax({
	type: 'post',
	data: formData,
	processData:false,
	dataType: 'json',
	contentType : false,
	url: "/db/mypageBuyerHistList.do",
	success: function(data) {
		var htmls = "";
		var cnt =0;
		var row=1;
		if(data.length < 1){
		} else {
                $(data.data).each(function(){

                    htmls +='<tr>'; 
                    
                    htmls += '<td><input type="hidden"  id="buyerHistIdx' + cnt + '" value="' + this.buyerHistIdx + '"/><span>' +row + '</span></td>';
                    htmls += '<td><span>' + this.buyerHistNm + '</span></td>';
                    htmls += '<td><span>' + this.buyerHistInvt + '원</span></td>';
                    htmls += '<td><input type="hidden" value="' + this.buyerHistSpecCd + '"/><span>' + this.buyerHistSpecNm + '</span></td>';
                    htmls += '<td><span>' + this.buyerHistDt + '</span></td>';
                    htmls += '<td><span>' + this.buyerHistContent + '</span></td>';
                    htmls += '<td><span>' + this.processCd + '</span></td>';
                    htmls +="<td><button type='button' class='txtbtn floatR delBtn'>삭제</button><button type='button' onclick='fn_updateEr(\"" + this.buyerHistIdx + "\", \"" + this.buyerHistNm + "\", \"" + this.buyerHistInvt + "\", \"" + this.buyerHistSpecCd +  "\", \"" + this.buyerHistDt + "\", \"" + this.buyerHistContent + "\", \"" +this.processCd+"\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
                    htmls += '</tr>';
                    cnt++;
                    row++;

            	});	//each end

		};
		console.log(data.data);
		//alert(htmls);
		$("#resultTbody").html(htmls);
           
       }	   // Ajax success end
});	// Ajax end


$(".english input").keyup(function(event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
       var inputVal = $(this).val();
       $(this).val(inputVal.replace(/[^(a-zA-Z)]/gi, ''));
    }
 });
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
			<h2 class="">MY 바이어 정보 관리하기 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>MY 바이어 정보 관리하기</h3>
				<div class="continner">
					<div class="daylist">
						<h4>기본정보</h4>
						<table class="table01">
							<colgroup>
								<col width="7%" /><col width="8%" /><col width="38%" /><col width="15%" /><col width="*" />
							</colgroup>
							<tr>
								<th colspan="2">회사명</th>
								<td>
								<span id="companyNm"></span>
								</td>
								<th>이름</th>
								<td>
								<span id="buyerNm"></span>
								</td>
							</tr>
							<tr>
								<th colspan="2">사업자등록번호*</th>
								<td>
								<span id="buyerComRegNum"></span>
								</td>
								<th>대표자 E-mail</th>
								<td>
									<input type="text" id="buyerCeoEmail1" name="buyerCeoEmail1" value="" size="15" style="width:120px;"/>
									<span style="margin-left:5px;margin-right:5px;">@</span>
									<select id="buyerCeoEmail2" name="buyerCeoEmail2">
										<option value="naver.com" 	>naver.com</option>
										<option value="google.com" >google.com</option>
										<option value="yahoo.com"  >yahoo.com</option>
										<option value="daum.com"	>daum.com</option>
										<option value="hanmail.net" >hanmail.net</option>
										<option value="nate.com"    >nate.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="2">관심분야</th>
								<td>
									<select id="buyerBusAreaCd" name="buyerBusAreaCd" >
										<c:forEach var="buyerBusAreaCd" items="${buyerBusAreaCd}" varStatus="status" >
										 	<option value="${buyerBusAreaCd.commonCd}">${buyerBusAreaCd.commonNm}</option>
										 </c:forEach>
									</select>
								</td>
								<th>홈페이지</th>
								<td>
									<input type="text" id="buyerSite" name="buyerSite" value=""  size="15" />
								</td>
							</tr>
							<tr>
								<th rowspan="4">주소</th>
								<th rowspan="2">본사</th>
								<td rowspan="2">
									<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" value="" style="width: 260px; margin-right: 4px;" readonly>
									<button class="txtbtn" style="width: 110px;" onclick="javascript:openDaumPostcode()">주소검색</button><br />
									<input type="text" id="buyerHeadDetailAddr" name="buyerHeadDetailAddr" value="" style="width: 376px; margin-top: 3px;">
								</td>
								<th>대표전화</th>
								<td>
									<select id="buyerHeadTel1" name="buyerHeadTel1">
										<option value="02"	>02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerHeadTel2" name="buyerHeadTel2" value="" size="4" style="width: 50px; text-align: center"/>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerHeadTel3" name="buyerHeadTel3" value="" size="4"style="width: 50px; text-align: center" />
								</td>
							</tr>
							<tr>
								<th>대표FAX</th>
								<td>
									<input type="text" id="buyerHeadFax1" name="buyerHeadFax1" value="" size="4" style="width: 46px; text-align: center"/>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerHeadFax2" name="buyerHeadFax2" value="" size="10" style="width: 50px; text-align: center"/>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerHeadFax3" name="buyerHeadFax3" value="" size="10" style="width: 50px; text-align: center"/>
								</td>
							</tr>
							<tr>
								<th rowspan="2">지사</th>
								<td rowspan="2">
									<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" value=""  style="width: 260px; margin-right: 4px;" readonly>
									<button class="txtbtn" style="width: 110px;" onclick="javascript:openDaumPostcode1()">주소검색</button><br />
									<input type="text" id="buyerBranchDetailAddr" name="buyerBranchDetailAddr" value="" style="width: 376px; margin-top: 3px;">
								</td>
								<th>지사전화</th>
								<td>
									<select id="buyerBranchTel1" name="buyerBranchTel1" >
										<option value="02"	>02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerBranchTel2" name="buyerBranchTel2" value="" size="10" style="width: 50px; text-align: center" />
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerBranchTel3" name="buyerBranchTel3" value="" size="10" style="width: 50px; text-align: center"/>
								</td>
							</tr>
							<tr>
								<th>지사FAX</th>
								<td>
									<input type="text" id="buyerBranchFax1" name="buyerBranchFax1" value="" size="4" style="width: 46px; text-align: center"/>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerBranchFax2" name="buyerBranchFax2" value="" size="4" style="width: 50px; text-align: center"/>
									<span style="margin-left:5px;margin-right:5px;">-</span>
									<input type="text" id="buyerBranchFax3" name="buyerBranchFax3" value="" size="4" style="width: 50px; text-align: center"/>
								</td>
							</tr>
						</table>
						<h4 class="clearfix">
							히스토리
							<button type="button" class="txtbtn floatR">추가</button>
						</h4>
						<table class="table01 datetable pct">
							<colgroup>
								<col width="5%"><col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="25%"><col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>NO</th>
									<th>기업명</th>
									<th>투자금</th>
									<th>전문분야</th>
									<th>일시</th>
									<th>내용</th>
									<th>진행사항</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
						<div class="submitbtn">
							<button type="button">취소<span></span></button>
							<button type="button" class="ok">저장<span></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 히스토리 추가폼 -->
<div class="layer" style="display: none;" id="buyerHistPop">
	<div class="box boxw600" style="height: 520px; margin-top: -260px;">
		<div class="ti">히스토리 추가</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>투자 기업명</th>
					<td>
						<input type="text" name="buyerHistNm" id="buyerHistNm"  value=""style="width:75%" size="28"/>
					</td>
				</tr>
				<tr>
					<th>투자금</th>
					<td>
						<input type="text" name="buyerHistInvt" id="buyerHistInvt" value=""style="width:75%" size="28"/>
					</td>
				</tr>
				<tr>
					<th>전문분야</th>
					<td>
						<select id="buyerHistSpecCd" name="buyerHistSpecCd" >
							<c:forEach var="buyerHistSpecCd" items="${buyerHistSpecCd}" varStatus="status" >
							 	<option value="${buyerHistSpecCd.commonCd}">${buyerHistSpecCd.commonNm}</option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>일시</th>
					<td>
						<input type="text" name="buyerHistDt" id="buyerHistDt" value="" class="date"style="width:50%"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="buyerHistContent" id="buyerHistContent" value=""style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>진행사항</th>
					<td>
						<select id="processCd" name="processCd" >
							<c:forEach var="processCd" items="${processCd}" varStatus="status" >
							 	<option value="${processCd.commonCd}">${processCd.commonNm}</option>
							 </c:forEach>
						</select>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="histBtn" name="histBtn">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>	
</div>
<input type="hidden" id="memberId" name="memberId" value="${data.memberId}"/>
<!-- 히스토리 수정폼 -->
<div class="layer" style="display: none;" id="upbuyerHistPop">
<input type="hidden" name="upbuyerHistIdx" id="upbuyerHistIdx" value=""/>
	<div class="box boxw600" style="height: 520px; margin-top: -260px;">
		<div class="ti">히스토리 추가</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>투자 기업명</th>
					<td>
						<input type="text" name="buyerHistNm" id="upbuyerHistNm"  value=""style="width:75%" size="28"/>
					</td>
				</tr>
				<tr>
					<th>투자금</th>
					<td>
						<input type="text" name="buyerHistInvt" id="upbuyerHistInvt" value=""style="width:75%" size="28"/>
					</td>
				</tr>
				<tr>
					<th>전문분야</th>
					<td>
						<select id="upbuyerHistSpecCd" name="upbuyerHistSpecCd" >
							<c:forEach var="buyerHistSpecCd" items="${buyerHistSpecCd}" varStatus="status" >
							 	<option value="${buyerHistSpecCd.commonCd}">${buyerHistSpecCd.commonNm}</option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>일시</th>
					<td>
						<input type="text" name="buyerHistDt" id="upbuyerHistDt" value="" class="date"style="width:50%"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="buyerHistContent" id="upbuyerHistContent" value=""style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>진행사항</th>
					<td>
						<select id="upprocessCd" name="processCd" >
							<c:forEach var="processCd" items="${processCd}" varStatus="status" >
							 	<option value="${processCd.commonNm}">${processCd.commonNm}</option>
							 </c:forEach>
						</select>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="uphistBtn" name="uphistBtn">저장하기</button>
				<button type="button" class="upcloseBtn">취소</button>	
			</div>
			<button type="button" class="btn_close upcloseBtn">X</button>
		</div>
	</div>	
</div>

</body>
</html>