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
			
			 $(".nview").click(function(){
					$("#buyerPop").show();
			 });	
			 
			 $(".closeBtn").click(function(){
					$("#buyerPop").hide();
			 });
			 
		});
		
		function goSearch(){
			//alert("test");
			$('#searchFrm').attr('action', "/db/buyerInformationList.do").submit();
		}
		
		function fn_ViewDetails(buyerNm,buyerBusAreaCd,buyerCeo,buyerCeo_emai,buyerHistNm,buyerHistSpecCd,buyerHistContent){
			//alert("test");
			
			$('#buyerNm').val(buyerNm);
			$('#buyerCeo').val(buyerCeo);
			$('#buyerBusAreaCd').val(buyerBusAreaCd);
			$('#buyerCeo_emai').val(buyerCeo_emai);
			$('#buyerHistNm').val(buyerHistNm); 
			$('#buyerHistSpecCd').val(buyerHistSpecCd);
			$('#buyerHistContent').val(buyerHistContent);
			$('#buyerHistNm').val(buyerHistNm);
			
			$('.change_greeting').html(buyerNm);
			$('.change_greeting2').html(buyerBusAreaCd);
			$('.change_greeting1').html(buyerCeo);
			$('.change_greeting3').html(buyerCeo_emai);
			$('.change_greeting4').html(buyerHistNm, buyerHistSpecCd, buyerHistContent);
			$('.change_greeting5').html(buyerHistSpecCd);
			$('.change_greeting6').html(buyerHistContent);
			$('.change_greeting7').html(buyerHistNm);
			
		}
		

		function plusFun(){
			alert("test");
			var plusUI = document.createElement('ul');
			plusUI.innerHTML = "<li>추가</li>";
			document.getElementById('dlist').appendChild(plusUI);
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
				<span class="now">바이어 정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">바이어 정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 바이어 정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>바이어 정보</h3>
				<div class="continner">
					
					<form role="form" id="searchFrm" class="form-horizontal" method="post">
					<div class="publicsch clearfix">
						<div class="ti">바이어 정보 검색하기</div>
						<div class="sel">
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="1" ${searchVO.title eq 1 ? 'selected="selected"' : '' }>업체명</option>
								<option value="2" ${searchVO.field eq 2 ? 'selected="selected"' : '' }>분야</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" placeholder="검색어를 입력해주세요." name="searchText" id="searchText" style="width: 300px;" />
						</div>
						<button type="button" class="btnSch" name="searchText" id="searchText" value="${searchVO.searchText}" onclick="javascript:goSearch();"></button>
					</div>
					</form>
					
					<div class="namelist">
					
					<div class="col888">총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" /> 건</div>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<ul>
							<li>
								<div class="textw">
									<p><strong><c:out value="${result.buyerNm}"/></strong></p>
									<p>관심분야: <c:out value="${result.buyerBusAreaCd}"/> ㅣ 홈페이지 : <c:out value="${result.buyerCeoEmail}"/>
								</div>
								<a href="javascript:fn_ViewDetails('${result.buyerNm}','${result.buyerBusAreaCd}','${result.buyerCeo}','${result.buyerCeoEmail}','${result.buyerHistNm}','${result.buyerHistSpecCd}','${result.buyerHistContent}','${result.buyerHistNm}');" class="nview">상세보기</a>
								<!-- <a href="javascript:;" class="nview">상세보기</a> -->
							</li>
						</ul>
						<!-- <div class="morew">
							<button type="button" class="btnmore" onclick="plusFun();">더보기<span></span></button>
							<hr>
								<a id="more_btn_a" href="javascript:moreContent('more_list', 10);" >
									더보기(More)
								</a>
							<hr>

						</div> -->
						
						
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<div class="layer" style="display: none;" id="buyerPop">
	<div class="box boxw600" style="height: 550px; margin-top: -280px;">
		<div class="ti">바이어정보</div>
		<div class="">
			<div class="sti">기본자원</div>
			<table class="table01 namet" id="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>소속기관</th>
					<td class="change_greeting"></td>
				</tr>
				<tr>
					<th>대표자</th>
					<td class="change_greeting1"></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td class="change_greeting2"></td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td class="change_greeting3"></td>
				</tr>
			</table>
			<div class="sti">히스토리</div>
			<table class="table01 namet">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>투자 이력</th>
					<td class="change_greeting4"></td>
				</tr>
			</table>
			<div class="submitbtn">
				<button type="button" class="ok closeBtn">확인</button>

			</div>
			<button type="button" class="btn_close closeBtn">X</button>
			
		</div>
	</div>
</div>

	<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="buyerNm" id="buyerNm" value="">
	   <input type="hidden" name="buyerCeo" id="buyerCeo" value="">
	   <input type="hidden" name="buyerComRegNum" id="buyerComRegNum" value="">
	   <input type="hidden" name="buyerCeoEmail" id="buyerCeoEmail" value="">
	   <input type="hidden" name="buyerBusAreaCd" id="buyerBusAreaCd" value="">
	   <input type="hidden" name="buyerSite" id="buyerSite" value="">
	   <input type="hidden" name="buyerHeadAddr" id="buyerHeadAddr" value="">
	   <input type="hidden" name="buyerHeadDetailAddr" id="buyerHeadDetailAddr" value="">
	   <input type="hidden" name="buyerHeadTel" id="buyerHeadTel" value="">
	   <input type="hidden" name="buyerHeadFax" id="buyerHeadFax" value="">
	   <input type="hidden" name="buyerBranchAddr" id="buyerBranchAddr" value="">
	   <input type="hidden" name="buyerBranchDetailAddr" id="buyerBranchDetailAddr" value="">
	   <input type="hidden" name="buyerBranchTel" id=buyerBranchTel value="">
	   <input type="hidden" name="buyerBranchFax" id="buyerBranchFax" value="">
	   <input type="hidden" name="buyerEstDt" id="buyerEstDt" value="">
	   <input type="hidden" name="buyerCapital" id="buyerCapital" value="">
	   <input type="hidden" name="buyerRegDt" id="buyerRegDt" value="">
	   <input type="hidden" name="buyerRegId" id="buyerRegId" value="">
	   <input type="hidden" name="buyerHistNm" id="buyerHistNm" value="">
	   <input type="hidden" name="buyerHistSpecCd" id="buyerHistSpecCd" value="">
	   <input type="hidden" name="buyerHistContent" id="buyerHistContent" value="">
    </form>

	
</body>
</html>