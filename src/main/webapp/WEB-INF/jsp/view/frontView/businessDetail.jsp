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
			
			$("#closeBtn").click(function(){
				$("#busPop").hide();
			});

			$("#closeBtnX").click(function(){
				$("#busPop").hide();
			});
			$("select[name=phone1]").val("${phone1}").prop("selected","selected");

				/*
			$("input[type='file']").change(function(e){
				//alert("test");
				var file = e.target.file;
				var all = Array.prototype.slice.cal(file);
				
				for(var i=0;i<file.length;i++){
					if(!checkExtension(fils[i].name,file[i].size)){
						return false;
					}
				}
				
			});
				
			
			
 			$("#createBtn").click(function(){

				if(checkValue()){

					var yn = confirm("신청하시겠습니까?");
					
					if(yn){
						var filesChk = $("input[name='file']").val();
						if(filesChk == ""){
							$("input[name='file']").remove();
						}
				
					alert( $("input[name='file']").val());
					var formData = new FormData();
					//param setting   formData.append("다음페이지에서받을 변수명",값);
 					formData.append("file", $("input[name='file']").val());
					formData.append("bussAnncemntNo",$("#bussAnncemntNo").val());
					formData.append("entprNm",$("#entprNm").val());
					formData.append("entprRespsibNm",$("#entprRespsibNm").val());
					formData.append("phone1",$("#phone1").val());
					formData.append("entprRespsiHpNo2",$("#entprRespsiHpNo2").val());
					formData.append("entprRespsiHpNo3",$("#entprRespsiHpNo3").val());
					formData.append("entprRespsibEmail1",$("#entprRespsibEmail1").val());
					formData.append("entprRespsibEmail2",$("#entprRespsibEmail2").val());
					formData.append("uploadProposal",$("#uploadProposal").val());
					var params = $("#insertFrm").serialize();					
					$.ajax({
						type : 'post',
						url:'/db/businessDetailInsert.do',
						data: params,
//						enctype: 'multipart/form-data',//이거 내가 추가했음
//						dataType: 'json',
//						cache : false,
//						async : true,
						processData:false,
						contentType:false,
						success : function(data) {
							alert("하이?");
 							if(data.returnCode == 0){
			                    alert("등록을 실패 하였습니다.");
			                    return;
			                }else{
			                	alert("등록이 완료 되었습니다.");
								location.reload();
								return false;
			                }
 						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 	});
				} 
			}

			}); */
			
		});

/* 		
		function fileUpload1(){
			alert("넘긴다");
			var formData= $("input[name='file']").val();
			
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "/db/companyFileUpload1.do",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        async: false,
		        success: function (data) {
		        	if(data == "success" ){
				       console.log('업로드가 완료되었습니다.');
			        }
		        	else{
		        		alert("업로드가 실패하였습니다.");
		        	}
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		            alert("업로드가 실패하였습니다.");
		        }
		    });
		}

		function fileUpload2(){
			var formData = new FormData($('#proposalFile')[0]);
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "/db/companyFileUpload2.do",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        async: false,
		        success: function (data) {
		        	if(data == "success"){
				       console.log('업로드가 완료되었습니다.');
			        }
		        	else{
		        		alert("업로드가 실패하였습니다.")
		        	}
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		            alert("업로드가 실패하였습니다.")
		        }
		    });
		}
 */
		function checkValue(){
			var retValue = true;
			
			if($('#entprNm').val() == ""){
				alert("업체(기관)명을  입력하세요.");
				$('#entprNm').focus();
				return;
			}
			
			if($('#entprRespsibNm').val() == ""){
				alert("담당자성명을 입력하세요.");
				$('#entprRespsibNm').focus();
				return;
			}
			
			if($('#entprRespsiHpNo2').val() == ""){
				alert("연락처를 입력하세요.");
				$('#entprRespsiHpNo2').focus();
				return;
			}
			
			if($('#entprRespsibEmail1').val() == ""){
				alert("이메일을 입력하세요.");
				$('#entprRespsibEmail1').focus();
				return;
			}
			return retValue;
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
								<p class="txt1">공고번호 :<c:out value="${detail.bussAnncemntNo}"/></p>
								<p class="txt2"><c:out value="${detail.bussAnncemntNm}"/> ㅣ 전문분야 : <c:out value="${detail.business_bus_area}"/> ㅣ 관심분야: <c:out value="${detail.business_site}"/></p>
								<p class="txt3"><c:out value="${detail.bussFrDt.substring(0,10)}"/> ~ <c:out value="${detail.bussToDt.substring(0,10)}"/></p>
								<c:if test="${joinTypeCd==000001}">
									<button type="button" class="btnjoin" id="busApplyBtn">사업신청<br />바로하기</button>
								</c:if>
							</div>
							<div class="file">${detail.bussCont}</div>
							<div class="viewcont">
								<c:out value="${detail.bussAnncemntNo}"/> ㅣ 전문분야 : <c:out value="${detail.business_bus_area}"/> ㅣ 관심분야: <c:out value="${detail.business_site}"/>
							</div>
							<!-- <ul class="listpn">
								<li>
									<strong>이전글</strong>
									<span>이전글이 존재하지 않습니다.</span>
								</li>
								<li>
									<strong>다음글</strong>
									<a href="#none">다음글이 입니다.</a>
								</li>
							</ul> -->
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
	<div class="box boxw600" style="height: 680px; margin-top: -325px;">
		<form id="insertFrm" name="insertFrm" action="/db/businessDetailInsert.do" method="POST" enctype="multipart/form-data">
	   <input type="hidden" name="bussAnncemntNo" id="bussAnncemntNo" value="${detail.bussAnncemntNo}">
		
		<div class="ti">사업 신청하기</div>
		<div class="">
			<div class="sti">기업정보</div>
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td>
						<input type="text" id="entprNm" name="entprNm" maxlength="100" value="${list1.entprNm}" style="width:100%" readOnly>
					</td>
				</tr>
				<tr>
					<th>담당자성명</th>
					<td>
						<input type="text" id="entprRespsibNm" name="entprRespsibNm" maxlength="100"  value="${list1.entprRespsibNm}" style="width:100%" readOnly/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
						<td>
						<c:if test="${memberId!=null}">
								<select id="phone1" name="phone1" style="width: 80px;">
									<option value="011">011</option>
									<option value="010">010</option>
									<option value="016">016</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
						</c:if>
						<c:if test="${memberId==null}">
							<input type="text" style="width: 70px;" readOnly/>						
						</c:if>							
						<em>-</em>
						<input type="text" style="width: 70px;" id="entprRespsiHpNo2" name="entprRespsiHpNo2"  value="${phone2}" maxlength="4" readOnly/>
						<em>-</em>
						<input type="text" style="width: 70px;" id="entprRespsiHpNo3" name="entprRespsiHpNo3"  value="${phone3}" maxlength="4" readOnly/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="entprRespsibEmail1" name="entprRespsibEmail1" value="${email1}" style="width: 120px;" readOnly/>
						<em>@</em>
						<!-- <select style="width: 195px">
							<option value=""></option>
						</select> -->
						<input type="text" id="entprRespsibEmail2" name="entprRespsibEmail2" value="${email2}"style="width: 120px;" readOnly/>
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
						<input type="file" id="file" name="file" style="width: 100%"/>
					</td>
				</tr>
 				<tr>
					<th>제안서</th>
					<td>
						<input type="file" id="file1" name="file1" style="width: 100%"/>
					</td>
				</tr>
 				<tr>
					<th>비고</th>
					<td>
						<input type="text" id="remark" name="remark" style="width: 100%"/>
					</td>
				</tr>
			</table>
			<div class="submitbtn">
<!-- 				<a href="#" id="createBtn">
						
 -->					
 					<c:if test="${memberId!=null}">	<!--  로그인이 되었을경우 작동가능-->
	 					<button type="submit" class="ok">신청하기</button>
 					</c:if>
 					<c:if test="${memberId==null}">	<!--  로그인이 안되면 작동이 안됨-->
	 					<button type="button" class="ok">신청하기</button>
 					</c:if>
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
	   <input type="hidden" name="bussAnncemntNo" id="bussAnncemntNo" value="${bussAnncemntNo}">
    </form>
	


</body>
</html>