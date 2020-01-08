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
	
	<script type="text/javaScript" defer="defer">
			$(document).ready(function () {
/****************************************수정start**************************************/
				/* 자동시작함수 */

				/* 데이터 정보 보여주기 */
				var memberId = '${data.memberId}';
				$('#memberId').html(memberId);				
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
				//회사명
				var companyNm = '${data.companyNm}';
				$('#companyNm').html(companyNm);
				//대표자
				var buyerCeo = '${data.buyerCeo}';
				$('#buyerCeo').html(buyerCeo);
 				//설립일
				var buyerEstDt = '${data.buyerEstDt}';
				$('#buyerEstDt').val(buyerEstDt);

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
	                    htmls += '<td><span>' + this.buyerHistSpecCd + '</span></td>';
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
			            document.getElementById('buyerHeadAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
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
			            document.getElementById('buyerBranchAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
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
			$(".floatR").click(function(){
				$("#buyerHistPop").show();
			});
			//전문가 심의 이력정보 추가취소버튼 클릭
			$(".closeBtn").click(function(){
				$("#buyerHistPop").hide();
			});
			$(".upcloseBtn").click(function(){
				$("#upbuyerHistPop").hide();
			});
			
			$("#saveBtn").click(function(){
				var	 formData = new FormData();
				/*대표 E-mail*/
				var 	buyerCeoEmail		=	 $('#buyerCeoEmail1').val();
						buyerCeoEmail		+= "@";
						buyerCeoEmail		+=	 $('#buyerCeoEmail2').val();
				/*	대표전화*/
				var 	buyerHeadTel 		=   $('#buyerHeadTel1').val();
						buyerHeadTel 		+= $('#buyerHeadTel2').val();
						buyerHeadTel 		+= $('#buyerHeadTel3').val();
				/*	대표팩스*/
				var 	buyerHeadFax 		=   $('#buyerHeadFax1').val();
						buyerHeadFax 		+= $('#buyerHeadFax2').val();
						buyerHeadFax 		+= $('#buyerHeadFax3').val();
				/*	지사전화*/
				var 	buyerBranchTel 	=   $('#buyerBranchTel1').val();
						buyerBranchTel 	+= $('#buyerBranchTel2').val();
						buyerBranchTel 	+= $('#buyerBranchTel3').val();
				/*	지사팩스*/
				var 	buyerBranchFax 	=   $('#buyerBranchFax1').val();
						buyerBranchFax 	+= $('#buyerBranchFax2').val();
						buyerBranchFax 	+= $('#buyerBranchFax3').val();

				formData.append("memberId",$('#memberId').html());//아이디
				formData.append("buyerNm",$('#buyerNm').html());//이름
				formData.append("companyNm",$('#companyNm').html());//회사명
				formData.append("buyerCeo",$('#buyerCeo').html());//대표자
				formData.append("buyerEstDt",$('#buyerEstDt').val());//설립일
				formData.append("buyerCapitalAmt",$('#buyerCapitalAmt').val());//자본금
				formData.append("buyerBusAreaCd",$('#buyerBusAreaCd').val());//관심분야
				formData.append("buyerSite",$('#buyerSite').val());//홈페이지
				formData.append("buyerHeadAddr",$('#buyerHeadAddr').val());//본사주소1
				formData.append("buyerHeadDetailAddr",$('#buyerHeadDetailAddr').val());//본사주소2
				formData.append("buyerBranchAddr",$('#buyerBranchAddr').val());//지사주소1
				formData.append("buyerBranchDetailAddr",$('#buyerBranchDetailAddr').val());//지사주소2
				formData.append("buyerCeoEmail",buyerCeoEmail);//대표 이메일
				formData.append("buyerHeadTel",buyerHeadTel);//대표 전화
				formData.append("buyerHeadFax",buyerHeadFax);//대표팩스
				formData.append("buyerBranchTel",buyerBranchTel);//지사전화
				formData.append("buyerBranchFax",buyerBranchFax);//지사팩스
				formData.append("adminpage","adminpage");//어드민
				$.ajax({
					type : 'post',
					url:'/db/mypageBuyerUpdate.do',
					enctype: 'multipart/form-data',
					data: formData,
					contentType:false,
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0 || data.returnCode1 == 0){
							alert("저장을 실패 하였습니다.");
							return;
						}else{
							alert("저장이 완료 되었습니다.");
		                	window.location.href="/db/buyer/buyerInformationManagementList.do";
						}
					},  
					error:function(request,status,error){ //ajax 오류인경우  
						alert("작업중 에러가 발생했습니다.");      
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
			//업데이트
			$("#uphistBtn").click(function(){
				var	 formData = new FormData();
				var one = $('#upbuyerHistDt').val()
				var two = one.replace("-","");
				var buyerHistDt = two.replace("-","");
				formData.append("memberId",$('#memberId').ml());
				alert($('#memberId').html())
				formData.append("buyerHistIdx",$('#upbuyerHistIdx').val());
				formData.append("buyerHistNm",$('#upbuyerHistNm').val());
				formData.append("buyerHistInvt",$('#upbuyerHistInvt').val());
				formData.append("buyerHistSpecCd",$('#upbuyerHistSpecCd').val());
				formData.append("buyerHistDt",buyerHistDt);
				formData.append("buyerHistContent",$('#upbuyerHistContent').val());
				formData.append("processCd",$('#upprocessCd').val());
				$.ajax({
					type : 'post',
					url:'/db/mypageBuyerHistUpdate.do',
					enctype: 'multipart/form-data',
					data: formData,
					contentType:false,
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0 || data.returnCode1 == 0){
							return;
						}else{
							document.getElementById('upbuyerHistIdx').value="";
							document.getElementById('upbuyerHistNm').value="";
							document.getElementById('upbuyerHistInvt').value="";
							document.getElementById('upbuyerHistSpecCd').value="";
							document.getElementById('upbuyerHistDt').value="";
							document.getElementById('upbuyerHistContent').value="";
							document.getElementById('upprocessCd').value="";
							$("#upbuyerHistPop").hide();
							buyerHistList(); 
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
				delRowId = "#buyerHistIdx"+delRow;
				var buyerHistIdx = $(delRowId).val();
				$.ajax({
					type : 'post',
					url:'/db/mypageBuyerHistDelete.do',
					enctype: 'multipart/form-data',
					data: {
								"memberId" : memberId,
								"buyerHistIdx" : buyerHistIdx
							},
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0 || data.returnCode1 == 0){
							alert("삭제에 실패했습니다.");
							buyerHistList();	
						}else{
							alert("삭제가 완료 되었습니다.");
							buyerHistList();
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
			function fn_updateEr(buyerHistIdx, buyerHistNm, buyerHistInvt, buyerHistSpecCd,buyerHistDt,buyerHistContent,processCd){
				document.getElementById('upbuyerHistIdx').value=buyerHistIdx;
				document.getElementById('upbuyerHistNm').value=buyerHistNm;
				document.getElementById('upbuyerHistInvt').value=buyerHistInvt;
				document.getElementById('upbuyerHistSpecCd').value=buyerHistSpecCd;
				document.getElementById('upbuyerHistDt').value=buyerHistDt;
				document.getElementById('upbuyerHistContent').value=buyerHistContent;
				document.getElementById('upprocessCd').value=processCd;
				$("#upbuyerHistPop").show();
			}

/****************************************수정end**************************************/
			
			
			
			
			
			
			
			
			$("#idChkBtn").click(function(){
				//alert($('#memberId').val());
				//alert($('#expertHeadTel1').val());
				if($('#memberId').val() == ''){
					alert('아이디를 입력하세요.');
					$('#memberId').focus();
					return false;
				}else{
					$.ajax({
						type : 'post',
						url:'/db/member/memberIdChk.do',
						data: {memberId : $('#memberId').val()},
						dataType: 'json',
						success : function(data) {
							if(data.idCnt != 0){
								$("#chkYn").val("N");
								$("#able").hide();
								$("#enable").show();
							}else{
								$("#chkYn").val("Y");
								$("#able").show();
								$("#enable").hide();
							}
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 	});
					return false;
				}
				 
			});
			
			
			
			//히스토리 추가버튼 클릭 
			$("#resultAddBtn").click(function(){
				var rowItem = "";
				rowItem += "<tr>"; 
				rowItem += "	<td> <input type='text' class='form-control' name='buyerHistNm' placeholder=''></td>";
				rowItem += "	<td> <input type='text' class='form-control' name='buyerHistInvt' placeholder='' onkeyup='inputNumberFormat(this);'> </td>";
				rowItem += "	<td> <input type='text' class='form-control' name='buyerHistSpecCd' placeholder=''> </td>";
				rowItem += "	<td> <input type='text' class='Date form-control' name='buyerHistDt' data-dateformat='yy-mm-dd' placeholder='ex) YYYY-MM-DD'> </td>";
				rowItem += "	<td> <input type='text' class='form-control' name='buyerHistContent'> </td>";
				rowItem += "	<td> <select name='buyerHistPro'  class='form-control'><option value='0'>투자예정</option><option value='1'>진행중</option><option value='2'>투자완료</option></select> </td>";
				rowItem += "	<td> <button type='button' class='btn btn-danger'> <i class='fa fa-minus'></i> </button> </td>";
				rowItem += "</tr>";
				$('#resultTable').append(rowItem);
			});
			
			$('#resultTable').on("click", "button", function() {
			    $(this).closest("tr").remove();
			});
			
		

/* 			$("#saveBtn").click(function(){

				$('#resultTbody tr').each(function () {
					var cellItem = $(this).find(":input");
					var cellItem2 = $(this).find("select");
					var buyerHistNm = cellItem.eq(0).val();
					var buyerHistInvt = cellItem.eq(1).val();
					var buyerHistSpecCd = cellItem.eq(2).val();
					var buyerHistDt = cellItem.eq(3).val();
					var buyerHistContent = cellItem.eq(4).val();
					var buyerHistPro = cellItem2.eq(0).val();
					
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistNm' class='buyerHistNm' value='"+buyerHistNm+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistInvt' class='buyerHistInvt' value='"+buyerHistInvt+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistSpecCd' class='buyerHistSpecCd' value='"+buyerHistSpecCd+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistDt' class='buyerHistDt' value='"+buyerHistDt+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistContent' class='buyerHistContent' value='"+buyerHistContent+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistPro' class='buyerHistPro' value='"+buyerHistPro+"' />");
				}); 
				
				 if(checkValue()){
					$.ajax({
						type : 'post',
						url:'/db/buyer/buyerUpdate.do',
						data: $('#updateFrm,#buyerHistFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("저장을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("저장이 완료 되었습니다.");
								location.reload();
								return false;
			                }
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 	});
				 }
			});
 */			
			function checkValue(){
				var retValue = true;
				
				if($('#buyerNm').val() == ""){
					alert("회사명을 입력하세요.");
					$('#buyerNm').focus();
					return;
				}
				
				if($('#buyerCeo').val() == ""){
					alert("대표자를 입력하세요.");
					$('#buyerCeo').focus();
					return;
				}
				
				if($('#buyerComRegNum').val() == ""){
					alert("사업자등록번호를 입력하세요.");
					$('#buyerComRegNum').focus();
					return;
				}
				
				if($('#buyerCeoEmail').val() == ""){
					alert("대표자E-mail을 입력하세요.");
					$('#memberHp').focus();
					return;
				}
				
				if($('#buyerBusAreaCd').val() == ""){
					alert("관심분야를 입력하세요.");
					$('#buyerBusAreaCd').focus();
					return;
				}
				
				if($('#buyerEstDt').val() == ""){
					alert("설립일을 입력하세요.");
					$('#buyerEstDt').focus();
					return;
				}

				return retValue;
			}
			
			$("#createBtn").click(function(){

				$('#resultTbody tr').each(function () {
					var cellItem = $(this).find(":input");
					var cellItem2 = $(this).find("select");
					var buyerHistNm = cellItem.eq(0).val();
					var buyerHistInvt = cellItem.eq(1).val();
					var buyerHistSpecCd = cellItem.eq(2).val();
					var buyerHistDt = cellItem.eq(3).val();
					var buyerHistContent = cellItem.eq(4).val();
					var buyerHistPro = cellItem2.eq(0).val();
					
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistNm' class='buyerHistNm' value='"+buyerHistNm+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistInvt' class='buyerHistInvt' value='"+buyerHistInvt+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistSpecCd' class='buyerHistSpecCd' value='"+buyerHistSpecCd+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistDt' class='buyerHistDt' value='"+buyerHistDt+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistContent' class='buyerHistContent' value='"+buyerHistContent+"' />");
					$(document).find("#buyerHistFrm").append("<input type='hidden' name='buyerHistPro' class='buyerHistPro' value='"+buyerHistPro+"' />");
				}); 
				
				 if(checkValue()){
					$.ajax({
						type : 'post',
						url:'/db/buyer/buyerInsert.do',
						data: $('#insertFrm,#buyerHistFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("등록을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("등록이 완료 되었습니다.");
								location.reload();
								return false;
			                }
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 	});
				 }
			});
</script>


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
			.table-row{
			text-align:center;background:#eee;vertical-align:middle;
			}
	</style>

	

	
</head>
<body>
<input type="hidden" name="chkYn" id="chkYn" value="">
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>바이어정보 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>바이어정보 등록</b></h1>
					</div>
				</div>
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 기본 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="7%" /><col width="8%" /><col width="38%" /><col width="15%" /><col width="*" />	
									</colgroup>
									<tbody>
										<tr>
											<th colspan="2" class="essential" style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<span id="memberId"></span>
											</td>
											
											<th class="table-row" >이름 * </th>
											<td>
												<span id="buyerNm"></span>
											</td>
										</tr>
										<tr>
											<th class="table-row" colspan="2">회사명 * </th>
											<td style="vertical-align:middle;">
												<span id="companyNm"></span>
											</td>
											<th class="table-row">대표자 * </th>
											<td style="vertical-align:middle;">
												<span id="buyerCeo"></span>
											</td>
										</tr>
										<tr>
											<th class="table-row" colspan="2">사업자등록번호 * </th>
											<td style="vertical-align:middle;">
												<span id="buyerComRegNum"></span>
											</td>
											<th class="table-row">대표자 E-Mail *</th>
											<td>
												<input type="text" id="buyerCeoEmail1" name="buyerCeoEmail1" class="input-sm" value="" style="width:20%; height: 23px">
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
											<th class="table-row" colspan="2">관심분야 * </th>
											<td style="vertical-align:middle;">
												<select id="buyerBusAreaCd" name="buyerBusAreaCd">
													<c:forEach var="buyerBusAreaCd" items="${buyerBusAreaCd}" varStatus="status" >
													 	<option value="${buyerBusAreaCd.commonCd}">${buyerBusAreaCd.commonNm}</option>
													 </c:forEach>
												 </select>
											</td>

											<th class="table-row">홈페이지 </th>
											<td>
												<input type="text" id="buyerSite" name="buyerSite" class="input-sm" value="" style="width:40%">
											</td>
										</tr>
										<tr>
											<th class="table-row" rowspan="4">주소 </th>
											<th class="table-row" rowspan="2">본사 </th>
											<td>
													<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode()"><b>주소검색</b></a>
											</td>
											<th class="table-row">대표전화 </th>
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
												<input type="text" id="buyerHeadTel2" name="buyerHeadTel2" value="" size="4" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="buyerHeadTel3" name="buyerHeadTel3" value="" size="4"style="width: 50px; text-align: center" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr> 
											<td>
													<input type="text" id="buyerHeadDetailAddr" name="buyerHeadDetailAddr" class="input-sm" value="" style="width:94%">
											</td>
											<th class="table-row">대표FAX </th>
												<td>
													<input type="text" id="buyerHeadFax1" name="buyerHeadFax1" value="" size="4" style="width: 46px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="buyerHeadFax2" name="buyerHeadFax2" value="" size="10" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="buyerHeadFax3" name="buyerHeadFax3" value="" size="10" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
												</td>

										</tr>
										<tr>
											<th class="table-row" rowspan="2">지사 </th>
											<td>
													<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode1()"><b>주소검색</b></a>
											</td>
											<th class="table-row">지사전화 </th>
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
												<input type="text" id="buyerBranchTel2" name="buyerBranchTel2" value="" size="10" style="width: 50px; text-align: center" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="buyerBranchTel3" name="buyerBranchTel3" value="" size="10" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />

											</td> 
										</tr>
										<tr>
											<td>
												<input type="text" id="buyerBranchDetailAddr" name="buyerBranchDetailAddr" class="input-sm" value="" style="width:94%">
											</td>
											<th class="table-row">지사FAX </th>
											<td>
												<input type="text" id="buyerBranchFax1" name="buyerBranchFax1" value="" size="4" style="width: 46px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="buyerBranchFax2" name="buyerBranchFax2" value="" size="4" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="buyerBranchFax3" name="buyerBranchFax3" value="" size="4" style="width: 50px; text-align: center"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
											</td> 
										</tr>
										<tr>
											<th class="table-row" colspan="2">설립일 *</th>
											<td>
													<input class="date" type="text" name="buyerEstDt" id="buyerEstDt" data-dateformat="yyyy-mm-dd" value=""style="text-align: center; width: 15%;">
											</td>
											<th class="table-row">자본금</th>
											<td>
												<label class="input" style="width:100%">
												
													<input type="text" id="buyerCapitalAmt" name="buyerCapitalAmt"value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10" style="width:40%">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<br>

								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 히스토리</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="#a" id="resultAddBtn" class="btn btn-primary" ><b>추가</b></a>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>투자 기업명</th>
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
								<br>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="/db/buyer/buyerInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
										<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
<!--------------------------------------------수정 FROM END ---------------------------------------------->
			
			<!--  등록 form S -->
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 기본 정보</b></h5>
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
											<th colspan="2" class="essential" style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<input type="text" id="memberId" name="memberId" class="input-sm" value=""  style="width:100%">
												<button class="txtbtn" id="idChkBtn" style="width: 100px;">중복확인</button>
												<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
													사용가능한 아이디입니다.
												</div>
												<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
													사용 불가능한 아이디입니다.
												</div>
											</td>
											<th class="essential" class="table-row" >비밀번호</th>
											<td>
												<input type="password" style="width: 100%;" id="memberPw" name="memberPw"  maxlength="30">
											</td>
										</tr>
										<tr>
											<th colspan="2" class="table-row" >이름</th>
											<td>
												<input type="text" style="width: 100%;" id="memberNm" name="memberNm" maxlength="30">
											</td>
											<th class="essential" class="table-row" >비밀번호 확인</th>
											<td>
												<input type="password" style="width: 100%;" id="memPwdChk" name="memPwdChk" maxlength="30">
											</td>
										</tr>
										
										<tr>
											<th class="table-row" colspan="2">회사명 * </th>
											<td>
													<input type="text" id="companyNm" name="companyNm" class="input-sm" value=""  style="width:100%">
												
											</td>
											<th class="table-row">대표자 * </th>
											<td>
												
													<input type="text" id="buyerCeo" name="buyerCeo" class="input-sm" value="" style="width:100%">
												
											</td>
										</tr>
										<tr>
											<th class="table-row" colspan="2">사업자등록번호 * </th>
											<td>
												
													<input type="text" id="buyerComRegNum" name="buyerComRegNum" class="input-sm" value="" maxlength="12" style="width:100%">
												
											</td>
											<th class="table-row">대표자 E-Mail *</th>
											<td>
												<input type="text" id="buyerCeoEmail1" name="buyerCeoEmail1" class="input-sm" value="" style="width:100%">
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
											<th class="table-row" colspan="2">관심분야 * </th>
											<td>
												
													<input type="text" id="buyerBusAreaCd" name="buyerBusAreaCd" class="input-sm" value="" style="width:100%">
												
											</td>
											<th class="table-row">홈페이지 </th>
											<td>
												
													<input type="text" id="buyerSite" name="buyerSite" class="input-sm" value="" style="width:100%">
												
											</td>
										</tr>
										<tr>
											<th class="table-row" rowspan="4">주소 </th>
											<th class="table-row" rowspan="2">본사 </th>
											<td>
												
													<a href="#" class="btn btn-primary" onclick="javascript:headPostcode()"><b>주소검색</b></a>
													<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												
											</td>
											<th class="table-row">대표전화 </th>
											<td>
												
													<input type="text" id="buyerHeadTel" name="buyerHeadTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												
											</td> 
										</tr>
										<tr>
											<td>
												
													<input type="text" id="buyerHeadDetailAddr" name="buyerHeadDetailAddr" class="input-sm" value="" style="width:100%">
												
											</td>
											<th class="table-row">대표FAX </th>
											<td>
												
													<input type="text" id="buyerHeadFax" name="buyerHeadFax" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												
											</td> 
										</tr>
										<tr>
											<th class="table-row" rowspan="2">지사 </th>
											<td>
												
													<a href="#" class="btn btn-primary" onclick="javascript:branchPostcode()"><b>주소검색</b></a>
													<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												
											</td>
											<th class="table-row">대표전화 </th>
											<td>
												
													<input type="text" id="buyerBranchTel" name="buyerBranchTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												
											</td> 
										</tr>
										<tr>
											<td>
												
													<input type="text" id="buyerBranchDetailAddr" name="buyerBranchDetailAddr" class="input-sm" value="" style="width:100%">
												
											</td>
											<th class="table-row">대표FAX </th>
											<td>

													<input type="text" id="buyerBranchFax" name="buyerBranchFax" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">

											</td> 
										</tr>
										<tr>
											<th class="table-row" colspan="2">설립일 *</th>
											<td>
												<input class="input-sm" type="text" name="buyerEstDt" id="buyerEstDt" data-dateformat="yyyy-mm-dd">
											</td>
											<th class="table-row">자본금</th>
											<td>
												
													<input type="text" id="buyerCapitalAmt" name="buyerCapitalAmt" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%" maxlength="10">
												
											</td>
										</tr>
									</tbody>
								</table>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 히스토리</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="#a" id="resultAddBtn" class="btn btn-primary" ><b>추가</b></a>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>투자 기업명</th>
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
								<br>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="/db/buyer/buyerInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
										<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!--  등록 form E -->			
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
	 
    
    <form name="buyerHistFrm" id="buyerHistFrm" method="post">
    </form>
	
	
	
	
	
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
						<input type="text" name="buyerHistDt" id="buyerHistDt" value="" class="date"style="width:50%"autocomplete="off"/>
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
						<input type="text" name="buyerHistSpecCd" id="upbuyerHistSpecCd" value=""style="width:75%"/>
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