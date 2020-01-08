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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  

<script type="text/javascript">
$(document).ready(function(){
var expertOffiTel = '${data.expertOffiTel}';
	var 	expertOffiTel1 = expertOffiTel.substring(0,3);
			expertOffiTel1 += "-";
			expertOffiTel1 += expertOffiTel.substring(3,7);
			expertOffiTel1 += "-";
			expertOffiTel1 += expertOffiTel.substring(7);
			$('#expertOffiTel').text(expertOffiTel1);

			
	var 	expertOffiFax = '${data.expertOffiFax}';
			
	var 	expertOffiFax1 = expertOffiFax.substring(0,3);
			expertOffiFax1 += "-";
			expertOffiFax1 += expertOffiFax.substring(3,7);
			expertOffiFax1 += "-";
			expertOffiFax1 += expertOffiFax.substring(7);
			$('#expertOffiFax').text(expertOffiFax1);
			
	var 	benefitRespsibHpNo = '${data.benefitRespsibHpNo}';
	var 	benefitRespsibHpNo1 = benefitRespsibHpNo.substring(0,3);
	benefitRespsibHpNo1 += "-";
	benefitRespsibHpNo1 += benefitRespsibHpNo.substring(3,7);
	benefitRespsibHpNo1 += "-";
	benefitRespsibHpNo1 += benefitRespsibHpNo.substring(7);
			$('#benefitRespsibHpNo').text(benefitRespsibHpNo1);
			
});

function moveDetailView(memberId){
	$('#memberId').val(memberId);
	$('#memberDetailFrm').attr('action', "/db/expert/expertInformationManagementRegister.do").submit();
}

</script>
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
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가정보</b></h1>
					</div>
				</div>
			
			<!--  수정 form S -->
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<div class="table-responsive">
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
												<c:out value="${data.expertNm}"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">성별 </th>
											<td style="vertical-align:middle;">
												<c:out value="${data.expertGender}"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">경력년수 </th>
											<td style="vertical-align:middle;">
												<c:out value="${data.expertCareerNum}년"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">전문분야 * </th>
											<td>
												<label class="input" style="width:100%">
												<span>${data.largeSpecialAreaCd}</span>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 전문분야 * </th>
											<td colspan="3">
												<label class="input" style="width:100%">
												<span>${data.detailSpecialAreaCd}</span>	
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">관심분야 *</th>
											<td>
												<label class="input" style="width:100%">
												<span>${data.expertInterestAreaCd}</span>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 관심분야 *</th>
											<td colspan="3">
												<span>${data.expertDetailIntrtAreaCd}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">산학연관 </th>
											<td>
												<span>${data.expertIndsEduCd}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인 </th>
											<td>
												<span>${data.expertStRegNo}</span>												
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호 </th>
											<td style="vertical-align:middle;">
												<span>${data.expertRegNo}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">출신학교 </th>
											<td style="vertical-align:middle;">
												<span>${data.expertFinalSchoolNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공 </th>
											<td>
												<span>${data.expertMajorNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">학력 </th>
											<td>
												<span>${data.expertFnalEduCd}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">소속기관 *</th>
											<td style="vertical-align:middle;">
												<span>${data.expertHeadAddrNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서 </th>
											<td>
												<span>${data.expertDptmNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책 </th>
											<td>
												<span>${data.expertOffiDutyNm}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">직장 * </th>
											<td>
												<span>${data.expertOffiAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰 </th>
											<td colspan="3">
												<span id="expertOffiTel"></span>
											</td> 
										</tr>
										<tr>
											<td>
												<span>${detail.expertOffiDetailAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표FAX </th>
											<td colspan="3">
													<span id="expertOffiFax"></span>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">자택 </th>
											<td>
												<span>${data.expertHomeAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상세주소 </th>
											<td colspan="3">
												<span>${data.expertHomeDetailAddr}</span>
											</td>
										</tr>
									</tbody>
								</table>





								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7"><h5 class="page-title txt-color-blueDark"><b>● 심의(자문, 평가 등) 이력</b></h5></div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>날짜</th>
											<th>제목</th>
											<th>비고</th>
										</tr>
									</thead>	
									<tbody id="resultTbody">
											<c:forEach var="data1" items="${data1}" varStatus="status">
												<tr>
													<td><span>${data1.expertDelibrDt}</span></td>
													<td><span>${data1.expertDelibrTitle}</span></td>
													<td><span>${data1.remark}</span></td>
												</tr>
											</c:forEach>										
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
											<span>${data.benefitBankCd}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">계좌번호 </th>
											<td>
											<span>${data.benefitAccntNo}</span>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">생년월일 </th>
											<td>
											<span>${data.benefitBirthDt}</span>											
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 전화 * </th>
											<td>
											<span id="benefitRespsibHpNo"></span>											
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="javascript:moveDetailView('${data.memberId}');" id="createBtn" class="btn btn-primary" ><b>수정</b></a>&nbsp;
										<a href="/db/expert/expertInformationManagementList.do" class="btn" ><b>목록</b></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			<!--  상세보기 form E -->
			
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
	 
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 

    <form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="memberId" id="memberId" value="">
    </form>
    
    
</body>
</html>
