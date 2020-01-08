
/*20191224 최선권 관리자 마이페이지*/

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
		
		$(".ok").click(function(){
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

			formData.append("buyerBusAreaCd",$('#buyerBusAreaCd').val());//관심분야
			formData.append("buyerSite",$('#buyerSite').val());//홈페이지
			formData.append("buyerHeadAddr",$('#buyerHeadAddr').val());//본사주소1
			formData.append("buyerHeadDetailAddr",$('#buyerHeadDetailAddr').val());//본사주소2
			formData.append("buyerBranchAddr",$('#buyerBranchAddr').val());//지사주소1
			formData.append("buyerCeoEmail",buyerCeoEmail);//대표 이메일
			formData.append("buyerHeadTel",buyerHeadTel);//대표 전화
			formData.append("buyerHeadFax",buyerHeadFax);//대표팩스
			formData.append("buyerBranchTel",buyerBranchTel);//지사전화
			formData.append("buyerBranchFax",buyerBranchFax);//지사팩스
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
		//업데이트
		$("#uphistBtn").click(function(){
			var	 formData = new FormData();
			var one = $('#upbuyerHistDt').val()
			var two = one.replace("-","");
			var buyerHistDt = two.replace("-","");
			formData.append("memberId",$('#memberId').val());
			formData.append("buyerHistIdx",$('#upbuyerHistIdx').val());
			formData.append("buyerHistNm",$('#upbuyerHistNm').val());
			formData.append("buyerHistInvt",$('#upbuyerHistInvt').val());
			formData.append("buyerHistSpec",$('#upbuyerHistSpec').val());
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
						document.getElementById('upbuyerHistSpec').value="";
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
		function fn_updateEr(buyerHistIdx, buyerHistNm, buyerHistInvt, buyerHistSpec,buyerHistDt,buyerHistContent,processCd){
			alert("buyerHistContent" + buyerHistContent);
			alert("processCd" + processCd);
			document.getElementById('upbuyerHistIdx').value=buyerHistIdx;
			document.getElementById('upbuyerHistNm').value=buyerHistNm;
			document.getElementById('upbuyerHistInvt').value=buyerHistInvt;
			document.getElementById('upbuyerHistSpec').value=buyerHistSpec;
			document.getElementById('upbuyerHistDt').value=buyerHistDt;
			document.getElementById('upbuyerHistContent').value=buyerHistContent;
			document.getElementById('upprocessCd').value=processCd;
			$("#upbuyerHistPop").show();
		}
