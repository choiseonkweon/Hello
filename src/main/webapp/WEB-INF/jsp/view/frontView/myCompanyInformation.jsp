<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<link >
<script type="text/javascript" src="../../db/js/myCompanyInformation.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<body>
	<script type="text/javascript">
/************************/
/* 	성과관리 추가 삭제 수정 시작  	   */
/************************/

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



/*기업성과 리스트 불러오기*/
function showCompanyList(){
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
	var memberId = '${memberId}';
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


/************************/
/* 	성과관리 추가 삭제 수정 종료  	   */
/************************/

/************************/
/* 진흥원 수혜사업 추가 삭제 수정 시작  */
/************************/
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

/************************/
/* 진흥원 수혜사업 추가 삭제 수정 시작  */
/************************/
 
 /************************/
/*  지적재산권현황 추가 삭제 수정 시작  */
/************************/
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

	//삭제기능 
	$(document).on("click",".deljecpBtn",function(){
		var memberId = '${memberId}';
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

 /************************/
/*  지적재산권현황 추가 삭제 수정 시작  */
/************************/
 
 /**********************/
 /* 기업사원정보 추가 삭제 수정 시작 */
 /**********************/
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
 	
 	//삭제기능 
 	$(document).on("click",".delBtn",function(){
 		var memberId = '${memberId}';
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

 	//수정기능 
 	$(document).on("click",".employeeUptBtn",function(){
 		var delRow = $(this).closest('tr').prevAll().length;

 		var enterpriseIdx = $("#enterpriseIdx"+delRow).text();
 		$.ajax({
 			type : 'post',
 			url:'/db/memberemployeeUpdate.do',
 			enctype: 'multipart/form-data',
 			data: {
 						"enterpriseIdx" : enterpriseIdx
 					},
 			dataType: 'json',
 			success : function(data) {
 				if(data.returnCode == 0 || data.returnCode1 == 0){
 					alert("등록을 실패 하였습니다.");
 					return;
 				}else{
 					alert("삭제가 완료 되었습니다.");
 					showemployeesList(); 
 				}
 			},  
 			error:function(request,status,error){ //ajax 오류인경우  
 				alert("작업중 에러가 발생했습니다.");      
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			} 
 		});
 	});
 	};
 /**********************/
 /* 기업사원정보 추가 삭제 수정 종료 */
 /**********************/	
 
 
	function datecheck1(){//data 유효성 검사 
	    var re = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if (re.test($('input[name=entprEstDt]').val())) {
			$('input[name=entprEstDt]').css("color", "blue");

		} else {
			$('input[name=entprEstDt]').css("color", "red");
		}	    
	}
	
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

/* 진흥원 수혜사업 수정*/
	function fn_editReply(totcnt, entprEmployeeNm, entprEmployeeDept, entprEmployeePosition, entprEmployeeEmail, entprEmployeePhone, orgFileNm, remark){

		document.getElementById('uptotcnt').value=totcnt;
		document.getElementById('upEntprEmployeeNm').value=entprEmployeeNm;
		document.getElementById('upentprEmployeeDept').value=entprEmployeeDept;
		document.getElementById('upentprEmployeePosition').value=entprEmployeePosition;
		document.getElementById('upentprEmployeeEmail').value=entprEmployeeEmail;
		document.getElementById('upentprEmployeePhone').value=entprEmployeePhone;
		document.getElementById('upremark').value=remark;
		$("#EmployeePop4").show();		
	}
	
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

			/* 본사 대표전화 담기 */
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

			/* 사업분야코드 담기 */
			var largeBussAreaCd = '${detail.largeBussAreaCd}';
			var mediumBussAreaCd = '${detail.mediumBussAreaCd}';
			$('#largeBussAreaCd').val(largeBussAreaCd);
			largeBussAreaCdSelectBox(mediumBussAreaCd);
		});
</script>
<input type="hidden" id="memberIdx" name="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
<input type="hidden" id="memberId" name="memberId" value="${detail.memberId}" />
<input type="hidden" id="memberId" name="memberId" value="${detail.memberId}" />
<input type="hidden" id="memberPw" name="memberPw" value="${detail.memberPw}" />
<input type="hidden" id="sessionMemberId" name="sessionMemberId" value="${memberId}" />

<div id="wrap" class="sub s5">
<jsp:include page="menu.jsp"></jsp:include>

	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>마이페이지</span>
				<span class="now">내 기업 정보</span>
			</div>
		</div>
		<div class="layout01">
				
			<h2 class="">마이페이지 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>내 기업 정보</h3>
				<div class="continner">
					<div class="daylist">
						<h4>기본정보</h4>
						<form id="updateFrm" name="updateFrm" action="#" method="POST" >
						<table class="table01"	>
							<colgroup>
								<col width="20%" /><col width="30%" /><col width="20%" /><col width="*" 		/>
							</colgroup>
							<tr>
								<th>업체(기관)명</th>
								<td>
									<input type="text" id="entprNm" name="entprNm" value="${detail.entprNm}"	/>
								</td>
								<th>홈페이지</th>
								<td>
									<input type="text" id="entprSite" name="entprSite" value="${detail.entprSite}"  />
								</td>
							</tr>
							<tr>
								<th>사업자등록번호</th>
								<td>
									<input type="text" id="entprComRegNum"	name="entprComRegNum" value="${detail.entprComRegNum}" maxlength="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>

								</td>
								<th>사업분야</th>
								<td><div style="margin-bottom: 5px;">
									
									<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox('')" >
										<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
										 	<option value="${largeBussAreaCd.commonCd}">${largeBussAreaCd.commonNm}</option>
										 </c:forEach>
									</select>
									</div>
									<div >
										<select id="mediumBussAreaCd" name="mediumBussAreaCd" style="position:relative;">
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>대표자</th>
								<td>
									<input type="text" id="entprCeo" name="entprCeo" value="${detail.entprCeo}"  />
								</td>
								<th>대표자이메일</th>
								<td>
									<input type="text" id="entprCeoEmail1" name="entprCeoEmail1" value="" style="width:100px;"/>@
									<select id="entprCeoEmail2" name="entprCeoEmail2">
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
								<th>본사주소</th>
								<td colspan="3">
									<input type="text" style="width: 400px;float: left; margin-right: 5px;" id="entprHeadAddr" name="entprHeadAddr" value="${detail.entprHeadAddr}" readOnly/>
									<button type="button" class="txtbtn" style="width: 120px; " onclick="javascript:openDaumPostcode()">우편번호 검색</button>
									<input type="text" style="width: 525px;" id="entprHeadDetailAddr" name="entprHeadDetailAddr" value="${detail.entprHeadDetailAddr}" />
								</td>
							</tr>
							<tr>
								<th>본사 대표전화</th>
								<td>
									<select style="width: 20%;margin-right: 5px;" id="entprHeadTel1" name="entprHeadTel1">
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
									<input type="text" style="width: 15%;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprHeadTel2" name="entprHeadTel2" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
									<input type="text" style="width: 15%;margin-left: 5px; text-align: center;" id="entprHeadTel3" name="entprHeadTel3" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
								</td>
							</tr>
							<tr>
								<th>지사주소</th>
								<td colspan="3">
									<input type="text" style="width: 400px;float: left; margin-right: 5px;" id="entprBranchAddr" name="entprBranchAddr" value="${detail.entprBranchAddr}" readOnly/>
									<button type="button" class="txtbtn" style="width: 120px; " onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
									<input type="text" style="width: 525px;" id="entprBranchDetailAddr" name="entprBranchDetailAddr" value="${detail.entprBranchDetailAddr}" />

								</td>
							</tr>
							<tr>
								<th>지사 대표전화</th>
								<td colspan="3">
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
									<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprBranchTel2" name="entprBranchTel2" value="${detail.entprBranchTel}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
									<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprBranchTel3" name="entprBranchTel3" value="${detail.entprBranchTel}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
								</td>
							</tr>
							<tr>
								<th>설립일</th>
								<td>
									<input type="text" style="width:90px; text-align: center;" class="date"id="entprEstDt" name="entprEstDt" value="${detail.entprEstDt}" oninput="datecheck1()" maxlength="10"/>
								</td>
								<th>자본금</th>
								<td>
									<input type="text" style="width: 50%; text-align: right;" id="entprCapitalAmt" name="entprCapitalAmt" value="${detail.entprCapitalAmt}" />
								</td>
							</tr>
						</table>
						</form>
						
						<h4 class="clearfix">
							성과관리
						<button type="button" class="txtbtn floatR" id="ERaddBtn">추가</button>						
							
						</h4>
						<div class="table01 datetable" id="resultTable">
							<table class="table01 datetable" id="resultTable">
								<colgroup>
									<col width="10%" />	<col width="20%" /><col width="20%" /><col width="20%" /><col width="20%" /><col width="10%" />
								</colgroup>
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
						</div>						 
						 
						<h4 class="clearfix">
							진흥원 수혜사업
						</h4>
						<table class="table01 datetable" id="resultTable">
							<colgroup>
							<col width="5%" /><col width="10%" /><col width="15%" />	<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" />
							</colgroup>
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

						<h4 class="clearfix">
							지적재산권 현황
							<button type="button" class="txtbtn floatR" id="resultBtn1">추가</button>
						</h4>
						<table class="table01 datetable" id="resultTable1">
							<colgroup>
								<col width="5" /><col width="10" /><col width="10" /><col width="10" /><col width="10" /><col width="5" /><col width="10" /><col width="10" /><col width="10" /><col width="10" />
							</colgroup>
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
						

						<h4>
							기업사원 정보
							<button type="button" class="txtbtn floatR" id="employeeBtn">추가</button>						
						</h4>
						<form id="employeeFrm" name="employeeFrm" method="POST" enctype="multipart/form-data"></form>
						
						<table class="table01 datetable pct" id="resultTable2">
							<colgroup>
								<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" />
							</colgroup>
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
						
<!-- 						<div class="text1">
							<label class="">
								<input type="checkbox" id="joinAgree1" name="okok" /> 전남콘텐츠 기업육성센터 원스톱 지원실 자문·컨설팅 이용을 위해 개인정보 활용에 대해 동의합니다.
							</label>ㅋ
						</div> -->
						<div class="submitbtn">
							<a href="#">
								<button type="button" class="ok" id="fn_main">취소</button>
							</a>
							<a href="#" id="okok">
								<button type="button">저장하기</button>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 기업성과 추가하기 -->
<div class="layer" style="display: none;" id="resultPop">
	<div class="box boxw600" style="height: 490px; margin-top: -245px;">
		<div class="ti">기업 성과 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
		</div>
			<button type="button" class="btn_close closeBtn">X</button>
	</div>
</div>

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
							 	<option value="${propt.commonCd}">${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="regFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonCd}">${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="regNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonCd}" <c:if test="${nation.commonCd=='KOR'}">selected</c:if> >${nation.commonNm}</option>
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
						<input type="text" style="width: 25%;" id="intltProptyDt" name="intltProptyDt" value="" class="date"/>
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
				<button type="button" id="saveBtn" name="saveBtn">저장하기</button>
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
						<input type="text" name="entprEmployeeNm" id="entprEmployeeNm" style="width: 75%;" maxlength="7"/>
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
						<input type="text" name="entprEmployeeEmail" id="entprEmployeeEmail"  style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="entprEmployeePhone" id="entprEmployeePhone"  style="width:75%" maxlength="11"/>
					</td>
				</tr>
				<tr>
					<th>4대보험</th>
					<td>
						<input type="file" name="fileupload" style="width:75%"/>
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
							 	<option value="${propt.commonCd}" >${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="upregFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonCd}" >${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="upregNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonCd}" >${nation.commonNm}</option>
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
							 	<option value="${YearCd.commonCd}" >${YearCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="entprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonCd}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalamt" id="entprCapitalamt" value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="entprResultTakeAmt"  value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="entprResultEmpCnt"  value=""style="width:75% "maxlength="3"/>명
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
							 	<option value="${YearCd.commonCd}" >${YearCd.commonNm}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="upentprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonCd}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalAmt" id="upentprCapitalAmt" value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="upentprResultTakeAmt"  value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="upentprResultEmpCnt"  value=""style="width:75%" maxlength="3"/>명
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>