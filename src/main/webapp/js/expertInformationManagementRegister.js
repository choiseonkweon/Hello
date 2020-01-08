



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
		
		$(".ok").click(function(){
			alert("ㅎ2");
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
	                	window.location.href="/db/main.do";
					}
				},  
				error:function(request,status,error){ //ajax 오류인경우  
					alert("작업중 에러가 발생했습니다.");      
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
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
