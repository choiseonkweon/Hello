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
				<li>Home</li><li>사업 관리</li><li><b>사업운영 실적관리</b></li><li><b>인프라지원 </b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                    <h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>장비,시설 활용실적</b></h1>
				</div>
			</div>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
						<div class="table-responsive">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
						    <input type="hidden" id="enterpriseIdx" name="enterpriseIdx"  value="<c:out value='${resultList[0].enterpriseIdx}'/>"/> 
							<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">제목 * </th>
											<td>
												<label class="input" style="width:100%;">
                                                    <input type="text" id="resourcePerformNm" name="resourcePerformNm" class="input-sm" value="<c:out value="${resultList[0].resourcePerformNm}"/>" style="width:100%;" maxlength="100">
												</label>
											</td>
										</tr>
									</tbody>
							</table>
							</form>
							<div style="margin-top:25px;margin-bottom:50px;">
								<button type="button" class="btn btn-default btn-sm" onclick="goResourFaciSearch('Y');">장비(시설)찾기</button>
										<table id="resultTable" class="table table-hover" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
											<colgroup>
												<col width="15%">
												<col width="20%">
												<col width="15%">
												<col width="25%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th>활용일</th>
													<th>활용기관</th>
													<th>수입금(원)</th>
													<th>사업명</th>
													<th></th>
		
												</tr>
											</thead>
											<tbody id="resultTbody">
													<c:forEach var="result" items="${resultList}" varStatus="status">
														<tr value="<c:out value='${result.resourFaciId}'/>" value2="<c:out value='${result.memberId}'/>" value3="<c:out value='${result.appliNo}'/>">
															<td><c:out value='${result.useDt}'/></td>
															<td><c:out value='${result.compNm}'/></td>
                                                            <td><input type='text' value='<c:out value='${result.incomeAmt}'/>' onkeydown="javascript:return onlyNumber(event)" maxlength="10"/></td>
															<td><input type='text' value='<c:out value='${result.entprBussProStusNm}'/>' maxlength="40"/></td>
															<td><button type='button' class='txtbtn floatR delBtn' onclick='resourFaciDel(this);'>삭제</button></td>
														</tr>															
													</c:forEach>												
											</tbody>
										</table>								
							</div>
							
							<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
								<a href="#" id="cancelBtn" class="btn" ><b>취소</b></a>&nbsp;
								<a href="#" id="createBtn" class="btn btn-primary" onclick="fn_save();"><b>저장</b></a>
							</div>
						</div>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->

<!-- Modal -->
<div class="modal fade" id="resourFaciModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				 <b>장비찾기</b>
				</h4>
			</div>
			<div id="resourFaciResultBody"></div>
	
			<footer>
				<div class="modal-footer modify" style="align-items: center;">
					<button type="button" class="btn btn-default btn-sm" onclick="selectResourFaci();">선택</button>
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
			</footer>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	
	
	<script type="text/javaScript" language="javascript" defer="defer">
	var resourFaciChecked = new Array();
	var resourFaciChecked2 = new Array();
	
		$(document).ready(function () {
			$("#cancelBtn").click(function(){
				if(confirm("이 페이지에서 나가시겠습니까?")){
                    location.href = "/db/business/businessInfraResourFaciUseResultList.do";
				}
			});				
			

		});
		
		// 기업찾기 - 전체 체크박스
		function resourFaciAllCheck(target){
			if($(target).is(':checked')){
				$("#resourFaciListBody :checkbox").prop('checked',true);
				$("#resourFaciListBody :checkbox:checked").each(function(){
					resourFaciChecked.push($(this).val());
				});
			}else{
				$("#resourFaciListBody :checkbox").prop('checked',false);
				$("#resourFaciListBody :checkbox").each(function(){
					var thisValue = $(this).val();
					if(resourFaciChecked.indexOf(thisValue) > -1){
						resourFaciChecked.splice(thisValue,1);
					};
				});			
			}
			
		}
		
		// 장비찾기 - 체크박스
		function resourFaciCheck(target){
			var thisValue = $(target).val();
			if($(target).is(':checked')){
				$(target).prop('checked',true);
				resourFaciChecked.push(thisValue);
			}else{
				$(target).prop('checked',false);
				if(resourFaciChecked.indexOf(thisValue) > -1){
					resourFaciChecked.splice(thisValue,1);
				};
			}
			
		}		
		
        function enterKey(){
        	if(window.event.keyCode == 13){
        		goResourFaciSearch('Y');
        		window.event.preventDefault();
    		}		
        }
        
		//기업찾기 조회
		function goResourFaciSearch(flag){

			
			resourFaciChecked = new Array();
			if(flag === "Y"){
				$("#searchType").val("");
				$("#searchType1").val("");
				$("#searchFromDate").val("");
				$("#searchToDate").val("");
				
			}
			
			 $.ajax({
					type : 'post',
					url:'/db/business/bussInfraResourFaciSearchList.do',
					data: $("#resourFaciSearchFrm").serialize(),
					dataType: 'html',
					success : function(data) {
						
						$("#resourFaciResultBody").empty().append(data);
						$("#resourFaciModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			   		} 
			 });  			
			
		}	
		
        // 기업찾기 조회- page
		function goResourFaciSearchPage(pageNo){

        	$("#resourFaciPageIndex").val(pageNo);
        	
			 $.ajax({
					type : 'post',
					url:'/db/business/bussInfraResourFaciSearchList.do',
					data: $("#resourFaciListForm").serialize(),
					dataType: 'html',
					success : function(data) {
						$("#resourFaciResultBody").empty().append(data);
						
						$("#resourFaciListBody :checkbox").each(function(){
							 var checkValue = $(this).val();
							 var resourFaicCheckLength = resourFaciChecked.length;
							 for(var i=0;i<resourFaicCheckLength;i++){
								 if(resourFaciChecked[i] ===checkValue ){
										$(this).prop("checked",true);
								 }
								 
							 }
							
						});
						
						$("#resourFaciModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			            
			   		} 
			 });  			
			
		}				
		
		
		function checkValue(){
			var retValue = true;
			
            if($('#resourcePerformNm').val() == ""){
				alert("제목을 입력하세요.");
				$('#resourcePerformNm').focus();
				return;
			}

			if($("#resultTbody tr").length === 0){
				alert("장비(시설)를(을)  선택하세요.");
				goEntprSearch();
				return;
			}
			
			return retValue;
		}
		
		// 기업 선택
		function selectResourFaci(){
			
			if(resourFaciChecked.length === 0){
				alert("장비(시설)를(을) 선택하세요.");
				return false;
			}
			
			var param = {
					"resourFaciId" : $("#resourFaciId").val(),
					"membersId"          : resourFaciChecked
			};
			
			 $.ajax({
					type : 'post',
					url:'/db/business/bussInfraResourFaciSelectList.do',
					data: param,
					dataType: 'json',
					success : function(data) {
						var html = "";
						var rData = data.resultList;
						
						$.each(rData,function(i){
							var iData = this;
							var flag   = true 
							$("#resultTbody tr").each(function(j){
								  if($(this).attr('value') === iData.resourFaciId && $(this).attr('value2') === iData.memberId && $(this).attr('value3') === iData.appliNo){
									  flag = false;
									  return false;
								  }else{
									  flag = true;
								  }
							});
							if(flag){
								html += "<tr value='"+iData.resourFaciId+"' value2='"+iData.memberId+"' value3='"+iData.appliNo+"'>";
							    html += "<td>"+iData.useFrDt+"~"+iData.useToDt+"</td>";
							    html += "<td>"+iData.compNm+"</td>";
                                html += "<td><input type='text' value='' onkeydown='javascript:return onlyNumber(event)' maxlength='10'/></td>";
							    html += "<td><input type='text' value='' maxlength='40'/></td>";
							    html += "<td><button type='button' class='txtbtn floatR delBtn' onclick='resourFaciDel(this);'>삭제</button></td>";
								html += '</tr>';									
							}									
						});
						
						$("#resultTbody").append(html);
						$("#resourFaciModal").modal('hide');
						
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			   		} 
			 }); 				
			
		}		
		
		function resourFaciDel(target){
			$(target).closest('tr').remove();
			
		}
		
		
		function fn_save(){
			if(checkValue()){

				var listData = new Array();
				
				var resourcePerformNm =  $('#resourcePerformNm').val(); // 제목
				var enterpriseIdx =  $('#enterpriseIdx').val(); // 제목
				
				$("#resultTbody tr").each(function(i){
					var mapData = {
							"enterpriseIdx"			: enterpriseIdx,
							"resourcePerformNm"	: resourcePerformNm,
							"resourFaciId"			: $(this).attr('value'),
							"memberId"				: $(this).attr('value2'),
							"appliNo"					: $(this).attr('value3'),
							"useDt"					: $(this).find("td:eq(0)").text(),
							"compNm"				: $(this).find("td:eq(1)").text(),
							"incomeAmt"			: $(this).find("td:eq(2)").find("input").val(),
							"entprBussProStusNm"	: $(this).find("td:eq(3)").find("input").val()
					}
					listData.push(mapData);
				});
				 $.ajax({
						type : 'post',
						url:'/db/business/bussInfraResourFaciSave.do',
						data: {"params" : JSON.stringify(listData)},
						dataType: 'json',
						success : function(data) {
	                		alert("저장이 완료 되었습니다.");
                            location.href = "/db/business/businessInfraResourFaciUseResultList.do";
							return false;							
							
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            window.event.preventDefault();
				   		} 
				 }); 								
				
			}
		}			
		
    </script>
</body>
</html>