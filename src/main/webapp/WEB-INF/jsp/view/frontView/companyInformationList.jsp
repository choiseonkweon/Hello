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
			$('.boardTitle').on('click',function(){
				/* alert("Testetetet :: " + $(this).children().eq(0).text() ); */
				var url = "/db/companyInformationDetail.do?sno="+$(this).children().eq(0).text(); //팝업창에 출력될 페이지 URL
				location.href = url;
			});
			
			$("#detailView").click(function(){
				/* alert("testetet"); */
			});
			
		});
		
		function moveDetailView(memberId, pageNum) {
			
			$('#memberId').val(memberId);
			$('#pageNum').val(pageNum);
 			 /* alert("pageNum: " + pageNum + "\n" +"memberId : " + memberId ); */
			
			$('#memberDetailFrm').attr('action', "/db/companyInformationDetail.do").submit();
			
		}

		
		
		/* pagenation*/
		function fn_egov_link_page(pageNo){
			document.listForm.pageIndex.value = pageNo;
			document.listForm.action = "<c:url value='/companyInformationList.do'/>";
			document.listForm.submit();
		}
		//엔터키 입력시 
		function enterKey() {
			alert('누르기전');
			if (window.event.keyCode == 13) {
				alert('누르기후');
				goSearch();
			}
		}
		
		function goSearch(){
			/* alert("test"); */
			$('#searchFrm').attr('action', "/db/companyInformationList.do").submit();
		}
		
    </script>
<body>
<div id="wrap" class="sub s1">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>시장정보</span>
				<span class="now">기업정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">기업정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>기업정보</h3>
				<div class="continner">
					<form role="form" id="searchFrm" class="form-horizontal" method="post">
					
					<div class="publicsch clearfix">
						<div class="ti">기업정보 검색하기</div>
						<div class="sel">
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="1" ${searchVO.entprNm eq 1 ? 'selected="selected"' : '' }>제목</option>
								<option value="2" ${searchVO.largeBussAreaCd eq 2 ? 'selected="selected"' : '' }>분야</option>
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
							<select class="floatR" style="width: 150px;">
								<option>자문접수</option>
							</select>
						</div>
						
					<form role="form" id="searchDetail"  class="form-horizontal" method="post">
						<table class="table01 datetable">
								<colgroup>
									<col width="180px" /><col width="*" /><col width="180px" />
								</colgroup>
							<thead>
									<tr>
										<th>No.</th>
										<th>기업</th>
										<th>분야</th>
										<th>등록일</th>
									</tr>
							</thead>
							<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="4">조1 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount > 0 }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
													<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
											<td>
												<a href="javascript:moveDetailView('${result.memberId}','${result.pageNum}');">
													<c:out value="${result.entprNm}"/>
												</a>
											</td>
											<td><c:out value="${result.largeBussAreaCd}"/></td>
											<td><c:out value="${result.entprEstDt}"/></td>
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
	   <input type="hidden" name="title" id="title" value="">
	   <input type="hidden" name="titleminus" id="titleminus" value="">
	   <input type="hidden" name="titleplus" id="titleplus" value="">
	   <input type="hidden" name="companyname" id="companyname" value="">
	   <input type="hidden" name="dateInserted" id="dateInserted" value="">
	   <input type="hidden" name="mainphone" id="mainphone" value="">
	   <input type="hidden" name="address" id="address" value="">
	   <input type="hidden" name="touchmoney" id="touchmoney" value="">
	   <input type="hidden" name="capital" id="capital" value="">
	   <input type="hidden" name="employees" id="employees" value="">
	   <input type="hidden" name="establishmentdate" id="establishmentdate" value="">

	<!-- 20191114 최선권 히든 수정-->
<!-- 	   <input type="hidden" name="snominus" id="snominus" value="sno-1">-->
<!-- 	   <input type="hidden" name="snoplus" id="snoplus" value="sno+1"> -->
 	   <input type="hidden" name="pageNumPlus" id="pageNumPlus" value="pageNum-1">
	   <input type="hidden" name="pageNumMinus" id="pageNumMinus" value="pageNum+1">
 
	<!-- 20191114 최선권 히든 추가-->
	   <input type="hidden" name="entprNm" id="entprNm" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="pageNum" id="pageNum" value="">

    </form>


</body>
</html>




