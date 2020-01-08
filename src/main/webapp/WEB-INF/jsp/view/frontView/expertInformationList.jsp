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
					$("#expertPop").show();
			 });
			 
			 $(".closeBtn").click(function(){
					$("#expertPop").hide();
			 });
		});

		function goSearch(){
			$('#searchFrm').attr('action', "/db/expertInformationList.do").submit();
		}
		
		function fn_ViewDetails(expertNm,expertHeadAddrNm,expertDptmNm,expertOffiDutyNm,largeSpecialAreaCd,expertInterestAreaCd,expertDelibrDt,detailSpecialAreaCd,expertDetailIntrtAreaCd,expertDelibrTitle){
			//alert("test");
			$('#expert_nm').text(expertNm);
			$('#expert_head_addr_nm').text(expertHeadAddrNm);
			$('#expert_dptm_nm').text(expertDptmNm);
			$('#expert_offi_duty_nm').text(expertOffiDutyNm);
			$('#large_special_area_cd').text(largeSpecialAreaCd); 
			$('#expert_interest_area_cd').text(expertInterestAreaCd);
			$('#expert_delibr_dt').html(expertDelibrDt);
			$('#detail_special_area_cd').text(detailSpecialAreaCd);
			$('#expert_detail_intrt_area_cd').text(expertDetailIntrtAreaCd);
			$('#expert_delibr_title').html(expertDelibrTitle);
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
				<span class="now">전문가 정보</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">전문가 정보 - 전남콘텐츠기업육성센터에서 활동하고 있는 기업정보를 확인해보세요.</h2>
			<div class="cont">
				<h3>전문가 정보</h3>
				<div class="continner">
					
				<form role="form" id="searchFrm" class="form-horizontal" method="post">
					<div class="publicsch clearfix">
						<div class="ti">전문가 정보 검색하기</div>
						<div class="sel">
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="1" ${searchVO.title eq 1 ? 'selected="selected"' : '' }>이름</option>
								<option value="2" ${searchVO.field eq 2 ? 'selected="selected"' : '' }>이메일</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" placeholder="검색어를 입력해주세요." name="searchText" id="searchText" style="width: 300px;" />
						</div>
						<button type="button" class="btnSch" name="searchText" id="searchText" value="${searchVO.searchText}" onclick="javascript:goSearch();"></button>
					</div>
				</form>	

					<div class="namelist">
						<div class="col888"><fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" /> 건</div>
						<c:forEach var="result" items="${resultList}" varStatus="status">
						<ul>
							<li>
								<div class="textw">
									<p><strong><c:out value="${result.expertNm}"/></strong></p>
									<p>소속: <c:out value="${result.expertHeadAddrNm}"/> ㅣ 전문분야 : <c:out value="${result.largeSpecialAreaCd}"/> ㅣ 관심분야: <c:out value="${result.expertInterestAreaCd}"/></p>
								</div>
								<a href="javascript:fn_ViewDetails('${result.expertNm}','${result.expertHeadAddrNm}','${result.expertDptmNm}','${result.expertOffiDutyNm}','${result.largeSpecialAreaCd}','${result.expertInterestAreaCd}','${result.expertDelibrDt}','${result.detailSpecialAreaCd}','${result.expertDetailIntrtAreaCd}','${result.expertDelibrTitle}');" class="nview">상세보기</a>
								<!-- <a href="#none" class="nview">상세보기</a> -->
							</li>
						</ul>
						<!-- <div class="morew">
							<button type="button" class="btnmore">더보기<span></span></button>
						</div>
					-->
					</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<div class="layer" style="display: none;" id="expertPop">
	<div class="box boxw600" style="height: 550px; margin-top: -280px;">
		<div class="ti">전문가 정보</div>
		<div class="">
			
			<div class="sti"></div>
			<table class="table01 namet" id="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>이름</th>
					<td class="change_greeting"><span id="expert_nm"></span></td>
				</tr>
				<tr>
					<th>소속기관</th>
					<td class="change_greeting1"><span id="expert_head_addr_nm"></span></td>
				</tr>
				<tr>
					<th>해당부서</th>
					<td class="change_greeting2"><span id="expert_dptm_nm"></span></td>
				</tr>
				<tr>
					<th>직책</th>
					<td class="change_greeting3"><span id="expert_offi_duty_nm"></span></td>
				</tr>
				<tr>
					<th>전문분야</th>
					<td class="change_greeting4"><span id="large_special_area_cd"></span>><span id="detail_special_area_cd"></span></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td class="change_greeting6"><span id="expert_interest_area_cd"></span>><span id="expert_detail_intrt_area_cd"></span></td>
				</tr>
				<tr>
					<th>심의(자문,평가등)이력</th>
					<td class="change_greeting8"><span id="expert_delibr_dt"></span><span id="expert_delibr_title"></span>
					</td>
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
	   <input type="hidden" name="expertNm" id="expertNm" value="">
	   <input type="hidden" name="expert_ceo" id="expert_ceo" value="">
	   <input type="hidden" name="expert_com_reg_num" id="expert_com_reg_num" value="">
	   <input type="hidden" name="expert_ceo_email" id="expert_ceo_email" value="">
	   <input type="hidden" name="expert_bus_area" id="expert_bus_area" value="">
	   <input type="hidden" name="expert_site" id="expert_site" value="">
	   <input type="hidden" name="expert_head_addr" id="expert_head_addr" value="">
	   <input type="hidden" name="expert_head_detail_addr" id="expert_head_detail_addr" value="">
	   <input type="hidden" name="expert_head_tel" id="expert_head_tel" value="">
	   <input type="hidden" name="expert_head_fax" id="expert_head_fax" value="">
	   <input type="hidden" name="expert_branch_addr" id="expert_branch_addr" value="">
	   <input type="hidden" name="expert_branch_detail_addr" id="expert_branch_detail_addr" value="">
	   <input type="hidden" name="expert_branch_tel" id=expert_branch_tel value="">
	   <input type="hidden" name="expert_branch_fax" id="expert_branch_fax" value="">
	   <input type="hidden" name="expert_est_dt" id="expert_est_dt" value="">
	   <input type="hidden" name="expert_capital" id="expert_capital" value="">
	   <input type="hidden" name="expert_reg_dt" id="expert_reg_dt" value="">
	   <input type="hidden" name="expert_reg_id" id="expert_reg_id" value="">
	   <input type="hidden" name="expert_hist_nm" id="expert_hist_nm" value="">
	   <input type="hidden" name="expert_hist_spec" id="expert_hist_spec" value="">
	   <input type="hidden" name="expert_hist_content" id="expert_hist_content" value="">
	   
	   
	   <input type="hidden" name="expertEmail" id="expertEmail" value="">
	   <input type="hidden" name="expertGender" id="expertGender" value="">
	   <input type="hidden" name="expertCareerNum" id="expertCareerNum" value="">
	   <input type="hidden" name="largeSpecialAreaCd" id="largeSpecialAreaCd" value="">
	   <input type="hidden" name="mediumSpecialAreaCd" id="mediumSpecialAreaCd" value="">
	   <input type="hidden" name="detailSpecialAreaCd" id="detailSpecialAreaCd" value="">
	   <input type="hidden" name="expertInterestAreaCd" id="expertInterestAreaCd" value="">
	   <input type="hidden" name="expertDetailIntrtAreaCd" id="expertDetailIntrtAreaCd" value="">
	   <input type="hidden" name="expertIndsEduCd" id="expertIndsEduCd" value="">
	   <input type="hidden" name="expertStRegNo" id="expertStRegNo" value="">
	   <input type="hidden" name="expertFinalSchoolNm" id="expertFinalSchoolNm" value="">
	   <input type="hidden" name="expertMajorNm" id="expertMajorNm" value="">
	   <input type="hidden" name="expertFnalEduNm" id="expertFnalEduNm" value="">
	   <input type="hidden" name="expertHeadAddrNm" id="expertHeadAddrNm" value="">
	   <input type="hidden" name="expertDptmNm" id="expertDptmNm" value="">
	   <input type="hidden" name="expertOffiDutyNm" id="expertOffiDutyNm" value="">
	   <input type="hidden" name="expertOffiAddr" id="expertOffiAddr" value="">
	   <input type="hidden" name="expertOffiDetailAddr" id="expertOffiDetailAddr" value="">
	   <input type="hidden" name="expertOffiTel" id="expertOffiTel" value="">
	   <input type="hidden" name="expertOffiFax" id="expertOffiFax" value="">
	   <input type="hidden" name="expertHeadTel" id="expertHeadTel" value="">
	   <input type="hidden" name="expertHomeAddr" id="expertHomeAddr" value="">
	   <input type="hidden" name="expertHomeDetailAddr" id="expertHomeDetailAddr" value="">
	   <input type="hidden" name="benefitBankCd" id="benefitBankCd" value="">
	   <input type="hidden" name="benefitAccntNo" id="benefitAccntNo" value="">
	   <input type="hidden" name="benefitBirthDt" id="benefitBirthDt" value="">
	   <input type="hidden" name="benefitRespsibHpBno" id="benefitRespsibHpBno" value="">
	   <input type="hidden" name="fileCourse" id="fileCourse" value="">
	   <input type="hidden" name="orgFileNm" id="orgFileNm" value="">
	   <input type="hidden" name="uploadFileNm" id="uploadFileNm" value="">
	   
    </form>
    

</body>
</html>


