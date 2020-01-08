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
	
	<script type="text/javaScript" >
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
			$('#expertRegNo').val(expertRegNo);
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
	 						document.getElementById('expertDelibrDt').value="";
	 						document.getElementById('expertDelibrTitle').value="";
	 						document.getElementById('remark').value="";
	 						$("#experetPop").hide();
							alert("등록이 완료 되었습니다.");
							expertDeliberateList();

						
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
 

 function largeSpecialAreaCdSelectBox(dataOption){
 	var selectBoxData = $("#largeSpecialAreaCd").val();
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
  			console.log(data.data);
  			//alert(htmls);
  			$("#detailSpecialAreaCd").html(htmls);
  	 			if(selectOption.length > 0){
  	 				$('#detailSpecialAreaCd').val(dataOption).attr('selected', 'selected');
  	 			}
             },  
 		error:function(request,status,error){ //ajax 오류인경우  
 			alert("작업중 에러가 발생했습니다.");      
 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		} 
 	});
 }


 function expertInterestAreaCdSelectBox(dataOption){
 	var selectBoxData = $("#expertInterestAreaCd").val();
     var selectOption = dataOption;
 	$.ajax({
 		type : 'post',
 		url:'/db/selectOnchangeexpertDetailIntrtAreCd.do',
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
  			$("#expertDetailIntrtAreaCd").html(htmls);
  	 			if(selectOption.length > 0){
  	 				$('#expertDetailIntrtAreaCd').val(dataOption).attr('selected', 'selected');
  	 			}
             },  
 		error:function(request,status,error){ //ajax 오류인경우  
 			alert("작업중 에러가 발생했습니다.");      
 			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		} 
 	});
 }



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
 		            document.getElementById('expertOffiAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
 			}
 	}).open();
 }

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
 		            document.getElementById('expertHomeAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
 			}
 	}).open();
 }


 $(document).ready(function () {
 	//전문가 수당 지급정보 - 생년월일
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
 	
 	  
 	  
 	  //전문가 심의 이력정보 추가버튼클릭
 		$("#experetBtn").click(function(){
 			$("#experetPop").show();
 		});
 		//전문가 심의 이력정보 추가취소버튼 클릭
 		$(".closeBtn").click(function(){
 			$("#experetPop").hide();
 		});
 		$(".upcloseBtn").click(function(){
 			$("#upexperetPop").hide();
 		});
 		
 		$("#ok").click(function(){
 			var	 formData = new FormData();
 			/*	휴대폰*/
 			var 	expertOffiTel 	=   $('#expertOffiTel1').val();
 					expertOffiTel 	+= $('#expertOffiTel2').val();
 					expertOffiTel 	+= $('#expertOffiTel3').val();
 			/*	팩스*/
 			var 	expertOffiFax 		=   $('#expertOffiFax1').val();
 					expertOffiFax 		+= $('#expertOffiFax2').val();
 					expertOffiFax 		+= $('#expertOffiFax3').val();
 			/*	담당자 전화*/
 			var 	benefitRespsibHpNo 	=   $('#benefitRespsibHpNo1').val();
 					benefitRespsibHpNo 	+= $('#benefitRespsibHpNo2').val();
 					benefitRespsibHpNo 	+= $('#benefitRespsibHpNo3').val();
 			formData.append("expertCareerNum",$('#expertCareerNum').val());//경력지수
 			formData.append("largeSpecialAreaCd",$('#largeSpecialAreaCd').val());//전문분야
 			formData.append("detailSpecialAreaCd",$('#detailSpecialAreaCd').val());//세부전문분야
 			formData.append("expertInterestAreaCd",$('#expertInterestAreaCd').val());//관심분야
 			formData.append("expertDetailIntrtAreaCd",$('#expertDetailIntrtAreaCd').val());//세부관심분야
 			formData.append("expertIndsEduCd",$('#expertIndsEduCd').val());//산학연관
 			formData.append("expertStRegNo",$('#expertStRegNo').val());//과학기술인
 			formData.append("expertRegNo",$('#expertRegNo').val());//사업자등록번호
 			formData.append("expertFinalSchoolNm",$('#expertFinalSchoolNm').val());//출신학교
 			formData.append("expertMajorNm",$('#expertMajorNm').val());//전공
 			formData.append("expertFnalEduCd",$('#expertFnalEduCd').val());//학력
 			formData.append("expertHeadAddrNm",$('#expertHeadAddrNm').val());//소속기관
 			formData.append("expertDptmNm",$('#expertDptmNm').val());//해당부서
 			formData.append("expertOffiDutyNm",$('#expertOffiDutyNm').val());//직책
 			formData.append("expertOffiAddr",$('#expertOffiAddr').val());//직장주소1
 			formData.append("expertOffiDetailAddr",$('#expertOffiDetailAddr').val());//직장주소2
 			formData.append("expertHomeAddr",$('#expertHomeAddr').val());//자택주소1
 			formData.append("expertHomeDetailAddr",$('#expertHomeDetailAddr').val());//자택주소2
 			formData.append("benefitBankCd",$('#benefitBankCd').val());//은행
 			formData.append("benefitAccntNo",$('#benefitAccntNo').val());//계좌번호
 			formData.append("benefitBirthDt",$('#benefitBirthDt').val());//생년월일
 			formData.append("expertOffiTel",expertOffiTel);//휴대폰
 			formData.append("expertOffiFax",expertOffiFax);//팩스
 			formData.append("benefitRespsibHpNo",benefitRespsibHpNo);//담당자전화
 			$.ajax({
 				type : 'post',
 				url:'/db/mypageExpertUpdate.do',
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
 	                	window.location.href="/db/expert/expertInformationManagementList.do";
 					}
 				},  
 				error:function(request,status,error){ //ajax 오류인경우  
 					alert("작업중 에러가 발생했습니다.");      
 					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				}
 			});
 		});
 		
 		
 //심의(자문, 평가 등) 이력 수정
 		$("#upexpertBtn").click(function(){
 			var	 formData = new FormData();
 			formData.append("memberId",$('#memberId').val());//아이디
 			alert($('#memberId').val());
 			formData.append("expertHistIdx",$('#upexpertHistIdx').val());//심의일자
 			formData.append("expertDelibrDt",$('#upexpertDelibrDt').val());//심의일자
 			formData.append("expertDelibrTitle",$('#upexpertDelibrTitle').val());//심의제목
 			formData.append("remark",$('#upremark').val());//비고
 			$.ajax({
 				type : 'post',
 				url:'/db/mypageExpertDeliberateUpdate.do',
 				enctype: 'multipart/form-data',
 				data: formData,
 				contentType:false,
 				processData:false,
 				dataType: 'json',
 				success : function(data) {
 					if(data.returnCode == 0 || data.returnCode1 == 0){
 						return;
 					}else{
 						document.getElementById('upexpertHistIdx').value="";
 						document.getElementById('upexpertDelibrDt').value="";
 						document.getElementById('upexpertDelibrTitle').value="";
 						document.getElementById('upremark').value="";
 						$("#upexperetPop").hide();
 						expertDeliberateList(); 
 					}
 				},  
 				error:function(request,status,error){ //ajax 오류인경우  
 					alert("작업중 에러가 발생했습니다.");      
 					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				}
 			});
 		});	

 		//삭제
 		$(document).on("click",".delBtn",function(){
 			var memberId = $('#memberId').val();	//아이디
 			var delRow = $(this).closest('tr').prevAll().length;
 			delRowId = "#totcnt"+delRow;
 			var expertHistIdx = $(delRowId).val();
 			$.ajax({
 				type : 'post',
 				url:'/db/mypageExpertDeliberateDelete.do',
 				enctype: 'multipart/form-data',
 				data: {
 							"memberId" : memberId,
 							"expertHistIdx" : expertHistIdx
 						},
 				dataType: 'json',
 				success : function(data) {
 					if(data.returnCode == 0 || data.returnCode1 == 0){
 						alert("삭제에 실패했습니다.");
 						expertDeliberateList();	
 					}else{
 						alert("삭제가 완료 되었습니다.");
 						expertDeliberateList();
 					}
 				},  
 				error:function(request,status,error){ //ajax 오류인경우  
 					alert("작업중 에러가 발생했습니다.");      
 					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				} 
 			});
 		});

 })//document end

 		/* 기업성과관리  수정*/
 		function fn_updateEr(expertHistIdx, expertDelibrDt, expertDelibrTitle, remark){
 			document.getElementById('upexpertHistIdx').value=expertHistIdx;
 			document.getElementById('upexpertDelibrDt').value=expertDelibrDt;
 			document.getElementById('upexpertDelibrTitle').value=expertDelibrTitle;
 			document.getElementById('upremark').value=remark;
 			$("#upexperetPop").show();
 		}
    </script>
</head>	
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>전문가정보 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가정보 수정</b></h1>
					</div>
				</div>
			
			<!--  수정 form S -->
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberId" id="memberId" value="${data.memberId}"/>
							<div class="table-responsive">
<!-- 								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 기본 정보</b></h5>
								</div> -->

								<!--기본정보 폼  -->
<%-- 								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td style="vertical-align:middle;">
												<c:out value="pjy519"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<c:out value="*****"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">E-mail * </th>
											<td style="vertical-align:middle;">
												<c:out value="jypark@kb-sys.co.kr"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td style="vertical-align:middle;">
												<c:out value="*****"/>
											</td>
										</tr>
									</tbody>
								</table>
 --%>


 								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">이름 * </th>
											<td style="vertical-align:middle;">
												<span>${data.expertNm}</span>	
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">성별 </th>
											<td style="vertical-align:middle;">
												<span>${data.expertGender}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">경력년수 </th>
											<td style="vertical-align:middle;">
												<span>${data.expertCareerNum}년</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">전문분야 * </th>
											<td>
												<select id="largeSpecialAreaCd" name="largeSpecialAreaCd" onchange="largeSpecialAreaCdSelectBox('')" >
													<c:forEach var="largeSpecialAreaCd" items="${largeSpecialAreaCd}" varStatus="status" >
													 	<option value="${largeSpecialAreaCd.commonCd}">${largeSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 전문분야 * </th>
											<td colspan="3">
											<select id="detailSpecialAreaCd" name="detailSpecialAreaCd" style="position:relative;"></select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">관심분야 *</th>
											<td>
												<select id="expertInterestAreaCd" name="expertInterestAreaCd" onchange="expertInterestAreaCdSelectBox('')" >
													<c:forEach var="expertInterestAreaCd" items="${expertInterestAreaCd}" varStatus="status" >
													 	<option value="${expertInterestAreaCd.commonCd}">${expertInterestAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 관심분야 *</th>
											<td colspan="3">
												<select id="expertDetailIntrtAreaCd" name="expertDetailIntrtAreaCd" style="position:relative;"></select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">산학연관 </th>
											<td style="vertical-align:middle;">
												<select id="expertIndsEduCd" name="expertIndsEduCd">
													<c:forEach var="expertIndsEduCd" items="${expertIndsEduCd}" varStatus="status" >
													 	<option value="${expertIndsEduCd.commonCd}">${expertIndsEduCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인 </th>
											<td>
													<input type="text" id="expertStRegNo" name="expertStRegNo" class="input-sm" value="" maxLength="8" style="width:38%" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호 </th>
											<td style="vertical-align:middle;">
												<input type="text" id="expertRegNo" name="expertRegNo" class="input-sm" value=""   style="width:45%" maxLength="10"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">출신학교 </th>
											<td style="vertical-align:middle;">
										<input type="text" id="expertFinalSchoolNm" name="expertFinalSchoolNm"  size="15" maxlength="10"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertMajorNm" name="expertMajorNm" class="input-sm" value="" placeholder="전산" onkeyup='inputNumberFormat(this);' style="width:46%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">학력 </th>
											<td>
												<select id="expertFnalEduCd" name="expertFnalEduCd" >
													<c:forEach var="expertFnalEduCd" items="${expertFnalEduCd}" varStatus="status" >
													 	<option value="${expertFnalEduCd.commonCd}">${expertFnalEduCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">소속기관 *</th>
											<td style="vertical-align:middle;">
										<input type="text" id="expertHeadAddrNm" name ="expertHeadAddrNm" size="15" maxlength="20"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서 </th>
											<td>
													<input type="text" id="expertDptmNm" name="expertDptmNm" size="5" maxlength="10"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertOffiDutyNm" name="expertOffiDutyNm" class="input-sm" value=""  style="width:46%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">직장 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertOffiAddr" name="expertOffiAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 80px; " onclick="javascript:openDaumPostcode()">주소검색</button>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰 </th>
											<td colspan="3">
												<select id="expertOffiTel1" name="expertOffiTel1"style="widdth: 20px;">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="019">019</option>
												</select>-
												<input type="text" id="expertOffiTel2" name="expertOffiTel2" style="text-align: center;" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" id="expertOffiTel3" name="expertOffiTel3"  style="text-align: center;" size="4" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertOffiDetailAddr" name="expertOffiDetailAddr" class="input-sm" value="" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표FAX </th>
											<td colspan="3">
												<input type="text" id="expertOffiFax1" name="expertOffiFax1" style="text-align: center;"size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" id="expertOffiFax2" name="expertOffiFax2" style="text-align: center;"size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" id="expertOffiFax3" name="expertOffiFax3" style="text-align: center;"  size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">자택 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertHomeAddr" name="expertHomeAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 80px; " onclick="javascript:openDaumPostcode1()">주소검색</button>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상세주소 </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="expertHomeDetailAddr" name="expertHomeDetailAddr" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:67%">
												</label>
											</td> 
										</tr>
									</tbody>
								</table>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7"><h5 class="page-title txt-color-blueDark"><b>● 심의(자문, 평가 등) 이력</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" id="experetBtn" class="btn btn-primary">추가</button>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th >심의일자</th>
											<th >심의내용</th>
											<th >심의비고</th>
											<th ></th>
										</tr>
									</thead>	
									<tbody id="resultTbody">
									</tbody>
								</table>
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 수당 지급정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">은행 </th>
											<td>
												<select id="benefitBankCd" name="benefitBankCd" >
													<c:forEach var="benefitBankCd" items="${benefitBankCd}" varStatus="status" >
													 	<option value="${benefitBankCd.commonCd}">${benefitBankCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">계좌번호 </th>
											<td>
													<input type="text" id="benefitAccntNo" name="benefitAccntNo" class="input-sm" value="" style="width:157px">
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">생년월일 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="benefitBirthDt" name="benefitBirthDt" class="date" value=""  style="width:12%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 전화 * </th>
											<td>
										<select id="benefitRespsibHpNo1" name="benefitRespsibHpNo1"style="widdth: 20px;">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select>-
										<input type="text" id="benefitRespsibHpNo2" name="benefitRespsibHpNo2" style="text-align: center;" size="4" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
										<input type="text" id="benefitRespsibHpNo3" name="benefitRespsibHpNo3" style="text-align: center;"  size="4"maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="/db/expert/expertInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
										<button type="button" id="ok"class="btn btn-primary">저장<span></span></button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			<!--  수정 form E -->
			</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
	 
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
    
    
<div class="layer" style="display: none;" id="experetPop">
	<div class="box boxw600" style="height: 355px;margin-top: -200px;margin-left: -150px;">
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
	<div class="box boxw600" style="height: 355px;margin-top: -200px;margin-left: -150px;">
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