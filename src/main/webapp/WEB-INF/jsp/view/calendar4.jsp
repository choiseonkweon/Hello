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
	var today = new Date(); 	// 비교를 위한 날짜
	var date   = new Date(); 	// 오늘 날짜 

	//1. 페이지가 시작할때 일정을 조회
	$(document).ready(function(){
    	today = new Date(today.getFullYear(), today.getMonth(), 1);					//조회 월의 첫째날
	    var curLastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);	//조회 월의 마지막
	    var bfrLastDay = new Date(today.getFullYear(), today.getMonth(), 0);		 	// 이전달의 마지막날
	    var aftLastDay = new Date(today.getFullYear(), today.getMonth()+1, 1);		// 달력의 다음달 마지막날
	    var strtDt = "";
	    var endDt = "";
	    if(today.getDay() == 0){	//조회월 시작일이 일요일 일 경우
	    	strtDt = String(today.getFullYear()) + String(today.getMonth() < 10 ? "0".concat(today.getMonth()+1) : today.getMonth()+1) + String("0".concat(today.getDate()));
	    }else{
	       	strtDt = String(bfrLastDay.getFullYear())+String(bfrLastDay.getMonth() < 10 ? "0".concat(bfrLastDay.getMonth()+1) : bfrLastDay.getMonth() +1) +String(bfrLastDay.getDate() - today.getDay() + 1);
	    }
	        
	    if(curLastDate.getDay() == 6){	//조회월 마지막일이 토요일 일 경우
	       	endDt = String(curLastDate.getFullYear())+String(curLastDate.getMonth() < 10 ? "0".concat(curLastDate.getMonth() +1) : curLastDate.getMonth() + 1) +String(curLastDate.getDate());
	    }else{
	       	endDt = String(aftLastDay.getFullYear())+String(aftLastDay.getMonth() < 10 ? "0".concat(aftLastDay.getMonth()+1) : aftLastDay.getMonth() + 1) +String("0".concat(7 - curLastDate.getDay() - 1) );
	    }
	    console.log("이번달 눌렀을때 strtDt=="+strtDt);
	    console.log("이번달 눌렀을때endDt=="+endDt);
		selectSchedule(strtDt, endDt);
	});
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, 1);					//조회 월의 첫째날
        var curLastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);	//조회 월의 마지막
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth(), 0);		 	// 이전달의 마지막날
        var aftLastDay = new Date(today.getFullYear(), today.getMonth()+1, 1);		// 달력의 다음달 마지막날
        var strtDt = "";
        var endDt = "";
        if(today.getDay() == 0){	//조회월 시작일이 일요일 일 경우
        	strtDt = today.getFullYear().concat(String(today.getMonth() < 10 ? "0".concat(today.getMonth()+1) : today.getMonth()+1) , String("0".concat(today.getDate())));
        }else{
        	strtDt = String(bfrLastDay.getFullYear())+String(bfrLastDay.getMonth() < 10 ? "0".concat(bfrLastDay.getMonth()+1) : bfrLastDay.getMonth() +1) +String(bfrLastDay.getDate() - today.getDay() + 1);
        }
        
        if(curLastDate.getDay() == 6){	//조회월 마지막일이 토요일 일 경우
        	endDt = String(curLastDate.getFullYear())+String(curLastDate.getMonth() < 10 ? "0".concat(curLastDate.getMonth() +1) : curLastDate.getMonth() + 1) +String(curLastDate.getDate());
        }else{
        	endDt = String(aftLastDay.getFullYear())+String(aftLastDay.getMonth() < 10 ? "0".concat(aftLastDay.getMonth()+1) : aftLastDay.getMonth() + 1) +String("0".concat(7 - curLastDate.getDay() - 1) );
        }
        console.log("이전달 눌렀을때 strtDt=="+strtDt);
        console.log("이전달 눌렀을때endDt=="+endDt);
        selectSchedule(strtDt, endDt);
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
        var curLastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);	//조회 월의 마지막
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth(), 0);		 	// 이전달의 마지막날
        var aftLastDay = new Date(today.getFullYear(), today.getMonth()+1, 1);		// 달력의 다음달 마지막날
        var strtDt = "";
        var endDt = "";
        if(today.getDay() == 0){	//조회월 시작일이 일요일 일 경우
        	strtDt = String(today.getFullYear()) + String(today.getMonth() < 10 ? "0".concat(today.getMonth()+1) : today.getMonth()) + String("0".concat(today.getDate()));
        }else{
        	strtDt = String(bfrLastDay.getFullYear())+String(bfrLastDay.getMonth() < 10 ? "0".concat(bfrLastDay.getMonth()+1) : bfrLastDay.getMonth() +1) +String(bfrLastDay.getDate() - today.getDay() + 1);
        }
        
        if(curLastDate.getDay() == 6){	//조회월 마지막일이 토요일 일 경우
        	endDt = String(curLastDate.getFullYear())+String(curLastDate.getMonth() < 10 ? "0".concat(curLastDate.getMonth() +1) : curLastDate.getMonth() + 1) +String(curLastDate.getDate());
        }else{
        	endDt = String(aftLastDay.getFullYear())+String(aftLastDay.getMonth() < 10 ? "0".concat(aftLastDay.getMonth()+1) : aftLastDay.getMonth() + 1) +String("0".concat(7 - curLastDate.getDay() - 1) );
        }
        console.log("다음달 눌렀을때 strtDt=="+strtDt);
        console.log("다음달 눌렀을때endDt=="+endDt);
        selectSchedule(strtDt, endDt);
    }
    
    function getFormatDate(i){
        var year = i.getFullYear();              //yyyy
        var month = (1 + i.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = i.getDate();                   //d
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth() - 1, 0);
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 
        var prevDay = bfrLastDay - nMonth+1;
        return  year + '' + month + '' + day;
        }
    var i = new Date();
    i = getFormatDate(i);
    console.log("i=="+i);
    
    function build(data,i) //data 받기!
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 				 //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 			 //현재 달의 마지막 날 (년, 월입력, 0) 규칙임.
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth() , 0);		 // 이전달의 마지막날
        var tbcal = document.getElementById("calendar"); 								 // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); 							 //년도와 월 출력할곳
        var prevDay = bfrLastDay - nMonth;
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
        for (var i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            html = '<span style="color:#B3B6B3 ;">'+Number(bfrLastDay.getDate() - nMonth.getDay() + i + 1) + '</span>'
            cell.innerHTML = html;
            cnt = cnt + 1;
            
        }
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
           
          
           
            var schedule = ""; //일정
            //조회해온 일정만큼 반복문 수행
            for(var a = 0; a < data.schedule.length; a++){
           
            	if(
//             			i >= data.schedule[a].useFrDt && i <= data.schedule[a].useToDt){
            			i >= data.schedule[a].useFrDt.substring(6) && i <= data.schedule[a].useToDt.substring(6))	{
            	
            		if(schedule ==""){ //일정 비어있으면 일정하나 추가
            			schedule =data.schedule[a].compNm;
            			}else{ //근데 일정이 이미 등록되어있다면, 다른 일정들도 보여주기
            		schedule = schedule +"</br>" + data.schedule[a].compNm; //일정들 
            		}
            		
            }
            
            }
            if(cnt % 7 == 1) {									//요일을 7로 나눌때 나머지가 1이므로 일요일
            	cell.innerHTML= "<font color=#FF9090>"+i+ "</br>"+"<font size=1px; color='black'>" + schedule; // 날짜 + 일정들
            } else if(cnt % 7 == 0){
            	
            	cell.innerHTML = "<font color=#7ED5E4>" + i+"</br>"+"<font size=1px; color='black'>" + schedule;	//토요일에 색
                row = calendar.insertRow();	
            }
           else{
            	cell.innerHTML= i +"</br>"+"<font size=1px; color='black'>" + schedule; 
            }
            //년, 월, 일이 같으면 오늘 날짜 표시
            if(today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
            
        
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
    function selectSchedule(strtDt, EndDt){
   	
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
            type : 'post',									//method 타입은 post 로..
            data : {"useFrDt" : strtDt				//서버로 넘겨주는 파라메타
            	       ,"useToDt" : EndDt				//useFrDt = 시작일자 이므로 위에서 구한 year 에 month 와 01 을 붙여줌
            	       },	
            														//useToDt = 마지막일자 이므로 year 에 month와 현재 월의 마지막일자를 붙여줌
            	       dataType: 'json',
            url: '/db/site/calendar4.do',							//url 설정
            success: function(data,i){								//정상적으로 결과를 받으면..
            	build(data,i); 										//data = 받은일정데이터
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