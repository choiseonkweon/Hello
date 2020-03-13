package jcep.admin.service;


import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcep.admin.dao.CalendarMapper;


/**
 * @Class Name : SiteService.java
 * @Description : SiteService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.19          최초생성
 *
 * @since 2019.07.19
 * @version 1.0
 */

@Service("calendarService")
public class CalendarService {

	@Autowired
    private CalendarMapper calendarMapper;
	
	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 공지사항 목록
	 * @exception Exception
	 */
	public List<HashMap<String,Object>> testCalendarList(HashMap<String,Object> map){
		return calendarMapper.testCalendarList(map);
	}
}


