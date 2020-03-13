<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<style>
    table
    {
        border:1px solid #BDBDBD;
        text-align:center;
        width:70%;
        font-size:17px;
    }
    tr, td {
    border: 1px solid #BDBDBD;
    padding: 20px;
  }

</style>
<script language="javascript">
	var today = new Date(); // 오늘 날짜
	var date = new Date(); // 오늘날짜와 비교위해 date만듦
	
	//1. 페이지가 시작할때 일정을 조회
	$(document).ready(function(){
		selectSchedule();
	});
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        selectSchedule();
//         build(); //만들기
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        selectSchedule();
//         build();
    }
    
    function build(data) //data 받기!
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 				 //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 			 //현재 달의 마지막 날
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth() - 1, 0);		 // 이전달의 마지막날
        var tbcal = document.getElementById("calendar"); 								 // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); 							 //년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) 														//today.getMonth() 가 0부터 시작하므로 +1 을했을때 12면
        {
            before.innerHTML=(today.getMonth())+"월";									//이전 달은 그대로 표시
            next.innerHTML="1월";														//다음 달은 1월로 표시
        }
        else if(today.getMonth()+1==1) 													//today.getMonth() 가 0부터 시작하므로 +1 을했을때 1면
        {
        before.innerHTML="12월";															//이전 달은 12월
        next.innerHTML=(today.getMonth()+2)+"월";										//다음달은 2월
        }
        else
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        //요일을 표시하는 row를 제외하고 달력조회할때 다시 그리기 위해 제거
        while (tbcal.rows.length > 2) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            html = '<span style="color:#B3B6B3 ;">'+Number(bfrLastDay.getDate() - nMonth.getDay() + i + 1) +'</span>'
            cell.innerHTML = html;
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {									//요일을 7로 나눌때 나머지가 1이므로 일요일
                cell.innerHTML = "<font color=#FF9090>" + i;	//일요일에 색
            }
            if (cnt % 7 == 0) { 								// 요일을 7로 나눌때 나머지가 없으므로 토요일
                cell.innerHTML = "<font color=#7ED5E4>" + i;	//토요일에 색
                row = calendar.insertRow();						//토요일이면 다음주 한줄 생성
            }
            //년, 월, 일이 같으면 오늘 날짜 표시
            if(today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
            var schedule = ""; //일정
            //조회해온 일정만큼 반복문 수행
            for(var a = 0; a < data.schedule.length; a++){
            	/* 
            	   i = 일자 
            	   data.schedule[a].useFrDt.substring(6) = 조회해온 일정시작일에서 6자리 이전은 자르고 6자리 이후부터의 데이터 날짜만 가져옴 
            	   data.schedule[a].useToDt.substring(6) = 조회해온 일정종료일에서 6자리 이전은 자르고 6자리 이후부터의 데이터 날짜만 가져옴 
            	    일치할경우 일정을 표시
            	*/
            	if(i >= data.schedule[a].useFrDt.substring(6) && i <= data.schedule[a].useToDt.substring(6)	){
            		if(schedule ==""){ //일정 비어있으면 일정하나 추가
            			schedule =data.schedule[a].compNm;
            			}else{ //근데 일정이 이미 등록되어있다면, 다른 일정들도 보여주기
            		schedule = "</br>"+"<font size=1px>" + schedule +"</br>"+ "<font size=1px>" + data.schedule[a].compNm //일정들 
            		}
            }
            }
        cell.innerHTML=i +"</br>"+"<font size=1px>" + schedule; // 날짜 + 일정들
        }
        //다음달 시작
        var nextMonthDate = 1;			//다음달 시작일
     	var html ="";
     	while((cnt++) % 7 != 0){		//토요일까지만 다음달 날짜를 표시하기위해 반복
			html = '<span style="color:#B3B6B3 ;">'+nextMonthDate+'</span>'
    	 	row.insertCell().innerHTML = html;
     		nextMonthDate += 1;			//하루 추가
     	}
    }
    
    //일정 조회
    function selectSchedule(){
   	
    		var year = String(today.getFullYear()); //현재년도
    		var month = "";
    		//현재 월 이 10월 이전이면 앞에 0을 붙여서 두자리로 만들어줌
    		if(today.getMonth() < 10){
    			month = "0" + (today.getMonth() +1)
    		}else{
    			month = today.getMonth() + 1;
    		}
    		var month = String(month);
//     		var month = String(today.getMonth() < 10 ? "0" + (today.getMonth() +1) : today.getMonth() + 1); //현재 달
    		var lastDay = String(( new Date( year, month, 0) ).getDate());	//현재 달의 마지막일
    		//ajax 시작
    		$.ajax({
            type : 'post',											//method 타입은 post 로..
            data : {"useFrDt" : year.concat(month,"01")				//서버로 넘겨주는 파라메타
            	       ,"useToDt" : year.concat(month,lastDay)},	//useFrDt = 시작일자 이므로 위에서 구한 year 에 month 와 01 을 붙여줌
            														//useToDt = 마지막일자 이므로 year 에 month와 현재 월의 마지막일자를 붙여줌
            	       dataType: 'json',
            url: '/db/site/calendar4.do',							//url 설정
            success: function(data){								//정상적으로 결과를 받으면..
            	build(data); 										//data = 받은일정데이터
            	                                                    //build = 달력 그리기 시작
            },
            error : function(e){
            	console.log("실패");
            }
         });
    };
</script>




<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사이트 관리</li><li><b>일정 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>일정 관리</b></h1>
				</div>
			</div>
	
			<table align="center" id="calendar">
        <tr>
            <td><font size=3%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=3%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">일</font></td>
            <td align="center"> 월 </td>
            <td align="center"> 화 </td>
            <td align="center"> 수 </td>
            <td align="center"> 목 </td>
            <td align="center"> 금 </td>
            <td align="center"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
		</div>
	</div>	
 </body>
</html>