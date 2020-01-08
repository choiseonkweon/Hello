<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<script type="text/javaScript" >
	
	$(document).ready(function () {
	
	});

	function moveDetailView(noticeTitle, noticeIdx,pageNum){
		//alert("test");
		
		$('#noticeTitle').val(noticeTitle);
		$('#noticeIdx').val(noticeIdx);
		$('#pageNum').val(pageNum);
		alert(pageNum);
		$('#memberDetailFrm').attr('action', "/db/noticeDetail.do").submit();
	}
	
	//다음글 / 이전글을 눌렀을경우 해당값을 가져와서 넘긴다.
	function moveDetailViewPaging(noticeTitle, pageNum) {
		//alert("tset");
		$('#noticeTitle').val(noticeTitle);
		$('#pageNum').val(pageNum);
		//alert("memberId : " + memberId + "\n" + "pageNum : " + pageNum);
		
		$('#memberDetailFrm').attr('action', "/db/noticeDetailpaging.do").submit();
		
	}
	

	function moveDetailViewPlus(sno,title,snominus,snoplus) {
		
		$('#sno').val(sno);
		$('#title').val(title);
		$('#snoplus').val(sno+1);
		$('#snominus').val(sno-1);
		/* alert(sno);
		alert(title);
		alert(snominus);
		alert(snoplus); */
		
		$('#memberDetailFrm').attr('action', "/db/companyInformationDetailPlus.do").submit();
		
	}
	

	function goSearch(){
		/* alert("test"); */
		$('#searchFrm').attr('action', "/db/noticeList.do").submit();
	}

	
      
</script>

<body>

<div id="wrap" class="sub s4">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>고객광장</span>
				<span class="now">공지사항</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">고객광장 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>공지사항</h3>
				<div class="continner">
					<form role="form" id="searchFrm" class="form-horizontal" method="post">
					
					<div class="publicsch clearfix">
						<div class="ti">공지사항 검색하기</div>
						<div class="sel">
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="1" ${searchVO.noticeTitle eq 1 ? 'selected="selected"' : '' }>제목</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력해주세요." style="width: 300px;" />
						</div>
						<button type="button" class="btnSch" name="searchText" id="searchText" value="${searchVO.searchText}" onclick="javascript:goSearch();"></button>
					</div>
										
				</form>	
					
			</div>
			
					<div class="datelist">
						<div class="clearfix col888">
							총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" />건
							<!-- <select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select> -->
						</div>
						
					<form role="form" id="searchDetail" action="/frontView/companyListSearch.do" class="form-horizontal" method="post">
						<table class="table01 datetable">
								<colgroup>
									<col width="180px" /><col width="*" /><col width="180px" />
								</colgroup>
							<thead>
									<tr>
										<th>No.</th>
										<th>제목1</th>
										<th>등록일</th>
									</tr>
							</thead>
							<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="4">조회 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount ne 0 }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>
													<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
											</td>
											<td>
												<a href="javascript:moveDetailView('${result.noticeTitle}','${result.noticeIdx}', '${result.pageNum}');">
													<c:out value="${result.noticeTitle}"/>
												</a>
											</td>
											<td><c:out value="${result.regDt}"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody> 
						</table>
						</form>
					<br/>
						<c:if test="${paginationInfo.totalRecordCount ne 0 }">
						<center>
							<div id="paging">
								<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
					        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					        		<form:hidden path="pageIndex" />
					        	</form:form>	
				        	</div>
				        	</center>
			        	</c:if> 
			        </div>
					
				</div>
			</div>
		
		
	</div>
</div>


	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="sno" id="sno" value="">
	   <input type="hidden" name="snominus" id="snominus" value="<c:out value="${detail.sno-1}"/>">
	   <input type="hidden" name="snoplus" id="snoplus" value="<c:out value="${detail.sno+1}"/>">
	   <input type="hidden" name="title" id="title" value="<c:out value="${detail.titleminus}"/>">
	   <input type="hidden" name="titleminus" id="titleminus" value="<c:out value="${detail.titleplus}"/>">
	   <input type="hidden" name="titleplus" id="titleplus" value="">
	   <input type="hidden" name="companyname" id="companyname" value="">
	   <input type="hidden" name="dateInserted" id="dateInserted" value="">
	   <input type="hidden" name="mainphone" id="mainphone" value="">
	   <input type="hidden" name="address" id="address" value="">
	   <input type="hidden" name="touchmoney" id="touchmoney" value="">
	   <input type="hidden" name="capital" id="capital" value="">
	   <input type="hidden" name="employees" id="employees" value="">
	   <input type="hidden" name="establishmentdate" id="establishmentdate" value="">


	   <input type="hidden" name="pageNum" id="pageNum" value="">
	   <input type="hidden" name="noticeIdx" id="noticeIdx" value="">
	   <input type="hidden" name="noticeTitle" id="noticeTitle" value="">
	   
	   
    </form>

</body>
</html>

