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

	jQuery(function($){
	    // Frequently Asked Question
	    var article = $('#faq>#faqBody>.article');
	    article.addClass('hide');
	    article.find('#a').hide();
	    article.eq(0).removeClass('hide');
	    article.eq(0).find('#a').show();
	    $('#faq>#faqBody>.article>#q>a').click(function(){
	        var myArticle = $(this).parents('.article:first');
	        if(myArticle.hasClass('hide')){
	            article.addClass('hide').removeClass('show');
	            article.find('#a').slideUp(100);
	            myArticle.removeClass('hide').addClass('show');
	            myArticle.find('#a').slideDown(100);
	        } else {
	            myArticle.removeClass('show').addClass('hide');
	            myArticle.find('#a').slideUp(100);
	        }
	        return false;
	    });
	    $('#faq>#faqHeader>.showAll').click(function(){
	        var hidden = $('#faq>#faqBody>.article.hide').length;
	        if(hidden > 0){
	            article.removeClass('hide').addClass('show');
	            article.find('#a').slideDown(100);
	        } else {
	            article.removeClass('show').addClass('hide');
	            article.find('#a').slideUp(100);
	        }
	    });
	});
	
	/* pagenation*/
	function fn_egov_link_page(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/view/frontView/faqList.do'/>";
		document.listForm.submit();
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
				<span class="now">FAQ</span>
			</div>
		</div>
		
		
		<div class="layout01">
			<h2 class="">고객광장 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			<div class="cont">
				<h3>FAQ</h3>
				<div class="continner">
					<div class="publicsch clearfix">
						<div class="ti">FAQ 검색하기</div>
						<div>
							<select style="width: 120px;">
								<option value="">전체</option>
								<option value="1" >제목</option>
								<option value="2" >내용</option>
							</select>
						</div>
						<div>
							<input type="text" placeholder="검색어를 입력해주세요." style="width: 300px;" />
						</div>
						<button type="button" class="btnSch"></button>
					</div>
					
					<div id="faq" class="datelist">
						<div class="col888">
							총 게시글 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}"  pattern="#,###" />5건
						</div>
						<div class="faqHeader">
					        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
					    </div>
						<!-- <ul class="faqlist" id="faqBody"> -->
						<ul id="faqBody" class="faqlist">
							<li class="article" id="a1">
								<p id="q" class="faqq">
									<a href="#a1">사업 선정은 어떤 과정을 통해 선발되는 건가요?</a>
								</p>
								<p id="a" class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</p>
							</li>
							<li class="article" id="a2">
								<p id="q" class="faqq">
									<a href="#a2">사업 선정은 어떤 과정을 통해 선발되는 건가요?</a>
								</p>
								<p id="a" class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</p>
							</li>
							<li class="article" id="a3">
								<p id="q" class="faqq">
									<a href="#a3">사업 선정은 어떤 과정을 통해 선발되는 건가요?</a>
								</p>
								<p id="a" class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</p>
							</li>
							<li class="article" id="a4">
								<p id="q" class="faqq">
									<a href="#a4">사업 선정은 어떤 과정을 통해 선발되는 건가요?</a>
								</p>
								<p id="a" class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</p>
							</li>
							<li class="article" id="a4">
								<p id="q" class="faqq">
									<a href="#a4">사업 선정은 어떤 과정을 통해 선발되는 건가요?</a>
								</p>
								<p id="a" class="faqa">
									(재)전남정보문화산업진흥원에서는 전남지역 문화 콘텐츠산업 육성을 위해 우수한 사업 아이디어나 기술력을 갖춘 창업기업을 아래와 같이 모집합니다.
									이때 사업에게 필요로 하는 필요항목은 다음과 같습니다.
								</p>
							</li>
						</ul>
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
	</div>
</body>
</html>