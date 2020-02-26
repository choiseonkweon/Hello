<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function () {

		var bussAnncemntNo = $('#bussAnncemntNo').val();
		
		$("#busApplyBtn").click(function(){
			$("#busPop").show();
		});
		
		$("#closeBtn").click(function(){
			$("#busPop").hide();
		});

		$("#closeBtnX").click(function(){
			$("#busPop").hide();
		});
		$("select[name=phone1]").val("${phone1}").prop("selected","selected");

		
		$("#updateButton").click(function(bussAnncemntNo, attchFileNo){
			
			$('#bussAnncemntNo').val(bussAnncemntNo);
			$('#attchFileNo').val(attchFileNo);
			
			 $.ajax({
					type : 'post',
					url:'/db/business/businessManagementRegisterUpdateButton.do',
					data: $('#updateFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("승인을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("승인이 완료 되었습니다.");
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
		
		
		$("#saveBtn").click(function(){
			//alert("test");
			 $.ajax({
					type : 'post',
					url:'/db/business/businessManagementRegisterUpdateSave.do',
					data: $('#updateFrm').serialize(),
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
		});
		
		$("#createBtn").click(function(){
			var formData = new FormData();

			formData.append("bussAnncemntNo",$('#bussAnncemntNo').val());
			formData.append("bussAnncemntNm",$('#bussAnncemntNm').val());
			formData.append("bussFrDt",$('#bussFrDt').val());
			formData.append("bussToDt",$('#bussToDt').val()); 
			formData.append("bussCostAmt",$('#bussCostAmt').val());
			formData.append("bussDeptCd",$('#bussDeptCd').val());
			formData.append("originalUrl",$('#originalUrl').val());
			formData.append("bussCont",$('#bussCont').val());
			formData.append("bussDiviCd",$('#bussDiviCd').val());
			formData.append("applicStCd",$('#applicStCd').val());
			formData.append("memberId",$('#memberId').val());
			formData.append("approvalDt",$('#approvalDt').val());
			//formData.append("orgFileNm",$('#orgFileNm').val());
			formData.append("regDt",$('#regDt').val());
			formData.append("regId",$('#regId').val());
			formData.append("fileupload", $("input[name=orgFileNm]")[0].files[0]);

			$.ajax({
				type : 'post',
				url:'/db/business/businessManagementRegisterInsert.do',
				enctype: 'multipart/form-data',
				data: formData,
				contentType:false,		
				processData:false,
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
	});
		
		/* $("#createBtn").click(function(){
			 $.ajax({
					type : 'post',
					url:'/business/businessManagementRegisterInsert.do',
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
		}); */


		$(function() {
	           $("#datepicker1").datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	            });                    
	            
	            //초기값을 오늘 날짜로 설정
	            $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	        });

		
		$(function(){
			//input을 datepicker로 선언
         $("#datepicker2").datepicker({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
             //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
         });                    
         
         //초기값을 오늘 날짜로 설정
         $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
         
         $('#test').click(function(){
         	//alert("testetetet");
         })
         
     });
		

		
		//캘릭더 클리
		$(function(){

			$("#preYear").click(function(){
				var preYear = parseInt($("#presentYear").text()) - 1 ;
				$("#presentYear").text(preYear);
			})
			
			$("#nextYear").click(function(){
				var nextYear = parseInt($("#presentYear").text()) + 1 ;
				$("#presentYear").text(nextYear);
			})
			
			$(".month").click(function(e){
				$(".monthw").find("a").removeAttr("class", "on");
				$(e.target).attr("class", "on");
			})
			
			
			//첫 렌더링시에 더보기 데이터가 없을 경우 더보기 버튼 hidden 처리
			var totalCnt =$('#totCnt').val();
			var liCnt = parseInt( $(".ing").length );
			if( totalCnt <= liCnt ){
				$('#moreBtn').css('display','none');
			}

			
		});
					

		//input을 datepicker로 선언
        $("#bussFrDt").datepicker({
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
            ,onSelect : function(selectedDate) {
				$('#bussToDt').datepicker('option', 'minDate', selectedDate);
			}
        }); 
		
		$("#bussToDt").datepicker({
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
            ,onSelect : function(selectedDate) {
				$('#bussFrDt').datepicker('option', 'maxDate', selectedDate);
			}
        }); 
		
        $(".formDate").datepicker({
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
        });  
	
    var bussDeptCd = '${detail.bussDeptCd}';   
    
    $('#bussDeptCd').val(bussDeptCd);
    bussDeptCdSelectBox();
    
	
    
    
    
	});
	

    /*셀렉트*/
    function bussDeptCdSelectBox(dataOption){
    	var selectBoxData = $("#bussDeptCd").val();
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
    
    function moveDetailView(bussAnncemntNo,attchFileNo){
    	
    	var yn = confirm("승인처리하시겠습니까?");
    	
    	if(yn){
	    	$('#bussAnncemntNo').val(bussAnncemntNo);
	    	$('#attchFileNo').val(attchFileNo);
	    	$('#orgFileNm').val(orgFileNm);
	
			$('#updateFrm').attr('action', "/db/business/businessManagementRegisterUpdateButton.do").submit();
    	}
    	else{
    		
    	}
    	
    	
    }
    function moveDetailView1(bussAnncemntNo,attchFileNo,remark){
		
    	var updateFrm = document.updateFrm;
    	var remark1 = '';
    	
    	alert(updateFrm.remark.value=(remark1));
    	
    	alert(remark);
    	
    	var yn = confirm("반려처리하시겠습니까?");
    	
    	
    	if(yn){
	    	$('#bussAnncemntNo').val(bussAnncemntNo);
	    	$('#attchFileNo').val(attchFileNo);
	    	$('#orgFileNm').val(orgFileNm);
	    	$('#remark').val(remark);
	
			$('#updateFrm').attr('action', "/db/business/businessManagementRegisterUpdateButton1.do").submit();
    	}
    	else{
    		
    	}
    	
    	
    }
    function moveDetailView2(bussAnncemntNo,attchFileNo){
    	
    	var yn = confirm("삭제처리하시겠습니까?");
    	
    	if(yn){
	    	$('#bussAnncemntNo').val(bussAnncemntNo);
	    	$('#attchFileNo').val(attchFileNo);
	    	$('#orgFileNm').val(orgFileNm);
	
			$('#updateFrm').attr('action', "/db/business/businessManagementRegisterUpdateButton2.do").submit();
    	}
    	else{
    		
    	}
    	
    	
    }
    
   
        
	
	
</script>


<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사업 관리</li><li><b>사업 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 등록</b></h1>
					</div>
				</div>
			</c:if>	
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			
	<!--  정보 수정 form -->
	<form id="updateFrm" name="updateFrm" enctype="multipart/form-data" method="POST">			
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						
							<input type="hidden" name="bussAnncemntNo" id="bussAnncemntNo" value="<c:out value="${detail.bussAnncemntNo}"/>"/>
							<input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail.attchFileNo}"/>"/>
							<input type="hidden" name="orgFileNm" id="orgFileNm" value="<c:out value="${detail.orgFileNm}"/>"/>
							<input type="hidden" name="remark" id="remark" value="<c:out value="${detail.remark}"/>"/>
							
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<c:out value="${detail.bussAnncemntNm}"/>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록자 </th>
											<td style="vertical-align:middle;">
												<c:out value="${detail.memberId}"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록일 </th>
											<td style="vertical-align:middle;">
												<c:out value="${detail.regDt}"/>
											</td>
										</tr>	
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 </th>
											<td>
												<label class="input" style="width: 100%;">
													<c:out value="${detail.bussAnncemntNo}"/>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 *</th>
											<td>
												<label class="input"> 
														<input type="text" id="bussFrDt" name="bussFrDt" value="${detail.bussFrDt}"   />
														&nbsp;~&nbsp;
														<input type="text" id="bussToDt" name="bussToDt" value="${detail.bussToDt}"  />
												</label>
											</td>
												
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업비용</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussCostAmt" name="bussCostAmt" value="${detail.bussCostAmt}"  />
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업부서</th>
											<td>
												<label class="input"> 
													<select id="bussDeptCd" name="bussDeptCd" >
													<c:forEach var="bussDeptCd" items="${bussDeptCd}" varStatus="status" >
													 	<option value="${bussDeptCd.commonCd}">${bussDeptCd.commonNm}</option>
													 </c:forEach>
												</select>
												</label>
											</td>
												
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<textarea class="ckeditor" name="bussCont" id="bussCont" style="width:100%;height:250px;">
														<c:out value="${detail.bussCont }" />
													</textarea>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
<%-- 												<form method="post" enctype="multipart/form-data" action="imgup.jsp">
													<input type="file" name="orgFileNm" size=100>
												</form> --%>
													<c:out value="${detail.orgFileNm }" />
													<!-- <input type="file" name="orgFileNm" id="orgFileNm" size=100> -->

											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/business/businessManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>수정</b></a>
								</div>
							</div>
							
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">							
								<tr>
									<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="5">승인요청목록</th>
									<!-- <th scope="row"><input type="checkbox" name="checkAll" id="checkAll"></th> -->
									<th style="text-align:center;background:#eee;vertical-align:middle;">회사명</th>
									<th style="text-align:center;background:#eee;vertical-align:middle;">증빙서류</th>
									<th style="text-align:center;background:#eee;vertical-align:middle;">승인요청일</th>
									<th style="text-align:center;background:#eee;vertical-align:middle;">상태</th>
									<th style="text-align:center;background:#eee;vertical-align:middle;">비고</th>
									<th style="text-align:center;background:#eee;vertical-align:middle;">승인 | 반려</th>
								</tr>
								<c:forEach var="detail1" items="${detail1}" varStatus="status">
								
								<tr>	
									<%-- <td>
										<td><input type="checkbox" name="checkRow" id="checkRow" value="<c:out value='${result.memberId}' />" /></td>
									</td> --%>
									<td>
										<c:out value="${detail1.bussAnncemntNo}"/> 
									</td>
									<td>
										<c:out value="${detail1.fileCourse}"/> 
									</td>
									<td>
										<c:out value="${detail1.regDt}"/> 
									</td>
									<td>
										<c:out value="${detail1.applicStCd}"/> 
									</td>
									<td>
										<c:out value="${detail1.remark}"/> 
									</td>
									<td>
										<!-- <input type="button" id="updateButton" name="updateButton">승인</input> -->
										<%-- <a href="javascript:moveDetailView('${detail.bussAnncemntNo}','${detail1.attchFileNo}');">   --%>
										<button type="button" onclick="javascript:moveDetailView('${detail.bussAnncemntNo}','${detail1.attchFileNo}');">	
											<input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail1.attchFileNo}"/>"/>
											승인 
										</button>
										<!-- </a> -->	
										<%-- <a href="javascript:moveDetailView1('${detail1.bussAnncemntNo}','${detail1.attchFileNo}');">  
											<input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail1.attchFileNo}"/>"/>
											반려
										</a> --%>
										<button type="button" class="btnjoin" id="busApplyBtn">
											<input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail1.attchFileNo}"/>"/>
											반려
										</button>
										<%-- <a href="javascript:moveDetailView2('${detail1.bussAnncemntNo}','${detail1.attchFileNo}');">
											<input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail1.attchFileNo}"/>"/>  
											삭제
										</a> --%> 
									</td>
								</tr>
								</c:forEach>
							</table>
			
			<c:forEach var="detail2" items="${detail2}" varStatus="status">
			<div class="layer" style="display: none;" id="busPop">
				<div class="box boxw600" style="height: 500px; margin-top: -325px;">
					
					<div class="ti">실적 반려사유</div>
					<div class="">
					
						<div class="sti">기업정보</div>
						<table class="table01">
							<colgroup>
								<col width="30%" /><col width="*" />
							</colgroup>
							<tr>
								<th>업체(기관)명</th>
								<td>
									<input type="text" id="bussAnncemntNo" name="bussAnncemntNo" maxlength="100" value="${detail.bussAnncemntNo}" style="width:100%" readOnly>
								</td>
							</tr>
							<tr>
								<th>사업명</th>
								<td>
									<input type="text" id="bussAnncemntNm" name="bussAnncemntNm" value="${detail.bussAnncemntNm}" style="width:100%" disabled="disabled">
								</td>
							</tr>
							<tr>
								<th>신청일</th>
								<td>
									<input type="text" id="regDt" name="regDt" value="${detail.regDt}" style="width: 100px;" />
								</td>
							</tr>
							<tr>
								<th>반려사유</th>
								<td>
									<input type="text" id="remark" name="remark" value="${detail2.remark}" style="width: 100px;"/>
								</td>
							</tr>
						</table>
						<div class="submitbtn">
			 					
			 					<%-- <c:if test="${memberId==null}">	<!--  로그인이 안되면 작동이 안됨--> --%>
				 					<!-- <button type="button" class="ok">신청2하기</button> -->
				 					<button type="button" onclick="javascript:moveDetailView1('${detail.bussAnncemntNo}','${detail2.attchFileNo}','${detail2.remark}');">
				 					<%-- <input type="hidden" name="attchFileNo" id="attchFileNo" value="<c:out value="${detail2.attchFileNo}"/>"/>
				 					<input type="hidden" name="remark" id="remark" value="<c:out value="${detail.remark}"/>"/> --%>
				 					반려하기
				 					</button>
			 				<%-- 	</c:if> --%>
							<a href="#" id="closeBtn">
								<button type="button">취소</button>	
							</a>
							
															
						</div>
						<!-- <a href="#" id="closeBtnX">
							<button type="button" class="btn_close">X</button>
						</a> -->
						
					</div>
					
				</div>
			</div>
												
				</c:forEach>			
							
					
						
						
					</div>
				</section>
			</c:if>
			</form>
			
			<!-- 정보저장 form -->
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" enctype="multipart/form-data" method="POST">
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="bussAnncemntNm" name="bussAnncemntNm" class="input-sm" value="" style="width:100%;" maxlength="6">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 * </th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="bussFrDt" id="bussFrDt" placeholder="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"  />
													<!-- <i class="icon-append fa fa-calendar"></i> -->
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="bussToDt" id="bussToDt" placeholder="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
													<!-- <i class="icon-append fa fa-calendar"></i> -->
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업비용</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussCostAmt" name="bussCostAmt" class="input-sm" value="" style="width:100%;" maxlength="12" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업부서</th>
											<td>
												<select id="bussDeptCd" name="bussDeptCd" >
													<c:forEach var="bussDeptCd" items="${bussDeptCd}" varStatus="status" >
													 	<option value="${bussDeptCd.commonCd}">${bussDeptCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 </th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussAnncemntNo" name="bussAnncemntNo" class="input-sm" value="" style="width:100%;" maxlength="30" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">원문Url</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="originalUrl" name="originalUrl" class="input-sm" value="" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<textarea class="ckeditor" name="bussCont" id="bussCont" style="width:100%;height:250px;"></textarea>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부1파일</th>
											<td colspan="3">
<%-- 										<form method="post" enctype="multipart/form-data" action="imgup.jsp">
													<input type="file" name="filename1" size=100>
												</form>
 --%>										<input type="file" name="orgFileNm"id="orgFileNm" size=100>
 											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/business/businessManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
		</div>
		<!-- END MAIN CONTENT -->


	</div>
	 
	<!-- 검색조건 유지 -->
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	
</body>
</html>


