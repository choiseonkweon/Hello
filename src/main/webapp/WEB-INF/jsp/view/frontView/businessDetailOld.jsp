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
			$("#busApplyBtn").click(function(){
				$("#busPop").show();
			});			
		});
    </script>


<body>
<div id="wrap" class="sub s1">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>사업공고</span>
				<span class="now">사업공고</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">사업공고 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>사업공고</h3>
				<div class="continner">
					<div class="daylist">
						<div class="dview">
							<div class="textw">
								<p class="txt1">공고번호 2019-06-24</p>
								<p class="txt2">ICT Standard Insight[ISI] 에너지 IoT/나주 개최 </p>
								<p class="txt3">기간 : 2019-08-20 ~ 2019-08-25 | 등록일 : 2019-08-25 </p>
								<button type="button" class="btnjoin" id="busApplyBtn">사업신청<br />바로하기</button>
							</div>
							<div class="file">내용</div>
							<div class="viewcont">
								내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							</div>
							<ul class="listpn">
								<li>
									<strong>이전글</strong>
									<span>이전글이 존재하지 않습니다.</span>
								</li>
								<li>
									<strong>다음글</strong>
									<a href="#none">다음글이 입니다.</a>
								</li>
							</ul>
						</div>
						<div class="morew">
							<a href="/db/businessList.do">
								<button type="button" class="btnlist">목록<span></span></button>
							</a>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="layer" style="display: none;" id="busPop">
	<div class="box boxw600" style="height: 650px; margin-top: -325px;">
		<div class="ti">사업 신청하기</div>
		<div class="">
			<div class="sti">기업정보</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td>케이비시스</td>
				</tr>
				<tr>
					<th>담당자성명</th>
					<td>
						<input type="text" style="width: 100%;" />
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select style="width: 95px;">
							<option></option>
						</select>
						<em>-</em>
						<input type="text" style="width: 100px;" />
						<em>-</em>
						<input type="text" style="width: 100px;" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" style="width: 120px;" />
						<em>@</em>
						<select style="width: 195px">
							<option></option>
						</select>
					</td>
				</tr>
			</table>
			<div class="sti">사용자원</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>회사소개서</th>
					<td>
						<input type="file" style="width: 100%" />
					</td>
				</tr>
				<tr>
					<th>제안서</th>
					<td>
						<input type="file" style="width: 100%" />
					</td>
				</tr>
			</table>
			<div class="submitbtn">
				<a href="#" onclick="javascript:alert('준비중 입니다.');">
					<button type="button" class="ok">신청하기</button>
				</a>
				<a href="/db/businessDetail.do">
					<button type="button">취소</button>	
				</a>

			</div>
			<a href="/db/businessDetail.do">
				<button type="button" class="btn_close">X</button>
			</a>
		</div>
	</div>
</div> 

	<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="business_id" id="business_id" value="">
	   <input type="hidden" name="business_nm" id="business_nm" value="">
	   <input type="hidden" name="business_ceo" id="business_ceo" value="">
	   <input type="hidden" name="business_com_reg_num" id="business_com_reg_num" value="">
	   <input type="hidden" name="business_ceo_email" id="business_ceo_email" value="">
	   <input type="hidden" name="business_bus_area" id="business_bus_area" value="">
	   <input type="hidden" name="business_site" id="business_site" value="">
	   <input type="hidden" name="business_head_addr" id="business_head_addr" value="">
	   <input type="hidden" name="business_head_detail_addr" id="business_head_detail_addr" value="">
	   <input type="hidden" name="business_head_tel" id="business_head_tel" value="">
	   <input type="hidden" name="business_head_fax" id="business_head_fax" value="">
	   <input type="hidden" name="business_branch_addr" id="business_branch_addr" value="">
	   <input type="hidden" name="business_branch_detail_addr" id="business_branch_detail_addr" value="">
	   <input type="hidden" name="business_branch_tel" id=business_branch_tel value="">
	   <input type="hidden" name="business_branch_fax" id="business_branch_fax" value="">
	   <input type="hidden" name="business_est_dt" id="business_est_dt" value="">
	   <input type="hidden" name="business_capital" id="business_capital" value="">
	   <input type="hidden" name="business_reg_dt" id="business_reg_dt" value="">
	   <input type="hidden" name="business_reg_id" id="business_reg_id" value="">
	   <input type="hidden" name="business_hist_nm" id="business_hist_nm" value="">
	   <input type="hidden" name="business_hist_spec" id="business_hist_spec" value="">
	   <input type="hidden" name="business_hist_content" id="business_hist_content" value="">
	   <input type="hidden" name="datepicker" id="datepicker" value="">
	   <input type="hidden" name="datepicker1" id="datepicker1" value="">
	   
    </form>
	


</body>
</html>