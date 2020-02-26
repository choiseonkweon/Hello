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
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
</head>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li>전문가 관리</li><li><b>평가위원 추출</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>평가위원 추출</b></h1>
				</div>
			</div>
			<!-- widget grid -->
			<section id="widget-grid" class="">
					<div class="well well-sm">
						<div class="table-responsive">
							<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
										<col width="100%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>제목</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>인원</option>													
												</select>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<%-- <th style="text-align:center;background:#eee;vertical-align:middle;">상태</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="Y" ${searchVO.applicStCd eq 'Y' ? 'selected="selected"' : '' }>승인</option>
													<option value="N" ${searchVO.applicStCd eq 'N' ? 'selected="selected"' : '' }>미승인</option>
												</select>
											</td> --%>
											<th style="text-align:center;background:#eee;vertical-align:middle;">추출일</th>
											<td colspan="2">								
												<label class="input"> 
													<input class="input-sm" type="text" name="startDate" id="startdate" placeholder="" data-dateformat="yy-mm-dd"  readOnly/>													
													&nbsp;~&nbsp;
												</label> 
												<label class="input"> 
													<input class="input-sm" type="text" name="endDate" id="finishdate" placeholder="" data-dateformat="yy-mm-dd" readOnly/>													
												</label>
											</td>
										</tr>
									</tbody>
									
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:center;width:100%">
									<a href="javascript:goSearch();" class="btn btn-primary"><b>검색</b></a>								
								</div>	
							</form>
							
						</div>
					</div>
					<!-- data table -->
					<div class="well well-sm">
						<div class="table-responsive">
							<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"><b>전체 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
							</div>
							<form id="memberListFrm" name="memberListFrm">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>인원</th>
											<th>추출일</th>
											<th>평가일</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount == 0 }">
											<tr style="text-align:center;">
												<td colspan="8">조회 결과가 없습니다.</td>
											</tr>
										</c:if>	
										<c:if test="${paginationInfo.totalRecordCount > 0 }">
											<c:forEach var="list" items="${list}" varStatus="status">
												<tr>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td>
														<a href="javascript:moveDetailView('${list.selectNo}');">
															<c:out value="${list.selectTitle}"/>
														</a>
													</td>
													<td><c:out value="${list.evaluationCnt}"/></td>
													<td><c:out value="${list.selectDt}"/></td>
													<td><c:out value="${list.evaluationDt}"/></td>
												</tr>
											</c:forEach>
										</c:if>										
									</tbody>
								</table>
							</form>
							<br/>
							<c:if test="${paginationInfo.totalRecordCount ne 0 }">
							<center>
								<div id="paging">
									<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
						        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						        		<form:hidden path="pageIndex" />
						        	</form:form>	
					        	</div>
					        	</center>
				        	</c:if> 							
						</div>					
					</div>
					<div class="btnList alignRight"style="text-align: right;">
						<button  type="button" id="createBtn"class="btn btn-primary btn-sm" onclick="fn_create()">추출하기</button>
					</div>
			</section> 
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->		
		
	</div>
	<!-- END MAIN PANEL -->	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">	 
	<input type="hidden" id="selectNo" name ="selectNo"/>
    </form>
    	<script type="text/javaScript" >
		$(document).ready(function () {
			
			//input을 datepicker로 선언
            $("#startdate").datepicker({
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
					$('#finishdate').datepicker('option', 'minDate', selectedDate);
				}
            }); 
			
			$("#finishdate").datepicker({
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
					$('#startdate').datepicker('option', 'maxDate', selectedDate);
				}
            }); 
			
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/evalu/evaluInformationManagementList.do'/>";
           	document.listForm.submit();
        }
        
       //엔터키 입력시
        function enterKey(){
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
        }
        
        function goSearch(){
        	$('#searchFrm').attr('action', "/db/evalu/evaluInformationManagementList.do").submit();
        }
        
        function moveDetailView(selectNo){        
        	$('#selectNo').val(selectNo);
        	$('#memberDetailFrm').attr('action', "/db/evalu/evaluInformationManagementDetail.do").submit();
        }
        
        function fn_create(){
        	$('#memberDetailFrm').attr('action', "/db/evalu/evaluInformationManagementInsert.do").submit();        	
        }
    </script>
</body>
</html>