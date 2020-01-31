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
<div id="wrap" class="sub s5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>마이페이지</span>
				<span class="now">시설 및 자원 사용신청현황</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">시설 및 자원 사용신청현황 - 전전남콘텐츠기업육성센터의 시설 및 자원 사용신청 내용을 확인할 수 있습니다.</h2>
			<div class="cont">
				<h3>시설 및 자원 사용신청현황</h3>
				<div class="continner">
					<div class="datelist">
						<div class="clearfix col888">
							총 게시글 : 00,000 건
							<select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select>
						</div>
						<table class="table01 datetable">
							<colgroup>
								<col width="80px" class="mdel" /><col width="13%" /><col width="*" /><col width="13%" /><col width="13%" /><col width="13%" /><col width="13%" />
							</colgroup>
							<tr>
								<th class="mdel">NO</th>
								<th>시설명</th>
								<th>예약일</th>
								<th>냉난방기</th>
								<th>빔프로젝트</th>
								<th>신청일</th>
								<th>상태</th>
							</tr>
							<tr>
								<td class="mdel">
								</td>
								<td>
								
								</td>
								<td>
									 - 
								</td>
								<td>
									사용
								</td>
								<td>
									사용
								</td>
								<td>
									2019-07-05
								</td>
								<td>
									대기
								</td>
							</tr>
						</table>
						<div class="paging">
							<a href="" class="pbtn">prev</a>
							<a href="" class="on">1</a>
							<a href="">2</a>
							<a href="">3</a>
							<a href="">4</a>
							<a href="">5</a>
							<a href="">6</a>
							<a href="">7</a>
							<a href="">8</a>
							<a href="">9</a>
							<a href="">10</a>
							<a href="" class="pbtn">next</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javaScript" >
		$(document).ready(function () {
		});
        
    </script>
</body>
</html>