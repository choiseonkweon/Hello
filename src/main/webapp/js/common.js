
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
		            $('.extraRoadAddr').val("(" + data.zonecode + ")" + " " + fullRoadAddr);
			}
	}).open({
		popupName : 'postCodePopup'
		
	});
}


$(document).ready(function () {
    
})//document end


 // 숫자
 var  onlyNumber = function( evt ){
        var code = (evt.which) ? evt.which : evt.keyCode

       if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46)
       {
           return true;
       } else {
       	return false;
       }
   }
    
	//input을 datepicker로 선언
 betweenPicker = function (fromId, toId,gubun){
	 var buttonImgPath = "../img/btn_datepicker.png";
	 if(gubun === "front"){
		 buttonImgPath = "../db/img/btn_datepicker.png";
	 }
    	$("#"+fromId).datepicker({
    		dateFormat: 'yy-mm-dd' //Input Display Format 변경
    			,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    			,changeYear: true //콤보박스에서 년 선택 가능
    			,changeMonth: true //콤보박스에서 월 선택 가능                
    			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
    				
    				,buttonImage: buttonImgPath //버튼 이미지 경로
    					,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    					,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    						,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    							,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
    	,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    	,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    	,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
    	,onSelect : function(selectedDate) {
    		$('#'+toId).datepicker('option', 'minDate', selectedDate);
    	}
    	}); 
    	$("#"+toId).datepicker({
    		dateFormat: 'yy-mm-dd' //Input Display Format 변경
    			,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    			,changeYear: true //콤보박스에서 년 선택 가능
    			,changeMonth: true //콤보박스에서 월 선택 가능                
    			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
    				,buttonImage: buttonImgPath //버튼 이미지 경로
    					,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    					,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    						,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    							,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
    	,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    	,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    	,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
    	,onSelect : function(selectedDate) {
    		$('#'+fromId).datepicker('option', 'maxDate', selectedDate);
    	}
    	});    	
    } 
	
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
		  
  oneDatepicker =  function(cls){
	            $("."+cls).datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                    ,changeYear: true //콤보박스에서 년 선택 가능
	                    ,changeMonth: true //콤보박스에서 월 선택 가능                
	                    ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                        ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
	                            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                                    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	            //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
	            
	            });       
	}
		  
  oneDatepicker2 =  function(cls){
			  $("."+cls).datepicker({
				  dateFormat: 'yy-mm-dd' //Input Display Format 변경
					  ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					  ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
					  ,changeYear: true //콤보박스에서 년 선택 가능
					  ,changeMonth: true //콤보박스에서 월 선택 가능                
					  ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						  ,buttonImage: "../db/img/btn_datepicker.png" //버튼 이미지 경로
							  ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
							  ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
								  ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
									  ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			  ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			  ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			  ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			  //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			  //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
			  
			  });       
		  }

