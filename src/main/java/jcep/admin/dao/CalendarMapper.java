package jcep.admin.dao;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;


/**
 * @Class Name : BusinessMapper.java
 * @Description : 사업관리에 대한 데이터처리 매퍼 클래스
 * @Modification Information 
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.18           최초생성
 *
 * @since 2019.06.18
 * @version 1.0
 */

@Mapper
public interface CalendarMapper {

	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public List<HashMap<String,Object>> testCalendarList(HashMap<String,Object> map);
}
