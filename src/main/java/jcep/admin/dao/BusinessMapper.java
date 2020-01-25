package jcep.admin.dao;

import java.util.ArrayList;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jcep.admin.model.BusinessVO;


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
public interface BusinessMapper {

	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessSupportBenefitList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessSupportBenefitListTotCnt(BusinessVO params) throws Exception;
	
	/**
	 * 시설 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessSupportBenefitDetailList(Map<String, Object> params) throws Exception;	
	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessContentPerformList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessContentPerformListTotCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessIntltProptyList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 지적재산권현황 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessIntltProptyListTotCnt(BusinessVO params) throws Exception;		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업유치,창업현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessAttractList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업유치,창업현황 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessAttractListTotCnt(BusinessVO params) throws Exception;		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraResourFaciUseResultList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessInfraResourFaciUseResultListTotCnt(BusinessVO params) throws Exception;			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 >기업입주현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraEnterpriseList(BusinessVO params) throws Exception;
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 기업입주현황 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessInfraEnterpriseListTotCnt(BusinessVO params) throws Exception;		
	
	/**
	 * 사업찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBussSearchList(BusinessVO params) throws Exception;
	
	/**
	 * 기업찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectEntprSearchList(BusinessVO params) throws Exception;		
	
	/**
	 * 지원사업수혜실적정보 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectJcepBenefitPerformCnt(Map<String,Object> params) throws Exception;		
	
	
	/**
	 * 지원사업수혜실적정보 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepBenefitPerform(Map<String, Object> params) throws Exception;		
	
	/**
	 * 지원사업수혜실적정보 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepBenefitPerform(Map<String, Object> params) throws Exception;		

	/**
	 * 지원사업수혜실적정보 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepBenefitPerform(Map<String, Object> params) throws Exception;		
	
}
