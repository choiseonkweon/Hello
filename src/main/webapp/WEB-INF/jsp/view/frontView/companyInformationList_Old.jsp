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
<div id="wrap" class="sub s1">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>기업정보</span>
				<span class="now">기업정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">기업정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>기업정보</h3>
				<div class="continner">
					<div class="publicsch clearfix">
						<div class="ti">기업정보 검색하기</div>
						<div class="sel">
							<select style="width: 120px;">
								<option>전체</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" placeholder="검색어를 입력해주세요." style="width: 300px;" />
						</div>
						<button type="button" class="btnSch"></button>
					</div>
					<div class="datelist">
						<div class="clearfix col888">
							총 게시글 : 00,000 건
							<select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select>
						</div>
						<table class="table01 datetable">
							<colgroup>
								<col width="10%" class="mdel" /><col width="*" /><col width="20%" /><col width="20%" />
							</colgroup>
							<tr>
								<th class="mdel">NO</th>
								<th>제목</th>
								<th>분야</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td class="mdel">
									000
								</td>
								<td class="tit">
									<a href="/db/companyInformationDetail.do">
										주식회사 케이비시스(kb-sys)
									</a>
								</td>
								<td>
									모바일컨텐츠
								</td>
								<td>
									2019-07-04
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