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
				<li>Home</li><li>사업 관리</li><li><b>사업운영 실적관리</b></li><li><b>기업지원 </b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>지원사업수혜실적</b></h1>
				</div>
			</div>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
						<div class="table-responsive">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
						    <input type="hidden" id="enterpriseIdx" name="enterpriseIdx"  value="<c:out value='${resultList[0].enterpriseIdx}'/>"/> 
						    <input type="hidden" id="bussAnncemntNo" name="bussAnncemntNo"  value="<c:out value='${resultList[0].bussAnncemntNo}'/>"/> 
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
													<input type="text" id="benefitPerformNm" name="benefitPerformNm" class="input-sm" value="<c:out value="${resultList[0].benefitPerformNm}"/>" style="width:100%;" maxlength="70">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td>
												<span id="bussAnncemntNm"><c:out value="${resultList[0].bussAnncemntNm}"/></span>
												<button type="button" class="btn btn-default btn-sm" onclick="goBussSearch('Y');">찾기</button>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업내용</th>
											<td colspan="3">
												<div class="editor">	
													<textarea id="bussCont"name="bussCont" rows="6" cols="6" style="width:100%; height:100px;"><c:out value="${resultList[0].bussCont}"/></textarea>
												</div>
											</td>										
										</tr>
									</tbody>
							</table>
							</form>
							<div style="margin-top:25px;margin-bottom:50px;">
								<button type="button" class="btn btn-default btn-sm" onclick="goEntprSearch('Y');">기업찾기</button>
										<table id="resultTable" class="table table-hover" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
											<colgroup>
												<col width="25%">
												<col width="15%">
												<col width="35%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th>참여기업명</th>
													<th>고용창출인원</th>
													<th>비고</th>
													<th></th>
		
												</tr>
											</thead>
											<tbody id="resultTbody">
													<c:forEach var="result" items="${resultList}" varStatus="status">
														<tr value="<c:out value='${result.memberId}'/>">
															<td><c:out value='${result.entprNm}'/></td>
															<td><c:out value='${result.empCreateStaff}'/></td>
															<td><input type='text' value='<c:out value='${result.remark}'/>' maxlength="200"/></td>
															<td><button type='button' class='txtbtn floatR delBtn' onclick='entprDel(this);'>삭제</button></td>
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
<div class="modal fade" id="bussModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				 <b>사업찾기</b>
				</h4>
			</div>
			<div id="bussResultBody">	</div>
			<footer>
				<div class="modal-footer modify" style="align-items: center;">
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
			</footer>
			<!-- 검색조건 유지 -->
		
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

<!-- 사업찾기 팝업 구분을 위한 form  -->
<form id="bussTypeForm" name="bussTypeForm" method="post">
    <input type="hidden" id="bussSearchType" name="bussSearchType" value="S"/>	
</form>
<!-- Modal -->
<div class="modal fade" id="entprModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				 <b>기업찾기</b>
				</h4>
			</div>
			<div id="entprResultBody"></div>
	
			<footer>
				<div class="modal-footer modify" style="align-items: center;">
					<button type="button" class="btn btn-default btn-sm" onclick="selectEntpr();">선택</button>
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
			</footer>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	
	
	<script type="text/javaScript" language="javascript" defer="defer">
	var entprChecked = new Array();
	
		$(document).ready(function () {
			$("#cancelBtn").click(function(){
				if(confirm("이 페이지에서 나가시겠습니까?")){
					location.href = "/db/business/businessSupportBenefitList.do";
				}
			});				
			

		});
		
		// 기업찾기 - 전체 체크박스
		function entprAllCheck(target){
			if($(target).is(':checked')){
				$("#entprListBody :checkbox").prop('checked',true);
				$("#entprListBody :checkbox:checked").each(function(){
					entprChecked.push($(this).val());
					
				});
			}else{
				$("#entprListBody :checkbox").prop('checked',false);
				$("#entprListBody :checkbox").each(function(){
					var thisValue = $(this).val();
					if(entprChecked.indexOf(thisValue) > -1){
						entprChecked.splice(thisValue,1);
					};
				});			
			}
			
		}
		
		// 기업찾기 - 체크박스
		function entprCheck(target){
			var thisValue = $(target).val();
			if($(target).is(':checked')){
				$(target).prop('checked',true);
					entprChecked.push(thisValue);
			}else{
				$(target).prop('checked',false);
				if(entprChecked.indexOf(thisValue) > -1){
					entprChecked.splice(thisValue,1);
				};
			}
			
		}		
		
        function enterKey(type){
        	if(window.event.keyCode == 13){
        		if(type === 'B'){
        			goBussSearch();
        		}else if(type === 'E'){
        			goEntprSearch();
        		}
        		window.event.preventDefault();
    		}		
        }
        
        // 사업찾기 조회
		function goBussSearch(flag){
        	var paramData = $("#bussSearchFrm").serialize();
        	
        	if(flag === "Y"){
        		paramData = $("#bussTypeForm").serialize();
        		
        	}
       
			 $.ajax({
					type : 'post',
					url:'/db/business/bussSearchList.do',
					data: paramData,
					dataType: 'html',
					success : function(data) {
						$("#bussResultBody").empty().append(data);
						$("#bussModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			            
			   		} 
			 });  			
			
		}		     
        
        // 사업찾기 조회- page
		function goBussSearchPage(pageNo){
        	
        	$("#bussPageIndex").val(pageNo);
        	
			 $.ajax({
					type : 'post',
					url:'/db/business/bussSearchList.do',
					data: $("#bussListForm").serialize(),
					dataType: 'html',
					success : function(data) {
						$("#bussResultBody").empty().append(data);
						$("#bussModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			            
			   		} 
			 });  			
			
		}		        
        
		//기업찾기 조회
		function goEntprSearch(flag){
			var bussAnncemntNo = $("#bussAnncemntNo").val();
			if(bussAnncemntNo === ""){
			     alert("사업을 선택하세요.");
			     return;
			}
			
			entprChecked = new Array();
			if(flag === "Y"){
				$("#searchText1").val("");
				
			}
			
			 $.ajax({
					type : 'post',
					url:'/db/business/benefitPerformEntprSearchList.do',
					data: {"searchText1"  : $("#searchText1").val(),
							  "bussAnncemntNo"	: bussAnncemntNo
					},
					dataType: 'html',
					success : function(data) {
						
						$("#entprResultBody").empty().append(data);
						$("#entprModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			   		} 
			 });  			
			
		}	
		
        // 기업찾기 조회- page
		function goEntprSearchPage(pageNo){

        	$("#entprPageIndex").val(pageNo);
        	
			 $.ajax({
					type : 'post',
					url:'/db/business/benefitPerformEntprSearchList.do',
					data: $("#enptrListForm").serialize(),
					dataType: 'html',
					success : function(data) {
						$("#entprResultBody").empty().append(data);
						
						$("#entprListBody :checkbox").each(function(){
							 var checkValue = $(this).val();
							 var entprCheckLength = entprChecked.length;
							 for(var i=0;i<entprCheckLength;i++){
								 if(entprChecked[i] ===checkValue ){
										$(this).prop("checked",true);
								 }
								 
							 }
							
						});
						
						$("#entprModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			            
			   		} 
			 });  			
			
		}				
		
		
		function checkValue(){
			var retValue = true;
			
			if($('#benefitPerformNm').val() == ""){
				alert("제목을 입력하세요.");
				$('#benefitPerformNm').focus();
				return;
			}
			
			if($('#bussAnncemntNm').text() == ""){
				alert("사업을 입력하세요.");
				goBussSearch('Y');				
				return;
			}

			if($("#resultTbody tr").length === 0){
				alert("기업을 선택하세요.");
				goEntprSearch('Y');
				return;
			}
			
			return retValue;
		}
		
		//사업 선택
		function selectBussAnncemnt(bussAnncemntNo,bussAnncemntNm){
			if(bussAnncemntNo !== $("#bussAnncemntNo").val()){
				if($("#resultTbody tr").length > 0){
					if(confirm("사업을 변경할 경우 선택된 기업은 삭제 됩니다.\n변경하시겠습니까?")){
						$("#resultTbody").empty();
					}else{
						return false;
					}
				}
				
			}
			
			$("#bussAnncemntNo").val(bussAnncemntNo);
			$("#bussAnncemntNm").text(bussAnncemntNm);
			$("#bussModal").modal('hide');
			
		}
		
		// 기업 선택
		function selectEntpr(){
			
			if(entprChecked.length === 0){
				alert("기업을 선택하세요.");
				return false;
			}
			
			var param = {
					"bussAnncemntNo" : $("#bussAnncemntNo").val(),
					"membersId"          : entprChecked
			};
			
			 $.ajax({
					type : 'post',
					url:'/db/business/bussBenefitEntprSelectList.do',
					data: param,
					dataType: 'json',
					success : function(data) {
						var html = "";
						var rData = data.resultList;
						
						$.each(rData,function(i){
							var iData = this;
							var flag   = true 
							$("#resultTbody tr").each(function(j){
								  if($(this).attr('value') === iData.memberId){
									  flag = false;
									  return false;
								  }else{
									  flag = true;
								  }
							});
							if(flag){
								html += "<tr value='"+iData.memberId+"'>";
							    html += "<td>"+iData.entprNm+"</td>";
							    html += "<td>"+iData.entprCreatJobCnt+"</td>";
							    html += "<td><input type='text' value='' maxlength='200'/></td>";
							    html += "<td><button type='button' class='txtbtn floatR delBtn' onclick='entprDel(this);'>삭제</button></td>";
								html += '</tr>';										
							}
							
						});
						
						$("#resultTbody").append(html);
						$("#entprModal").modal('hide');
						
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			   		} 
			 }); 				
			
		}		
		
		function entprDel(target){
			$(target).closest('tr').remove();
			
		}
		
		
		function fn_save(){
			if(checkValue()){

				var listData = new Array();
				
				var enterpriseIdx 	  =  $('#enterpriseIdx').val(); // 제목
				var benefitPerformNm =  $('#benefitPerformNm').val(); // 제목
				var bussAnncemntNo =  $('#bussAnncemntNo').val(); // 공고번호
				var bussAnncemntNm =  $('#bussAnncemntNm').text(); // 사업명
				var bussCont 			  =  $('#bussCont').val(); // 사업내용
				
				$("#resultTbody tr").each(function(i){
					var mapData = {
							"enterpriseIdx"			: enterpriseIdx,
							"benefitPerformNm"	: benefitPerformNm,
							"bussAnncemntNo"	: bussAnncemntNo,
							"bussAnncemntNm"	: bussAnncemntNm,
							"bussCont"				: bussCont,
							"memberId"				: $(this).attr('value'),
							"entprNm"				: $(this).find("td:eq(0)").text(),
							"empCreateStaff"		: $(this).find("td:eq(1)").text(),
							"remark"					: $(this).find("td:eq(2)").find("input").val()
					}
					listData.push(mapData);
					
				});
				
				 $.ajax({
						type : 'post',
						url:'/db/business/benefitPerformSave.do',
						data: {"params" : JSON.stringify(listData),
							      "bussAnncemntNo" : bussAnncemntNo
						         },
						dataType: 'json',
						success : function(data) {
	                		alert("저장이 완료 되었습니다.");
	                		location.href = "/db/business/businessSupportBenefitList.do";
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