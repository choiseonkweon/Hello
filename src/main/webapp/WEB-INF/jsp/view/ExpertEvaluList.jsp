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
					<span id="selectTitle1"></span>
				</td>
			</tr>

			<tr>
				<th style="text-align:center;background:#eee;vertical-align:middle;">분류</th>
				<td>
					<span id="selectClassCd1">
						<c:forEach var="selectClassNm" items="${selectClassNm}" varStatus="status" >
							·${selectClassNm.commonNm}&nbsp;&nbsp;
						</c:forEach>
					</span>
				</td>
			</tr>

			<tr>
				<th style="text-align:center;background:#eee;vertical-align:middle;">평가일</th>
				<td colspan="3">

					<span id="evaluationDt1"></span>
				</td>
			</tr>
			
			<tr>
				<th style="text-align:center;background:#eee;vertical-align:middle;">인원</th>
				<td>
					<span id="evaluationCnt1"> 명</span>
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
				<th>전문가 명</th>
				<th>참석여부</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody id="resultTbody">
				<c:forEach var="expert" items="${expert}" varStatus="status">
					<tr value="<c:out value='${expert.memberId}'/>">
	              	  	<td><span>${expert.expertNm}</span></td>
	              	  	<td>
		               	  	<select name="attendYn" id="attendYn">
		                	  	<option value="N">불참</option>
		                	  	<option value="Y">참석</option>
	                	  	</select>
						</td>
						<td><input type='text' id="remark" name="remark" style="width:100%"/></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
</body>
</html>