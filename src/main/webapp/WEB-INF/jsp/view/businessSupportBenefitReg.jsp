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
				<li>Home</li><li>사업 관리</li><li><b>사업운영 실적관리</b></li><li><b>기업지원</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>지원사업수혜실적 등록</b></h1>
				</div>
			</div>
			
			<section id="widget-grid" class="">
				<div class="well well-sm">
						<div class="table-responsive">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
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
													<input type="text" id="benefitPerformNm" name="benefitPerformNm" class="input-sm" value="<c:out value="${resultList[0].benefitPerformNm}"/>" style="width:100%;" maxlength="30">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td>
												<span id="bussAnncemntNm"><c:out value="${resultList[0].bussAnncemntNm}"/></span>
												<c:if test="${empty resultList[0].bussAnncemntNo}">
													<button type="button" class="btn btn-default btn-sm" onclick="goBussSearch();">찾기</button>
												</c:if>
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
								<button type="button" class="btn btn-default btn-sm" onclick="goEntprSearch();">기업찾기</button>
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
															<td><input type='text' value='<c:out value='${result.remark}'/>'/></td>
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
			<div class="modal-body">
					<div class="table-responsive">
						<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"></h6>
						</div>
							<form role="form" id="bussSearchFrm" name="bussSearchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="30%">
										<col width="10%">
										<col width="50%"> 									
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">부서</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>시설명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>업체명</option>													
												</select>
											</td>										
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명</th>
											<td>
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:200px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey('B');">
												<a href="javascript:goBussSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
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
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
								<colgroup>
									<col>
									<col width="30%">
									<col width="30%">
								</colgroup>								
								<thead>
									<tr>
										<th>사업명</th>
										<th>사업기간</th>
										<th>사업부서</th>
									</tr>
								</thead>
									<tbody id="bussListBody"></tbody>
								</table>
							</form>						
					</div>
			
				</div>	
				<footer>
				<div class="modal-footer modify" style="align-items: center;">
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
				</footer>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

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
			<div class="modal-body">
					<div class="table-responsive">
						<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"></h6>
						</div>
							<form role="form" id="entprSearchFrm" name="entprSearchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="15%">
										<col width="85%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">기업명</th>
											<td>
												<input type="text" name=searchText1 id="searchText1" class="input-sm not-kor" style="width:200px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey('E');">
												<a href="javascript:goEntprSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
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
							<table class="table table-hover">
								<colgroup>
									<col width="3%">
									<col width="30%">
									<col width="30%">
									<col width="30%">
								</colgroup>								
								<thead>
									<tr>
										<th><input type="checkbox" id="allCheck" name="allCheck" value="all"/></th>
										<th>사업명</th>
										<th>참여기업</th>
										<th>사업부서</th>
									</tr>
								</thead>
									<tbody id="entprListBody"></tbody>
							</table>
					</div>
				</div>	
				<footer>
				<div class="modal-footer modify" style="align-items: center;">
					<button type="button" class="btn btn-default btn-sm" onclick="selectEntpr();">선택</button>
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
				</footer>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	
	
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
	
	<script type="text/javaScript" language="javascript" defer="defer">
		$(document).ready(function () {
			//기업찾기 > 전체 선택
			$("#allCheck").click(function(){
				if($(this).is(':checked')){
					$("#entprListBody :checkbox").prop('checked',true);
				}else{
					$("#entprListBody :checkbox").prop('checked',false);
				}
			});

		});
		
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
		function goBussSearch(){
       
        	//초기화
        	$("#searchText").val("");
        	
			 $.ajax({
					type : 'post',
					url:'/db/business/bussSearchList.do',
					data: $("#bussSearchFrm").serialize(),
					dataType: 'json',
					success : function(data) {
						var html = "";
						$(data.resultList).each(function(){
								html += "<tr>";
							    html += "<td><a href='javascript:selectBussAnncemnt(\""+this.bussAnncemntNo+"\",\""+this.bussAnncemntNm+"\");'>"+this.bussAnncemntNm+"</a></td>";
							    html += "<td>"+this.bussFrDt+" ~ "+this.bussToDt+"</td>";
							    html += "<td>"+this.bussDeptNm+"</td>";
								html += "</tr>";							
							
						});

						$("#bussListBody").empty().append(html);
						$("#bussModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			            
			   		} 
			 });  			
			
		}		
		//기업찾기 조회
		function goEntprSearch(){
			var bussAnncemntNo = $("#bussAnncemntNo").val();
			if(bussAnncemntNo === ""){
			     alert("사업을 선택하세요.");
			     return;
			}
			//초기화
			$("#searchText1").val("");
			$("#allCheck").prop("checked",false);
			
			 $.ajax({
					type : 'post',
					url:'/db/business/entprSearchList.do',
					data: {"searchText1"  : $("#searchText1").val(),
							  "bussAnncemntNo"	: bussAnncemntNo
					},
					dataType: 'json',
					success : function(data) {
						var html = "";
						var rData = data.resultList;
						$.each(rData,function(i){
								html += "<tr>";
							    html += "<td><input type='checkbox' id='chk_"+i+"' name='chk_"+i+"' value='"+this.memberId+"'/></td>";
							    html += "<td>"+this.bussAnncemntNm+"</td>";
							    html += "<td>"+this.entprNm+"</td>";
							    html += "<td>"+this.bussDeptNm+"</td>";
								html += '</tr>';							
							
						});
						
						$("#entprListBody").empty().append(html);
						$("#entprModal").modal('show');
						
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            window.event.preventDefault();
			   		} 
			 });  			
			
		}			
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/member/authList.do'/>";
           	document.listForm.submit();
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
				goBussSearch();				
				return;
			}

			if($("#resultTbody tr").length === 0){
				alert("기업을 선택하세요.");
				goEntprSearch();
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
			var entprList = new Array();
			var entprCheck = $("#entprListBody :checkbox:checked");
			
			if(entprCheck.length === 0){
				alert("기업을 선택하세요.");
				return false;
			}
			
			$(entprCheck).each(function(){
				entprList.push($(this).val());
			});
			
			var param = {
					"bussAnncemntNo" : $("#bussAnncemntNo").val(),
					"membersId"          : entprList
			};
			
			 $.ajax({
					type : 'post',
					url:'/db/business/entprSelectList.do',
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
							    html += "<td><input type='text' value=''/></td>";
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
				
				var benefitPerformNm =  $('#benefitPerformNm').val(); // 제목
				var bussAnncemntNo =  $('#bussAnncemntNo').val(); // 공고번호
				var bussAnncemntNm =  $('#bussAnncemntNm').text(); // 사업명
				var bussCont =  $('#bussCont').val(); // 사업내용
				
				$("#resultTbody tr").each(function(i){
					var mapData = {
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
	                		location.reload();
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