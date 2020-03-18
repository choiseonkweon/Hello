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
			
			List<HashMap<String,Object>> list = calendarService.testCalendarList(map);

			mav.addObject("list",list);
			return mav;
		}		
		
		



		
}
