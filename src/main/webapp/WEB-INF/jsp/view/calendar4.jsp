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
        font-size:20px;
    }
    tr, td {
    border: 1px solid #BDBDBD;
    padding: 20px;
  }

</style>
<script language="javascript">
	var today = new Date(); // 오늘 날짜
	var date = new Date();
	
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
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var bfrLastDay = new Date(today.getFullYear(), today.getMonth() - 1, 0);// 이전달의 마지막날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        // 남은 테이블 줄 삭제
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
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear() && today.getMonth()==date.getMonth()&&i==date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
            for(var a = 1; a < data.schedule.length; a++){ //일정 추가
            if(i>=data.schedule[a].useFrDt.substring(6) && i<=data.schedule[a].useToDt.substring(6)){
            	cell.innerHTML=i +"</br>"+ data.schedule[a].compNm //날짜 + 일정 
            	}
            }
            
        }
     var nextMonthDate = 1;
     var html ="";
     while((cnt++)%7 != 0){
		html = '<span style="color:#B3B6B3 ;">'+nextMonthDate+'</span>'
    	 row.insertCell().innerHTML = html;
     	nextMonthDate+=1;
     }
    }
    
    //일정 조회
    function selectSchedule(){
   	
    		var year = String(today.getFullYear()); //현재년도
    		var month = String(today.getMonth() < 10 ? "0" + (today.getMonth() +1) : today.getMonth() + 1); //현재 달
    		var lastDay = String(( new Date( year, month, 0) ).getDate());
    		$.ajax({
            type : 'post',
            data : {"useFrDt" : year.concat(month,"01")
            	       ,"useToDt" : year.concat(month,lastDay)},
            dataType: 'json',
            url: '/db/site/calendar4.do',
            success: function(data){
            	build(data); //data 받아서 위로 넘겨주기
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