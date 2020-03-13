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
			        <a href="#" onclick="moveMonth('prev')"><span id="prevMonth" class="cal_tit"><</span></a>
			        <span id="cal_top_year"></span>
			        <span id="cal_top_month"></span>
			        <a href="#" onclick="moveMonth('next')"><span id="nextMonth" class="cal_tit">&gt;</span></a>
			    </div>
			    <div id="cal_tab" class="cal">
 

<script type="text/javascript">
var year;		//현재 년
var month;		//현재 월
var startDay;	//현재 월 시작 요일 ex) sunday = 1;
var MaxDay;	//현재 월 마지막 일 ex) 30일
var prevDay;	//이전 월 마지막 일 ex) 30일
var lasycell;	//마지막셀값 구하기
var length = 0;
$(document).ready(function() {
	moveMonth(); 
});	

function drawCalendar(){
	var	cnt 	= 1;
	var 	html   ='<table class="calendar">'; 
				html +=	'<tr>' +
							'<th>일요일</th>'	+
							'<th>월요일</th>'	+
							'<th>화요일</th>'	+
							'<th>수요일</th>'	+
							'<th>목요일</th>'	+
							'<th>금요일</th>'	+
							'<th>토요일</th>'	+
       					'</tr>';
       					if(lasycell<29){length = 4;}
       					else if(lasycell<36){length = 5;}
       					else if(lasycell<43){length = 6;}
       					else{}
	for(var i=0;i<length;i++){ // 로우 그리기
		html+='<tr style="height:100px" >';

        for(var j=0;j<7;j++){ //한개의 로우안에 7개의 셀을 그리기
        	html +='<td style="text-overflow:ellipsis;overflow:hidden;">';
        	html +='    <div class="cal-day" id="cal-day'+cnt+'"></div>';
        	html +='    <div class="cal-schedule" id="cal-schedule'+cnt+'"></div>';
        	html +='</td>';
			cnt++;
        }//셀 7개 끝
        html+='</tr>';//로우 닫기
	//반복
	}
	html +='</table>';
    $("#cal_tab").html(html);//cal_tab에 html을 그린다.
}
	//prevmonthclick
	function moveMonth(params){
		console.log(params);
		if(!params){
			month=0;
			year=0;
			
		}else{
			if(params=="prev"){month = parseInt(month)-1;}
			else if(params=="next"){month = parseInt(month)+1;}
			
			if(month==0){
				year= parseInt(year)-1;
				month= 12;
			}//1월에서 이전을 클릭하면 작년으로 돌아간다.
			if(month==13){
				year++;
				month= 1; 
			}
		}
		$.ajax({
				type : 'post',
				url:'/db/schedule/CalendarList.do',
				data: {
							"month"	: month,
							"year"		: year
						},
				dataType: 'json',
				success : function(data) {
					year = data.year;
					month = data.month;
					startDay = data.startDay;
					MaxDay = data.MaxDay;
					prevDay = data.prevDay;
					lasycell = parseInt(startDay)+parseInt(MaxDay);
					drawCalendar();
					cal_date();
					console.log(data.list);
//테스트 데이터
//

/* $.each(data.list, function () {
 						var cnt=1;
						var caldata= $('div-schedule'+cnt).val();//200228
						//caldata(200228)시작데이터 
//이전달 데이터 뽑기
//1. startData= (month-1) or (month-1)= endDate 조건이 맞을경우
//2. day = prevdiv의 val와 값이 같으면 div에 뿌려준다.
						var prevMonth = parseInt(month)-1;
						var prevFrMonth = this.useFrDt.substr(4,2)
						var prevToMonth = this.useToDt.substr(4,2)
						if(prevFrMonth <= prevFrMonth && prevFrMonth >= prevToMonth){
							console.log("Fr : " + prevFrMonth + " & "  + "To " + prevToMonth);

							for(var i=1; i<(parseInt(length*7)+1i++;){
								
							}
						}
					)}; */
					
 //기존 데이터					
					$.each(data.list, function () {
						var a = this.useToDt.substr(6,2);
						var startcell = parseInt(startDay)+parseInt(a)-1;    //시작할 칸수
						var ReserDate = parseInt(this.useToDt) - parseInt(this.useFrDt)//예약기간
						if(ReserDate==0){//기간이 하루일경우
							$('#cal-schedule'+startcell).append(this.compNm);
						}else if(ReserDate>0){//기간이 하루이상일 경우
							for(var i=0;i<ReserDate;i++){
								$('#cal-schedule'+startcell).append(this.compNm);								
								startcell++;
							}
						}
					 });
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
		 });	    	
	}//Month

	//캘린더
	function cal_date(){
			var j =1;
			var nextlength=0;
			//해당월 구하기
			for(var i=startDay;i<lasycell; i++){
	        	var append = '<input type="hidden" id="calcnt'+i+'"value="'+i+'"/>';
				$('#cal-day'+i).html(append);
				$('#cal-day'+i).append(j++); 
			}

			//다음달 구하기
			var k=parseInt(lasycell);
			var nextmonth = 1+parseInt(month);
			j=0; 
			for(k; k< (length*7+1); k++ ){
	        	var append = '<input type="hidden" id="nextcnt'+k+'"value="'+k+'"/>';
				$('#cal-day'+k).html(append);
				$('#cal-day'+k).append(++j);
				$('#cal-day'+k).css("color","gray");
			}
			//이전달 구하기
			var prevlength = parseInt(prevDay)-(parseInt(startDay)-2);
			var prevmonth = 1-parseInt(month);
			
			for(var h=1; h<startDay;h++){
	        	var append = '<input type="hidden" id="prevcnt'+prevlength+'"value="'+prevlength+'"/>';
				$('#cal-day'+h).html(append);
				$('#cal-day'+h).append(prevlength++);

				
				
				
/* 				$('#calcnt'+h).val("prev"+prevlength);
				console.log("prev"+prevlength);
				$('#cal-day'+h).text(prevlength++); */
				$('#cal-day'+h).css("color","gray");
		}
		$('#cal_top_year').text(month); 
		
		
		//색칠공부
		for(var x=1; x<(length*7);x=x+7){
			$('#cal-day'+x).css("color","red");
		}
		for(var x=0; x<(length*7+1);x=x+7){
			$('#cal-day'+x).css("color","blue");
		} 
	}
			    	</script>
			    </div>
			</section>
			<!-- end widget grid -->
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->

	<script type="text/javaScript" >
/* 
	
	var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    $(document).ready(function() {
//        drawCalendar();
        initDate();
        drawDays();
        drawSche();
//        testCalendarList();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });

    //Calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
		setTableHTML+=	'<tr>' +
									'<th>SUN</th>'	+
									'<th>MON</th>'	+
									'<th>TUE</th>'	+
									'<th>WED</th>'	+
									'<th>THU</th>'	+
									'<th>FRI</th>'		+
									'<th>SAT</th>'	+
	        					'</tr>';
//칸수 구하기
		for(var i=0;i<6;i++){
            setTableHTML+='<tr style="height:100px" >'; 
//줄 구하기
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
    }
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    //정보갱신
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
        drawSche();
    }
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2019":{
                "07":{
                    "17":"제헌절"
                }
                ,"08":{
                    "7":"칠석"
                    ,"15":"광복절"
                    ,"23":"처서"
                }
                ,"09":{
                    "13":"추석"
                    ,"23":"추분"
                }
            }
        }
    }
    
    //스케줄 그리기
    function drawSche(data){
        setData();
        console.log("drawSche")
        console.log(data);
        var dateMatch = null;
        for(var i=firstDay.getDay(); i<firstDay.getDay()+lastDay.getDate(); i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);
                }
            }
        }
    }
    //DB 데이터 불러오기
/*     function testCalendarList(month, today){
		 $.ajax({
				type : 'post',
				url:'/db/schedule/testCalendarList.do',
				data: {
							"month"	: month,
							"today"	: today 
						},
				dataType: 'json',
				success : function(data) {
					drawSche(data);
					//넘어온 데이터 넘기기
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
		 });	    	
    } */
    
 
	</script>
	
</body>
</html>