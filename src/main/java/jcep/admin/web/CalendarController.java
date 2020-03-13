package jcep.admin.web;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jcep.admin.service.CalendarService;

/**
 * @Class Name : CalendarController.java
 * @Description : Calendar Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.03.03           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class CalendarController {

	@Resource(name = "calendarService")
	protected CalendarService calendarService;

			// 캘린더
		@RequestMapping(value = "/schedule/scheduleMain.do", produces="text/plain;charset=utf-8")
		public ModelAndView  scheduleMain(@RequestParam(required=false) Map<String, String> map) throws Exception {
			ModelAndView mav = new ModelAndView();

			mav.setViewName("/view/scheduleMain");
			return mav;
		}		
		
		@RequestMapping(value = "/schedule/CalendarList.do", produces="text/plain;charset=utf-8")
		public ModelAndView  CalendarList(@RequestParam(required=false) HashMap<String, Object> map) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			Calendar calendar = Calendar.getInstance();
			int month = Integer.valueOf((String) map.get("month"));
			int year =Integer.valueOf((String) map.get("year"));
			if(month==0) {
				year = calendar.get(Calendar.YEAR);	//현재년도
				month = calendar.get(Calendar.MONTH);	//현재월'
				map.put("year", year);
				map.put("month", month+1);
			}else if(month>0) {
				month = Integer.valueOf((String) map.get("month"));
				year =Integer.valueOf((String) map.get("year"));

				month--; //month는 0부터 시작기때문에 실제month에서 -1
			} 
			calendar.set(year,month, 1);
			int startDay = calendar.get(Calendar.DAY_OF_WEEK);
			int MaxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

			int prevDay = 0; //이전달 마지막일 구하기
			if(month==0) {
				calendar.set(year-1,11, 1);
				prevDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);				
			}else {
				calendar.set(year,month-1, 1);
				prevDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);				
			}
			List<HashMap<String,Object>> list = calendarService.testCalendarList(map);


			mav.addObject("list",list);
			mav.addObject("year",year);
			mav.addObject("month",month+1);
			mav.addObject("startDay",startDay);
			mav.addObject("MaxDay",MaxDay);
			mav.addObject("prevDay",prevDay);
			return mav;
		}		
		
		



		
}
