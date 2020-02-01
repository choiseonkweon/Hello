package jcep.front.dao;

import java.util.ArrayList;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jcep.admin.model.MemberVO;
import jcep.front.model.FacilityResourceFrontVO;


/**
 * @Class Name : FacilityResourceFrontMapper.java
 * @Description : 시설및자원관리에 대한 데이터처리 매퍼 클래스
 * @Modification Information 
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.08           최초생성
 *
 * @since 2019.07.08
 * @version 1.0
 */

@Mapper
public interface FacilityResourceFrontMapper {

	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectFacilityUseList(FacilityResourceFrontVO params) throws Exception;

	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectFacilityUseDetailList(FacilityResourceFrontVO params) throws Exception;	
	
	/**
	 * 시설신청.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public Integer resourFacilityApplInsert(FacilityResourceFrontVO params) throws Exception;	
	
	/**
	 * 시설 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectFacilityUseListTotCnt(FacilityResourceFrontVO params) throws Exception;
	
	/**
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceUseList(FacilityResourceFrontVO params) throws Exception;

	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectResourceUseDetailList(FacilityResourceFrontVO params) throws Exception;		
	
	/**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public int selectResourceUseListTotCnt(FacilityResourceFrontVO params) throws Exception;
	
	/**
	 * 시설신청 & 자원신청 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceFacilityCalendarList(FacilityResourceFrontVO params) throws Exception;	

	/**
	 * 시설신청 & 자원신청 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceFacilityCalendarList2(FacilityResourceFrontVO params) throws Exception;	

	/**
	 * 온라인 지원 신청하기 한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public Integer onlineInsert(MemberVO params) throws Exception;
	
	/*
	*//**
	 * 시설정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer facilityInsert(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 시설 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer facilityImageUpload(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 자원정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceInsert(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 자원정보를 삭젠한다.
	 * @param params - 삭제할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceDelete(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 자원 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer resourceImageUpload(FacilityResourceVO params) throws Exception;*/
	
}
