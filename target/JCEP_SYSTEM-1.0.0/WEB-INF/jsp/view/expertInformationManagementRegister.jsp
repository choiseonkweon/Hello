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
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>전문가정보 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가정보 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>전문가정보 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<!--  수정 form S -->
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberIdx" id="memberIdx" value="${detail.memberIdx}"/>
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 기본 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td style="vertical-align:middle;">
												<c:out value="pjy519"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<c:out value="*****"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">E-mail * </th>
											<td style="vertical-align:middle;">
												<c:out value="jypark@kb-sys.co.kr"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td style="vertical-align:middle;">
												<c:out value="*****"/>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">이름 * </th>
											<td style="vertical-align:middle;">
												<c:out value="박인영"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">성별 </th>
											<td style="vertical-align:middle;">
												<c:out value="여"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">경력년수 </th>
											<td style="vertical-align:middle;">
												<c:out value="10년"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">전문분야 * </th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">모바일콘텐츠</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 전문분야 * </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">동영상</option>
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">관심분야 *</th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">모바일콘텐츠</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 관심분야 *</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">동영상</option>
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">산학연관 </th>
											<td style="vertical-align:middle;">
												<c:out value="학"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호 </th>
											<td style="vertical-align:middle;">
												<c:out value="123-55-15254"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">출신학교 </th>
											<td style="vertical-align:middle;">
												<c:out value="xxx대학교"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value="" placeholder="전산" onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">학력 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value="" placeholder="공학박사"  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">소속기관 *</th>
											<td style="vertical-align:middle;">
												<c:out value="케이비시스"/>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">직장 * </th>
											<td>
												<label class="input" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:headPostcode()"><b>주소검색</b></a>
													<input type="text" id="enterpriseHeadAddr" name="enterpriseHeadAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰 </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadTel" name="enterpriseHeadTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadDetailAddr" name="enterpriseHeadDetailAddr" class="input-sm" value="" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표FAX </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadFax" name="enterpriseHeadFax" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">자택 </th>
											<td>
												<label class="input" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:branchPostcode()"><b>주소검색</b></a>
													<input type="text" id="enterpriseBranchAddr" name="enterpriseBranchAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상세주소 </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseBranchTel" name="enterpriseBranchTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
									</tbody>
								</table>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7"><h5 class="page-title txt-color-blueDark"><b>● 심의(자문, 평가 등) 이력</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="#a" id="resultAddBtn" class="btn btn-primary" ><b>추가</b></a>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>수행일</th>
											<th>내용</th>
											<th></th>
										</tr>
									</thead>	
									<tbody id="resultTbody">
									</tbody>
								</table>
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 수당 지급정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">은행 </th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">기업</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">계좌번호 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">생년월일 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseNm" name="enterpriseNm" class="input-sm" value=""  style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 전화 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="/enterprise/enterpriseInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
										<a href="#" id="createBtn" class="btn btn-primary" ><b>저장</b></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!--  수정 form E -->
			
			<!--  등록 form S -->
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 기본 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseNm" name="enterpriseNm" class="input-sm" value=""  style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">E-mail * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseNm" name="enterpriseNm" class="input-sm" value=""  style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">이름 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseNm" name="enterpriseNm" class="input-sm" value=""  style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">성별 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">경력년수 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">전문분야 * </th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">모바일콘텐츠</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 전문분야 * </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">동영상</option>
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">관심분야 *</th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">모바일콘텐츠</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">세부 관심분야 *</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">동영상</option>
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">산학연관 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">과학기술인 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업자등록번호 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">출신학교 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전공 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">학력 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">소속기관 *</th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">해당부서 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">직책 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseEmpCnt" name="enterpriseEmpCnt" class="input-sm" value=""  onkeyup='inputNumberFormat(this);' style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">직장 * </th>
											<td>
												<label class="input" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:headPostcode()"><b>주소검색</b></a>
													<input type="text" id="enterpriseHeadAddr" name="enterpriseHeadAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰 </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadTel" name="enterpriseHeadTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadDetailAddr" name="enterpriseHeadDetailAddr" class="input-sm" value="" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표FAX </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseHeadFax" name="enterpriseHeadFax" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">자택 </th>
											<td>
												<label class="input" style="width:100%">
													<a href="#" class="btn btn-primary" onclick="javascript:branchPostcode()"><b>주소검색</b></a>
													<input type="text" id="enterpriseBranchAddr" name="enterpriseBranchAddr" class="input-sm" value="" style="width:80%" readonly="readonly">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">상세주소 </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseBranchTel" name="enterpriseBranchTel" class="input-sm" value="" maxlength="13" onkeyup="inputTelNumber(this);" style="width:100%">
												</label>
											</td> 
										</tr>
									</tbody>
								</table>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-7 col-md-7"><h5 class="page-title txt-color-blueDark"><b>● 심의(자문, 평가 등) 이력</b></h5></div>
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="#a" id="resultAddBtn" class="btn btn-primary" ><b>추가</b></a>
									</div>
								</div>
								<table id="resultTable" class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<thead>
										<tr>
											<th>수행일</th>
											<th>내용</th>
											<th></th>
										</tr>
									</thead>	
									<tbody id="resultTbody">
									</tbody>
								</table>
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 전문가 수당 지급정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">은행 </th>
											<td>
												<label class="input" style="width:100%">
													<select id="enterpriseType" name="enterpriseType" style="width: 300px; height: 30px;">
														<option value="A">기업</option>
													</select>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">계좌번호 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">생년월일 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseNm" name="enterpriseNm" class="input-sm" value=""  style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 전화 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="enterpriseCeo" name="enterpriseCeo" class="input-sm" value="" style="width:100%">
												</label>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-xs-12">
									<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
										<a href="/enterprise/enterpriseInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
										<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!--  등록 form E -->			
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
	 
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
	<script type="text/javaScript" language="javascript" defer="defer">
		$(document).ready(function () {
			
			//성과관리 추가버튼 클릭
			$("#resultAddBtn").click(function(){
				var rowItem = "";
				rowItem += "<tr>";
				rowItem += "	<td> <input type='text' class='form-control' placeholder='ex) 2019-01-30'></td>";
				rowItem += "	<td> <input type='text' class='form-control' placeholder=''> </td>";
				rowItem += "	<td> <button type='button' class='btn btn-danger'> <i class='fa fa-minus'></i> </button> </td>";
				rowItem += "</tr>";
				$('#resultTable').append(rowItem);
				$('.form-control').focus();
			});
			
			$('#resultTable').on("click", "button", function() {
			    $(this).closest("tr").remove();
			});
			
			$('#resultTbody tr').each(function () {
				var cellItem = $(this).find(":input");
				var itemObj = new Object();
				itemObj.enterpriseResultYear = cellItem.eq(0).val();
				itemObj.enterpriseResultQta = cellItem.eq(1).val();
				itemObj.enterpriseResultCapital = cellItem.eq(2).val();
				itemObj.enterpriseResultTake = cellItem.eq(3).val();
				itemObj.enterpriseResultEmpCnt = cellItem.eq(4).val();
			});
			
			//input을 datepicker로 선언
            $("#enterpriseEstDt").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
            	
            });                  
            
			$("#saveBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/member/memberUpdate.do',
						data: $('#updateFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("저장을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("저장이 완료 되었습니다.");
								location.reload();
								return false;
			                }
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 });
			});
			
			function checkValue(){
				var retValue = true;
				
				if($('#memberId').val() == ""){
					alert("아이디를 입력하세요.");
					$('#memberId').focus();
					return;
				}
				
				if($('#chkYn').val() != "Y"){
					alert("아이디를 중복체크 하세요.");
					return;
				}
				
				if($('#memberPw').val() == ""){
					alert("비밀번호를 입력하세요.");
					$('#memberPw').focus();
					return;
				}
				
				if($('#memPwdChk').val() == ""){
					alert("비밀번호 확인을 입력하세요.");
					$('#memPwdChk').focus();
					return;
				}
				
				if($('#memberPw').val() != $('#memPwdChk').val()){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				if($('#memberNm').val() == ""){
					alert("이름을 입력하세요.");
					$('#memberNm').focus();
					return;
				}
				
				if($('#memberHp').val() == ""){
					alert("휴대폰번호를 입력하세요.");
					$('#memberHp').focus();
					return;
				}

				return retValue;
			}
			
			$("#createBtn").click(function(){
				if(checkValue()){
					$.ajax({
						type : 'post',
						url:'/member/memberInsert.do',
						data: $('#insertFrm').serialize(),
						dataType: 'json',
						success : function(data) {
							if(data.returnCode == 0){
			                    alert("등록을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("등록이 완료 되었습니다.");
								location.reload();
								return false;
			                }
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 	});
				} 
			});
			
		});
		
		function headPostcode(){
			
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('enterpriseHeadAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			        }
				}).open();
		}
		
		function branchPostcode(){
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('enterpriseBranchAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			        }
				}).open();
		}
    </script>
</body>
</html>