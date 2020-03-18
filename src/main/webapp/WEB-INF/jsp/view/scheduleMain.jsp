<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<style type="text/css">
.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center; 
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
</style>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>예약관리</li><li><b>schedule</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>schedule</b></h1>
				</div>
			</div>
			<!-- widget grid -->
			<section id="widget-grid" class="">
				<!-- 캘린더 Div -->			
				<div class="cal_top">
					<a href="#" onclick="moveMonth('prev')"><span id="prevMonth" class="cal_tit">&lt;</span></a>
						<span id="cal_top_year"></span>
						<span id="cal_top_month"></span>
					<a href="#" onclick="moveMonth('next')"><span id="nextMonth" class="cal_tit">&gt;</span></a>
				</div>
				<div id="cal_tab" class="cal">
				</div>
			</section>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
 
<script type="text/javaScript" > 

var year=null,month=null,today=null; //년, 월, 일
var firstDay=null,lastDay=null;	//당월 시작일, 당월 마지막일
var $tdDay=null,$tdSche=null;	//drawcell Id
var prevDate=null,prevLastday=null;
var nextDate=null,nextFirstday=null;
var cell=null, length=null;
var firstDate = null, lastDate=null;		 


$(document).ready(function() {
    initDate();
});


//calendar 그리기
function drawCalendar(){
    if(cell<29){length = 4;}
    else if(cell<36){length = 5;}
    else if(cell<43){length = 6;}
    else{}	
    var setTableHTML = "";
    setTableHTML+='<table class="calendar">';
    setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
    for(var i=0;i<length;i++){
        setTableHTML+='<tr height="100">';
        for(var j=0;j<7;j++){
            setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
            setTableHTML+='    <div class="cal-day"></div>';
            setTableHTML+='    <div class="cal-schedule"></div>';
            setTableHTML+='</td>';
        }
        setTableHTML+='</tr>';
    }
    setTableHTML+='</table>';
    $("#cal_tab").html(setTableHTML);
    $tdDay = $("td div.cal-day");
    $tdSche = $("td div.cal-schedule");
}


//날짜 초기화
function initDate(){
    dayCount = 0;
    today = new Date();
    year = today.getFullYear();
    month = today.getMonth()+1;
    
    firstDay = new Date(year,month-1,1);
    lastDay = new Date(year,month,0);

    prevDate   = new Date( year, month-1); 
	prevDate   = new Date( prevDate - 1 ); //두번 나눠서 한이유 2020년 1월일경우 조건문을 통해 year, month 둘다 값을 변경해야하지만 기존값에서 -1을 하게되면 자동적으로 2019년 12월이 나온다.
	prevLastday = prevDate.getDate();
	
	cell = (lastDay.getDate() +firstDay.getDay());//초기 셀값 구하기
	moveMonth();
}


//calendar 날짜표시
    function drawDays(){
		var viewMonth = null;

		$("#cal_top_year").text(year);
        $("#cal_top_month").text(month); 

        for(var i=0;i<length*7;i+=7){$tdDay.eq(i).css("color","red");}//일요일 빨간칠
        for(var i=6;i<length*7;i+=7){$tdDay.eq(i).css("color","blue");}//토요일 파란칠

        var prevCnt = 0;//이전달 그리기
        console.log("이전일"+(prevLastday-firstDay.getDay()+1));
        console.log("조건완료값"+(7-(7-firstDay.getDay() ))); 
			
		prevCnt = (prevLastday-firstDay.getDay()+1);
 		for(i=0; i<7+(7-firstDay.getDay()) ; i++){
 			$tdDay.eq(i).text(prevCnt);					//0번째칸부터시작
            $tdDay.eq(i).css("color","gray");	//회색
            $tdSche.eq(i).css("color","gray");	//회색
			prevCnt++
		} 

        var dayCount=0; //해당월  그리기
 		for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
	            $tdDay.eq(i).text(++dayCount);
        }
		
		var nextCnt=0;//다음달 그리기
 		for(i=lastDay.getDate()+firstDay.getDay(); i<(length*7); i++){
            $tdDay.eq(i).text(++nextCnt);
            $tdDay.eq(i).css("color","gray");	 //회색
            $tdSche.eq(i).css("color","gray");	 //회색 
		}
    }
    
    
    
     //calendar 월 이동
    function moveMonth(flag){
    	 if(!flag){//값이 없을경우 들어가는데 현재값에 들어감.
    	 }else if(flag=="prev"){
	        month--;
	        if(month<=0){
	            month=12;
	            year--;
	        }
		}else if(flag=="next"){
	        month++;
	        if(month>12){
	            month=1;
	            year++;
	        }
		}
		//달력값 재셋팅
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
		cell = (lastDay.getDate() +firstDay.getDay());
        drawCalendar();
        
        if(month<10){
            month=String("0"+month);
        }
        var fristDateDay = firstDay.getDay();
		var a = (length*7);//35
		var b = (lastDay.getDate()+firstDay.getDay());//33
		var lastDateDay = parseInt(a-b);

		//시작일		
		firstDate = String(year) +String(month)+ String('01');
		firstDate = prevDate1(firstDate,fristDateDay);

		//종료일
		lastDate = String(year) +String(month)+ String(lastDay.getDate());
		lastDate = nextDate1(lastDate,lastDateDay);
			
		console.log("시작일 데이터: " + firstDate);
		console.log("종료일 데이터: " + lastDate);
		ajax();
    }

     
    function ajax(){
		$.ajax({
             type : 'post',
             url:'/db/schedule/CalendarList.do',
             data: {
                      "firstDate"	:	firstDate,
                      "lastDate"	:	lastDate
                   },
             dataType: 'json',
             success : function(data) {
            	 drawDays(); 
				var sysday =firstDay.getDay();
         		var sysDate = String(year)+String(month)+'01';
				sysDate = prevParse(sysDate,sysday);
            	 for(var i=0; i< length*7; i++){//한칸당 계산.
            		 $.each(data.list, function () {
						var useFrDt = parse(this.use_fr_dt);//예약시작일
						var useToDt = parse(this.use_to_dt);//예약종료일
						if(useFrDt <= sysDate) {//예약시작일<=현재일
							if(useToDt >= sysDate){
							var append = '<a>'+this.comp_nm+'</a></br>';
							$tdSche.eq(i).append(append);
							} //end if
						}
					}) //end $.each
					sysDate.setDate(sysDate.getDate() +1);//날짜 1일추가
            	 } //end for
         	 
             }
		})

    } 

    
    
    function parse(str) {//String(8자리) -> Date()
        var y = str.substr(0, 4);
        var m = str.substr(4, 2);
        var d = str.substr(6, 2);
        return new Date(y,m-1,d);
    }

    
    function prevParse(str1, str2) {//시작일 구하기
        var y = str1.substr(0, 4);
        var m = str1.substr(4, 2);
        var d = str1.substr(6, 2);
        var dd = new Date(y,m-1,d);
        dd.setDate(dd.getDate() - parseInt(str2)) ;
        return dd;
    }

    
    function prevDate1(str1, str2) { //시작일 구하기
    	var y = str1.substr(0, 4);
        var m = str1.substr(4, 2);
        var d = str1.substr(6, 2);
        var dd = new Date(y,m-1,d);
        dd.setDate(dd.getDate() - parseInt(str2)) ;
		y = dd.getFullYear();
		m = dd.getMonth()+1;
		if(m<10){m = '0'+m;}
		d = dd.getDate();
		if(d<10){d = '0'+d;}
		var str = String(y)+String(m)+String(d)
		return str;
    }

    function nextDate1(str1, str2) { //종료일 구하기
    	var y = str1.substr(0, 4);
        var m = str1.substr(4, 2);
        var d = str1.substr(6, 2);
        var dd = new Date(y,m-1,d);
        dd.setDate(dd.getDate() + parseInt(str2)) ;
		y = dd.getFullYear();
		m = dd.getMonth()+1;
		if(m<10){m = '0'+m;}
		d = dd.getDate();
		if(d<10){d = '0'+d;}
		var str = String(y)+String(m)+String(d)
        return str;
    }

</script>
</body>
</html>