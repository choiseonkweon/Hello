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

	});
//$(document).ready 종료
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
//			                    htmls +="<td><button type='button' class='txtbtn floatR ERDelBtn'>삭제</button><button type='button' onclick='fn_updateEr(\"" + this.enterpriseIdx + "\", \"" + this.entprResultYearCd + "\", \"" + this.entprResultQtaCd + "\", \"" + this.entprCapitalAmt + "\", \"" + this.entprResultTakeAmt  + "\", \"" + this.entprResultEmpCnt + "\" )' class='txtbtn floatR uptBtn' >수정</button></td>";
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

/*기업 사워조회*/	
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
												<span>${detail.entprRespsibEmail}</span>
											</td>
										</tr>
									
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">담당자명 * </th>
											<td>
												<span>${detail.entprRespsibNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 연락처 </th>
											<td>
												<span>${detail.entprRespsibHpNo}</span>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">대표자 * </th>
											<td>
												<span>${detail.entprCeo}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">업종명 </th>
											<td>
												<span>${detail.entprTypeNm}</span>											
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업자등록번호 * </th>
											<td style="vertical-align:middle;">
												<span>${detail.entprComRegNum}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 E-Mail </th>
											<td>
											<span>${detail.entprCeoEmail}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업분야 </th>
											<td style="vertical-align:middle;">
											<span>${detail.largeBussAreaCd}</span> > <span>${detail.largeBussAreaCd}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 </th>
											<td>
											<span>${detail.entprSite}</span>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">본사 </th>
											<td>
													<span>${detail.entprHeadAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화 </th>
											<td>
												<span>${detail.entprHeadTel}</span>
											</td> 
										</tr>
										<tr>
											<td>
												<span>${detail.entprHeadDetailAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX </th>
											<td>
											<span>${detail.entprHeadFax}</span>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">지사 </th>
											<td>
											<span>${detail.entprBranchAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화 </th>
											<td>
											<span>${detail.entprBranchTel}</span>
											</td> 
										</tr>
										<tr>
											<td>
													<span>${detail.entprBranchDetailAddr}</span>
											</td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX </th>
											<td>
												<span>${detail.entprBranchFax}</span>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">설립일 *</th>
											<td style="vertical-align:middle;">
											<span>${detail.entprEstDt}</span>
												<input type="text" id="entprEstDt" name="entprEstDt" class="date" value="" maxlength="10" style="width: 15%">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자본금</th>
											<td>
											<span>${detail.entprCapitalAmt}</span>
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
									<a href="/db/enterprise/enterpriseInformationManagementList.do" class="btn" ><b>뒤로가기</b></a>&nbsp;
									<a href="/db/enterprise/enterpriseInformationManagementRegisterUpdate.do" class="btn" ><b>수정</b></a>&nbsp;
<!-- 									<button type="button" class="btn btn-primary" id="okok">수정</button> -->
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
	<input type="hidden" id="memberId" name="memberId" value="${detail.memberId}"/>
</body>
</html>