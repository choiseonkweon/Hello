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
											<th>자원명</th>
											<th>업체명</th>
											<th>연락처</th>
											<th>예약일</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr onclick="javascript:goPopView();">
											<td><c:out value="3"/></td>
											<td>노트북3</td>
											<td>(주)케이비시스</td>
											<td>010-2526-2441</td>
											<td>2019.07.06&nbsp;~&nbsp;2019.07.31</td>
											<td>
												대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="#" class="btn" ><b>승인</b></a>
												&nbsp;<a href="#" class="btn" ><b>반려</b></a>
											</td>
										</tr>
										<tr onclick="javascript:goPopView();">
											<td><c:out value="2"/></td>
											<td>노트북2</td>
											<td>(주)케이비시스</td>
											<td>010-2526-2441</td>
											<td>2019.07.06&nbsp;~&nbsp;2019.07.31</td>
											<td>
												반려
											</td>
										</tr>
										<tr onclick="javascript:goPopView();">
											<td><c:out value="1"/></td>
											<td>노트북3</td>
											<td>(주)케이비시스</td>
											<td>010-2526-2441</td>
											<td>2019.07.06&nbsp;~&nbsp;2019.07.31</td>
											<td>
												승인
											</td>
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
				 <b>자원 사용 신청내용</b>
				</h4>
			</div>
			<div class="modal-body">
					<div class="table-responsive">
						<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"></h6>
							</div>
						<table class="table table-hover">
								<colgroup>
						          <col width="10%">
						          <col width="18%">
						          <col width="72%">
						        </colgroup>
							        <tbody>
								        <tr>
								          <th class="tc tc01" rowspan="6" style="vertical-align: middle;">신청인</th>
								          <th class="tc">업체(기관)명</th>
								          <td><span id="detailPop_compNm">케이비시스</span></td>
								        </tr>
								        <tr>
								          <th class="tc">주소</th>
								          <td><span id="detailPop_addr">구로디지털로 288 1202호</span></td>
								        </tr>
								        <tr>
								          <th class="tc">성명</th>
								          <td><span id="detailPop_name">박인영</span></td>
								        </tr>
								        <tr>
								          <th class="tc">연락처</th>
								          <td><span id="detailPop_officeNum">010-3359-2023</span></td>
								        </tr>
								        <tr class="emailWrap">
								          <th class="tc">이메일</th>
								          <td><span id="detailPop_email">tjy@jcia.or.kr</span></td>
								        </tr>
								        <tr>
								          <th class="tc">인원수</th>
								          <td><span id="detailPop_totNum">30</span></td>
								        </tr>
										<tr>
								          <th class="tc tc01" rowspan="3" style="vertical-align: middle;">사용자원</th>
								          <th class="tc">자원이름</th>
								          <td><span id="detailPop_facNm">지식나눔터</span></td>
										</tr>
								        <tr>
								          <th class="tc">사용목적</th>
								          <td><span id="detailPop_purpose">Sw교육 전문강사 양성과정 운영</span></td>
								        </tr>
								        <tr>
								          <th class="tc">사용시간</th>
								          <td><span id="detailPop_useDate">2019.06.25 09시 ~ 2019.06.25 18시</span></td>
								        </tr>
			      				</tbody>
							</table>
					</div>
				</div>	
				<footer>
				<div class="modal-footer" style="align-items: center;">
	            	<button class="btn btn-primary" onclick="printArea();">인쇄</button>
			        <button class="btn btn-primary">확인</button>
			        <button type="button" class="btn btn-primary" onclick="updateResv();">수정</button>
			        <button class="btn"  onclick="deleteResv();">삭제</button>
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
        
        function goPopView(){
        	$('#myModal').modal('show');
        }
        
    </script>
</body>
</html>