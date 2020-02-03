package jcep.front.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;
import jcep.front.dao.FacilityResourceFrontMapper;
import jcep.front.model.FacilityResourceFrontVO;

/**
 * @Class Name : FacilityResourceFrontService.java
 * @Description : FacilityResourceFrontService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.08           최초생성
 *
 * @since 2019.07.08
 * @version 1.0
 */

@Service("facilityResourceFrontService")
public class FacilityResourceFrontService {

	@Autowired
    private FacilityResourceFrontMapper facilityResourceFrontMapper;
	
	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectFacilityUseList(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectFacilityUseList(params);
    }

	
	/**
	 * 시설 상세을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectFacilityUseDetailList(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectFacilityUseDetailList(params);
    }	

	
	/**
	 * 시설신청
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public Integer resourFacilityApplInsert(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.resourFacilityApplInsert(params);
    }	
	
	/**
	 * 시설 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectFacilityUseListTotCnt(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectFacilityUseListTotCnt(params);
	}
	
	/**
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceUseList(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectResourceUseList(params);
    }
	
	/**
	 * 시설 상세을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectResourceUseDetailList(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectResourceUseDetailList(params);
    }	
	
	
	/**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public int selectResourceUseListTotCnt(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectResourceUseListTotCnt(params);
	}
	
	
	/**
	 * 시설신청 & 자원신청 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceFacilityCalendarList(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectResourceFacilityCalendarList(params);
    }	

	/**
	 * 시설신청 & 자원신청 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceFrontVO> selectResourceFacilityCalendarList2(FacilityResourceFrontVO params) throws Exception {
		return facilityResourceFrontMapper.selectResourceFacilityCalendarList2(params);
	}	
	
	/**
	 * 온라인지원 신청하기 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer onlineInsert(MemberVO params) throws Exception{
		
		return facilityResourceFrontMapper.onlineInsert(params);
	}
	
	public  ArrayList<FacilityResourceFrontVO> selectFacilityApplicateList(FacilityResourceFrontVO params)throws Exception{
		return facilityResourceFrontMapper.selectFacilityApplicateList(params);
	}
	
	public  int selectFacilityApplicateListTotCnt(FacilityResourceFrontVO params)throws Exception{
		return facilityResourceFrontMapper.selectFacilityApplicateListTotCnt(params);
	}
	
	/*
	*
	*//**
	 * 시설정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer facilityInsert(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.facilityInsert(params);
	}
	
	*//**
	 * 시설 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer facilityImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.facilityImageUpload(params);
    }
	
   
	*//**
	 * 자원정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceInsert(FacilityResourceVO params) throws Exception{
		return facilityResourceMapper.resourceInsert(params);
	}
	
	*//**
	 * 자원 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer resourceImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.resourceImageUpload(params);
    }
	
	*//**
	 * 자원정보를 삭제한다.
	 * @param params - 삭제할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceDelete(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.resourceDelete(params);
	}*/
	
}
