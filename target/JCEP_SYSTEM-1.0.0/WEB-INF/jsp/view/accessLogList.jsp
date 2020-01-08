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
				<li>Home</li><li>사이트 관리</li><li><b>접속로그 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>접속로그 관리</b></h1>
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
											<th style="text-align:center;background:#eee;vertical-align:middle;">기간</th>
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
												<a href="javascript:goSearch();" class="btn btn-primary" style="margin-left: 200px;"><b>검색</b></a>
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
											<th>아이디</th>
											<th>IP</th>
											<th>작업종류</th>
											<th>접근일시</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><c:out value="3"/></td>
											<td>admin</td>
											<td>12.34.597.253</td>
											<td>관리자 목록 조회</td>
											<td>2018.09.20 11:30</td>
										</tr>
										<tr>
											<td><c:out value="2"/></td>
											<td>admin</td>
											<td>12.34.597.253</td>
											<td>원스톱지원실 조회</td>
											<td>2018.09.20 11:30</td>
										</tr>
										<tr>
											<td><c:out value="1"/></td>
											<td>admin</td>
											<td>12.34.597.253</td>
											<td>가입관리 목록 조회</td>
											<td>2018.09.20 11:30</td>
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
			<div style="padding-bottom:5px;text-align:left;">
				<a href="/facility/facilityRegistrationManagementReg.do" class="btn btn-primary" id="insertBtn" ><b>엑셀다운로드</b></a>
			</div>
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
						<table class="table table-hover">
								<colgroup>
						          <col width="10%">
						          <col width="18%">
						          <col width="72%">
						        </colgroup>
							        <tbody>
								        <tr>
								          <th class="tc tc01" rowspan="7" style="vertical-align: middle;">신청인</th>
								          <th class="tc">업체(기관)명</th>
								          <td><span id="detailPop_compNm">전남정보문화산업진흥원</span></td>
								        </tr>
								        <tr>
								          <th class="tc">주소</th>
								          <td><span id="detailPop_addr">(58656) 전남 목포시 석현로 46 (석현동) 벤처지원센터 운영사무실</span></td>
								        </tr>
								        <tr>
								          <th class="tc">성명</th>
								          <td><span id="detailPop_name">탁지영</span></td>
								        </tr>
								        <tr>
								          <th class="tc" rowspan="2" style="vertical-align: middle;">연락처</th>
								          <td><span id="detailPop_officeNum">061-280-7499</span></td>
								        </tr>
								        <tr>
								          <td><span id="detailPop_cellNum">010-3626-4520</span></td>
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
								          <th class="tc tc01" rowspan="5" style="vertical-align: middle;">사용시설</th>
								          <th class="tc">시설명</th>
								          <td><span id="detailPop_facNm">배움터-2</span></td>
										</tr>
								        <tr>
								          <th class="tc">목적(행사명)</th>
								          <td><span id="detailPop_purpose">마케팅 심화교육</span></td>
								        </tr>
								        <tr>
								          <th class="tc">사용시간</th>
								          <td><span id="detailPop_useDate">2019-06-25 09시 ~ 18시</span></td>
								        </tr>
								        <tr>
								          <th class="tc">냉난방기</th>
								          <td><span id="detailPop_cHUnitYn">사용</span></td>
								        </tr>
								        <tr>
								          <th class="tc">빔프로젝트</th>
								          <td><span id="detailPop_bimUseTime">8</span></td>
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