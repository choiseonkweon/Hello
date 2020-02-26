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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="../js/excel/excel.min.js"></script>
<script type="text/javaScript" >
	$(document).ready(function () {
		
		$(function() {
	           $("#startDate").datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	            });                    

	            //초기값을 오늘 날짜로 설정
	            $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	        });


		$(function(){
			//input을 datepicker로 선언
         $("#endDate").datepicker({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
             //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)businessManagementList
             ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
         });                    
         
         //초기값을 오늘 날짜로 설정
         $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
         
         $('#test').click(function(){
         })
         
     });
		

		
		//캘릭더 클리
		$(function(){

			$("#preYear").click(function(){
				var preYear = parseInt($("#presentYear").text()) - 1 ;
				$("#presentYear").text(preYear);
			})
			
			$("#nextYear").click(function(){
				var nextYear = parseInt($("#presentYear").text()) + 1 ;
				$("#presentYear").text(nextYear);
			})
			
			$(".month").click(function(e){
				$(".monthw").find("a").removeAttr("class", "on");
				$(e.target).attr("class", "on");
			})
			
			
			//첫 렌더링시에 더보기 데이터가 없을 경우 더보기 버튼 hidden 처리
			var totalCnt =$('#totCnt').val();
			var liCnt = parseInt( $(".ing").length );
			if( totalCnt <= liCnt ){
				$('#moreBtn').css('display','none');
			}

			
		});
		
		
	});
	
       /* pagination 페이지 링크 function */
       function fn_egov_link_page(pageNo){
       	document.listForm.pageIndex.value = pageNo;
       	document.listForm.action = "<c:url value='/business/businessManagementList.do'/>";
        document.listForm.submit();
       }
       
       function goPopView(){
       	$('#myModal').modal('show');
       }
       

       function enterKey() {
			if (window.event.keyCode == 13) {
				goSearch();
			}
		}
		
		//검색버튼 클릭시
		function goSearch() {
			//alert("tset");
			var datepicker1 = $('#datepicker1').val();
			var datepicker2 = $('#datepicker2').val();
			var totCnt = $('#totCnt').val();
			 //alert("값 표시 :: " + datepicker1 + '\n' +  datepicker2 + " " + totCnt);
			$('#searchFrm').attr('action', "/db/business/businessManagementList.do").submit();
		}
		

		function moveDetailView(bussAnncemntNo) {
			$('#bussAnncemntNo').val(bussAnncemntNo);
			$('#memberDetailFrm').attr('action', "/db/business/businessManagementDetail.do").submit();
		}

		
//엑셀 업로드 클릭(모달실행)

		function goExcelUploadModal(flag){
			if(flag='Y'){
				$("#ExcelUpoadModal").modal('show');				
			}
		}



		var test1 = null, test2 = null;
		function gridExcelToWeb(file, target){
		    var reader = new FileReader();

		    reader.onload = function (evt) {
		    	if (evt.target.readyState == FileReader.DONE) {
		            var data = evt.target.result;  //해당 데이터, 웹 서버에서 ajax같은거로 가져온 blob 형태의 데이터를 넣어주어도 동작 한다.
		            data = new Uint8Array(data);
		            var workbook = XLSX.read(data, { type: 'array' });
		            var sheetName = '';
		            workbook.SheetNames.forEach( function(data, idx){   //시트 여러개라면 이 안에서 반복문을 통해 돌리면 된다.

		            	if(idx == 0){
		                    sheetName = data;
		                }
		            });
		            test1 = workbook;

		            var toHtml = XLSX.utils.sheet_to_html(workbook.Sheets[sheetName], { header: '' });
		            target.html(toHtml);
		            }
		    };
		    reader.readAsArrayBuffer(file);
		}    

		$(document).ready(function () {
			$('#file').change( function(){
			    const selectedFile = $(this)[0].files[0];
			    gridExcelToWeb(selectedFile,  $('#UploadResultBody'))
			});
			
		}); 
		
		
		function ExcelUpload(flag){
			var formData = new FormData(form);
			formData.append("files",$("input[name=file]")[0].files);
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "/db/business/excelupload.do",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        async: false,
		        success: function (data) {
		        	if(data == '1'){
				       console.log('업로드가 완료되었습니다.');
			        }
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		            alert("업로드가 실패하였습니다.")
		        }
		    });
		}
</script>
    
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사업 관리</li><li><b>사업 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 관리</b></h1>
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 <!-- / 공고번호 --></th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected" ' : '' }>사업명</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected" ' : '' }>사업공고</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" 	style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>

											<th style="text-align:center;background:#eee;vertical-align:middle;">기간</th>
											<td colspan="3">
												<label class="input"> 
														<input type="text" id="startDate" name="startDate" value="${searchVO.startDate}"  readOnly />
														&nbsp;~&nbsp;
														<input type="text" id="endDate" name="endDate" value="${searchVO.endDate}"  readOnly onkeydown="javascript:enterKey();"/>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록상태</th>
											<td>
												<select name="searchSelect" id="searchSelect" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchSelect eq 1 ? 'selected="selected" ' : '' }>진행예정</option>
													<option value="2" ${searchVO.searchSelect eq 2 ? 'selected="selected" ' : '' }>진행중</option>
													<option value="3" ${searchVO.searchSelect eq 3 ? 'selected="selected" ' : '' }>완료</option>
												</select>
											</td>
											<th>
												<div style="padding-top:5px;padding-bottom:5px;text-align:center;width:99%">
													<a href="javascript:goSearch();" class="btn btn-primary" ><b>검색</b></a>
												</div>
											
											</th>
											<td>
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
								<h6 class="page-title txt-color-blueDark" style="text-align: left; float: left; width: 200px; height: 25px;"><b>총 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
								<a href="#" class="btn btn-primary" style="text-align: right; margin-left: 81%" id="excelUploadBtn"  onclick="goExcelUploadModal('Y')"><b>엑셀업로드</b></a>
							</div>
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>공고번호</th>
											<th>사업명</th>
											<th>상태</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>승인요청</th>
										</tr>
									</thead>
									<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="7">조회 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount ne 0 }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>
													<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
											</td>
											<td>
												<a href="javascript:moveDetailView('${result.bussAnncemntNo}');">
													<c:out value="${result.bussAnncemntNo}"/>
												</a>
											</td>
											<td>
												<a href="javascript:moveDetailView('${result.bussAnncemntNo}');">
													<c:out value="${result.bussAnncemntNm}"/>
												</a>	
											</td>
											<td><c:out value="${result.result}"/></td>
											<td><c:out value="${result.regId}"/></td>
											<td><c:out value="${result.regDt}"/></td>
											<td><c:out value="${result.applicStCd}"/></td>
									</tr>
									</c:forEach>
								</c:if>
							</tbody> 
								</table>
							</form>
						</div>
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
			</section>
			<!-- end widget grid -->
			<div style="padding-bottom:5px;text-align:right;">
				<a href="/db/business/businessManagementRegister.do" class="btn btn-primary" id="insertBtn" ><b>등록</b></a>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="sno" id="sno" value="">
	   <input type="hidden" name="title" id="title" value="">
	   <input type="hidden" name="titleminus" id="titleminus" value="">
	   <input type="hidden" name="titleplus" id="titleplus" value="">
	   <input type="hidden" name="companyname" id="companyname" value="">
	   <input type="hidden" name="dateInserted" id="dateInserted" value="">
	   <input type="hidden" name="mainphone" id="mainphone" value="">
	   <input type="hidden" name="address" id="address" value="">
	   <input type="hidden" name="touchmoney" id="touchmoney" value="">
	   <input type="hidden" name="capital" id="capital" value="">
	   <input type="hidden" name="employees" id="employees" value="">
	   <input type="hidden" name="establishmentdate" id="establishmentdate" value="">

 
	   <input type="hidden" name="entprNm" id="entprNm" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   
	   <input type="hidden" name="bussAnncemntNo" id="bussAnncemntNo" value="">

    </form>
	
	
<div class="modal fade" id="ExcelUpoadModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
				 <b>엑셀업로드</b>
				</h4>
			</div>
			<div id="fileDiv" style="width: 100%">
				<input type="file" name="file" id="file">
			</div>
 			<div>
 			<a>*엑셀업로드시 알아야 할 내용.</a><br/>
 			<a>*6개의 컬럼만 등록할 수 있습니다.</a><br/>
 			<a>*컬럼명이 아닌 컬럼값만 입력해주세요. </a><br/>
 			<a>*값이 정확하지 않을경우 등록이 안될 수 있습니다. </a>
 			</div>
 			<div style="height: 600px; overflow:scroll;">
				<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>								
				<thead>
					<tr>
						<th>공고번호</th>
						<th>사업명</th>
						<th>상태</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인요청</th>
					</tr>
				</thead>
					<tbody id="UploadResultBody">
					</tbody>
				</table>
 			</div>
			<footer>
				<div class="modal-footer modify" style="align-items: center;">
			        <button type="button" class="btn btn-default btn-sm" onclick="ExcelUpload('Y');">업로드</button>
			        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
	            </div>
			</footer>
			<!-- 검색조건 유지 -->
		
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->		
</body>
</html>



