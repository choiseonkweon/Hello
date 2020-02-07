/*
 *===========================*
 ||            20191204 최선권	           ||
 ||                내 기업정보	                   ||
 ||               기업사원 정보	               ||
 *===========================*
  
 */
	
	$(document).ready(function () {
		//설립일 달력
		
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
		

		
	           
/****************************************************************************************/
/****************************************************************************************/
		
		/*성과관리 추가완료 버튼 클릭시*/
		$("#ERsaveBtn").click(function(){
			var formData = new FormData();
			
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
		
/****************************************************************************************/
/****************************************************************************************/
		
		
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
		
/****************************************************************************************/
/****************************************************************************************/		

		/*지적재산권 추가완료 버튼 클릭시*/
		$("#saveBtn").click(function(){
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


		/*지적재산권  수정완료 버튼 클릭시*/
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

		
/****************************************************************************************/
/****************************************************************************************/

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
				//alert(medium_buss_area_cd);
				formData.append("memberId",$('#sessionMemberId').val());
				formData.append("entprNm",$('#entprNm').val());
				formData.append("entprSite",$('#entprSite').val());
				formData.append("entprComRegNum",$('#entprComRegNum').val()); 
				formData.append("largeBussAreaCd",$('#largeBussAreaCd').val());
				formData.append("mediumBussAreaCd",medium_buss_area_cd);
				formData.append("entprCeo",$('#entprCeo').val());
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
		                	window.location.href="/db/main.do";
						}
					},  
					error:function(request,status,error){ //ajax 오류인경우  
						alert("작업중 에러가 발생했습니다.");      
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
				    
	});//	$(document).ready


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