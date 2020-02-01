package jcep.admin.dao;

import java.util.ArrayList;
import java.util.List;
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

	/* 기업지원 - 지원사업수혜실적 */	
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
	 * 기업찾기 - 지원사업수혜실적
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBenefitPerformEntprSearchList(BusinessVO params) throws Exception;		

	
	public int selectBenefitPerformEntprSearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectBenefitPerformEntprSelectList(BusinessVO params) throws Exception;		
	
	/**
	 * 지원사업수혜실적정보 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectJcepBenefitPerformCnt(Map<String,Object> params) throws Exception;		
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectBenefitEnterpriseIdx(BusinessVO params) throws Exception;			
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
	
	
	/* 기업지원 - 콘텐츠개발 및 제작지원실적 */	
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
	 * 시설 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessContentPerformDetailList(Map<String, Object> params) throws Exception;		
	
	/**
	 * 기업찾기 - 콘텐츠
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectContentPerformEntprSearchList(BusinessVO params) throws Exception;			
	
	public int selectContentPerformEntprSearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectContentPerformEntprSelectList(BusinessVO params) throws Exception;			
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectContentEnterpriseIdx(BusinessVO params) throws Exception;		
	
	/**
	 * 콘텐츠개발 및 제작지원실적 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectJcepContentPerformCnt(Map<String,Object> params) throws Exception;		
	
	
	/**
	 * 콘텐츠개발 및 제작지원실적 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepContentPerform(Map<String, Object> params) throws Exception;		
	
	/**
	 * 콘텐츠개발 및 제작지원실적 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepContentPerform(Map<String, Object> params) throws Exception;		

	/**
	 * 콘텐츠개발 및 제작지원실적 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepContentPerform(Map<String, Object> params) throws Exception;			
	
	
	/* 기업지원 - 지적재산권현황 */		
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
	 * 시설 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessIntltProptyDetailList(Map<String, Object> params) throws Exception;		
	
	
	/**
	 * 실적찾기 - 지적재산권현황
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectIntltProptySearchList(BusinessVO params) throws Exception;			
	
	public int selectIntltProptySearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 실적선택 - 지적재산권현황
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectIntltProptySelectList(BusinessVO params) throws Exception;		
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectIntltEnterpriseIdx(BusinessVO params) throws Exception;	
	
	/**
	 * 지적재산권현황 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectJcepIntltProptyCnt(Map<String,Object> params) throws Exception;		
	
	
	/**
	 * 지적재산권현황 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepIntltPropty(Map<String, Object> params) throws Exception;		
	
	/**
	 * 지적재산권현황 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepIntltPropty(Map<String, Object> params) throws Exception;		

	/**
	 * 지적재산권현황 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepIntltPropty(Map<String, Object> params) throws Exception;		
	
	/* 기업지원 - 기업유치,창업현황 */			
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
	 * 시설 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessAttractDetailList(Map<String, Object> params) throws Exception;		
	
	/**
	 * 기업찾기 - 기업유치,창업
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBussAttractEntprSearchList(BusinessVO params) throws Exception;			
	
	public int selectBussAttractEntprSearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 기업선택 - 기업유치,창업
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectBussAttractEntprSelectList(BusinessVO params) throws Exception;		
	
	/**
	 * 기업유치,창업 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectJcepBussAttractCnt(Map<String,Object> params) throws Exception;		
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectAttractEnterpriseIdx(BusinessVO params) throws Exception;		
	
	/**
	 * 기업유치,창업 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepBussAttract(Map<String, Object> params) throws Exception;		
	
	/**
	 * 기업유치,창업 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepBussAttract(Map<String, Object> params) throws Exception;		

	/**
	 * 기업유치,창업 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepBussAttract(Map<String, Object> params) throws Exception;			
	
	/**
	 * 사업찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBussSearchList(BusinessVO params) throws Exception;
	
	public int selectBussSearchListCnt(BusinessVO params) throws Exception;
	

	
	
/* 인프라 지원 - 장비,시설 */
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
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraResourFaciUseResultDetailList(Map<String, Object> params) throws Exception;			

	/**
	 * 기업찾기 - 지원사업수혜실적
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBussInfraResourFaciSearchList(BusinessVO params) throws Exception;		

	
	public int selectBussInfraResourFaciSearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectBussInfraResourFaciSelectList(BusinessVO params) throws Exception;		
	
	/**
	 * 기업유치,창업 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectBussInfraResourFaciCnt(Map<String,Object> params) throws Exception;		
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectResourceEnterpriseIdx(BusinessVO params) throws Exception;		
	
	/**
	 * 기업유치,창업 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertBussInfraResourFaci(Map<String, Object> params) throws Exception;		
	
	/**
	 * 기업유치,창업 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateBussInfraResourFaci(Map<String, Object> params) throws Exception;		

	/**
	 * 기업유치,창업 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteBussInfraResourFaci(Map<String, Object> params) throws Exception;		
	
/* 인프라지원 - 기업입주 */
	
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
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraEnterpriseDetailList(Map<String, Object> params) throws Exception;			

	/**
	 * 기업찾기 - 지원사업수혜실적
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBussInfraEntprResourFaciSearchList(BusinessVO params) throws Exception;		

	
	public int selectBussInfraEntprResourFaciSearchListCnt(BusinessVO params) throws Exception;	
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public ArrayList<Map<String,Object>> selectBussInfraEntprResourFaciSelectList(BusinessVO params) throws Exception;		
	
	/**
	 * 기업유치,창업 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적정보 총 갯수
	 * @exception
	 */
	public int selectBussInfraEnterpriseCnt(Map<String,Object> params) throws Exception;		
	
	
	/**
	 * idx채번
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 
	 * @exception
	 */	
	public String selectMoveInEnterpriseIdx(BusinessVO params) throws Exception;	
	
	/**
	 * 기업유치,창업 등록한다.
	 * @param params - 등록정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertBussInfraEnterprise(Map<String, Object> params) throws Exception;		
	
	/**
	 * 기업유치,창업 수정한다.
	 * @param params - 수정정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateBussInfraEnterprise(Map<String, Object> params) throws Exception;		

	/**
	 * 기업유치,창업 삭제한다.
	 * @param params - 삭제정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteBussInfraEnterprise(Map<String, Object> params) throws Exception;		
	
	/**
	 * 장비명검색 코드 조회
	 * @return List
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectResourFaciCodeList(BusinessVO params) throws Exception;		
}
