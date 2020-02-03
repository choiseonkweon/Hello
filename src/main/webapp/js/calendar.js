  	function setReservMonth(date,resrvType) {
		var today = new Date();
		var yyyy = date.getFullYear();
		var mm = date.getMonth()+1;
		
		if((mm + '').length == 1) mm = '0' + mm;
		
		$('#reservMonth').text(yyyy+'.'+mm);
		
		date.setDate('1');
		
		drawReservMonth(date,resrvType);
	}	

 	function drawReservMonth(date,resrvType) {
  		
  	  	var lastDay = new Date(date.getYear(), date.getMonth() + 1, 0).getDate();
  	  	var maxWeek = Math.ceil((lastDay + date.getDay()) / 7);
  	  	var html = '';
  	  	var day = 1 - date.getDay();
  	  	var preLastDay = new Date(date.getYear(), date.getMonth(), 0).getDate() - (date.getDay()-1);
  	  	var nextDay = 1;
  	  	  	  	
  	  	for(var i=0; i<maxWeek; i++){
  	  		html += '<tr class="date">';
  	  		
  	  		for(var j=0; j<7; j++){
  	  			var sunClass = ''; var satClass = ''; var preClass = ''; var currClass = '';
  	  			var showDay = day;
  	  			
  	  			if(day <= 0){
  	  				preClass = ' prev';
  	  				showDay = preLastDay;
  	  				preLastDay++;
  	  			} 
  	  			if(day > lastDay){
  	  				preClass = ' prev';
  	  				showDay = nextDay;
  	  				nextDay++;
  	  			}
  	  			if(preClass == ''){
  	  				var nowMonth = new Date().getMonth();
  	  				var nowDay = new Date().getDate();
  	  				if((date.getMonth() == nowMonth) && (showDay == nowDay)) currClass = ' current';
  	  			}
  	  			
  	  			if(j==0) sunClass = 'sun ';
  	  			if(j==6) satClass = ' sat';
  	  			
				html += '<td class="' + sunClass + preClass + '">'
					+ '<div class="day_wrap' + currClass + '">'
					+ '<p class="num day'+ satClass + '" value="' + showDay + '" day="' + j + '">' + showDay + '</p>'
					+ '<ul class="reg">'
					+ '</ul>'
					+ '</div>'
					+ '</td>';
				day++;
  	  		}
  	  		
  	  		html += '</tr>';
  	  	}
  	  	
  	  	$('.week').find('tbody').find('tr').remove();
  	  	$('.week').find('tbody').append(html);
  	  	
  	  	// 현재달 
  	  	selectReservMonth(date, false,resrvType);
  	  	
  	  	//이전달
  	  	date.setMonth(date.getMonth() - 1);
  	  	selectReservMonth(date, true,resrvType);
  	  	
  	  	//다음달
  	  	date.setMonth(date.getMonth() + 2);
  	 	selectReservMonth(date, true,resrvType);  	  	
  	}  	
  	
 	
  	function selectReservMonth(date, preYn,resrvType) {
  		
  		var dd = date.getDate();
  		var mm = date.getMonth()+1; //January is 0!
  		var yyyy = date.getFullYear();
  		
  		if(dd<10) {
  		    dd='0'+dd
  		} 
  		if(mm<10) {
  		    mm='0'+mm
  		} 
  		
  		
  		var useDate = yyyy+''+mm;
  		
  		var param = {};
  		param.useDate = useDate;
  		param.resourFaciDiviCd = resrvType;
  		var url = "/db/front/resourceFacilityCalendarList.do";
  		if(resrvType === "R"){
  			url = "/db/front/resourceFacilityCalendarList2.do";
  			
  		}

  		$.ajax({
			type:"POST",
			url :url,
			data:param,
			dataType:"json",
			success: function (data) {
				
				var resultDataLength = data.resultList.length;	
				
				for(var i=0; i<resultDataLength; i++) {
					
					var row = data.resultList[i];
					var calYnArr = row.calYn.split(',');
					
					for(var j=0; j<calYnArr.length; j++) {
						
						if(calYnArr[j] == 'Y') {
							
							var obj;
							if(preYn == true) {
								obj= $('.week').find('.prev').find('.day[value=' + (j+1) + ']').parent();
							} else {
								obj= $('.week').find('td').not('.prev').find('.day[value=' + (j+1) + ']').parent();
							}
							
							var dispStyle = '';
							
							if(obj.find('.reserve_info').length >= 3) {
								dispStyle = 'style="display:none;"';
								var moreCnt = 1;
								
								if(obj.find('.num2').length > 0) {
									moreCnt = obj.find('.num2').text().substring(1,2);
									moreCnt++;
									obj.find('.num2').remove();
								}
									
								var btnHtml = '<p class="num2"><a href="javascirpt:void(0);">+' + moreCnt +  '</a></p>';
								obj.append(btnHtml);
								
							}
							
							var html = '<li class="schedule reserve_info"' + dispStyle +' style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><a href="javascript:void(0);"  value="' + row.appliNo + '">- ' + row.compNm + '/' + row.facilityNm + '</a></li>';
							obj.find(".reg").append(html);
						}
					}
				}
				
			},
			error: function (error) {
				alert("작업중 에러가 발생했습니다.");     
			}
		});
		
  	} 	
 	
  	
 	function openReservMore(obj) {
  		var parent = $(obj).parent();
  		
		var weekend = new Array('일', '월', '화', '수', '목', '금', '토');
		var date = $('#reservMonth').text() + '.' + parent.find('.day').attr('value') + ' ' + weekend[parent.find('.day').attr('day')];
		
		$('#layer_popup_date').text(date);
		
		$('#layer_popup_info').find('li').remove();
		
		parent.find('.reserve_info').each(function() {
			var info = $(this).text().substring(2, $(this).text().length);
			html = '<li class="reserve_info" onclick="selectReservDetail(' + $(this).attr('value') + ');">' + info + '</li>'
			$('#layer_popup_info').empty().append(html);
		});

		$('#reserveinfolistPop').show();		

  	}
  	
  	function closeReservMore(obj) {
  		$(obj).parent().parent().parent().hide(0);
        $('body').unbind('touchmove');
  	}  	
 	//월 변경 
  	function changeReservMonth(month,resrvType) {
  		var reservMonth = $('#reservMonth').text().split('.');
  		
  		var date = new Date(reservMonth[0], reservMonth[1]-1, 1);
  	    date.setMonth(date.getMonth() + month);
  	    
  	  	setReservMonth(date,resrvType);
  	} 	

  	function selectReservDetail(instSeq) {
  		var param = {};
  		param.instSeq = instSeq;
  		
  		$.ajax({
			type:"POST",
			url :"/jcc/facility/selectFacility",
			data:param,
			dataType:"json",
			success: function (data) {
				$('#pop02_compNm').text(data.result.compNm);
				$('#pop02_facNm').text(data.result.facNm);
				$('#pop02_useDate').text(data.result.useDate);
				$('#pop02_purpose').text(data.result.purpose);
				
				$('.pop02').show(0);
				$('body').bind('touchmove', function(e){e.preventDefault()});;
			},
			error: function (error) {
				alert('error: ' + error.status + ' - ' + error.statusText);
			}
		});
  	}
  	
  	
$(document).ready(function () {

})//document end
