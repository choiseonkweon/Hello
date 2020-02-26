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
				<li>Home</li><li>사업 관리</li><li><b>사업	관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>평가위원 추출</b></h1>
					</div>
				</div>
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" enctype="multipart/form-data" method="POST">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%">
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">제목</th>
												<td colspan="3">
													<span >${result.selectTitle}</span>
												</td>
											</tr>
								
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">분류</th>
												<td>
													<span>
														<c:forEach var="selectClassNm" items="${selectClassNm}" varStatus="status" >
															·${selectClassNm.selectClassCd}&nbsp;&nbsp;
														</c:forEach>
													</span>
												</td>
											</tr>
								
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">평가일</th>
												<td colspan="3">
													<span>${result.evaluationDt}</span>
												</td>
											</tr>
											
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">인원</th>
												<td>
													<span>${result.evaluationCnt}명</span>
												</td>
											</tr>
										</tbody>
									</table>
								
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="5%">
											<col width="85%">
										</colgroup>
										<thead>
											<tr>
												<th style="text-align: center;">전문가 명</th>
												<th style="text-align: center;">참석여부</th>
												<th style="text-align: center;">비고</th>
											</tr>
										</thead>
										<tbody id="resultTbody">
												<c:forEach var="slectEvaluDtlList" items="${slectEvaluDtlList}" varStatus="status">
													<tr>
									              	  	<td style="text-align: center;"><span>${slectEvaluDtlList.expertNm}</span></td>
									              	  	<td style="text-align: center;"><span>${slectEvaluDtlList.attendYn}</span></td>
														<td style="text-align: left;"><span >${slectEvaluDtlList.remark}</span></td>
													</tr>
												</c:forEach>
										</tbody>
									</table>
									<div style="padding-top:5px;padding-bottom:5px;width:99%; text-align: center;">
												<a href="/db/evalu/evaluInformationManagementList.do" class="btn" ><b>목록</b></a>&nbsp;
									</div>

	
						</div>
					</form>
				</div>
			</section>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	 
	<!-- 검색조건 유지 -->
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	
</body>
</html>