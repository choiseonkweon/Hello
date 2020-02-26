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
				<li>Home</li><li>사이트 관리</li><li><b>FAQ</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>FAQ</b></h1>
				</div>
			</div>
			<!-- widget grid -->
			<section id="widget-grid" class="">
					<div class="well well-sm">
						<div class="table-responsive">
							<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
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
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>제목</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
												<a href="javascript:goSearch();" class="btn btn-primary"><b>검색</b></a>
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
								<h6 class="page-title txt-color-blueDark"><b>전체 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
							</div>
							<form role="form" id="faqFrm" name="faqFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>상태</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${faqList}" varStatus="status">
											<tr>
											<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
												<td>
													<a href="javascript:moveDetailView('${result.faq_idx}');">
														<c:out value="${result.faq_title}"/>
													</a>
												</td>
												<td><c:out value="${result.faq_open_yn}"/></td>
												<td><c:out value="${result.reg_dt}"/></td>
											</tr>
										</c:forEach>	
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
			<div style="padding-bottom:5px;text-align:right;">
				<a href="/db/site/faqReg.do" class="btn btn-primary" id="insertBtn" ><b>등록</b></a>
				<a href="/db/site/faqListExcelDown.do" class="btn btn-primary" id="insertBtn" ><b>엑셀다운</b></a>
				<!-- excel file 읽어오기 -->
			    <form name="excelUpForm" id="excelUpForm" enctype="multipart/form-data" method="POST" action="ExcelUp.do">
				    <input type="file" id="excelFile" name="excleFile" value="엑셀 업로드" />
				</form>
			</div>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	<form role="form" id="faqDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="faq_idx" id="faq_idx" value="">
    </form>
    
	<script type="text/javaScript" >
 		$(document).ready(function () {
 		});
		
         /* pagination 페이지 링크 function */
         function fn_egov_link_page(pageNo){
         	document.listForm.pageIndex.value = pageNo;
         	document.listForm.action = "<c:url value='/site/faqList.do'/>";
            	document.listForm.submit();
         }
        
         function enterKey(){
         	if(window.event.keyCode == 13){
         		goSearch();
     		}
         }
        
         function goSearch(){
    			$('#searchFrm').attr('action', "/db/site/faqList.do").submit();
         }
        
         function moveDetailView(faq_idx){
         	$('#faq_idx').val(faq_idx);
         	$('#faqDetailFrm').attr('action', "/db/site/faqDetail.do").submit();
         }

         $("#excelUpForm").change(function(){
             var form = $("#excelUpForm")[0];

             var data = new FormData(form);
             $.ajax({
                enctype:"multipart/form-data",
                method:"POST",
                url: '/db/site/ExcelUp.do',
                processData: false,   
                contentType: false,
                cache: false,
                data: data,
                success: function(){  
                    alert("업로드 성공!!");
                }
             });
         });

    </script>
</body>
</html>