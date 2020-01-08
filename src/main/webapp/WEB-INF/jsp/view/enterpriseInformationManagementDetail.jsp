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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<style type="text/css">
	        #ui-datepicker-div .ui-widget-header {	
				background: #2D8CB9;	
			}
			.ui-state-default, .ui-widget-content .ui-state-default{
				background: transparent!important;
			}
			.ui-state-highlight, .ui-widget-content .ui-state-highlight{
				background: #fffa90!important;
			}
			.ui-datepicker-calendar th {
				color: #2D8CB9;
			}
			.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover{
			 	color:#333!important;
			}
	</style>
	<script type="text/javascript">
	$(document).ready(function () {

		/* 자동시작함수 */
		showCompanyList();		//기업 성과정보 자동으로 불러오기
		showBussList();			//진흥 수혜사업 정보 자동으로 불러오기 
		showJecpList();			//지적재산권 현황 정보 자동으로 불러오기
		showemployeesList(); 	//기업사원 정보 자동으로 불러오기

		/* 대표 이메일 담기 */
		var entprCeoEmailData = '${detail.entprCeoEmail}';
		var entprCeoEmail = entprCeoEmailData.split('@');
		$('#entprCeoEmail1').val(entprCeoEmail[0]);
		$('#entprCeoEmail2').val(entprCeoEmail[1]);
		
		/* 담당자 이메일 담기 */
		var entprRespsibEmailData = '${detail.entprRespsibEmail}';
		var entprRespsibEmail = entprRespsibEmailData.split('@');
		$('#entprRespsibEmail1').val(entprRespsibEmail[0]);
		$('#entprRespsibEmail2').val(entprRespsibEmail[1]);
		
		/* 본사 대표전화 담기 */
		var entprHeadTel = '${detail.entprHeadTel}';
		if(entprHeadTel.substring(0,2)=='02'){
			var entprHeadTel1 = entprHeadTel.substring(0,2);
			var entprHeadTel2 = entprHeadTel.substring(2,6);
			var entprHeadTel3 = entprHeadTel.substring(6);				
		}else{
			var entprHeadTel1 = entprHeadTel.substring(0,3);
			var entprHeadTel2 = entprHeadTel.substring(3,7);
			var entprHeadTel3 = entprHeadTel.substring(7);
		}
		$('#entprHeadTel1').val(entprHeadTel1);
		$('#entprHeadTel2').val(entprHeadTel2);
		$('#entprHeadTel3').val(entprHeadTel3);

		/*  지사대표FAX */
		var entprBranchFax = '${detail.entprBranchFax}';
		if(entprBranchFax.substring(0,2)=='02'){
			var entprBranchFax1 = entprBranchFax.substring(0,2);
			var entprBranchFax2 = entprBranchFax.substring(2,6);
			var entprBranchFax3 = entprBranchFax.substring(6);				
		}else{
			var entprBranchFax1 = entprBranchFax.substring(0,3);
			var entprBranchFax2 = entprBranchFax.substring(3,7);
			var entprBranchFax3 = entprBranchFax.substring(7);
		}
		$('#entprBranchFax1').val(entprBranchFax1);
		$('#entprBranchFax2').val(entprBranchFax2);
		$('#entprBranchFax3').val(entprBranchFax3);

 		/*  본사대표FAX */
		var entprHeadFax = '${detail.entprHeadFax}';
		if(entprHeadFax.substring(0,2)=='02'){
			var entprHeadFax1 = entprHeadFax.substring(0,2);
			var entprHeadFax2 = entprHeadFax.substring(2,6);
			var entprHeadFax3 = entprHeadFax.substring(6);				
		}else{
			var entprHeadFax1 = entprHeadFax.substring(0,3);
			var entprHeadFax2 = entprHeadFax.substring(3,7);
			var entprHeadFax3 = entprHeadFax.substring(7);
		}
		$('#entprHeadFax1').val(entprHeadFax1);
		$('#entprHeadFax2').val(entprHeadFax2);
		$('#entprHeadFax3').val(entprHeadFax3);
		/* 지사대표전화 */
		var entprBranchTel = '${detail.entprBranchTel}';
		if(entprBranchTel.substring(0,2)=='02'){
			var entprBranchTel1 = entprBranchTel.substring(0,2);
			var entprBranchTel2 = entprBranchTel.substring(2,6);
			var entprBranchTel3 = entprBranchTel.substring(6);				
		}else{
			var entprBranchTel1 = entprBranchTel.substring(0,3);
			var entprBranchTel2 = entprBranchTel.substring(3,7);
			var entprBranchTel3 = entprBranchTel.substring(7);
		}
		$('#entprBranchTel1').val(entprBranchTel1);
		$('#entprBranchTel2').val(entprBranchTel2);
		$('#entprBranchTel3').val(entprBranchTel3);

			var entprRespsibHpNo = '${detail.entprRespsibHpNo}';
			var entprRespsibHpNo1 = entprRespsibHpNo.substring(0,3);
			var entprRespsibHpNo2 = entprRespsibHpNo.substring(3,7);
			var entprRespsibHpNo3 = entprRespsibHpNo.substring(7);
		
		$('#entprRespsibHpNo1').val(entprRespsibHpNo1);
		$('#entprRespsibHpNo2').val(entprRespsibHpNo2);
		$('#entprRespsibHpNo3').val(entprRespsibHpNo3);

		
		
		/* 사업분야코드 담기 */
		var largeBussAreaCd = '${detail.largeBussAreaCd}';
		var mediumBussAreaCd = '${detail.mediumBussAreaCd}';
		$('#largeBussAreaCd').val(largeBussAreaCd);
		largeBussAreaCdSelectBox(mediumBussAreaCd);

		//추가버튼 클릭
		$("#employeeBtn").click(function(){
			$("#EmployeePop1").show();
		});
		//취소버튼 클릭
		$(".closeBtn2").click(function(){
			$("#EmployeePop1").hide();
		});
		//취소버튼 클릭
		$(".closeBtn4").click(function(){
			$("#EmployeePop4").hide();
		});


		//취소버튼 클릭
		$(".closeBtn").click(function(){
			$("#businessPop1").hide();
		});
		//취소버튼 클릭
		$(".btn_close closeBtn2").click(function(){
			$("#businessPop1").hide();
		});
		
		
		//취소버튼 클릭
		$(".upcloseBtn2").click(function(){
			$("#businessPop2").hide();
		});
		//취소버튼 클릭
		$(".btn_close upcloseBtn2").click(function(){
			$("#businessPop2").hide();
		});
		
		
		$("#businessBtn").click(function(){
			$("#businessPop").show();
	 	});
		
		$(".closeBtn").click(function(){
			$("#businessPop").hide();
	 	});
		
		$(".closeBtn2").click(function(){
			$("#businessPop").hide();
	 	});	

		$("#resultBtn1").click(function(){
			$("#businessPop1").show();
	 	});
		
		$(".closeBtn2").click(function(){
			$("#businessPop1").hide();
	 	});

		$("#ERaddBtn").click(function(){
			$("#enterpriseResultPop1").show();
		});
		
		$(".ERcloseBtn").click(function(){
			$("#enterpriseResultPop1").hide();
		});

		$(".ERcloseBtn2").click(function(){
			$("#enterpriseResultPop2").hide();
		});
	});
//$(document).ready 종료
	
	
	
	
	
	/*셀렉트*/
	function largeBussAreaCdSelectBox(dataOption){
		var selectBoxData = $("#largeBussAreaCd").val();
	    var selectOption = dataOption;
 		$.ajax({
 			type : 'post',
 			url:'/db/selectOnchange.do',
 			data: {
 						"selectBoxData" : selectBoxData
 					},
 			dataType: 'json',
 	 		success: function(data) {
 	 			var htmls = "";
 	 			if(data.length < 1){
 	 			} else {
 	                     $(data.data).each(function(){
 	 	                    htmls +='<option value="' + this.commonCd + '">' + this.commonNm + '</>'; 
 	                 	});	//each end
 	 			};
 	 			//console.log(data.data);
 	 			//alert(htmls);
 	 			$("#mediumBussAreaCd").html(htmls);
	 	 			if(selectOption.length > 0){
	 	 				$('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
	 	 			}
 	            },  
 			error:function(request,status,error){ //ajax 오류인경우  
 				alert("작업중 에러가 발생했습니다.");      
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			} 
 		});
	}
	/*캘린더*/
	  $(document).ready(function dis() {
		  var clareCalendar = {
		   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   dayNamesMin: ['일','월','화','수','목','금','토'],
		   weekHeader: 'Wk',
		   dateFormat: 'yy-mm-dd', //형식(20120303)
		   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
		   changeMonth: true, //월변경가능
		   changeYear: true, //년변경가능
		   showMonthAfterYear: true, //년 뒤에 월 표시
		   buttonImageOnly: false, //이미지표시
		   buttonText: '달력선택', //버튼 텍스트 표시
		   //buttonImage: '../calendar.gif', //이미지주소
		   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
		   yearRange: '1930:2020' //1950년부터 2020년까지
		  };
		  $(".date").datepicker(clareCalendar);
		  
		  //$("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
		  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
		 });
	
/*주소1*/
	function openDaumPostcode(){
			
			new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                extraRoadAddr += data.bname;
				            }
				            // 건물명이 있고, 공동주택일 경우 추가한다.
				            if(data.buildingName !== '' && data.apartment === 'Y'){
				               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				            }
				            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				            if(extraRoadAddr !== ''){
				                extraRoadAddr = ' (' + extraRoadAddr + ')';
				            }
				            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				            if(fullRoadAddr !== ''){
				                fullRoadAddr += extraRoadAddr;
				            }

				            // 우편번호와 주소 정보를 해당 필드에 넣는다.
				            document.getElementById('entprHeadAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
					}
			}).open();
		}
	/*주소2*/
		function openDaumPostcode1(){
			
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if(fullRoadAddr !== ''){
						fullRoadAddr += extraRoadAddr;
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('entprBranchAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
				}
			}).open();
		}
/*------------------------------------------------------------------------------------------------------------*/
/*기업 성과 관리*/

/*성과관리 추가*/
	$(document).ready(function () {
$("#ERsaveBtn").click(function(){
			var formData = new FormData();
			alert("g2");
			formData.append("memberId",$('#memberId').val());
			formData.append("entprResultYearCd",$('#entprResultYearCd').val());
			formData.append("entprResultQtaCd",$('#entprResultQtaCd').val());
			formData.append("entprCapitalamt",$('#entprCapitalamt').val()); 
			formData.append("entprResultTakeAmt",$('#entprResultTakeAmt').val());
			formData.append("entprResultEmpCnt",$('#entprResultEmpCnt').val());
			
			$.ajax({
				type : 'post',
				url:'/db/memberenterpriseResultInsert.do',
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
						document.getElementById('entprResultYearCd').value="";
						document.getElementById('entprResultQtaCd').value="";
						document.getElementById('entprCapitalAmt').value="";
						document.getElementById('entprEmployeeEmail').value="";
						document.getElementById('entprResultTakeAmt').value="";
						$("#enterpriseResultPop1").hide();
						showCompanyList();
						alert("등록이 완료 되었습니다.");
					}
				},  
				error:function(request,status,error){ //ajax 오류인경우  
					alert("작업중 에러가 발생했습니다.");      
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
/*성과관리 수정버튼 클릭*/
$("#ERsaveBtn2").click(function(){
	var formData = new FormData();
	formData.append("memberId",$('#memberId').val());
	formData.append("enterpriseIdx",$('#upenterpriseIdx').val());
	formData.append("entprResultYearCd",$('#upentprResultYearCd').val());
	formData.append("entprResultQtaCd",$('#upentprResultQtaCd').val());
	formData.append("entprCapitalAmt",$('#upentprCapitalAmt').val()); 
	formData.append("entprResultTakeAmt",$('#upentprResultTakeAmt').val());
	formData.append("entprResultEmpCnt",$('#upentprResultEmpCnt').val());
	
	$.ajax({
		type : 'post',
		url:'/db/memberEnterpriseResultUpdate.do',
		enctype: 'multipart/form-data',
		data: formData,
		contentType:false,		
		processData:false,
		dataType: 'json',
		success : function(data) {
			if(data.returnCode == 0 || data.returnCode1 == 0){
				alert("수정이 취소되었습니다..");
				return;
			}else{
				alert("수정이 완료되었습니다..");
				document.getElementById('upenterpriseIdx').value="";
				document.getElementById('upentprResultYearCd').value="";
				document.getElementById('upentprResultQtaCd').value="";
				document.getElementById('upentprCapitalAmt').value="";
				document.getElementById('upentprEmployeeEmail').value="";
				document.getElementById('upentprResultTakeAmt').value="";
				$("#enterpriseResultPop2").hide();
				showCompanyMinList(); 
			}
		},  
		error:function(request,status,error){ //ajax 오류인경우  
			alert("작업중 에러가 발생했습니다.");      
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});
		
	});
	
	/* 기업성과관리  수정*/
	function fn_updateEr(enterpriseIdx, entprResultYearCd, entprResultQtaCd, entprCapitalAmt, entprResultTakeAmt, entprResultEmpCnt){
		document.getElementById('upenterpriseIdx').value=enterpriseIdx;
		document.getElementById('upentprResultYearCd').value=entprResultYearCd;
		document.getElementById('upentprResultQtaCd').value=entprResultQtaCd;
		document.getElementById('upentprCapitalAmt').value=entprCapitalAmt;
		document.getElementById('upentprResultTakeAmt').value=entprResultTakeAmt;
		document.getElementById('upentprResultEmpCnt').value=entprResultEmpCnt;
		$("#enterpriseResultPop2").show();
	}
/*기업성과 리스트 불러오기*/
		function showCompanyList(){
			//var memberId =  $("#memberId").val();
			var formData = new FormData();
			formData.append('memberId',$("#memberId").val());
			$.ajax({
				type: 'post',
				data: formData,
				processData:false,
				dataType: 'json',
				contentType : false,
				url: "/db/myCompanyInformationEnterpriseResult.do",
				success: function(data) {
					var htmls = "";
					var cnt =0;
					if(data.length < 1){
					} else {
		                    $(data.data).each(function(){

			                    htmls +='<tr>'; 
			                    
			                    htmls += '<td><input type="hidden"  id="totcnt' + cnt + '" value="' + this.enterpriseIdx + '"/><span>' + this.entprResultYearCd + '년</span></td>';
			                    htmls += '<td><span>' + this.entprResultQtaCd + '</span></td>';
			                    htmls += '<td><span>' + this.entprCapitalAmt +'원</span></td>';
			                    htmls += '<td><span>' + this.entprResultTakeAmt + '원</span></td>';
			                    htmls += '<td><span>' + this.entprResultEmpCnt + '명</span></td>';
			                    htmls +="<td><button type='button' class='txtbtn floatR ERDelBtn'>삭제</button><button type='button' onclick='fn_updateEr(\"" + this.enterpriseIdx + "\", \"" + this.entprResultYearCd + "\", \"" + this.entprResultQtaCd + "\", \"" + this.entprCapitalAmt + "\", \"" + this.entprResultTakeAmt  + "\", \"" + this.entprResultEmpCnt + "\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
			                    htmls += '</tr>';
			                    cnt++;

		                	});	//each end

					};
					console.log(data.data);
					//alert(htmls);
					$("#resultTbody4").html(htmls);
		               
		           }	   // Ajax success end
			});	// Ajax end
		}
		

/*기업성과 선택 삭제*/
		$(document).on("click",".ERDelBtn",function(){
			var memberId = $('#memberId').val();
			var delRow = $(this).closest('tr').prevAll().length;
			delRowId = "#totcnt"+delRow;
			var enterpriseIdx = $(delRowId).val();

			$.ajax({
				type : 'post',
				url:'/db/memberEnterpriseResultDelete.do',
				enctype: 'multipart/form-data',
				data: {
							"memberId" : memberId,
							"enterpriseIdx" : enterpriseIdx
						},
				dataType: 'json',
				success : function(data) {
					if(data.a == 1 ){
						alert("삭제가 완료 되었습니다.");
						showCompanyList();
					}else{
						alert("삭제에 실패했습니다.");
						return;
					}
				},  
				error:function(request,status,error){ //ajax 오류인경우  
					alert("작업중 에러가 발생했습니다.");      
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				} 
			});
		});

/*------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------*/
/*진흥원 조회*/
	function showBussList(){
		//var memberId =  $("#memberId").val();
		var formData = new FormData();
		formData.append('memberId',$("#memberId").val());
		
		//alert(memberId);//아이디는 있다고 나옴 데이터를 넘기면 
		$.ajax({
			type: 'post',
			data: formData,
			processData:false,
			dataType: 'json',
			contentType : false,
		url: "/db/myCompanyInformationEnterpriseJcepBuss.do",
		success: function(data) {
			var htmls = "";
			var cnt =0;
			if(data.length < 1){
			} else {
                    $(data.data).each(function(){

	                    htmls +='<tr>'; 
	                    
	                    htmls += '<td><span id="bussAnncemntNo' + cnt + '">' + this.bussAnncemntNo + '</span></td>';
	                    htmls += '<td><span>' + this.bussAnncemntNm + '</span></td>';
	                    htmls += '<td><span>' + this.bussFrDt +' ~ '+this.bussToDt + '</span></td>';
	                    htmls += '<td><span>' + this.bussCostAmt +'</span></td>';
	                    htmls += '<td><span>' + this.entprCreatJobCnt + '</span></td>';
	                    htmls += '<td><span>' + this.entprBussYn + '</span></td>';
	                    if($.trim(this.applicStCd)=='투자예정'){
							if(!this.orgFileNm){
								htmls += '<td><span href="#"></span></td>';
							}else{
								htmls += '<td><span href="#">' + this.orgFileNm + '</span></td>';					
							}
						}else{
							if(!this.orgFileNm){
								htmls += '<td><span></span></td>';
							}else{
								htmls += '<td><span>' + this.orgFileNm + '</span></td>';
							}
							
						}
						if(!this.bussDeptCd){
		                    htmls += '<td><span></span></td>';							
						}else{
		                    htmls += '<td><span>'  +this.bussDeptCd + '</span></td>';							
						}
						if(!this.applicStCd){
		                    htmls += '<td><span></span></td>';							
						}else{
		                    htmls += '<td><span>' + this.applicStCd + '</span></td>';							
						}
	                    htmls += '</tr>';
	                    cnt++;

                	});	//each end

			};
			//console.log(data.data);
			//alert(htmls);
			$("#resultTbody").html(htmls);

           }	   // Ajax success end
	});	// Ajax end
	};
	/*------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------*/

$(document).ready(function () {
/*지적재산권 추가*/
 $("#bussSaveBtn").click(function(){
		var formData = new FormData();
		formData.append("memberId",$('#memberId').val());
		formData.append("intltProptBussNm",$('#intltProptBussNm').val());
		formData.append("intltProptPerfNm",$('#intltProptPerfNm').val());
		formData.append("intltProptCd",$('#intltProptCd').val()); 
		formData.append("regFormCd",$('#regFormCd').val());
		formData.append("regNationCd",$('#regNationCd').val());
		formData.append("intltProptyDt",$('#intltProptyDt').val());
		formData.append("intltProptRegNo",$('#intltProptRegNo').val());
		formData.append("remark",$('#remark').val());
		
		$.ajax({
			type : 'post',
			url:'/db/memberJecpInsert.do',
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
					document.getElementById('intltProptBussNm').value="";
					document.getElementById('intltProptPerfNm').value="";
					document.getElementById('intltProptCd').value="";
					document.getElementById('regFormCd').value="";
					document.getElementById('regNationCd').value="";
					document.getElementById('intltProptRegNo').value="";
					document.getElementById('intltProptyDt').value="";
					document.getElementById('remark').value="";
					$("#businessPop1").hide();
					showJecpList();
					alert("등록이 완료 되었습니다.");
				}
			},  
			error:function(request,status,error){ //ajax 오류인경우  
				alert("작업중 에러가 발생했습니다.");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});


/*지적재산권  수정*/
	$("#updateBtn2").click(function(){
		var formData = new FormData();
		formData.append("memberId",$('#memberId').val());
		formData.append("enterpriseIdx",$('#uptotcnt2').val());
		formData.append("intltProptBussNm",$('#upintltProptBussNm').val());
		formData.append("intltProptPerfNm",$('#upintltProptPerfNm').val());
		formData.append("intltProptCd",$('#upintltProptCd').val()); 
		formData.append("regFormCd",$('#upregFormCd').val());
		formData.append("regNationCd",$('#upregNationCd').val());
		formData.append("intltProptRegNo",$('#upintltProptRegNo').val());
		formData.append("intltProptyDt",$('#upintltProptyDt').val());
		formData.append("remark",$('#upremark').val());

		$.ajax({
			type : 'post',
			url:'/db/memberJecpUpdate.do',
			enctype: 'multipart/form-data',
			data: formData,
			contentType:false,		
			processData:false,
			dataType: 'json',
			success : function(data) {
				if(data.returnCode == 0 || data.returnCode1 == 0){
					alert("수정이 취소되었습니다..");
					return;
				}else{
					alert("수정이 완료되었습니다..");
					document.getElementById('uptotcnt2').value="";
					document.getElementById('upintltProptBussNm').value="";
					document.getElementById('upintltProptPerfNm').value="";
					document.getElementById('upintltProptCd').value="";
					document.getElementById('upregFormCd').value="";
					document.getElementById('upregNationCd').value="";
					document.getElementById('upintltProptRegNo').value="";
					document.getElementById('upintltProptyDt').value="";
					document.getElementById('upremark').value="";
					$("#businessPop2").hide();
					showJecpList(); 
				}
			},  
			error:function(request,status,error){ //ajax 오류인경우  
				alert("작업중 에러가 발생했습니다.");      
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
/* 지적재산권 현황 수정*/
function fn_update_jecp(totcnt, ntltProptBussNm, ntltProptPerfNm, intltProptCd, regNationCd, regFormCd, intltProptRegNo,intltProptyDt, remark){
	document.getElementById('uptotcnt2').value=totcnt;
	document.getElementById('upintltProptBussNm').value=ntltProptBussNm;
	document.getElementById('upintltProptPerfNm').value=ntltProptPerfNm;
	document.getElementById('upintltProptCd').value=intltProptCd;
	document.getElementById('upregNationCd').value=regNationCd;
	document.getElementById('upregFormCd').value=regFormCd;
	document.getElementById('upintltProptRegNo').value=intltProptRegNo;
	document.getElementById('upintltProptyDt').value=intltProptyDt;
	document.getElementById('upremark').value=remark;
	$("#businessPop2").show();
}
	
	
	
/*지적재산권 조회*/
	function showJecpList(){
		//var memberId =  $("#memberId").val();
		var formData = new FormData();
		formData.append('memberId',$("#memberId").val());

		//alert(memberId);//아이디는 있다고 나옴 데이터를 넘기면 
		$.ajax({
			type: 'post',
			data: formData,
			processData:false,
			dataType: 'json',
			contentType : false,		
			url: "/db/myCompanyInformationIntltpropty.do",
			success: function(data) {
			var htmls = "";
			var cnt =0;
			if(data.length < 1){
			} else {

                    $(data.data).each(function(){

	                    htmls +='<tr>'; 
	                    htmls +='<td><span id="enterpriseIdx' + cnt + '">'+ this.totcnt + '</td>';
	                    htmls +='<td>' + this.ntltProptBussNm + '</td>';
	                    htmls +='<td>' + this.ntltProptPerfNm + '</td>';
	                    htmls +='<td>' + this.intltProptCd + '</td>';
	                    htmls +='<td>' + this.regFormCd + '</td>';
	                    htmls +='<td>' + this.regNationCd + '</td>';
	                    htmls +='<td>' + this.intltProptRegNo + '</td>';
	                    if(!this.intltProptyDt){
		                    htmls +='<td></td>';	                    	
	                    }else{
		                    htmls +='<td>' + this.intltProptyDt + '</td>';
	                    }
						if(!this.remark){
		                    htmls +='<td></td>';
		                    }else{
		                    htmls +='<td>' + this.remark + '</td>';
						}

	                    htmls +="<td><button type='button' class='txtbtn floatR deljecpBtn'>삭제</button><button type='button' onclick='fn_update_jecp(\"" + this.totcnt + "\", \"" + this.ntltProptBussNm + "\", \"" + this.ntltProptPerfNm + "\", \"" + this.intltProptCd + "\", \"" + this.regNationCd + "\", \"" + this.regFormCd +"\", \"" + this.intltProptRegNo +"\", \"" + this.intltProptyDt +"\", \"" + this.remark  +"\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
	                    htmls +='</tr>';
	                    cnt++;

                	});	//each end

			};
			//console.log(data.data);
			//alert(htmls);
			$("#resultTbody1").html(htmls);

           }	   // Ajax success end
	});	// Ajax end
};

/*지적재산권 삭제*/
	$(document).on("click",".deljecpBtn",function(){
		var memberId = $("#memberId").val();
		var delRow = $(this).closest('tr').prevAll().length;

		var enterpriseIdx = $("#enterpriseIdx"+delRow).text();
		$.ajax({
			type : 'post',
			url:'/db/membereJecpDelete.do',
			enctype: 'multipart/form-data',
			data: {
						"memberId" : memberId,
						"enterpriseIdx" : enterpriseIdx
					},
			dataType: 'json',
			success : function(data) {
				if(data.returnCode == 0 || data.returnCode1 == 0){
					alert("삭제에 실패했습니다.");
					showJecpList();			//지적재산권 현황 정보 자동으로 불러오기

				}else{
					alert("삭제가 완료 되었습니다.");
					showJecpList();

				}
			},  
			error:function(request,status,error){ //ajax 오류인경우  
				alert("작업중 에러가 발생했습니다.");      
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			} 
		});
	});
	/*------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------*/
$(document).ready(function () {
	/*기업사원정보 추가완료 버튼 클릭시*/
		$("#saveBtn3").click(function(){
			var formData = new FormData();
			formData.append("memberId",$('#memberId').val());
			formData.append("entprEmployeeNm",$('#entprEmployeeNm').val());
			formData.append("entprEmployeeDept",$('#entprEmployeeDept').val());
			formData.append("entprEmployeePosition",$('#entprEmployeePosition').val()); 
			formData.append("entprEmployeeEmail",$('#entprEmployeeEmail').val());
			formData.append("entprEmployeePhone",$('#entprEmployeePhone').val());
			formData.append("fileupload", $("input[name=fileupload]")[0].files[0]);			

			$.ajax({
				type : 'post',
				url:'/db/memberemployeeInfomation.do',
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
						document.getElementById('entprEmployeeNm').value="";
						document.getElementById('entprEmployeeDept').value="";
						document.getElementById('entprEmployeePosition').value="";
						document.getElementById('entprEmployeeEmail').value="";
						document.getElementById('entprEmployeePhone').value="";
						document.getElementById('entprEmployeePhone').value="";
						var file = document.getElementById("orgFileNm"),
							clone = file.cloneNode(true);
						file.parentNode.replaceChild(clone, file);
						$("#EmployeePop1").hide();
						showemployeesList();
						alert("등록이 완료 되었습니다.");
					}
				},  
				error:function(request,status,error){ //ajax 오류인경우  
					alert("작업중 에러가 발생했습니다.");      
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});

		/*기업사원 정보 수정완료 버튼 클릭시*/
		$("#saveBtn4").click(function(){
			var formData = new FormData();
			formData.append("memberId",$('#memberId').val());
			formData.append("uptotcnt",$('#uptotcnt').val());
			formData.append("entprEmployeeNm",$('#upEntprEmployeeNm').val());
			formData.append("entprEmployeeDept",$('#upentprEmployeeDept').val());
			formData.append("entprEmployeePosition",$('#upentprEmployeePosition').val()); 
			formData.append("entprEmployeeEmail",$('#upentprEmployeeEmail').val());
			formData.append("entprEmployeePhone",$('#upentprEmployeePhone').val());
			formData.append("fileupload", $("input[name=upfileupload]")[0].files[0]);			

			$.ajax({
				type : 'post',
				url:'/db/memberemployeeUpdate.do',
				enctype: 'multipart/form-data',
				data: formData,
				contentType:false,		
				processData:false,
				dataType: 'json',
				success : function(data) {
					if(data.returnCode == 0 || data.returnCode1 == 0){
						alert("수정이 취소되었습니다..");
						return;
					}else{
						alert("수정이 완료되었습니다..");
						document.getElementById('uptotcnt').value="";
						document.getElementById('upEntprEmployeeNm').value="";
						document.getElementById('upentprEmployeeDept').value="";
						document.getElementById('upentprEmployeePosition').value="";
						document.getElementById('upentprEmployeeEmail').value="";
						document.getElementById('upentprEmployeePhone').value="";
						var file = document.getElementById("uporgFileNm"),
							clone = file.cloneNode(true);
						file.parentNode.replaceChild(clone, file);
						$("#EmployeePop4").hide();
						showemployeesList(); 

					}
				},  
				error:function(request,status,error){ //ajax 오류인경우  
					alert("작업중 에러가 발생했습니다.");      
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	
});
	/* 기업회원정보 수정*/
	function fn_update_employee(totcnt, entprEmployeeNm, entprEmployeeDept, entprEmployeePosition, entprEmployeeEmail, entprEmployeePhone, orgFileNm, remark){

		document.getElementById('uptotcnt').value=totcnt;
		document.getElementById('upEntprEmployeeNm').value=entprEmployeeNm;
		document.getElementById('upentprEmployeeDept').value=entprEmployeeDept;
		document.getElementById('upentprEmployeePosition').value=entprEmployeePosition;
		document.getElementById('upentprEmployeeEmail').value=entprEmployeeEmail;
		document.getElementById('upentprEmployeePhone').value=entprEmployeePhone;
		$("#EmployeePop4").show();		
	}
	
 	function showemployeesList(){
 		var formData = new FormData();
 		formData.append('memberId',$("#memberId").val());
 		
 		$.ajax({
 			type: 'post',
 			data: formData,
 			processData:false,
 			dataType: 'json',
 			contentType : false,
 			url: "/db/myCompanyInformationemployee.do",
	 		success: function(data) {
 			var htmls = "";
 			var cnt =0;
 			if(data.length < 1){
 			} else {
                     $(data.data).each(function(){

 	                    htmls +='<tr>'; 
 	                    htmls +=	'<td><span id="enterpriseIdx'+cnt+'"">'+this.totcnt+'</span></td>';
 	                    htmls +='<td>'+this.entprEmployeeNm+'</td>';
 	                    htmls +='<td>'+this.entprEmployeeDept+'</td>';
 	                    htmls +='<td>'+this.entprEmployeePosition+'</td>';
 	                    htmls +='<td>'+this.entprEmployeeEmail+'</td>';
 	                    htmls +='<td>'+this.entprEmployeePhone+'</td>';
 	                    if(!this.orgFileNm){
 	 	                    htmls +='<td><span>없음</span></td>';
 	                    }else{
 	 	                    htmls +='<td>'+this.orgFileNm+'</td>'; 	                		   	                    	
 	                    }
 	                    htmls +="<td><button type='button' class='txtbtn floatR delBtn'>삭제</button><button type='button' onclick='fn_update_employee(\"" + this.totcnt + "\", \"" + this.entprEmployeeNm + "\", \"" + this.entprEmployeeDept + "\", \"" + this.entprEmployeePosition + "\", \"" + this.entprEmployeeEmail + "\", \"" + this.entprEmployeePhone +"\", \"" + this.orgFileNm +"\", \"" + this.remark +"\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
 	                    htmls +='</tr>';
 	                    cnt++;

                 	});	//each end

 			};
 			//console.log(data.data);
 			//alert(htmls);
 			$("#resultTbody2").html(htmls);
                
            }	   // Ajax success end
 	});	// Ajax end
}	
 	//삭제기능 
 	$(document).on("click",".delBtn",function(){
 		var memberId = $("#memberId").val();
 		var delRow = $(this).closest('tr').prevAll().length;

 		var enterpriseIdx = $("#enterpriseIdx"+delRow).text();
 		$.ajax({
 			type : 'post',
 			url:'/db/memberemployeeDelete.do',
 			enctype: 'multipart/form-data',
 			data: {
 						"memberId" : memberId,
 						"enterpriseIdx" : enterpriseIdx
 					},
 			dataType: 'json',
 			success : function(data) {
 				if(data.a == 1){
 					alert("삭제가 완료 되었습니다.");
 					showemployeesList(); 
 				}else{
 					showemployeesList(); 
 				}
 			},  
 			error:function(request,status,error){ //ajax 오류인경우  
 				alert("작업중 에러가 발생했습니다.");      
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			} 
 		});
 	});
	/*------------------------------------------------------------------------------------------------------------*/

	//전체수정
 	$(document).ready(function () {
	$("#okok").click(function(){
		var	 formData = new FormData();
		/*	대표 이메일*/
		var 	entprCeoEmail 		=   $('#entprCeoEmail1').val();
				entprCeoEmail 		+= "@";
				entprCeoEmail 		+= $('#entprCeoEmail2').val();
		/*	자사 대표 전화번호*/
		var 	entprBranchTel 	=   $('#entprBranchTel1').val();
				entprBranchTel 	+= $('#entprBranchTel2').val();
				entprBranchTel 	+= $('#entprBranchTel3').val();

		/*	본사 대표 전화번호*/
		var 	entprHeadTel 		=   $('#entprHeadTel1').val();
				entprHeadTel 		+= $('#entprHeadTel2').val();
				entprHeadTel 		+= $('#entprHeadTel3').val();
		var medium_buss_area_cd = $('#mediumBussAreaCd').val();

		
		formData.append("memberId",$('#memberId').val());
		formData.append("entprSite",$('#entprSite').val());
		formData.append("entprComRegNum",$('#entprComRegNum').val()); 
		formData.append("largeBussAreaCd",$('#largeBussAreaCd').val());
		formData.append("mediumBussAreaCd",medium_buss_area_cd);
		formData.append("entprCeoEmail",entprCeoEmail);
		formData.append("entprHeadAddr",$('#entprHeadAddr').val());
		formData.append("entprHeadDetailAddr",$('#entprHeadDetailAddr').val());
		formData.append("entprHeadTel",entprHeadTel);
		formData.append("entprBranchAddr",$('#entprBranchAddr').val());
		formData.append("entprBranchDetailAddr",$('#entprBranchDetailAddr').val());
		formData.append("entprBranchTel",entprBranchTel);

		formData.append("entprEstDt",$('#entprEstDt').val());
		formData.append("entprCapitalAmt",$('#entprCapitalAmt').val());
	$.ajax({
			type : 'post',
			url:'/db/mypageCompanyUpdate.do',
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
                	window.location.href="/db/enterprise/enterpriseInformationManagementList.do";
				}
			},  
			error:function(request,status,error){ //ajax 오류인경우  
				alert("작업중 에러가 발생했습니다.");      
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
	

</script>
</head>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>기업정보 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업정보 수정</b></h1>
					</div>
				</div>
		
			<!--  수정 form S -->
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 수정 기본 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">회사명 * </th>
											<td>
												<span>${detail.entprNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 E-mail </th>
											<td>
												<input type="text" id="entprRespsibEmail1" name="entprRespsibEmail1" value="" style="width:100px;" maxLength="20"/>@
												<select id="entprRespsibEmail2" name="entprRespsibEmail2">
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
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">담당자명 * </th>
											<td>
												<span>${detail.entprRespsibNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 연락처 </th>
											<td>
									<select style="width: 50px;margin-right: 5px;" id="entprRespsibHpNo1" name="entprRespsibHpNo1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>-
									<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprRespsibHpNo2" name="entprRespsibHpNo2" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
									<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprRespsibHpNo3" name="entprRespsibHpNo3" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">대표자 * </th>
											<td>
												<span>${detail.entprCeo}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">업종명 </th>
											<td>
												<input type="text" id="entprTypeNm" name="entprTypeNm" class="" value="${detail.entprTypeNm}" style="width:27%">
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업자등록번호 * </th>
											<td style="vertical-align:middle;">
												<span>${detail.entprComRegNum}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 E-Mail </th>
											<td>
													<input type="text" id="entprCeoEmail1" name="entprCeoEmail1" value="" style="width:100px;"/>@
													<select id="entprCeoEmail2" name="entprCeoEmail2">
														<option value="naver.com" 	>naver.com</option>
														<option value="google.com"	>google.com</option>
														<option value="yahoo.com"	>yahoo.com</option>
														<option value="daum.com"	>daum.com</option>
														<option value="hanmail.net" >hanmail.net</option>
														<option value="nate.com"    >nate.com</option>
													</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업분야 </th>
											<td style="vertical-align:middle;">
												<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox('')" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.commonCd}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" style="position:relative;">
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 </th>
											<td>
													<input type="text" id="entprSite" name="entprSite" class="" value="${detail.entprSite}" style="width:27%">
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">본사 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="" value="${detail.entprHeadAddr}" style="width:73%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 120px; " onclick="javascript:openDaumPostcode()">우편번호 검색</button>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화 </th>
											<td>
												<select style="width: 8%;margin-right: 5px;" id="entprHeadTel1" name="entprHeadTel1">
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
												</select>-
												<input type="text" style="width: 40px;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprHeadTel2" name="entprHeadTel2" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px;margin-left: 5px; text-align: center;" id="entprHeadTel3" name="entprHeadTel3" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
											</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprHeadDetailAddr" name="entprHeadDetailAddr" class="" value="${detail.entprHeadDetailAddr}" style="width:93%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX </th>
											<td>
												<input type="text" id="entprHeadFax1" name="entprHeadFax1" value="" style="width:51px; text-align: center;" maxlength="3"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												<span>-</span>
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprHeadFax2" name="entprHeadFax2" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprHeadFax3" name="entprHeadFax3" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">지사 </th>
											<td>
													<input type="text" id="entprBranchAddr" name="entprBranchAddr" class="" value="${detail.entprBranchAddr}" style="width:73%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 120px; " onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화 </th>
											<td>
												<select style="width: 50px;margin-right: 5px;" id="entprBranchTel1" name="entprBranchTel1">
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
												</select>-
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprBranchTel2" name="entprBranchTel2" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprBranchTel3" name="entprBranchTel3" value="$" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>	
												</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprBranchDetailAddr" name="entprBranchDetailAddr" class="" value="${detail.entprBranchDetailAddr}" style="width:93%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX </th>
											<td>
												<input type="text" id="entprBranchFax1" name="entprBranchFax1"  value="" style="width:51px; text-align: center;"  maxlength="3"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												<span >-</span>
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprBranchFax2" name="entprBranchFax2" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprBranchFax3" name="entprBranchFax3" value="" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">설립일 *</th>
											<td style="vertical-align:middle;">
												<input type="text" id="entprEstDt" name="entprEstDt" class="date" value="${detail.entprEstDt}" maxlength="10" style="width: 15%">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자본금</th>
											<td>
													<input type="text" id="entprCapitalAmt" name="entprCapitalAmt" class="" value="${detail.entprCapitalAmt}"  onkeyup='inputNumberFormat(this);' maxlength="10" style="width:27%">
											</td>
										</tr>
										
<!-- 성과관리 -->
									</tbody>
								</table>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 성과 관리</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" id="ERaddBtn" class="btn btn-primary" >추가</button>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>수행년도</th>
											<th>분기</th>
											<th>자본금</th>
											<th>매출액</th>
											<th>직원수</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="resultTbody4">
									</tbody>
								</table>
								<br>
<!--진흥원 수혜사업-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 진흥원 수혜사업</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									</div>
								</div>
								<table id="busProStusTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
									<tr>
										<th>공고번호</th>
										<th>사업명</th>
										<th>사업기간</th>
										<th>사업비용</th>
										<th>고용창출</th>
										<th>완료여부</th>
										<th>증빙서류</th>
										<th>사업부서</th>
										<th>승인상태</th>
									</tr>
									</thead>
									<tbody id="resultTbody">
									</tbody>
								</table>
								<br>
<!--지적재산권 현황-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 지적재산권 현황</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary"  id="resultBtn1">추가</button>
									</div>
								</div>
								<table id="resultTable1" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
									<tr>
										<th>NO</th>
										<th>사업명</th>
										<th>실적명</th>
										<th>분류</th>
										<th>등록형태</th>
										<th>국가</th>
										<th>증빙</th>
										<th>일자</th>
										<th>비고</th>
										<th></th>
									</tr>
									</thead>
									<tbody id="resultTbody1">
									</tbody>
								</table>

								<br>
<!--기업사원 정보-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 기업사원 정보</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary"  id=employeeBtn>추가</button>
									</div>
								</div>
								<table id="resultTable1" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
									<tr>
										<th>NO</th>
										<th>성명</th>
										<th>부서</th>
										<th>직책</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>4대보험</th>
										<th></th>
									</tr>
									</thead>
									<tbody id="resultTbody2">
									</tbody>
								</table>
								<br>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/enterprise/enterpriseInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<button type="button" class="btn btn-primary" id="okok">저장</button>
								</div>
							</div>
						</form>
					</div>
				</section>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
	 
   <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
   <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
   <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
   <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 

<!-- 지적재산권 정보 추가 -->
<div class="layer" style="display: none;" id="businessPop1">
	<form id="jecpFrm" method="post" >
	<div class="box boxw600" style="height: 630px; margin-top: -270px;">
		<div class="ti">지적 재산권 정보 추가하기 </div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>사업명</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptBussNm" name="intltProptBussNm" value=""/>
					</td>
				</tr>
				<tr>
					<th>실적명</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptPerfNm" name="intltProptPerfNm" value=""/>	
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select id="intltProptCd" name="intltProptCd">
							<c:forEach var="propt" items="${propt}" varStatus="status" >
							 	<option value="${propt.commonNm}" <c:if test="${propt.commonNm=='특허'}">selected</c:if> >${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="regFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonNm}" <c:if test="${regForm.commonNm=='출원'}">selected</c:if> >${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="regNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonNm}" <c:if test="${nation.commonNm=='대한민국'}">selected</c:if> >${nation.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>증빙자료번호</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptRegNo" name="intltProptRegNo" value="" maxlength="20" placeholder="10-1234567-1234"/>
					</td>
				</tr>
				<tr>
					<th>지적재산권 등록 일자 </th>
					<td>
						<input type="date" style="width: 75%;" id="intltProptyDt" name="intltProptyDt" value="" max="9999-12-31"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" style="width: 75%;" id="remark" name="remark" value=""/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="bussSaveBtn" name="saveBtn">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn2">X</button>
		</div>
	</div>
	</form>
</div>


<!-- 기업 사원 정보-->
<div class="layer" style="display: none;" id="EmployeePop1">
	<div class="box boxw600" style="height: 570px; margin-top: -190px;">
		<div class="ti">기업사원 정보 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="entprEmployeeNm" id="entprEmployeeNm" style="width: 75%;" maxlength="7"onKeyPress="varcheck(document.f.test.value)"/>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<input type="text" name="entprEmployeeDept" id="entprEmployeeDept" style="width:75%" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input type="text" name="entprEmployeePosition" id="entprEmployeePosition" style="width:75%" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="entprEmployeeEmail1" name="entprEmployeeEmail1" value="" style="width:100px;"/>@
						<select id="entprEmployeeEmail2" name="entprEmployeeEmail2">
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
					<th>연락처</th>
					<td>
						<input type="text" name="entprEmployeePhone" id="entprEmployeePhone"  style="width:75%" maxlength="11"onkeyup='inputNumberFormat(this);'/>
					</td>
				</tr>
				<tr>
					<th>4대보험</th>
					<td>
						<input type="file" name="fileupload" id="orgFileNm" style="width:75%"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="saveBtn3" name="saveBtn3">저장하기</button>
				<button type="button" class="closeBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn2">X</button>
		</div>
	</div>	
</div>


<!-- 지적재산권 수정하기 -->
<div class="layer" style="display: none;" id="businessPop2">
	<form>
		<input type="hidden" id="upnumber2" name ="upnumber" value="">
		<input type="hidden" id="uptotcnt2" name ="uptotcnt" value="">	
	<div class="box boxw600" style="height: 630px; margin-top: -270px;">
		<div class="ti">지적 재산권 정보 수정하기 </div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>사업명</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptBussNm" name="intltProptBussNm" value=""/>
					</td>
				</tr>
				<tr>
					<th>실적명</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptPerfNm" name="intltProptPerfNm" value=""/>	
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select id="upintltProptCd" name="intltProptCd">
							<c:forEach var="propt" items="${propt}" varStatus="status" >
							 	<option value="${propt.commonNm}" >${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="upregFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonNm}" >${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="upregNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonNm}" >${nation.commonNm}</option>
						 	</c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>증빙자료번호</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptRegNo" name="intltProptRegNo" value="" placeholder="10-1234567-1234"/>
					</td>
				</tr>
				<tr>
					<th>지적재산권 등록 일자 </th>
					<td>
						<input type="date" style="width: 75%;" id="upintltProptyDt" name="intltProptyDt" value="" oninput="datecheck1()" max="9999-12-31"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" style="width: 75%;" id="upremark" name="remark" value=""/>
					</td>
				</tr>
			</table>			
			<div class="submitbtn">
				<button type="button" id="updateBtn2" name="updateBtn2">수정하기</button>
				<button type="button" class="upcloseBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close upcloseBtn2">X</button>
		</div>
	</div>
	</form>
</div>

<!-- 기업사원정보 수정하기 -->
<div class="layer" style="display: none;" id="EmployeePop4">
	<div class="box boxw600" style="height: 570px; margin-top: -190px;">
		<input type="hidden" id="upnumber" name ="upnumber" value="">
		<input type="hidden" id="uptotcnt" name ="uptotcnt" value="">
		<div class="ti">기업사원 정보 수정하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="entprEmployeeNm" id="upEntprEmployeeNm" value=""style="width: 75%;" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<input type="text" name="entprEmployeeDept" id="upentprEmployeeDept" value="" style="width:75%" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input type="text" name="entprEmployeePosition" id="upentprEmployeePosition" value=""style="width:75%" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="entprEmployeeEmail" id="upentprEmployeeEmail"  value=""style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="entprEmployeePhone" id="upentprEmployeePhone"  value="" maxlength="11" style="width:75%" />
					</td>
				</tr>
				<tr>
					<th>4대보험</th>
					<td>
						<input type="file" name="upfileupload" id="uporgFileNm"value=""style="width:75%"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="saveBtn4" name="saveBtn4">저장하기</button>
				<button type="button" class="closeBtn4">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn4">X</button>
		</div>
	</div>	
</div>


<!-- 성과관리 추가 레이어 20191210 -->
<div class="layer" style="display: none;" id="enterpriseResultPop1">
	<div class="box boxw600" style="height: 470px; margin-top: -190px;">
		<input type="hidden" id="uptotcnt" name ="uptotcnt" value="">
		<div class="ti">성과관리 추가</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
						<select name="entprResultYearCd" id="entprResultYearCd">
							<c:forEach var = "YearCd" items="${YearCd}" varStatus="status" >
							 	<option value="${YearCd.commonNm}" >${YearCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="entprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonNm}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalamt" id="entprCapitalamt" value=""style="width:75%" onkeyup='inputNumberFormat(this);'Maxlength="8"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="entprResultTakeAmt"  value=""style="width:75%"onkeyup='inputNumberFormat(this);'Maxlength="8"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="entprResultEmpCnt"  value=""style="width:75% "maxlength="3"onkeyup='inputNumberFormat(this);'/>명
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="ERsaveBtn" name="ERsaveBtn">저장하기</button>
				<button type="button" class="ERcloseBtn">취소</button>	
			</div>
			<button type="button" class="btn_close ERcloseBtn">X</button>
		</div>
	</div>	
</div>

<!-- 성과관리 수정 레이어 20191210 -->
<div class="layer" style="display: none;" id="enterpriseResultPop2">
	<div class="box boxw600" style="height: 470px; margin-top: -190px;">
		<input type="hidden" name ="enterpriseIdx" id="upenterpriseIdx" value="">
		<div class="ti">성과관리 수정</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
					<select name="entprResultYearCd" id="upentprResultYearCd">
							<c:forEach var = "YearCd" items="${YearCd}" varStatus="status" >
							 	<option value="${YearCd.commonNm}" >${YearCd.commonNm}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="upentprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonNm}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalAmt" id="upentprCapitalAmt" value=""style="width:75%" onkeyup='inputNumberFormat(this);'Maxlength="8"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="upentprResultTakeAmt"  value=""style="width:75%"onkeyup='inputNumberFormat(this);'Maxlength="8"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="upentprResultEmpCnt"  value=""style="width:75%" maxlength="3"onkeyup='inputNumberFormat(this);'/>명
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="ERsaveBtn2" name="ERsaveBtn2">저장하기</button>
				<button type="button" class="ERcloseBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close ERcloseBtn2">X</button>
		</div>
	</div>	
</div>
<input type="hidden" id="memberId" name="memberId" value="${detail.memberId}"/>
</body>
</html>