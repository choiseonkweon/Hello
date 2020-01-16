<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>시설 및 자원 관리</li><li><b>시설 신청 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>시설 신청 관리</b></h1>
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
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>시설명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>업체명</option>													
												</select>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">예약일</th>
											<td>
														<label class="input"> 
															<input class="input-sm" type="text" name="startdate" id="startdate" placeholder=""   />
															<i class="icon-append fa fa-calendar"></i>
															&nbsp;~&nbsp;
														</label>
														<label class="input"> 
															<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
															<i class="icon-append fa fa-calendar"></i>
														</label>
												<a href="javascript:goSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- data table -->
					<div class="well well-sm">
						<div class="table-responsive">
							<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"><b>총 : <fmt:formatNumber value="3" pattern="#,###" /> 건</b></h6>
							</div>
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>시설명</th>
											<th>업체명</th>
											<th>예약일</th>
											<th>인원</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="6">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td style="vertical-align: middle;"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td style="vertical-align: middle;">
														<a href="javascript:goPopView('${result.appliNo}');">
															<c:out value="${result.facilityNm}"/>
													   </a>
													</td>
													<td style="vertical-align: middle;">
														<a href="javascript:goPopView('${result.appliNo}');">
															<c:out value="${result.compNm}"/>
													   </a>													
													</td>
													<td style="vertical-align: middle;"> 
																								  <fmt:parseDate value="${result.useFrDt}" var="useFrDt" pattern="yyyyMMdd"/>
																								  <fmt:parseDate value="${result.useToDt}" var="useToDt" pattern="yyyyMMdd"/>
													                                              <fmt:formatDate value="${useFrDt}" pattern="yyyy.MM.dd"/>&nbsp;~&nbsp;
													                                              <fmt:formatDate value="${useToDt}" pattern="yyyy.MM.dd"/>
													</td>
													<td style="vertical-align: middle;"><c:out value="${result.usePersNum}"/></td>
													<td style="vertical-align: middle;">
													<c:choose>
														<c:when test="${result.applicStCd eq '000001' }"> 
															대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<a href="javascript:updateApprovResrv('${result.appliNo}','000004')" class="btn" ><b>승인</b></a>
												            &nbsp;<a href="javascript:updateApprovResrv('${result.appliNo}','000003')" class="btn" ><b>반려</b></a>
														</c:when>
														<c:when test="${result.applicStCd eq '000004' }">
															승인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</c:when>
														<c:when test="${result.applicStCd eq '000003' }">
															반려&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</c:when>														
													</c:choose>													
													
													</td>
												</tr>
											</c:forEach>
										</c:if>										
									</tbody>
								</table>
							</form>
						</div>
						<div id="paging">
							<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
				        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				        		<form:hidden path="pageIndex" />
				        	</form:form>	
			        	</div>
					</div>
			</section>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				 <b>시설 사용 신청내용</b>
				</h4>
			</div>
			<div class="modal-body">
					<div class="table-responsive">
						<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"></h6>
							</div>
						<form id="insertFrm" name="insertFrm" action="#" method="POST" >
						<input type="hidden" id="appliNo" name="appliNo" value="" />	
						<table class="table table-hover applicDetail">
								<colgroup>
						          <col width="10%">
						          <col width="18%">
						          <col width="72%">
						        </colgroup>
							        <tbody>
								        <tr>
								          <th class="tc tc01" rowspan="6" style="vertical-align: middle;">신청인</th>
								          <th class="tc">업체(기관)명</th>
								          <td><span id="compNm"></span></td>
								        </tr>
								        <tr>
								          <th class="tc">주소</th>
								          <td><span id="compAddr"></span></td>
								        </tr>
								        <tr>
								          <th class="tc">성명</th>
								          <td><span id="compApplNm">탁지영</span></td>
								        </tr>
								        <tr>
								          <th class="tc" style="vertical-align: middle;">연락처</th>
								          <td><span id="compTelNo"></span></td>
								        </tr>
								        <tr class="emailWrap">
								          <th class="tc">이메일</th>
								          <td><span id="compMail"></span></td>
								        </tr>
								        <tr>
								          <th class="tc">인원수</th>
								          <td><span id="usePersNum"></span></td>
								        </tr>
										<tr>
								          <th class="tc tc01" rowspan="3" style="vertical-align: middle;">사용시설</th>
								          <th class="tc">시설명</th>
								          <td><span id="facilityNm"></span></td>
										</tr>
								        <tr>
								          <th class="tc">목적(행사명)</th>
								          <td><span id="useObj">마케팅 </span></td>
								        </tr>
								        <tr>
								          <th class="tc">사용시간</th>
								          <td><span id="useDate"></span></td>
								        </tr>
			      				</tbody>
							</table>
					</form>
					</div>
				</div>	
				<footer>
				<div class="modal-footer view" style="align-items: center;">
	            	<button class="btn btn-primary" onclick="printArea();">인쇄</button>
			        <button class="btn btn-primary" onclick="closeModal();">확인</button>
			        <button type="button" class="btn btn-primary" onclick="modifyResrv();">수정</button>
			        <button class="btn"  onclick="deleteResrv();">삭제</button>
	            </div>
				<div class="modal-footer modify" style="align-items: center;">
			        <button type="button" class="btn btn-primary" onclick="updateResrv();">저장</button>
			        <button class="btn"  onclick="cancelResv();">취소</button>
	            </div>	            
				</footer>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<script type="text/javaScript" >
		$(document).ready(function () {
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/member/authList.do'/>";
           	document.listForm.submit();
        }
        
        function goPopView(appliNo){
        	var param = {};
        	  param.appliNo = appliNo;
			 $.ajax({
					type : 'post',
					url:'/db/facility/facilityApplicDetail.do',
					data: param,
					dataType: 'json',
					success : function(data) {
	                		$(".applicDetail span").text("");
	                		$("#appliNo").val("");
	                    	$(".view").css("display","");
	                    	$(".modify").css("display","none");	                		
	                		
	                		var rData = data.resultList[0];

	                		$("#appliNo").val(rData.appliNo);
	                		$("#compNm").text(rData.compNm);
	                		$("#compAddr").text(rData.compAddr1+" "+rData.compAddr2);
	                		$("#compApplNm").text(rData.compApplNm);
	                		$("#compTelNo").text(rData.compTelNo);
	                		$("#compMail").text(rData.compMail);
	                		$("#usePersNum").text(rData.usePersNum);
	                		$("#facilityNm").text(rData.facilityNm);
	                		$("#useObj").text(rData.useObj);
	                		$("#useDate").text(rData.compNm);
	                		
				        	$('#myModal').modal('show');
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });         	
        	
        }
        
        function enterKey(){
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
        }  
        
        function goSearch(){
   			$('#searchFrm').attr('action', "/db/facility/facilityApplicationManagementList.do").submit();
        }        
        
        function closeModal(){
        	$('#myModal').modal('hide');
        	
        }
        
        function updateApprovResrv(appliNo,applicStCd){//신청번호 , 신청상태코드
        	var param = {};
        	param.appliNo = appliNo;
        	param.applicStCd = applicStCd;
        
			 $.ajax({
					type : 'post',
					url:'/db/facility/resourcFacilityApplicUpdate.do',
					data: param,
					dataType: 'json',
					success : function(data) {
	                		alert("완료 되었습니다.");
	                		location.reload();
							return false;
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });        	
        }
        
        function updateResrv(){
			 $.ajax({
					type : 'post',
					url:'/db/facility/facilityModifySave.do',
					data: param,
					dataType: 'json',
					success : function(data) {
	                		alert("완료 되었습니다.");
	                		location.reload();
							return false;
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });        	
        }        
        
        function modifyResrv(){
        	$(".view").css("display","none");
        	$(".modify").css("display","");
        	
        }
        
        function cancelResv(){
        	if(confirm("이 페이지를 닫으시겠습니까?")){
        		closeModal();
        	}
        	
        }        
        
        function deleteResrv(){
        	if(confirm("시설 신청내역을 삭제하시겠습니까?")){
   			 $.ajax({
					type : 'post',
					url:'/db/facility/resourceFacilityApplicDelete.do',
					data: $('#insertFrm').serialize(),
					dataType: 'json',
					success : function(data) {
	                		alert("삭제 되었습니다.");
	                		location.reload();
							return false;
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });        
   		   }        	
        }
        
        
        
    </script>
</body>
</html>