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
			.th{ text-align: center;}
			.td{text-align: center; text-overflow:ellipsis; overflow:hidden}
	</style>
	<script type="text/javascript">
	//기업찾기 조회
	function goEntprSubSearch(flag){
		 $.ajax({
				type : 'post',
				url:'/db/enterprise/goEntprSubSearchList.do',
				data: {"memberId"  	: $("#memberId").val(),
						  "searchType"			: flag
				},
				dataType: 'html',
				success : function(data) {
					console.log(data);
					$("#entprResultBody").empty().append(data);
					$("#entprModal").modal('show');
					
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            window.event.preventDefault();
		   		} 
		 });  	
	}		
	
    function moveUpdateView(flag){
    	$('#memberId').val();
    	$('#memberUpdateFrm').attr('action', "/db/enterprise/enterpriseInformationManagementUpdate.do").submit();
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
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업정보 상세보기</b></h1>
					</div>
				</div>
		
			<!--  수정 form S -->
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
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
												<span>${detail.entprRespsibHpNo}</span>&nbsp;-&nbsp;
												<span>${detail.entprRespsibHpNo2}</span>&nbsp;-&nbsp;
												<span>${detail.entprRespsibHpNo3}</span>
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
											<span>${detail.largeBussAreaNm}</span>&nbsp;>&nbsp;
											<span>${detail.mediumBussAreaNm}</span>
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
												<span>${detail.entprHeadTel}</span>&nbsp;-&nbsp;
												<span>${detail.entprHeadTel2}</span>&nbsp;-&nbsp;
												<span>${detail.entprHeadTel3}</span>
											</td> 
										</tr>
										<tr>
											<td>
												<span>${detail.entprHeadDetailAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX </th>
											<td>
												<span>${detail.entprHeadFax}</span>&nbsp;-&nbsp;
												<span>${detail.entprHeadFax2}</span>&nbsp;-&nbsp;
												<span>${detail.entprHeadFax3}</span>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">지사 </th>
											<td>
											<span>${detail.entprBranchAddr}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화 </th>
											<td>
												<span>${detail.entprBranchTel}</span>&nbsp;-&nbsp;
												<span>${detail.entprBranchTel2}</span>&nbsp;-&nbsp;
												<span>${detail.entprBranchTel3}</span>
											</td> 
										</tr>
										<tr>
											<td>
													<span>${detail.entprBranchDetailAddr}</span>
											</td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX </th>
											<td>
												<span>${detail.entprBranchFax}</span>&nbsp;-&nbsp;
												<span>${detail.entprBranchFax2}</span>&nbsp;-&nbsp;
												<span>${detail.entprBranchFax3}</span>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">설립일 *</th>
											<td style="vertical-align:middle;">
											<span>${detail.entprEstDt}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자본금</th>
											<td>
											<span><fmt:formatNumber value="${detail.entprCapitalAmt}" pattern="#,###" />원</span>
											</td>
										</tr>
									</tbody>
								</table>
<!-- 성과관리 -->

								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 성과 관리</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary btn-sm floatR" onclick="goEntprSubSearch('result');">더보기</button>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th class="th">수행년도</th>
											<th class="th">분기</th>
											<th class="th">자본금</th>
											<th class="th">매출액</th>
											<th class="th">직원수</th>
										</tr>
									</thead>
									<tbody id="resultTbody4">
										<c:forEach var="list1" items="${list1}" varStatus="status">
											<tr>
											<td style="text-align: center;">${list1.entprResultYearNm}년</td>
											<td style="text-align: center;">${list1.entprResultQtaNm}</td>
											<td style="text-align: center;"><fmt:formatNumber value="${list1.entprCapitalAmt}" pattern="#,###" />원</td>
											<td style="text-align: center;"><fmt:formatNumber value="${list1.entprResultTakeAmt}" pattern="#,###" />원</td>
											<td style="text-align: center;"><fmt:formatNumber value="${list1.entprResultEmpCnt}" pattern="#,###" />명</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
<!--진흥원 수혜사업-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 진흥원 수혜사업</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary btn-sm floatR" onclick="goEntprSubSearch('propty');">더보기</button>
									</div>
								</div>
								<table id="busProStusTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px; table-layout:fixed">
									<colgroup>
										<col width="18%">
										<col width="12%">
										<col width="10%">
										<col width="5%">
										<col width="5%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
									<tr>
										<th class="th">사업명</th>
										<th class="th">사업기간</th>
										<th class="th">사업비용</th>
										<th class="th">고용창출</th>
										<th class="th">완료여부</th>
										<th class="th">증빙서류</th>
										<th class="th">사업부서</th>
										<th class="th">승인상태</th>
										<th class="th">비고</th>
									</tr>
									</thead>
									<tbody id="resultTbody">
										<c:forEach var="list2" items="${list2}" varStatus="status">
											<tr>
											<td class="td"><nobr>${list2.bussAnncemntNm}</nobr></td>
											<td class="td">${list2.bussFrDt}&nbsp; ~ &nbsp;${list2.bussToDt}</td>
											<td class="td"><fmt:formatNumber value="${list2.bussCostAmt}" pattern="#,###" />원</td>
											<td class="td"><c:if test="${list2.entprCreatJobCnt!=null}"><fmt:formatNumber value="${list2.entprCreatJobCnt}" pattern="#,###" />명</c:if></td>
											<td class="td"><c:if test="${list2.entprBussYn=='Y'}">완료</c:if></td>
											<td class="td">
												<a href="#">${list2.orgFileNm1}</a>
												<a href="#">${list2.orgFileNm2}</a>
											</td>
											<td class="td">${list2.bussDeptNm}</td>
											<td class="td">${list2.applicStNm}</td>
											<td class="td">${list2.remark}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
<!--지적재산권 현황-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 지적재산권 현황</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary btn-sm floatR" onclick="goEntprSubSearch('jecp');">더보기</button>
									</div>
								</div>
								<table id="resultTable1" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
									<tr>
										<th class="th">NO</th>
										<th class="th">사업명</th>
										<th class="th">실적명</th>
										<th class="th">분류</th>
										<th class="th">등록형태</th>
										<th class="th">국가</th>
										<th class="th">증빙</th>
										<th class="th">일자</th>
										<th class="th">비고</th>
									</tr>
									</thead>
									<tbody id="resultTbody1">
										<c:set var="cnt" value="0"></c:set>
										<c:forEach var="list3" items="${list3}" varStatus="status">
											<c:set var="cnt" value="${cnt+1}"></c:set>
											<tr>
											<td class="td">${cnt}</td>
											<td class="td">${list3.intltProptBussNm}</td>
											<td class="td">${list3.intltProptPerfNm}</td>
											<td class="td">${list3.intltProptNm}</td>
											<td class="td">${list3.regFormNm}</td>
											<td class="td">${list3.regNationNm}</td>
											<td class="td">
												<a href="#">${list3.orgFileNm}</a>
											</td>
											<td class="td">${list3.intltProptyDt}</td>
											<td class="td">${list3.remark}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<br>
<!--기업사원 정보-->
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"><h5 class="page-title txt-color-blueDark"><b>● 기업사원 정보</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<button type="button" class="btn btn-primary btn-sm floatR" onclick="goEntprSubSearch('employee');">더보기</button>
									</div>
								</div>
								<table id="resultTable1" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
									<tr>
										<th class="th">NO</th>
										<th class="th">성명</th>
										<th class="th">부서</th>
										<th class="th">직책</th>
										<th class="th">이메일</th>
										<th class="th">연락처</th>
										<th class="th">4대보험</th>
									</tr>
									</thead>
									<tbody id="resultTbody2">
										<c:set var="cnt1" value="0"></c:set>
										<c:forEach var="list4" items="${list4}" varStatus="status">
											<c:set var="cnt1" value="${cnt1+1}"></c:set>
											<tr>
											<td class="td">${cnt1}</td>
											<td class="td">${list4.entprEmployeeNm}</td>
											<td class="td">${list4.entprEmployeeDept}</td>
											<td class="td">${list4.entprEmployeePosition}</td>
											<td class="td">${list4.entprEmployeeemail}</td>
											<td class="td">${list4.entprEmployeePhone}-${list4.entprEmployeePhone2}-${list4.entprEmployeePhone3}</td>
											<td class="td">
												<a href="#">${list4.orgFileNm}</a>
											</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="" class="btn" ><b>뒤로가기</b></a>&nbsp;
									<a href="javascript:moveUpdateView('Update');" class="btn"><b>수정</b></a>&nbsp;
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
   <input type="hidden" name="searchSelect" value="<c:out value='${searchVO.searchSelect}'/>"/>
   <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 

	<form role="form" id="memberUpdateFrm" action="#" class="form-horizontal" method="post">
   <input type="hidden" id="memberId" name="memberId" value="<c:out value='${detail.memberId}'/>"/>
    </form>
<!-- Modal -->
<div class="modal fade" id="entprModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="width:180%; right:300px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				</h4>
			</div>
			<div id="entprResultBody"></div>
	
			<footer>
				<div class="modal-footer modify" style="align-items: center;">
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">확인</button>
	            </div>
			</footer>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	


</body>
</html>