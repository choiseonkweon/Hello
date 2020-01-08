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
			$('#questionIdx').val();
			$('#questionTitle').val();
			
			$("#busPop").show();
		});
		$("#closeBtn").click(function(){
			$("#busPop").hide();
		});

		$("#closeBtnX").click(function(){
			$("#busPop").hide();
		});
		$("#bbb").click(function(){
			
			//alert($('#questionIdx').val());
			//alert($('#questionTitle').val());
			
			/* if($('#memberId').val() == ''){
				alert('아이디를 입력하세요.');
				$('#memberId').focus();
				return false;
			}else{
				$.ajax({
					type : 'post',
					url:'/db/member/memberIdChk.do',
					data: {memberId : $('#memberId').val()},
					dataType: 'json',
					success : function(data) {
						if(data.idCnt != 0){
							$("#chkYn").val("N");
							$("#able").hide();
							$("#enable").show();
						}else{
							$("#chkYn").val("Y");
							$("#able").show();
							$("#enable").hide();
						}
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
				return false;
			} */
			 
		});
	});

	

	function moveDetailView(questionIdx, pageNum, questionTitle, writeNm, writeDt) {
		
		//alert("questionIdx :: " + $('#questionIdx').val());
		//alert("questionTitle :: " + $('#questionTitle').val());
		//alert("questionPw :: " + $('#questionPw').val());
		
		$("#busPop").show();
		$('#questionIdx').val(questionIdx);
		$('#questionTitle').val(questionTitle);
		
		if(totcnt != 0){ 
			//alert("Testetetetetet1111111111111");
			$('#questionIdx').val(questionIdx);
			$('#pageNum').val(pageNum);
			$('#questionTitle').val(questionTitle);
			$('#writeNm').val(writeNm);
			$('#writeDt').val(writeDt);
			
			$('#memberDetailFrm').attr('action', "/db/contactUsDetail.do").submit();
		}
		else{
			//alert("Testetetetetet");
			return false;
		}
		 /* alert("pageNum: " + pageNum + "\n" +"memberId : " + memberId ); */
					 
	}
	
	//엔터키 입력시
	function enterKey() {
		if (window.event.keyCode == 13) {
			goSearch();
		}
	}
	
	function goSearch(){
		/* alert("test"); */
		$('#searchFrm').attr('action', "/db/contactUsList.do").submit();
	}
	
	function passwd(questionIdx, questionTitle, questionPw, totcnt){
		$('#questionIdx').val(questionIdx);
		$('#questionTitle').val(questionTitle);
		$('#questionPw').val(questionPw);
		
		//alert("questionIdx passwd :: " + $('#questionIdx').val(questionIdx));
		//alert("questionTitle passwd :: " + $('#questionTitle').val(questionTitle));
		//alert("questionIdx questionPw :: " + $('#questionPw').val(questionPw));
		//alert("totcnt totcnt :: " + $('#totcnt').val(totcnt));
		//alert("tseteset");
		if(totcnt != 0){ 
			//alert("Testetetetetet1111111111111");
			$('#questionIdx').val(questionIdx);
			$('#pageNum').val(pageNum);
			$('#questionTitle').val(questionTitle);
			$('#writeNm').val(writeNm);
			$('#writeDt').val(writeDt);
			
			$('#memberDetailFrm').attr('action', "/db/contactUsDetail.do").submit();
		}
		else{
			//alert("Testetetetetet");
			$('#insertFrm').attr('action', "/db/contactUsDetail.do").submit();
		}
		 /* alert("pageNum: " + pageNum + "\n" +"memberId : " + memberId ); */
			
		$('#insertFrm').attr('action', "/db/contactUsList.do").submit();
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
				<span class="now">문의하기</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">고객광장 - 전남콘텐츠기업육성센터와 함께 기업의 경쟁력을 높이세요.</h2>
			
			
			<div class="cont">
				<h3>문의하기</h3>
				<div class="continner">
					<form role="form" id="searchFrm" action="/frontView/contactUsListSearch.do" class="form-horizontal" method="post">
					
					<div class="publicsch clearfix">
						<div class="ti">문의하기 검색하기</div>
						<div class="sel">
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="1" ${searchVO.writeNm eq 1 ? 'selected="selected"' : '' }>제목</option>
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
						
					<form role="form" id="searchDetail" action="/frontView/companyListSearch.do" class="form-horizontal" method="post">
						<table class="table01 datetable">
							<thead>
								<colgroup>
									<col width="180px" /><col width="*" /><col width="180px" />
								</colgroup>
									<tr>
										<th>No.</th>
										<th>제목</th>
										<th>작성자</th>
										<th>상태</th>
										<th>등록일</th>
									</tr>
							</thead>
							<tbody>
								<c:if test="${paginationInfo.totalRecordCount == 0 }">
									<tr style="text-align:center;">
										<td colspan="5">조회 결과가 없습니다.</td>
									</tr>
								</c:if>	
								<c:if test="${paginationInfo.totalRecordCount > 0 }">
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>
													<c:out value="${result.pageNum}"/>
											</td>
											<td>
												<a href="javascript:moveDetailView('${result.questionIdx}','${result.pageNum}','${result.questionTitle}','${result.writeNm}','${result.writeDt}');">
													<c:out value="${result.questionTitle}"/>
												</a>
											</td>
											<td>
												<a href="javascript:moveDetailView('${result.questionIdx}','${result.pageNum}','${result.questionTitle}','${result.writeNm}','${result.writeDt}');">
													<c:out value="${result.writeNm}"/>
												</a>	
											</td>
											<td><c:out value="${result.answerCont}"/></td>
											<td><c:out value="${result.writeDt}"/></td>
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
						<div class="submitbtn">
							<a href="/db/contactUsDetailAuth.do">
								<button type="button" class="btnlist" style="background-color: blue; position: relative; left: 500px;"><b>등록</b><span></span></button>
							</a>
						</div>
			        </div>
					
				</div>
			
		</div>
	</div>
	</div>
	

<div class="layer" style="display: none;" id="busPop">
	<div class="box boxw600" style="height: 325px; margin-top: -325px;">
		<form role="form" id="insertFrm" name="insertFrm" action="/db/contactUsDetail.do" method="POST" enctype="multipart/form-data">
	    <input type="hidden" name="questionIdx" id="questionIdx" value="${questionIdx}">
	    <input type="hidden" name="writeNm" id="writeNm" value="${writeNm}">
	    <input type="hidden" name="writeDt" id="writeDt" value="${writeDt}">
	    <input type="hidden" name="questionCont" id="questionCont" value="${questionCont}">
	    <input type="hidden" name="answerCont" id="answerCont" value="${answerCont}">
		<%-- 
		<input type="hidden" name="questionTitle" id="questionTitle" value="${result.questionTitle}">
		<input type="hidden" name="questionPw" id="questionPw" value="${result.questionPw}"> --%>
		
		<div class="ti">비밀번호 입력하기</div>
		<div class="">
			<div class="sti">비밀번호</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<%-- <th>번호</th>
					<td>
						<input type="text" id="questionIdx" name="questionIdx" maxlength="100" value='${questionIdx}' style="width:100%">
					</td> --%>
					
					<th>작성자</th>
					<td>
						<input type="text" id="questionTitle" name="questionTitle" maxlength="100" value='${questionTitle}' style="width:100%">
					</td>
					<th>비밀번호</th>
					<td>
						<input type="password" id="questionPw" name="questionPw" maxlength="100" value="${questionPw}" style="width:100%">
					</td>
				</tr>
				
			</table>
			
			
			<div class="submitbtn">
<!-- 				<a href="#" id="createBtn"> -->
					<button type="submit" id="passwd" class="ok" onclick="javascript:passwd('${result.questionIdx}', '${result.questionTitle}', '${result.questionPw}', '${result.totcnt}', '${result.writeNm}');">확인</button>
<!-- 				</a> -->
				<a href="#" id="closeBtn">
					<button type="button">취소</button>	
				</a>

			</div>
			<a href="#" id="closeBtnX">
				<button type="button" class="btn_close">X</button>
			</a>
		</div>
		</form>
	</div>
</div>	
	
	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   	
 	   <input type="hidden" name="pageNumPlus" id="pageNumPlus" value="pageNum-1">
	   <input type="hidden" name="pageNumMinus" id="pageNumMinus" value="pageNum+1">
 
	   <input type="hidden" name="entprNm" id="entprNm" value="">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="pageNum" id="pageNum" value="">
	   
	   <input type="hidden" name="questionIdx" id="questionIdx" value="">
	   <input type="hidden" name="questionTitle" id="questionTitle" value="">
	   <input type="hidden" name="writeNm" id="writeNm" value="">
	   <input type="hidden" name="writeDt" id="writeDt" value="">
	   <input type="hidden" name="questionCont" id="questionCont" value="">
	   <input type="hidden" name="questionPw" id="questionPw" value="">
	   <input type="hidden" name="answerCont" id="answerCont" value="">
	

    </form>
	
	
	
	
</body>
</html>



