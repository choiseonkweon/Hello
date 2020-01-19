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
				<li>Home</li><li>시설 및 자원 관리</li><li><b>자원 신청 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>자원 신청 관리</b></h1>
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
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>자원명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>업체명</option>															
												</select>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">예약일</th>
											<td>
														<label class="input"> 
															<input class="input-sm" type="text" name="searchFromDate" id="searchFromDate" placeholder=""  value="${searchVO.searchFromDate}" data-dateformat="yy-mm-dd"  />
															&nbsp;~&nbsp;
														</label>
														<label class="input"> 
															<input class="input-sm" type="text" name="searchToDate" id="searchToDate" placeholder="" value="${searchVO.searchToDate}" data-dateformat="yy-mm-dd">
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
								<h6 class="page-title txt-color-blueDark"><b>총 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
							</div>
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>자원명</th>
											<th>업체명</th>
											<th>연락처</th>
											<th>예약일</th>
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
													<td style="vertical-align: middle;"><c:out value="${result.compTelNo}"/></td>
													<td style="vertical-align: middle;"> 
																								  <fmt:parseDate value="${result.useFrDt}" var="useFrDt" pattern="yyyyMMdd"/>
																								  <fmt:parseDate value="${result.useToDt}" var="useToDt" pattern="yyyyMMdd"/>
													                                              <fmt:formatDate value="${useFrDt}" pattern="yyyy.MM.dd"/>&nbsp;~&nbsp;
													                                              <fmt:formatDate value="${useToDt}" pattern="yyyy.MM.dd"/>
													</td>
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
						<input type="hidden" id="applicStCd" name="applicStCd" value="000001" />	
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
								          <th class="tc tc01" rowspan="3" style="vertical-align: middle;">사용자원</th>
								          <th class="tc">자원명</th>
								          <td><span id="faciNm" class="view"></span>
												<select class="modify" id="facilityNm" name="facilityNm" style="width: 30%;">
												</select>								                
								          
								          </td>
										</tr>
								        <tr>
								          <th class="tc">목적(행사명)</th>
								          <td><span id="useObj">마케팅 </span></td>
								        </tr>
								        <tr>
								          <th class="tc">사용시간</th>
								          <td><span id="useDate"  class="view"></span>
												<div class="set modify">
													<input type="text" class="input-sm" data-dateformat="yyyy-mm-dd" id="useFrDt" name="useFrDt" value="" style="width: 110px; margin-right: 4px;" />
													<select class="modify" name="useFrTm" id="useFrTm" style="width: 100px;">
														<option value="0900">9시</option>
														<option value="1000">10시</option>
														<option value="1100">11시</option>
														<option value="1200">12시</option>
														<option value="1300">13시</option>
														<option value="1400">14시</option>
														<option value="1500">15시</option>
														<option value="1600">16시</option>
														<option value="1700">17시</option>
													</select>
												</div>
												<div class="set modify">
													<input type="text" class="input-sm" data-dateformat="yyyy-mm-dd" id="useToDt" name="useToDt" style="width: 110px; margin-right: 4px;" />
													<select class="modify" name="useToTm" id="useToTm" style="width: 100px;">
														<option value="1000">10시</option>
														<option value="1100">11시</option>
														<option value="1200">12시</option>
														<option value="1300">13시</option>
														<option value="1400">14시</option>
														<option value="1500">15시</option>
														<option value="1600">16시</option>
														<option value="1700">17시</option>
														<option value="1800">18시</option>
													</select>
												</div>									          
								          </td>
								        </tr>
			      				</tbody>
							</table>
					</form>
					</div>
				</div>
				<footer>
				<div class="modal-footer view" style="align-items: center;">
	            	<button class="btn btn-primary" onclick="printArea(document.getElementById('myModal').innerHTML);">인쇄</button>
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
			fromDatePicker("searchFromDate","searchToDate");
			toDatePicker("searchFromDate","searchToDate");					
			fromDatePicker("useFrDt","useToDt");
			toDatePicker("useFrDt","useToDt");			
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
					url:'/db/resource/resourceApplicDetail.do',
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
	                		$("#useDate").text(rData.useFrDt + " " + rData.useFrTm.substring(0,2)+"시 ~ " + rData.useToDt + " " + rData.useToTm.substring(0,2)+"시");
	                		
	                		var fData = data.resourceList;
							var fDataLength = fData.length;
							for(var i=0;i < fDataLength;i++){
								document.insertFrm.facilityNm.options[i] = new Option(fData[i].resourceNm,fData[i].resourceId);
							}	                
	                		
							$("#useFrTm").val(rData.useFrTm);
							$("#useFrDt").val(rData.useFrDt);
	                		
	                		$("#useToTm").val(rData.useToTm);
	                		$("#useToDt").val(rData.useToDt);
	                		$("#facilityNm").val(rData.resourFaciId);	                		
	                		
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
   			$('#searchFrm').attr('action', "/db/resource/resourceApplicationManagementList.do").submit();
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
			   		} 
			 });        	
        }
        
        function updateResrv(){
        	
			 $.ajax({
					type : 'post',
					url:'/db/facility/resourcFacilityApplicUpdate.do',
					data: $('#insertFrm').serialize(),
					dataType: 'json',
					success : function(data) {
	                		alert("저장 되었습니다.");
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
        	if(confirm("자원 신청내역을 삭제하시겠습니까?")){
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
        
        
        function printArea(){
        	$('#myModal button').hide();
        	var AreaContents = document.getElementById('myModal').innerHTML;
            var strFeature;
            strFeature = "width=850,height=800,toolbar=no,location=no,directories=no";
            strFeature += ",status=no,menubar=no,scrollbars=yes,resizable=no";
            var cssBody = '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\ href=\'<c:url value="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/bootstrap.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/font-awesome.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/sub.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/smartadmin-production-plugins.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/smartadmin-production.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/smartadmin-skins.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/smartadmin-rtl.min.css"/>\'>';
        	cssBody += '<link rel=\'stylesheet\' type=\'text/css\' media=\'screen\' href=\'<c:url value="../css/demo.min.css"/>\'>';

            objWin = window.open('', 'print', strFeature);
        	
            objWin.document.open();
            objWin.document.write('<html><head>');
            objWin.document.write(cssBody);
            objWin.document.write('</head><body>');
            objWin.document.write(AreaContents);
            objWin.document.write('</body></html>');
            objWin.document.close();
            
            setTimeout(function(){
            	printBtn(objWin);
            },500);
        }        
        
        function printBtn(objWin){
        	$('#myModal button').show();
        	objWin.print();
            objWin.close();
        }       
    </script>
</body>
</html>