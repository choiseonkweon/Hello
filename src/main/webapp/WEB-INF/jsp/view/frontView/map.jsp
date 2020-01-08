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
	<jsp:include page="menu.jsp"></jsp:include>
<div id="wrap" class="sub s4">
<jsp:include page="menu.jsp"></jsp:include>	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>고객광장</span>
				<span class="now">오시는 길</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">고객광장 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>오시는 길</h3>
				<div class="continner">
					<div class="sub_con">

					 	<div class="map">
 				      <img src="../css/img/map_img.png" style="width:100%; border:1px solid #ddd;">
 				    </div>

					   <dl class="map_dl">
					     <dt>전남콘텐츠기업육성센터</dt>
					     <dd>
					       <span class="tit">주소</span> : 전라남도 나주시 우정로 10 전남콘텐츠기업육성센터 (우)58322 <br> (구주소: 빛가람동 186-1) <span class="space">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <br><br>
					       <span class="tit">전화</span> : 061-339-6994
					     </dd>
					   </dl>

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