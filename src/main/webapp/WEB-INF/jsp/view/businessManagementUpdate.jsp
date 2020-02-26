<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	.fileDiv1 {
	width: 70%; line-height:28px; padding-left:10px;  height:100%; border-right: 1px solid black; float: left;
	}
	.fileDiv2 {
	width: 15%;  line-height:28px; height:100%;border-right: 1px solid black; float: left; text-align: center;
	}
	.fileDiv3 {
	 width: 13%; line-height:28px; height:100%;float: left; text-align: center;
	}
	.fileSpan1{
	width: 70%; line-height:28px; padding-left:10px;  height:25px; float: left;
	}
	.fileSpan2{
	width: 15%; line-height:28px; height:25px; float: left; text-align: right;
	}
	.fileSpan3{
	width: 15%; line-height:28px; height:25px; float: left; text-align: center;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">
 
		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사업 관리</li><li><b>사업 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업 수정</b></h1>
					</div>
				</div>
			
	<!--  정보 수정 form -->
	<form id="updateFrm" name="updateFrm" enctype="multipart/form-data" method="POST">	
				<section id="widget-grid" class="">
					<div class="well well-sm">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업명 * </th>
											<td colspan="3">
												<label class="input" style="width: 100%;">
													<input type="text" id="bussAnncemntNm" name="bussAnncemntNm" class="input-sm" value="${result.bussAnncemntNm}" style="width:50%;" maxlength="29">&nbsp;&nbsp;
													<input  type="checkbox" name="bussDiviCd" id="bussDiviCd" value="Y" >&nbsp;
													<span> 진흥원수혜사업</span>
												</label>
												
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업기간 * </th>
											<td colspan="3">
												<label class="input"> 
													<input class="input-sm" type="text" name="bussFrDt" id="bussFrDt" readOnly value="${result.bussFrDt}"/>
													<!-- <i class="icon-append fa fa-calendar"></i> -->
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
													<input class="input-sm" type="text" name="bussToDt" id="bussToDt" readOnly value="${result.bussToDt}"/>
													<!-- <i class="icon-append fa fa-calendar"></i> -->
												</label>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업비용 *</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="bussCostAmt" name="bussCostAmt" class="input-sm" style="width:100%;" value="${result.bussCostAmt}" maxlength="12" onkeyup="inputNumberFormat(this)">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">사업부서 *</th>
											<td>
												<select id="bussDeptCd" name="bussDeptCd" >
													<c:forEach var="bussDeptCd" items="${bussDeptCd}" varStatus="status" >
													 	<option value="${bussDeptCd.commonCd}">${bussDeptCd.commonNm}</option>
													 </c:forEach>
												</select>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">공고번호 *</th>
											<td>
													<span>${result.bussAnncemntNo}</span>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">원문Url</th>
											<td>
												<label class="input" style="width: 100%;">
													<input type="text" id="originalUrl" name="originalUrl" class="input-sm" value="${result.originalUrl}" style="width:100%;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">첨부파일</th>
											<td colspan="3">
												<a href="#" id="fileboxBtn1" class=" btn-default" style="display: block;float: left">▽</a>
												<a href="#" id="fileboxBtn2" class="btn-default" style="display:none; float: left">△</a>
														<c:set var = "fileCnt" value="0"/>
												<div id="fileadd">
													<span id="item_0">
															<input multiple="multiple" name="files[]" class="thefiles" id="thefiles${fileCnt}" type="file"/>  <!-- 초기 파일 인풋 -->
													</span>
												</div>
												<div id="selectFileDelete" style=" width:80px; height:25px; cursor: pointer; float: right"> 선택 삭제 </div>
												<script>
												function addFileForm(count) {
													var html = "<span id='item_"+count+"'>";
													html += "<input multiple='multiple' name='files[]' class='thefiles' id='thefiles"+count+"' type='file'/></span>";
													$("#fileadd").append(html);
												}
												
												</script>
												<div id="fileBox" style=" width:100%; height:200px; border: 1px solid black; float: left;  display:none; ">
													<div style=" width:100%; height:30px; border-bottom: 1px solid black; background-color: #EAEAEA;">
														<div class="fileDiv1"> <input type="checkbox" name="selectAll" id="selectAll" value="0">&nbsp;파일명</div>
														<div class="fileDiv2">용량</div>
														<div class="fileDiv3">업로드 상태</div>
													</div>
													<div style="width: 100%; height: 85%; overflow: scroll;">
															<c:set var = "fileCount" value="0"/>
															<c:forEach var="files" items="${files}" varStatus="status" >
																<c:set var="fileCount" value="${fileCount + 1}" /> <!-- 한사이클돌면 1씩 증가시킨다 -->
																<div id="uploadfiles${fileCount}">			
																	<div class="fileSpan1">
																		<input type="checkbox" name ="Chckbox" id="Chckbox${fileCount}'" value="${fileCount}"/> 
																		<span style="color: black;">[붙임]</span>
																		<a style="color: black; " id="fileName${fileCount}" href="/db/businessManagementfileView.do?attchFileNo=${files.attchFileNo}">${files.orgFileNm}</a>&nbsp;&nbsp;
																		<span style="cursor: pointer; display:none;" id="nonFile${fileCount}"onClick="Nonfile('${fileCount}');">삭제 취소</span>
																		<span style="cursor: pointer;" id="files${fileCount}" onClick="chageFile('${fileCount}');" >x</span><br/>
																		<input type="hidden" id="fileValue${fileCount}" value="Y"/>	
																		<input type="hidden" id="fileNumber${fileCount}" value="${files.attchFileNo}"/>	
																	</div>
																	<div class="fileSpan2">알수없음</div>
																	<div class="fileSpan3">완료</div>
																</div>
															</c:forEach>
														<div id="fileList" style="width: 100%;height: 100%;"></div>													
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">내용</th>
											<td colspan="3">
												<div class="editor">	
													<label class="input" style="width: 100%;">
														<textarea class="ckeditor" name="bussCont" id="bussCont" style="width:100%;height:250px;">${result.bussCont}</textarea>
													</label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/business/businessManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a  id="updateBtn" class="btn btn-primary" ><b>수 1정</b></a>
								</div>
							</div>
						</div>
				</section>
			</form>
		</div>
		<input type="hidden" id="count" value="${fileCount}"/>
		<input type="hidden" id="cnt" value="${fileCnt}"/>
		<input type="hidden" id="bussAnncemntNo" name="bussAnncemntNo" value="${result.bussAnncemntNo}" >
		<iframe id="iframeView" style="width: 100%; height: 100%" src=""></iframe>
		<!-- END MAIN CONTENT -->


	</div>
	 
	<!-- 검색조건 유지 -->
    <%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
    
	<!-- END MAIN PANEL -->
	<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function () {
        var fileNumber = new Array();	//파일번호를 담을 배열
        var j= 0;	//파일번호 변수(파일을 추가 및 삭제 후 html을 계속 append하기 때문에 전역변수로 설정.)
        var count = $('#count').val();	
        var cnt = $('#cnt').val();			
        const target = document.getElementsByName('files[]');	


	//파일추가
    var fileNumberArr =new Array;//배열 생성

    $(document).on('change','.thefiles',function(){
    fileBuffer =[];
    fileNumber = [];

	fileNumberArr.push(new Array());
	Array.prototype.push.apply(fileBuffer, target[cnt].files);
    $.each(target[cnt].files, function(index, file){
    	console.log("파일개수" + target[cnt].files.length);
		console.log("index : "+index)
		fileNumberArr[cnt].push(index);
     	const fileName = file.name;
        const fileSize = file.size;
		var filesindex = index;
		var html = '';        //appen를 하기때문에 forEach를 돌릴때마다 그려줄 데이터 초기화
        html += '<div class="file" id="upfileList'+j+'"style="width:100%; height:25px">';
        html += '		<div class="fileSpan1">'
        html += 			'<input type="checkbox" name ="fileChckbox" id="fileChckbox'+j+'" value="'+j+'"/>'+	//checkbox
					        '<input type="hidden" name ="filetarget" id="filetarget'+j+'" value="'+cnt+'"/>'+		//hidden cnt	변수
					        '<input type="hidden" name ="fileindexa" id="fileindex'+j+'" value="'+index+'"/>'+		//hidden index 변수
        					' [추가] '+fileName +
        				'</div> ' +
        				'<div class="fileSpan2">'+fileSizeKb(fileSize)+'KB' +	//단순하게 fileSize를 보여주기 위한 용도 나중에 size체크시 유용하게 사용가능.
        				'</div>' + 
        				'<div class="fileSpan3">미완료' +
        				'</div>';
        html += '</div>';
        $('#fileList').append(html);	//#fileList에 값을 추가 
        // append와 html의 차이점.
        //append - 추가된 데이터를 지우지 않고 추가.(일반적인 리스트를 뿌려줄땐 지워야할 데이터를 remove해야하기 때문에 비효율적.)
        //html - 기존에 그려져있던 데이터를 지우고 새로 데이터를 그려주기 때문에 수정된 리스틀 뿌릴때 사용하면 좋다. 그러나 그러져있던 데이터를 중간에 빼고 새로운 데이터를 다시 그릴때에는 부적합하다고 판단!
        const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
//        console.log(fileEx);//파일확장자 확인
     	fileNumber[j]= j;	//배열에 파일번호 추가
     	j++;
    });
	$('.thefiles').css('display','none');			//this.fileInput 숨기기
	$('.thefiles').removeClass('.thefiles');	//this.fileInput의 class명 삭제 (다음추가된 fileinput의 클래스명이 중복된 경우 function 작동이 제대로 안될수 있기때문에 제거해준다.)
 	cnt++
	addFileForm(cnt);	//fileinput 새로 추가.
 	$('#cnt').val(cnt);
	console.log(fileNumberArr);
    });	
		

	//파일 전체선택
    $("#selectAll").click(function(){
        //클릭되었으면
        if($("#selectAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=fileChckbox]").prop("checked",true);
            $("input[name=Chckbox]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=fileChckbox]").prop("checked",false);
            $("input[name=Chckbox]").prop("checked",false);
        }
    })


    
    //선택한 파일 삭제
		
        $("#selectFileDelete").click(function(){
		console.log(fileNumberArr);
        	
        	
         	$('input:checkbox[name=fileChckbox]:checked').each(function() {
        		var val = this.value
        		var filecnt = $('#filetarget'+val).val();
        		var filedex = $('#fileindex'+val).val();
        		target[filecnt].files[filedex].remove;
    			fileBuffer.splice(val,1);		//제거
    			fileNumber.splice(val,1);	//제거
    			fileNumberArr[filecnt].splice(filedex,1);//2차원 배열에서 제거 
				console.log(fileNumberArr[filecnt].length);			
    			$('#upfileList'+val).remove();
        	});
        	$('input:checkbox[name=Chckbox]:checked').each(function() {
        		var val = this.value
				$('#uploadfiles'+val).css('display','none')
    			$("#fileValue"+val).val('N');	
        	}); 
			
			
			
//			console.log(fileIndex);
//			fileBuffer.splice(fileIndex,1);//제거
//			fileNumber.splice(fileIndex,1);	//제거
//			console.log(fileNumber.length);
//			console.log(fileNumber[0]);
//			$('#fileList>div:eq('+fileIndex+')').remove();
        });
    
//저장버튼 클릭
		$("#updateBtn").click(function(){
			console.log("수정버튼 클릭");
			if(checkValue()){
			var formData = new FormData();
			var files = $("input[name=files");				
			var c =0;

			//새로 추가된 파일		
 			for(var k=0; k<fileNumberArr.length; k++){
				for(var e=0; e<fileNumberArr[k].length; e++){
 						var f = fileNumberArr[k][e]
 						formData.append("multiFiles[]",$("#thefiles"+k)[0].files[f]);
 				} 
			}

			//기존파일
			for(var d =1; d<= count;d++){
				if($('#fileValue'+d).val()!='Y'){
					formData.append("fileNumber"+c,$('#fileNumber'+d).val());
					c++;
				}else{
				}
			}

				var check = null;
				var bussCostAmt = $('#bussCostAmt').val();
				if($('#bussDiviCd').prop("checked")==false){
					check = 'N';
				}else{
					check = 'Y';
				}

				formData.append("bussDiviCd",check);
				formData.append("count",c);
				formData.append("bussAnncemntNo",$('#bussAnncemntNo').val());
				formData.append("bussAnncemntNm",$('#bussAnncemntNm').val());
				formData.append("bussFrDt",$('#bussFrDt').val());
				formData.append("bussToDt",$('#bussToDt').val()); 
				formData.append("bussCostAmt",bussCostAmt.replace(/,/g,''));
				formData.append("bussDeptCd",$('#bussDeptCd').val());
				formData.append("originalUrl",$('#originalUrl').val());
				formData.append("bussCont",$('#bussCont').val());
				formData.append("applicStCd",$('#applicStCd').val());
				formData.append("memberId",$('#memberId').val());
				formData.append("regDt",$('#regDt').val());
				formData.append("regId",$('#regId').val());
				$.ajax({
					type : 'post',
					url:'/db/business/businessManagementRegisterUpdateOk.do',
					data: formData,
					enctype: 'multipart/form-data',
					contentType:false,		
					processData:false,
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
		    				window.location.href="/db/business/businessManagementList.do";
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });
			}
			
	});

		//input을 datepicker로 선언
        $("#bussFrDt").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
            ,onSelect : function(selectedDate) {
				$('#bussToDt').datepicker('option', 'minDate', selectedDate);
			}
        }); 

		$("#bussToDt").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,onSelect : function(selectedDate) {
				$('#bussFrDt').datepicker('option', 'maxDate', selectedDate);
			}
        }); 

		if('${result.bussDiviCd}'=='Y'){
			$("input:checkbox[id='bussDiviCd']").prop("checked", true)
		}

		$("#fileboxBtn1").click(function(){
			$("#fileboxBtn1").css('display','none');
			$("#fileboxBtn2").css('display','inline');
			$("#fileBox").css('display','inline');
		});
		$("#fileboxBtn2").click(function(){
			$("#fileboxBtn2").css('display','none');
			$("#fileboxBtn1").css('display','inline');
			$("#fileBox").css('display','none');
		});

	});
	
	function fileSizeKb(str){
		// str = fileSize 형식은 int
		if(1000 > str){//FileSize가 1KB 미만일경우 1KB로 표시
		    		str = 1;
		}else {
			strsize = String(str)
			str = strsize.substring(0,strsize.length-3);
		}
		return comma(str);
	}
	
	function checkValue(){
		var retValue = true;
		
		if($('#bussAnncemntNm').val() == ""){
			alert("사업명을 입력하세요.");
			$('#bussAnncemntNm').focus();
			return;
		}

		if($('#bussFrDt').val() == ""){
			alert("사업기간을 입력하세요.");
			$('#bussFrDt').focus();
			return;
		}

		if($('#bussToDt').val() == ""){
			alert("사업기간을 입력하세요.");
			$('#bussToDt').focus();
			return;
		}

		if($('#bussCostAmt').val() == ""){
			alert("사업비용을 입력하세요.");
			$('#bussCostAmt').focus();
			return;
		}
		return retValue;
	}
	

	
	function chageFile(cnt){
		
		var con_test = confirm("삭제하시겠습니까?");
		if(con_test == false){
			return false;;
		}
			$("#files"+cnt).css('display','none');	
			$("#fileName"+cnt).css('text-decoration','line-through');	
			$("#fileValue"+cnt).val('N');
			$("#nonFile"+cnt).css('display','inline');	
	}


	function Nonfile(cnt){
		$("#files"+cnt).css('display','inline');	
		$("#fileName"+cnt).css('text-decoration','none');	
		$("#fileValue"+cnt).val('N');
		$("#nonFile"+cnt).css('display','none');	
	}
	
</script>
</body>
</html>


