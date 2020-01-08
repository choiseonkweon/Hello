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
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
												</select>
												<input type="text" name="searchText" id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상태</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
												</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">기간</th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="startdate" id="startdate" placeholder=""   />
													<i class="icon-append fa fa-calendar"></i>
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="finishdate" id="finishdate" placeholder="">
													<i class="icon-append fa fa-calendar"></i>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:center;width:99%">
									<a href="javascript:goSearch();" class="btn btn-primary" ><b>검색</b></a>
								</div>
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
											<th>공고번호</th>
											<th>사업명</th>
											<th>상태</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><c:out value="3"/></td>
											<td>2019-8-000</td>
											<td>(주)케이비시스 통합관리시스템 구축</td>
											<td>진행중</td>
											<td>홍길동</td>
											<td>2019.05.25</td>
											<td>2</td>
										</tr>
										<tr>
											<td><c:out value="2"/></td>
											<td>2019-8-000</td>
											<td>(주)케이비시스 통합관리시스템 구축</td>
											<td>진행중</td>
											<td>홍길동</td>
											<td>2019.05.25</td>
											<td>2</td>
										</tr>
										<tr>
											<td><c:out value="1"/></td>
											<td>2019-8-000</td>
											<td>(주)케이비시스 통합관리시스템 구축</td>
											<td>완료</td>
											<td>홍길동</td>
											<td>2019.05.25</td>
											<td>2</td>
										</tr>
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
			<div style="padding-bottom:5px;text-align:right;">
				<a href="/db/business/businessManagementRegister.do" class="btn btn-primary" id="insertBtn" ><b>등록</b></a>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	
	
	<script type="text/javaScript" >
		$(document).ready(function () {
		});
		
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/member/authList.do'/>";
           	document.listForm.submit();
        }
        
        function goPopView(){
        	$('#myModal').modal('show');
        }
        
    </script>
</body>
</html>