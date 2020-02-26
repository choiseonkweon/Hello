<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../js/myCompanyInformation.js"></script>
<script type="text/javascript" src="../js/validation.js"></script>

<head>
	<style type="text/css">
	        #ui-datepicker-div .ui-widget-header {	
				background: #2D8CB9;	
			}
			.ui-state-default, .ui-widget-content .ui-state-default{
				background: transparent!important;
			}
			.ui-state-highlight, .ui-widget-content .ui-state-highlight{
				background: #fffa90!important;
			}
			.ui-datepicker-calendar th {
				color: #2D8CB9;
			}
			.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover{
			 	color:#333!important;
			}
			
	</style>
	<script type="text/javascript">
	//추가버튼 클릭

	
	</script>
</head>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>기업/바이어/전문가정보 관리</li><li><b>기업정보 관리1</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>기업정보 수정</b></h1>
					</div>
				</div>
		
			<!--  수정 form S -->
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<div class="table-responsive">
								<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
									&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 수정 기본 정보</b></h5>
								</div>
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">회사명 * </th>
											<td>
												<span>${list.entprNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 E-mail </th>
											<td>
												<input type="text" id="entprRespsibEmail1" name="entprRespsibEmail1" value="" style="width:100px;" maxLength="20"/>@
												<select id="entprRespsibEmail2" name="entprRespsibEmail2">
													<option value="naver.com" 	>naver.com</option>
													<option value="google.com" >google.com</option>
													<option value="yahoo.com"  >yahoo.com</option>
													<option value="daum.com"	>daum.com</option>
													<option value="hanmail.net" >hanmail.net</option>
													<option value="nate.com"    >nate.com</option>
												</select>
											</td>
										</tr>
									
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">담당자명 * </th>
											<td>
												<span>${list.entprRespsibNm}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">담당자 연락처 </th>
											<td>
												<select id="entprRespsibHpNo" name="entprRespsibHpNo">
													<c:forEach var="hpNum" items="${hpNum}" varStatus="status" >
													 	<option value="${hpNum.commonCd}"<c:if test="${hpNum.commonCd == list.entprRespsibHpNo}">selected</c:if>>${hpNum.commonCd}</option>
													 </c:forEach>
												</select>-
									<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprRespsibHpNo2" name="entprRespsibHpNo2" value="${list.entprRespsibHpNo2}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
									<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprRespsibHpNo3" name="entprRespsibHpNo3" value="${list.entprRespsibHpNo3}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">대표자 * </th>
											<td>
												<span>${list.entprCeo}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">업종명 </th>
											<td>
												<input type="text" id="entprTypeNm" name="entprTypeNm" class="" value="${list.entprTypeNm}" style="width:27%">
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업자등록번호 * </th>
											<td style="vertical-align:middle;">
												<span>${list.entprComRegNum}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 E-Mail </th>
											<td>
													<input type="text" id="entprCeoEmail1" name="entprCeoEmail1" value="" style="width:100px;"/>@
													<select id="entprCeoEmail2" name="entprCeoEmail2">
														<option value="naver.com" 	>naver.com</option>
														<option value="google.com"	>google.com</option>
														<option value="yahoo.com"	>yahoo.com</option>
														<option value="daum.com"	>daum.com</option>
														<option value="hanmail.net" >hanmail.net</option>
														<option value="nate.com"    >nate.com</option>
													</select>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">사업분야 </th>
											<td style="vertical-align:middle;">
												<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox('')" >
													<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
													 	<option value="${largeBussAreaCd.commonCd}">${largeBussAreaCd.commonNm}</option>
													 </c:forEach>
												</select>
												<select id="mediumBussAreaCd" name="mediumBussAreaCd" style="position:relative;">
												</select>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">홈페이지 </th>
											<td>
													<input type="text" id="entprSite" name="entprSite" class="" value="${list.entprSite}" style="width:27%">
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="4">주소 </th>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">본사 </th>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="" value="${list.entprHeadAddr}" style="width:73%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 120px; " onclick="javascript:openDaumPostcode()">우편번호 검색</button>
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표전화 </th>
											<td>

												<select id="entprHeadTel" name="entprHeadTel">
													<c:forEach var="totNum" items="${totNum}" varStatus="status" >
													 	<option value="${totNum.commonCd}"<c:if test="${totNum.commonCd == list.entprHeadTel}">selected</c:if>>${totNum.commonCd}</option>
													 </c:forEach>
												</select>-
												<input type="text" style="width: 40px;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprHeadTel2" name="entprHeadTel2" value="${list.entprHeadTel2}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px;margin-left: 5px; text-align: center;" id="entprHeadTel3" name="entprHeadTel3" value="${list.entprHeadTel3}" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
											</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprHeadDetailAddr" name="entprHeadDetailAddr"  value="${list.entprHeadDetailAddr}" style="width:93%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">본사대표FAX </th>
											<td>
												<select id="entprHeadFax" name="entprHeadFax">
													<c:forEach var="totNum" items="${totNum}" varStatus="status" >
													 	<option value="${totNum.commonCd}"<c:if test="${totNum.commonCd == list.entprHeadFax}">selected</c:if>>${totNum.commonCd}</option>
													 </c:forEach>
												</select>
												<span>-</span>
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprHeadFax2" name="entprHeadFax2"  value="${list.entprHeadFax2}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprHeadFax3" name="entprHeadFax3"  value="${list.entprHeadFax3}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" rowspan="2">지사 </th>
											<td>
													<input type="text" id="entprBranchAddr" name="entprBranchAddr" class="" value="${list.entprBranchAddr}" style="width:73%" readonly="readonly">
													<button type="button" class="btn btn-primary" style="width: 120px; " onclick="javascript:openDaumPostcode1()">우편번호 검색</button>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표전화 </th>
											<td>
												<select id="entprBranchTel" name="entprBranchTel">
													<c:forEach var="totNum" items="${totNum}" varStatus="status" >
													 	<option value="${totNum.commonCd}"<c:if test="${totNum.commonCd == list.entprBranchTel}">selected</c:if>>${totNum.commonCd}</option>
													 </c:forEach>
												</select>
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprBranchTel2" name="entprBranchTel2" value="${list.entprBranchTel2}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprBranchTel3" name="entprBranchTel3" value="${list.entprBranchTel3}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>	
												</td> 
										</tr>
										<tr>
											<td>
												<label class="input" style="width:100%">
													<input type="text" id="entprBranchDetailAddr" name="entprBranchDetailAddr" value="${list.entprBranchDetailAddr}" style="width:93%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">지사대표FAX </th>
											<td>
												<select id="entprBranchFax" name="entprBranchFax">
													<c:forEach var="totNum" items="${totNum}" varStatus="status" >
													 	<option value="${totNum.commonCd}"<c:if test="${totNum.commonCd == list.entprBranchFax}">selected</c:if>>${totNum.commonCd}</option>
													 </c:forEach>
												</select>
												<span >-</span>
												<input type="text" style="width: 40px ;margin-right: 5px; margin-left: 5px; text-align: center;" id="entprBranchFax2" name="entprBranchFax2" value="${list.entprBranchFax2}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-
												<input type="text" style="width: 40px ;margin-left: 5px; text-align: center;" id="entprBranchFax3" name="entprBranchFax3" value="${list.entprBranchFax3}" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</td> 
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;" colspan="2">설립일 *</th>
											<td style="vertical-align:middle;">
												<input type="text" id="entprEstDt" name="entprEstDt" class="date" value="${list.entprEstDt}" maxlength="10" style="width: 15%">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자본금</th>
											<td>
													<input type="text" id="entprCapitalAmt" name="entprCapitalAmt" value="${list.entprCapitalAmt}"  onkeyup='inputNumberFormat(this);' maxlength="10" style="width:27%">
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
<!------------------------------------------------------------- 하단부 추가---->

						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h5 class="page-title txt-color-blueDark">
								<b>● 성과관리</b>
							</h5>
						</div>
						<h4 class="clearfix">
						<button type="button" class="txtbtn floatR" id="ERaddBtn">추가</button>						
						</h4>
						<div class="table01 datetable" id="resultTable">
							<table class="table table-bordered table-striped" id="resultTable">
								<colgroup>
									<col width="10%" />	<col width="20%" /><col width="20%" /><col width="20%" /><col width="20%" /><col width="10%" />
								</colgroup>
								<thead>
									<tr>
										<th>수행년도</th>
										<th>분기</th>
										<th>자본금</th>
										<th>매출액</th>
										<th>직원수</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="resultTbody4">
								</tbody>
							</table>
						</div>						 
						 


						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h5 class="page-title txt-color-blueDark">
								<b>● 진흥원 수혜사업</b>
							</h5>
						</div>
						<table class="table table-bordered table-striped" id="resultTable">
							<colgroup>
							<col width="5%" /><col width="10%" /><col width="15%" />	<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" />
							</colgroup>
							<thead>
							<tr>
								<th>공고번호</th>
								<th>사업명</th>
								<th>사업기간</th>
								<th>사업비용</th>
								<th>고용창출</th>
								<th>완료여부</th>
								<th>증빙서류</th>
								<th>사업부서</th>
								<th>승인상태</th>
							</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>


						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h5 class="page-title txt-color-blueDark">
								<b>● 지적재산권 현황</b>
							</h5>
						</div>
						<h4 class="clearfix">
							<button type="button" class="txtbtn floatR" id="resultBtn1">추가</button>
						</h4>
						<table class="table table-bordered table-striped" id="resultTable1">
							<colgroup>
								<col width="5" /><col width="10" /><col width="10" /><col width="10" /><col width="10" /><col width="5" /><col width="10" /><col width="10" /><col width="10" /><col width="10" />
							</colgroup>
							<thead>
							<tr>
								<th>NO</th>
								<th>사업명</th>
								<th>실적명</th>
								<th>분류</th>
								<th>등록형태</th>
								<th>국가</th>
								<th>증빙</th>
								<th>일자</th>
								<th>비고</th>
								<th></th>
							</tr>
							</thead>
								<tbody id="resultTbody1">
								</tbody>
						</table>
						
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h5 class="page-title txt-color-blueDark">
								<b>● 기업사원 정보</b>
							</h5>
						</div>
						<h4>
							<button type="button" class="txtbtn floatR" id="employeeBtn">추가</button>						
						</h4>
						<table class="table table-bordered table-striped" id="resultTable2">
							<colgroup>
								<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" />
							</colgroup>
							<thead>
							<tr>
								<th>NO</th>
								<th>성명</th>
								<th>부서</th>
								<th>직책</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>4대보험</th>
								<th></th>
							</tr>
							</thead>
									<tbody id="resultTbody2">
									</tbody>
						</table>
								<br>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/enterprise/enterpriseInformationManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<button type="button" class="btn btn-primary" id="okok">저장</button>
								</div>
							</div>
						</form>
					</div>
				</section>
		<!-- END MAIN CONTENT -->
		
	</div>
	 <!-- END MAIN PANEL -->
<!-- 기업성과 추가하기 -->
<div class="layer" style="display: none;" id="resultPop">
	<div class="box boxw600" style="height: 490px; margin-top: -245px;">
		<div class="ti">기업 성과 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select style="width: 120px;">
							<option></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:alert('준비중 입니다.');">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
		</div>
			<button type="button" class="btn_close closeBtn">X</button>
	</div>
</div>

<!-- 지적재산권 정보 추가 -->
<div class="layer" style="display: none;" id="businessPop1">
	<form id="jecpFrm" method="post" >
	<div class="box boxw600" style="height: 630px; margin-top: -270px;">
		<div class="ti">지적 재산권 정보 추가하기 </div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>사업명</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptBussNm" name="intltProptBussNm" value=""/>
					</td>
				</tr>
				<tr>
					<th>실적명</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptPerfNm" name="intltProptPerfNm" value=""/>	
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select id="intltProptCd" name="intltProptCd">
							<c:forEach var="propt" items="${propt}" varStatus="status" >
							 	<option value="${propt.commonCd}">${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="regFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonCd}">${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="regNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonCd}" <c:if test="${nation.commonCd=='KOR'}">selected</c:if> >${nation.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>증빙자료번호</th>
					<td>
						<input type="text" style="width: 75%;" id="intltProptRegNo" name="intltProptRegNo" value="" maxlength="20" placeholder="10-1234567-1234"/>
					</td>
				</tr>
				<tr>
					<th>지적재산권 등록 일자 </th>
					<td>
						<input type="text" style="width: 25%;" id="intltProptyDt" name="intltProptyDt" value="" class="date"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" style="width: 75%;" id="remark" name="remark" value=""/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="saveBtn" name="saveBtn">저장하기</button>
				<button type="button" class="closeBtn">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn2">X</button>
		</div>
	</div>
	</form>
</div>


<!-- 기업 사원 정보-->
<div class="layer" style="display: none;" id="EmployeePop1">
	<div class="box boxw600" style="height: 570px; margin-top: -190px;">
		<div class="ti">기업사원 정보 추가하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="entprEmployeeNm" id="entprEmployeeNm" style="width: 75%;" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<input type="text" name="entprEmployeeDept" id="entprEmployeeDept" style="width:75%" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input type="text" name="entprEmployeePosition" id="entprEmployeePosition" style="width:75%" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="entprEmployeeEmail" id="entprEmployeeEmail"  style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="entprEmployeePhone" id="entprEmployeePhone"  style="width:75%" maxlength="11"/>
					</td>
				</tr>
				<tr>
					<th>4대보험</th>
					<td>
						<input type="file" name="fileupload" style="width:75%"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="saveBtn3" name="saveBtn3">저장하기</button>
				<button type="button" class="closeBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn2">X</button>
		</div>
	</div>	
</div>


<!-- 지적재산권 수정하기 -->
<div class="layer" style="display: none;" id="businessPop2">
	<form>
		<input type="hidden" id="upnumber2" name ="upnumber" value="">
		<input type="hidden" id="uptotcnt2" name ="uptotcnt" value="">	
	<div class="box boxw600" style="height: 630px; margin-top: -270px;">
		<div class="ti">지적 재산권 정보 수정하기 </div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>사업명</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptBussNm" name="intltProptBussNm" value=""/>
					</td>
				</tr>
				<tr>
					<th>실적명</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptPerfNm" name="intltProptPerfNm" value=""/>	
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select id="upintltProptCd" name="intltProptCd">
							<c:forEach var="propt" items="${propt}" varStatus="status" >
							 	<option value="${propt.commonCd}" >${propt.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록형태</th>
					<td>
						<select id="upregFormCd" name="regFormCd">
							<c:forEach var="regForm" items="${regForm}" varStatus="status" >
							 	<option value="${regForm.commonCd}" >${regForm.commonNm}</option>
							 </c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>등록국가</th>
					<td>
						<select id="upregNationCd" name="regNationCd">
							<c:forEach var="nation" items="${nationVo}" varStatus="status" >
							 	<option value="${nation.commonCd}" >${nation.commonNm}</option>
						 	</c:forEach>
						 </select>
					</td>
				</tr>
				<tr>
					<th>증빙자료번1호</th>
					<td>
						<input type="text" style="width: 75%;" id="upintltProptRegNo" name="intltProptRegNo" value="" placeholder="10-1234567-1234"/>
					</td>
				</tr>
				<tr>
					<th>지적재산권 등록 일자 </th>
					<td>
						<input type="date" style="width: 75%;" id="upintltProptyDt" name="intltProptyDt" value="" oninput="datecheck1()" max="9999-12-31"/>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<input type="text" style="width: 75%;" id="upremark" name="remark" value=""/>
					</td>
				</tr>
			</table>			
			<div class="submitbtn">
				<button type="button" id="updateBtn2" name="updateBtn2">수정하기</button>
				<button type="button" class="upcloseBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close upcloseBtn2">X</button>
		</div>
	</div>
	</form>
</div>

<!-- 기업사원정보 수정하기 -->
<div class="layer" style="display: none;" id="EmployeePop4">
	<div class="box boxw600" style="height: 570px; margin-top: -190px;">
		<input type="hidden" id="upnumber" name ="upnumber" value="">
		<input type="hidden" id="uptotcnt" name ="uptotcnt" value="">
		<div class="ti">기업사원 정보 수정하기</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="entprEmployeeNm" id="upEntprEmployeeNm" value=""style="width: 75%;" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<input type="text" name="entprEmployeeDept" id="upentprEmployeeDept" value="" style="width:75%" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input type="text" name="entprEmployeePosition" id="upentprEmployeePosition" value=""style="width:75%" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="entprEmployeeEmail" id="upentprEmployeeEmail"  value=""style="width:75%"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="entprEmployeePhone" id="upentprEmployeePhone"  value="" maxlength="11" style="width:75%" />
					</td>
				</tr>
				<tr>
					<th>4대보험</th>
					<td>
						<input type="file" name="upfileupload" id="uporgFileNm"value=""style="width:75%"/>
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="saveBtn4" name="saveBtn4">저장하기</button>
				<button type="button" class="closeBtn4">취소</button>	
			</div>
			<button type="button" class="btn_close closeBtn4">X</button>
		</div>
	</div>	
</div>


<!-- 성과관리 추가 레이어 20191210 -->
<div class="layer" style="display: none;" id="enterpriseResultPop1">
	<div class="box boxw600" style="height: 470px; margin-top: -190px;">
		<input type="hidden" id="uptotcnt" name ="uptotcnt" value="">
		<div class="ti">성과관리 추가</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
						<select name="entprResultYearCd" id="entprResultYearCd">
							<c:forEach var = "YearCd" items="${YearCd}" varStatus="status" >
							 	<option value="${YearCd.commonCd}" >${YearCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="entprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonCd}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalamt" id="entprCapitalamt" value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="entprResultTakeAmt"  value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="entprResultEmpCnt"  value=""style="width:75% "maxlength="3"/>명
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="ERsaveBtn" name="ERsaveBtn">저장하기</button>
				<button type="button" class="ERcloseBtn">취소</button>	
			</div>
			<button type="button" class="btn_close ERcloseBtn">X</button>
		</div>
	</div>	
</div>

<!-- 성과관리 수정 레이어 20191210 -->
<div class="layer" style="display: none;" id="enterpriseResultPop2">
	<div class="box boxw600" style="height: 470px; margin-top: -190px;">
		<input type="hidden" name ="enterpriseIdx" id="upenterpriseIdx" value="">
		<div class="ti">성과관리 수정</div>
		<div class="mgt30">
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>수행년도</th>
					<td>
					<select name="entprResultYearCd" id="upentprResultYearCd">
							<c:forEach var = "YearCd" items="${YearCd}" varStatus="status" >
							 	<option value="${YearCd.commonCd}" >${YearCd.commonNm}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th>분기</th>
					<td>
						<select name="entprResultQtaCd" id="upentprResultQtaCd">
							<c:forEach var = "qtaCd" items="${qtaCd}" varStatus="status" >						
							 	<option value="${qtaCd.commonCd}" >${qtaCd.commonNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>
						<input type="text" name="entprCapitalAmt" id="upentprCapitalAmt" value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>매출액</th>
					<td>
						<input type="text" name="entprResultTakeAmt" id="upentprResultTakeAmt"  value=""style="width:75%"/>원
					</td>
				</tr>
				<tr>
					<th>직원수</th>
					<td>
						<input type="text" name="entprResultEmpCnt" id="upentprResultEmpCnt"  value=""style="width:75%" maxlength="3"/>명
					</td>
				</tr>
			</table>
			
			<div class="submitbtn">
				<button type="button" id="ERsaveBtn2" name="ERsaveBtn2">저장하기</button>
				<button type="button" class="ERcloseBtn2">취소</button>	
			</div>
			<button type="button" class="btn_close ERcloseBtn2">X</button>
		</div>
	</div>	
</div>
<input type="hidden" id="memberId" name="memberId" value="${list.memberId}"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	 
   <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
   <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
   <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
   <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> 


<script type="text/javascript">
	/*셀렉트*/
	function largeBussAreaCdSelectBox(dataOption){
		var selectBoxData = $("#largeBussAreaCd").val();
	    var selectOption = dataOption;
 		$.ajax({
 			type : 'post',
 			url:'/db/selectOnchange.do',
 			data: {
 						"selectBoxData" : selectBoxData
 					},
 			dataType: 'json',
 	 		success: function(data) {
 	 			var htmls = "";
 	 			if(data.length < 1){
 	 			} else {
 	                     $(data.data).each(function(){
 	 	                    htmls +='<option value="' + this.commonCd + '">' + this.commonNm + '</>'; 
 	                 	});	//each end
 	 			};
 	 			//console.log(data.data);
 	 			//alert(htmls);
 	 			$("#mediumBussAreaCd").html(htmls);
	 	 			if(selectOption.length > 0){
	 	 				$('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
	 	 			}
 	            },  
 			error:function(request,status,error){ //ajax 오류인경우  
 				alert("작업중 에러가 발생했습니다.");      
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			} 
 		});
	}
	/*캘린더*/
	  $(document).ready(function dis() {
		  var clareCalendar = {
		   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   dayNamesMin: ['일','월','화','수','목','금','토'],
		   weekHeader: 'Wk',
		   dateFormat: 'yy-mm-dd', //형식(20120303)
		   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
		   changeMonth: true, //월변경가능
		   changeYear: true, //년변경가능
		   showMonthAfterYear: true, //년 뒤에 월 표시
		   buttonImageOnly: false, //이미지표시
		   buttonText: '달력선택', //버튼 텍스트 표시
		   //buttonImage: '../calendar.gif', //이미지주소
		   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
		   yearRange: '1930:2020' //1950년부터 2020년까지
		  };
		  $(".date").datepicker(clareCalendar);
		  
		  //$("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
		  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
		 });
	
/*주소1*/
		
$(document).ready(function () {

					/* 자동시작함수 */
					showCompanyList();		//기업 성과정보 자동으로 불러오기
					showBussList();			//진흥 수혜사업 정보 자동으로 불러오기 
					showJecpList();			//지적재산권 현황 정보 자동으로 불러오기
					showemployeesList(); 	//기업사원 정보 자동으로 불러오기

					/* 대표 이메일 담기 */
					var entprCeoEmailData = '${list.entprCeoEmail}';
					var entprCeoEmail = entprCeoEmailData.split('@');
					$('#entprCeoEmail1').val(entprCeoEmail[0]);
					$('#entprCeoEmail2').val(entprCeoEmail[1]);
					
					/* 담당자 이메일 담기 */
					var entprRespsibEmailData = '${list.entprRespsibEmail}';
					var entprRespsibEmail = entprRespsibEmailData.split('@');
					$('#entprRespsibEmail1').val(entprRespsibEmail[0]);
					$('#entprRespsibEmail2').val(entprRespsibEmail[1]);

					/* 사업분야코드 담기 */
					var largeBussAreaCd = '${list.largeBussAreaCd}';
					var mediumBussAreaCd = '${list.mediumBussAreaCd}';
					$('#largeBussAreaCd').val(largeBussAreaCd);
					largeBussAreaCdSelectBox(mediumBussAreaCd);

					//추가버튼 클릭
					$("#employeeBtn").click(function(){
						$("#EmployeePop1").show();
					});
					//취소버튼 클릭
					$(".closeBtn2").click(function(){
						$("#EmployeePop1").hide();
					});
					//취소버튼 클릭
					$(".closeBtn4").click(function(){
						$("#EmployeePop4").hide();
					});


					//취소버튼 클릭
					$(".closeBtn").click(function(){
						$("#businessPop1").hide();
					});
					//취소버튼 클릭
					$(".btn_close closeBtn2").click(function(){
						$("#businessPop1").hide();
					});
					
					
					//취소버튼 클릭
					$(".upcloseBtn2").click(function(){
						$("#businessPop2").hide();
					});
					//취소버튼 클릭
					$(".btn_close upcloseBtn2").click(function(){
						$("#businessPop2").hide();
					});
					
					
					$("#businessBtn").click(function(){
						$("#businessPop").show();
				 	});
					
					$(".closeBtn").click(function(){
						$("#businessPop").hide();
				 	});
					
					$(".closeBtn2").click(function(){
						$("#businessPop").hide();
				 	});	

					$("#resultBtn1").click(function(){
						$("#businessPop1").show();
				 	});
					
					$(".closeBtn2").click(function(){
						$("#businessPop1").hide();
				 	});

					$("#ERaddBtn").click(function(){
						$("#enterpriseResultPop1").show();
					});
					
					$(".ERcloseBtn").click(function(){
						$("#enterpriseResultPop1").hide();
					});

					$(".ERcloseBtn2").click(function(){
						$("#enterpriseResultPop2").hide();
					});

						$("#okok").click(function(){
							var	 formData = new FormData();
							/*	대표 이메일*/
							var 	entprCeoEmail 		=   $('#entprCeoEmail1').val();
									entprCeoEmail 		+= "@";
									entprCeoEmail 		+= $('#entprCeoEmail2').val();
							var medium_buss_area_cd = $('#mediumBussAreaCd').val();
							formData.append("memberId",'${list.memberId}');
							formData.append("entprNm",$('#entprNm').val());
							formData.append("entprSite",$('#entprSite').val());
							formData.append("entprComRegNum",$('#entprComRegNum').val()); 
							formData.append("largeBussAreaCd",$('#largeBussAreaCd').val());
							formData.append("mediumBussAreaCd",medium_buss_area_cd);
							formData.append("entprCeo",$('#entprCeo').val());
							formData.append("entprCeoEmail",entprCeoEmail);
							formData.append("entprHeadAddr",$('#entprHeadAddr').val());
							formData.append("entprHeadDetailAddr",$('#entprHeadDetailAddr').val());
							formData.append("entprHeadTel",entprHeadTel);
							formData.append("entprBranchAddr",$('#entprBranchAddr').val());
							formData.append("entprBranchDetailAddr",$('#entprBranchDetailAddr').val());
							formData.append("entprBranchTel",entprBranchTel);

							formData.append("entprEstDt",$('#entprEstDt').val());
							formData.append("entprCapitalAmt",$('#entprCapitalAmt').val());
						$.ajax({
								type : 'post',
								url:'/db/mypageCompanyUpdate.do',
								enctype: 'multipart/form-data',
								data: formData,
								contentType:false,
								processData:false,
								dataType: 'json',
								success : function(data) {
									if(data.returnCode == 0 || data.returnCode1 == 0){
										alert("등록을 실패 하였습니다.");
										return;
									}else{
										alert("등록이 완료 되었습니다.");
					                	window.location.href="/db/main.do";
									}
								},  
								error:function(request,status,error){ //ajax 오류인경우  
									alert("작업중 에러가 발생했습니다.");      
									console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						});

});

				
</script>
</body>
</html>