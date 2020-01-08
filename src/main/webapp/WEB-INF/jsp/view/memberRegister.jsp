<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
	<script type="text/javaScript" language="javascript" defer="defer">
		$(document).ready(function () {
			var memberId = $('#memberId').val();
			/* alert(memberId); */
			
			$("#idChkBtn").click(function(){
				if($('#memberId').val() == ''){
					alert('아이디를 입력하세요.');
					$('#memberId').focus();
					return;
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
				}
				 
			});
			
			$("#saveBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/db/member/memberUpdate.do',
						data: $('#updateFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("저장을 실패 하였습니다.");
			                    return;
			                }else if(data.returnCode1 == 0){
			                    alert("저장을 실패 하였습니다.");
			                    return;
			                }else if(data.returnCode2 == 0){
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
			});
			
			

			function checkValue(){
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
				
				if($('#memberHp').val() == ""){
					alert("휴대폰번호를 입력하세요.");
					$('#memberHp').focus();
					return;
				}

				return retValue;
			}
			
			$("#createBtn").click(function(){
				if(checkValue()){
					$.ajax({
						type : 'post',
						url:'/db/member/memberInsert.do',
						data: $('#insertFrm').serialize(),
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



			function checkValue1(){
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
				
				if($('#memberHp').val() == ""){
					alert("휴대폰번호를 입력하세요.");
					$('#memberHp').focus();
					return;
				}

				return retValue;
			}
			
			$("#createBtn1").click(function(){
				if(checkValue1()){
					$.ajax({
						type : 'post',
						url:'/db/member/memberInsert1.do',
						data: $('#insertFrm1').serialize(),
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
						
			

			function checkValue2(){
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
				
				if($('#memberHp').val() == ""){
					alert("휴대폰번호를 입력하세요.");
					$('#memberHp').focus();
					return;
				}

				return retValue;
			}
			
			$("#createBtn2").click(function(){
				if(checkValue2()){
					$.ajax({
						type : 'post',
						url:'/db/member/memberInsert2.do',
						data: $('#insertFrm2').serialize(),
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
			
			

			/* 사업분야코드 담기 */
			var largeBussAreaCd = '${detail.largeBussAreaCd}';
			var mediumBussAreaCd = '${detail.mediumBussAreaCd}';
			
			var expertFnalEduCd = '${detail.expertFnalEduCd}';
			
			var expertIndsEduCd = '${detail.expertIndsEduCd}';
			
			var largeSpecialAreaCd = '${detail.largeSpecialAreaCd}';
			var mediumSpecialAreaCd = '${detail.mediumSpecialAreaCd}';
			
			var detailSpecialAreaCd = '${detail.detailSpecialAreaCd}';
			
			$('#largeBussAreaCd').val(largeBussAreaCd);
			largeBussAreaCdSelectBox(mediumBussAreaCd);
			// 20191217 함수 안에서 실행 한것이기 때문에 아랫것은 치워돋됨!
			//$('#mediumBussAreaCd').val(mediumBussAreaCd).attr('selected', 'selected');
			
			$('#expertFnalEduCd').val(expertFnalEduCd);
			expertFnalEduCdSelectBox();

			$('#expertIndsEduCd').val(expertIndsEduCd);
			expertIndsEduCdSelectBox();
			
			$('#largeSpecialAreaCd').val(largeSpecialAreaCd);
			largeSpecialAreaCdSelectBox();
			$('#mediumSpecialAreaCd').val(mediumSpecialAreaCd).attr('selected', 'selected');
			
			$('#detailSpecialAreaCd').val(detailSpecialAreaCd);
			
		});
		
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
		

	function openDaumPostcode2(){
			
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

		function openDaumPostcode3(){
			
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
		
	function openDaumPostcode4(){
			
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

		function openDaumPostcode5(){
			
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
		
		
		
		/*셀렉트*/
	/* 	function largeBussAreaCdSelectBox(){
			var selectBoxData = $("#largeBussAreaCd").val();
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
	 	 			$("#mediumBussAreaCd").html(htmls);
	 	            },  
	 			error:function(request,status,error){ //ajax 오류인경우  
	 				alert("작업중 에러가 발생했습니다.");      
	 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			} 
	 		});
		}
			 */
		

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
		                        });   //each end
		              };
		              //console.log(data.data);
		              //alert(htmls);
		              $("#mediumBussAreaCd").html(htmls);
		                 if(selectOption.length > 0){//이거 오류나는데 왜 정상적으로돼 ? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
		                    $('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
		                 }
		                },  
		          error:function(request,status,error){ //ajax 오류인경우  
		             alert("작업중 에러가 발생했습니다.");      
		             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          } 
		       });
		   }
			 
			 /*셀렉트*/
			   function expertFnalEduCdSelectBox(dataOption){
			      var selectBoxData = $("#expertFnalEduCd").val();
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
			                        });   //each end
			              };
			              //console.log(data.data);
			              //alert(htmls);
			              //$("#mediumBussAreaCd").html(htmls);
			                 //if(selectOption.length > 0){//이거 오류나는데 왜 정상적으로돼 ? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			                 //   $('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
			                 //}
			                },  
			          error:function(request,status,error){ //ajax 오류인경우  
			             alert("작업중 에러가 발생했습니다.");      
			             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			          } 
			       });
			   }
				

				 /*셀렉트*/
				   function expertIndsEduCdSelectBox(dataOption){
				      var selectBoxData = $("#expertIndsEduCd").val();
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
				                        });   //each end
				              };
				              //console.log(data.data);
				              //alert(htmls);
				              //$("#mediumBussAreaCd").html(htmls);
				                 //if(selectOption.length > 0){//이거 오류나는데 왜 정상적으로돼 ? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
				                 //   $('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
				                 //}
				                },  
				          error:function(request,status,error){ //ajax 오류인경우  
				             alert("작업중 에러가 발생했습니다.");      
				             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				          } 
				       });
				   }
								 


				   /*셀렉트*/
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
				                        });   //each end
				              };
				              //console.log(data.data);
				              //alert(htmls);
				              $("#mediumSpecialAreaCd").html(htmls);
				                 if(selectOption.length > 0){ //이거 오류나는데 왜 정상적으로돼 ? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
				                    $('#mediumSpecialAreaCd').val(dataOption).attr('selected', 'selected');
				                 }
				                },  
				          error:function(request,status,error){ //ajax 오류인경우  
				             alert("작업중 에러가 발생했습니다.");      
				             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				          } 
				       });
				   }
									 
				 
	
				    </script>

<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>회원 관리</li><li><b>회원 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업회원 정보 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'create1'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가 정보 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'create2'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>바이어 정보 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업회원 정보 수정</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify1'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가회원 정보 수정</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify2'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>바이어회원 정보 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<!-- 기업 회원정보 수정 form S -->
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberIdx" id="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
							<input type="hidden" name="memberId" id="memberId" value="<c:out value="${detail.memberId}"/>"/>
							<input type="hidden" name="joinTypeCd" id="joinTypeCd" value="<c:out value="${detail.joinTypeCd}"/>"/>
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td colspan="3">
												<c:out value="${detail.memberId}"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td colspan="3">
												<label class="input">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="<c:out value="${detail.memberPw}"/>" maxlength="20" style="width:300px;">
												</label>
											</td>
											
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름(담당자명) * </th>
											<td>
												<input type="text" id="memberNm" name="memberNm" value="<c:out value="${detail.memberNm}"/>" maxlength="20" />
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 * </th>
											<td>
												<input type="text" id="entprRespsibEmail" name=entprRespsibEmail value="<c:out value="${detail.entprRespsibEmail}"/>" maxlength="40" />
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 *</th>
											<td>
												<label class="input">
													<input type="text" id="entprRespsibHpNo" name="entprRespsibHpNo" class="input-sm" value="<c:out value="${detail.entprRespsibHpNo}"/>" maxlength="12" style="width:300px;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">회사명</th>
											<td>
												<label class="input">
													<input type="text" id="entprNm" name="entprNm" class="input-sm" value="<c:out value="${detail.entprNm}"/>" maxlength="30" style="width:300px;">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자</th>
											<td>
												<label class="input">
													<input type="text" id="entprCeo" name="entprCeo" class="input-sm" value="<c:out value="${detail.entprCeo}"/>" maxlength="40" style="width:300px;">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input">
													<input type="text" id="entprComRegNum" name="entprComRegNum" class="input-sm" value="<c:out value="${detail.entprComRegNum}"/>" maxlength="13" style="width:300px;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 E-MAIL</th>
											<td>
												<label class="input">
													<input type="text" id="entprCeoEmail" name="entprCeoEmail" class="input-sm" value="<c:out value="${detail.entprCeoEmail}"/>" maxlength="40" style="width:300px;">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업분야</th>
											<td>
												<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox()" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.orderNbr}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" style="position: relative;">
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprSite" name="entprSite" class="input-sm" value="<c:out value="${detail.entprSite}"/>" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<option value="기업회원" ${detail.joinTypeCd eq '000001' ? 'selected="selected"' : '' }>기업회원</option>
													<!-- <option value="000002">전문가</option>
													<option value="000003">바이어</option> -->
												</select>
											</td>
										</tr>	
										
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="input-sm" value="<c:out value="${detail.entprHeadAddr}"/>" maxlength="60" style="width:100%;" >
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화</th>
											<td>
												<label class="input">
													<input type="text" id="entprHeadTel" name="entprHeadTel" class="input-sm" value="<c:out value="${detail.entprHeadTel}"/>" maxlength="12" style="width:100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX</th>
											<td>
												<label class="input">
													<input type="text" id="entprHeadFax" name="entprHeadFax" class="input-sm" value="<c:out value="${detail.entprHeadFax}"/>" maxlength="13" style="width:100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="entprBranchAddr" name="entprBranchAddr" class="input-sm" value="<c:out value="${detail.entprBranchAddr}"/>" maxlength="60" style="width:100%;" >
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode1()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화</th>
											<td>
												<label class="input">
													<input type="text" id="entprBranchTel" name="entprBranchTel" class="input-sm" value="<c:out value="${detail.entprBranchTel}"/>" maxlength="12" style="width:100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX</th>
											<td>
												<label class="input">
													<input type="text" id="entprBranchFax" name="entprBranchFax" class="input-sm" value="<c:out value="${detail.entprBranchFax}"/>" maxlength="13" style="width:100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										
										
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 기업회원 정보 수정 form E -->
			


			<!-- 전문가 회원정보 수정 form S -->
			<c:if test="${viewType eq 'modify1'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberIdx" id="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
							<input type="hidden" name="memberId" id="memberId" value="<c:out value="${detail.memberId}"/>"/>
							<input type="hidden" name="joinTypeCd" id="joinTypeCd" value="<c:out value="${detail.joinTypeCd}"/>"/>
							
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td colspan="3">
												<c:out value="${detail.memberId}"/>
											</td>
										</tr>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="<c:out value="${detail.memberPw}"/>" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberNm" name="memberNm" class="input-sm" value="<c:out value="${detail.memberNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertStRegNo" name="expertStRegNo" class="input-sm" value="<c:out value="${detail.expertStRegNo}"/>" maxlength="20" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id=expertHeadTel" name="expertHeadTel" class="input-sm" value="<c:out value="${detail.expertHeadTel}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertRegNo" name="expertRegNo" class="input-sm" value="<c:out value="${detail.expertRegNo}"/>" maxlength="10" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertEmail" name="expertEmail" class="input-sm" value="<c:out value="${detail.expertEmail}"/>" maxlength="40" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
												
											</td>
										</tr>
										
										<tr>										
											<th style="text-align:center;background:#eee;vertical-align:middle;">최종학력</th>
											<td>
												<select id="expertFnalEduCd" name="expertFnalEduCd" onchange="expertFnalEduCdSelectBox()" >
													<c:forEach var="expertFnalEduCd" items="${expertFnalEduCd}" varStatus="status" >
													 	<option value="${expertFnalEduCd.orderNbr}">${expertFnalEduCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<%-- <select id="mediumBussAreaCd" name="mediumBussAreaCd" >
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
												
												<label class="input" style="width:100%">
													<input type="text" id="expertFinalSchoolNm" name="expertFinalSchoolNm" class="input-sm" value="<c:out value="${detail.expertFinalSchoolNm}"/>" maxlength="30" style="width:100%">
												</label>
												
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertMajorNm" name="expertMajorNm" class="input-sm" value="<c:out value="${detail.expertMajorNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속기관 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertHeadAddrNm" name="expertHeadAddrNm" class="input-sm" value="<c:out value="${detail.expertHeadAddrNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertDptmNm" name="expertDptmNm" class="input-sm" value="<c:out value="${detail.expertDptmNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertOffiDutyNm" name="expertOffiDutyNm" class="input-sm" value="<c:out value="${detail.expertOffiDutyNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">산학연간</th>
											<td>
												<select id="expertIndsEduCd" name="expertIndsEduCd" onchange="expertIndsEduCdSelectBox()" >
													<c:forEach var="expertIndsEduCd" items="${expertIndsEduCd}" varStatus="status" >
													 	<option value="${expertIndsEduCd.orderNbr}">${expertIndsEduCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전문분야</th>
											<td>
												<select id="largeSpecialAreaCd" name="largeSpecialAreaCd" onchange="largeSpecialAreaCdSelectBox()" >
													<c:forEach var="largeSpecialAreaCd" items="${largeSpecialAreaCd}" varStatus="status" >
													 	<option value="${largeSpecialAreaCd.orderNbr}">${largeSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<%-- <select id="mediumSpecialAreaCd" name="mediumSpecialAreaCd" >
													<c:forEach var="mediumSpecialAreaCd" items="${mediumSpecialAreaCd}" varStatus="status" >
													 	<option value="${mediumSpecialAreaCd.commonCd}">${mediumSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부전문분야 *</th>
											<td>
												<select id="detailSpecialAreaCd" name="detailSpecialAreaCd" >
													<c:forEach var="detailSpecialAreaCd" items="${detailSpecialAreaCd}" varStatus="status" >
													 	<option value="${detailSpecialAreaCd.commonCd}">${detailSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<!-- <option value="000001">기업회원</option> -->
													<option value="000002">전문가</option>
													<!-- <option value="000003">바이어</option> -->
												</select>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자택주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="expertHomeAddr" name="expertHomeAddr" class="input-sm" value="<c:out value="${detail.expertHomeAddr}"/>" maxlength="60" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode2()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자택상세주소</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertHomeDetailAddr" name="expertHomeDetailAddr" class="input-sm" value="<c:out value="${detail.expertHomeDetailAddr}"/>" maxlength="12" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiAddr" name="expertOffiAddr" class="input-sm" value="<c:out value="${detail.expertOffiAddr}"/>" maxlength="50" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode3()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiTel" name="expertOffiTel" class="input-sm" value="<c:out value="${detail.expertOffiTel}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiFax" name="expertOffiFax" class="input-sm" value="<c:out value="${detail.expertOffiFax}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 전문가회원 정보 수정 form E -->
	
	
	
			<!-- 바이어 회원정보 수정 form S -->
			<c:if test="${viewType eq 'modify2'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberIdx" id="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
							<input type="hidden" name="memberId" id="memberId" value="<c:out value="${detail.memberId}"/>"/>
							<input type="hidden" name="joinTypeCd" id="joinTypeCd" value="<c:out value="${detail.joinTypeCd}"/>"/>
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td colspan="3">
												<c:out value="${detail.memberId}"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td colspan="3">
												<label class="input">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="<c:out value="${detail.memberPw}"/>" maxlength="20" style="width:300px;">
												</label>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberNm" name="memberNm" class="input-sm" value="<c:out value="${detail.memberNm}"/>" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerCeoEmail" name="buyerCeoEmail" class="input-sm" value="<c:out value="${detail.buyerCeoEmail}"/>" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<!-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprRespsibHpNo" name="entprRespsibHpNo" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr> -->
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerCeo" name="buyerCeo" class="input-sm" value="<c:out value="${detail.buyerCeo}"/>" maxlength="40" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">회사명</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="companyNm" name="companyNm" class="input-sm" value="<c:out value="${detail.companyNm}"/>" maxlength="30" style="width:100%">
												</label>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerComRegNum" name="buyerComRegNum" class="input-sm" value="<c:out value="${detail.buyerComRegNum}"/>" maxlength="13" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
												<!-- <label class="input" style="width:100%">
													<input type="text" id="entprCeoEmail" name="entprCeoEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label> -->
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">관심분야</th>
											<td>
												<%-- <select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox()" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.orderNbr}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" >
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
												<!-- 20191217 관심분야를 코드로 하는지 텍스트로 하는지 정확히 확인이 안되서 우선 텍스트로 구성함 -->
												<input type="text" id="buyerBusArea" name="buyerBusArea" class="input-sm" value="<c:out value="${detail.buyerBusArea}"/>" maxlength="20" style="width:100%">
												
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerSite" name="buyerSite" class="input-sm" value="<c:out value="${detail.buyerSite}"/>" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<!-- <option value="000001">기업회원</option>
													<option value="000002">전문가</option> -->
													<option value="000003">바이어</option>
												</select>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="<c:out value="${detail.buyerHeadAddr}"/>" maxlength="60" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode4()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadTel" name="buyerHeadTel" class="input-sm" value="<c:out value="${detail.buyerHeadTel}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadFax" name="buyerHeadFax" class="input-sm" value="<c:out value="${detail.buyerHeadFax}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="<c:out value="${detail.buyerBranchAddr}"/>" maxlength="50" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode5()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchTel" name="buyerBranchTel" class="input-sm" value="<c:out value="${detail.buyerBranchTel}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchFax" name="buyerBranchFax" class="input-sm" value="<c:out value="${detail.buyerBranchFax}"/>" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 바이어회원 정보 수정 form E -->
					
			
			
			<!--기업회원 정보 등록 form S -->
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" maxlength="20" style="width:100%" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');">	
												</label>
												<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
													사용가능한 아이디입니다.
												</div>
												<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
													사용 불가능한 아이디입니다.
												</div>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">
												<a href="#" id="idChkBtn" class="btn btn-primary" ><b>중복확인</b></a>
											</th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memPwdChk" name="memPwdChk" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름(담당자명) * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberNm" name="memberNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprRespsibEmail" name="entprRespsibEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprRespsibHpNo" name="entprRespsibHpNo" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">회사명</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprNm" name="entprNm" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprCeo" name="entprCeo" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprComRegNum" name="entprComRegNum" class="input-sm" value="" maxlength="13" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자E-MAIL</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprCeoEmail" name="entprCeoEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업분야</th>
											<td>
												<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox()" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.orderNbr}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" >
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprSite" name="entprSite" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<option value="000001">기업회원</option>
													<!-- <option value="000002">전문가</option>
													<option value="000003">바이어</option> -->
												</select>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="input-sm" value="" maxlength="60" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="entprHeadTel" name="entprHeadTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="entprHeadFax" name="entprHeadFax" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="entprBranchAddr" name="entprBranchAddr" class="input-sm" value="" maxlength="50" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode1()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="entprBranchTel" name="entprBranchTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="entprBranchFax" name="entprBranchFax" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 기업 회원정보 등록 form E -->	
			
			<!--전문가 정보 등록 form S -->
			<c:if test="${viewType eq 'create1'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm1" name="insertFrm1" action="#" method="POST">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" maxlength="20" style="width:100%" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');">	
												</label>
												<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
													사용가능한 아이디입니다.
												</div>
												<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
													사용 불가능한 아이디입니다.
												</div>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">
												<a href="#" id="idChkBtn" class="btn btn-primary" ><b>중복확인</b></a>
											</th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memPwdChk" name="memPwdChk" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberNm" name="memberNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertStRegNo" name="expertStRegNo" class="input-sm" value="" maxlength="20" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id=expertHeadTel" name="expertHeadTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertRegNo" name="expertRegNo" class="input-sm" value="" maxlength="10" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertEmail" name="expertEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
												
											</td>
										</tr>
										
										<tr>										
											<th style="text-align:center;background:#eee;vertical-align:middle;">최종학력</th>
											<td>
												<select id="expertFnalEduCd" name="expertFnalEduCd" onchange="expertFnalEduCdSelectBox()" >
													<c:forEach var="expertFnalEduCd" items="${expertFnalEduCd}" varStatus="status" >
													 	<option value="${expertFnalEduCd.orderNbr}">${expertFnalEduCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<%-- <select id="mediumBussAreaCd" name="mediumBussAreaCd" >
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
												
												<label class="input" style="width:100%">
													<input type="text" id="expertFinalSchoolNm" name="expertFinalSchoolNm" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
												
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertMajorNm" name="expertMajorNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속기관 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertHeadAddrNm" name="expertHeadAddrNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertDptmNm" name="expertDptmNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="expertOffiDutyNm" name="expertOffiDutyNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">산학연간</th>
											<td>
												<select id="expertIndsEduCd" name="expertIndsEduCd" onchange="expertIndsEduCdSelectBox()" >
													<c:forEach var="expertIndsEduCd" items="${expertIndsEduCd}" varStatus="status" >
													 	<option value="${expertIndsEduCd.orderNbr}">${expertIndsEduCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
											
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전문분야</th>
											<td>
												<select id="largeSpecialAreaCd" name="largeSpecialAreaCd" onchange="largeSpecialAreaCdSelectBox()" >
													<c:forEach var="largeSpecialAreaCd" items="${largeSpecialAreaCd}" varStatus="status" >
													 	<option value="${largeSpecialAreaCd.orderNbr}">${largeSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<%-- <select id="mediumSpecialAreaCd" name="mediumSpecialAreaCd" >
													<c:forEach var="mediumSpecialAreaCd" items="${mediumSpecialAreaCd}" varStatus="status" >
													 	<option value="${mediumSpecialAreaCd.commonCd}">${mediumSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부전문분야 *</th>
											<td>
												<select id="detailSpecialAreaCd" name="detailSpecialAreaCd" >
													<c:forEach var="detailSpecialAreaCd" items="${detailSpecialAreaCd}" varStatus="status" >
													 	<option value="${detailSpecialAreaCd.commonCd}">${detailSpecialAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<!-- <option value="000001">기업회원</option> -->
													<option value="000002">전문가</option>
													<!-- <option value="000003">바이어</option> -->
												</select>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자택주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="expertHomeAddr" name="expertHomeAddr" class="input-sm" value="" maxlength="60" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode2()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자택상세주소</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertHomeDetailAddr" name="expertHomeDetailAddr" class="input-sm" value="" maxlength="12" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiAddr" name="expertOffiAddr" class="input-sm" value="" maxlength="50" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode3()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiTel" name="expertOffiTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직장대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="expertOffiFax" name="expertOffiFax" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="createBtn1" class="btn btn-primary" ><b>등록</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 전문가 정보 등록 form E -->		
			
			<!--바이어 정보 등록 form S -->
			<c:if test="${viewType eq 'create2'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm2" name="insertFrm2" action="#" method="POST">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberId" name="memberId" class="input-sm" value="" maxlength="20" style="width:100%" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');">	
												</label>
												<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
													사용가능한 아이디입니다.
												</div>
												<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
													사용 불가능한 아이디입니다.
												</div>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">
												<a href="#" id="idChkBtn" class="btn btn-primary" ><b>중복확인</b></a>
											</th>
											<td>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memberPw" name="memberPw" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memPwdChk" name="memPwdChk" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="memberNm" name="memberNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerCeoEmail" name="buyerCeoEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<!-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprRespsibHpNo" name="entprRespsibHpNo" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
											</td>
										</tr> -->
										<tr>											
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerCeo" name="buyerCeo" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">회사명</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="companyNm" name="companyNm" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerComRegNum" name="buyerComRegNum" class="input-sm" value="" maxlength="13" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%">
												</label>
											</td>
										
											<th style="text-align:center;background:#eee;vertical-align:middle;"></th>
											<td>
												<!-- <label class="input" style="width:100%">
													<input type="text" id="entprCeoEmail" name="entprCeoEmail" class="input-sm" value="" maxlength="40" style="width:100%">
												</label> -->
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">관심분야</th>
											<td>
												<%-- <select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox()" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.orderNbr}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" >
													<c:forEach var="mediumBussAreaCd" items="${mediumBussAreaCd}" varStatus="status" >
													 	<option value="${mediumBussAreaCd.commonCd}">${mediumBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select> --%>
												<!-- 20191217 관심분야를 코드로 하는지 텍스트로 하는지 정확히 확인이 안되서 우선 텍스트로 구성함 -->
												<input type="text" id="buyerBusArea" name="buyerBusArea" class="input-sm" value="" maxlength="20" style="width:100%">
												
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="buyerSite" name="buyerSite" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td colspan="3">
												<select id="joinTypeCd" name="joinTypeCd" style="width: 250px; height: 30px;">
<!-- 													<option value="000000">마스터</option>
													<option value="000000">일반회원</option>
													<option value="000000">사업담당자</option> -->
													<!-- <option value="000001">기업회원</option>
													<option value="000002">전문가</option> -->
													<option value="000003">바이어</option>
												</select>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadAddr" name="buyerHeadAddr" class="input-sm" value="" maxlength="60" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode4()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadTel" name="buyerHeadTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerHeadFax" name="buyerHeadFax" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchAddr" name="buyerBranchAddr" class="input-sm" value="" maxlength="50" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode5()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchTel" name="buyerBranchTel" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX</th>
											<td>
												<label class="input" style="width:94%">
													<input type="text" id="buyerBranchFax" name="buyerBranchFax" class="input-sm" value="" maxlength="12" style="width:100%" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/memberList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="createBtn2" class="btn btn-primary" ><b>등록</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 바이어 정보 등록 form E -->				
					
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 
	<input type="hidden" name="chkYn" id="chkYn" value="">
	
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
    <input type="hidden" name="joinTypeCd" value="<c:out value='${searchVO.joinTypeCd}'/>"/>  
    <input type="hidden" name="memberId" value="<c:out value='${searchVO.memberId }'/>"/>
    
	<!-- END MAIN PANEL -->
	
</body>
</html>