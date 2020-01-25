package jcep.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcep.admin.dao.BusinessMapper;
import jcep.admin.model.BusinessVO;
import jcep.admin.model.FacilityResourceVO;


/**
 * @Class Name : BusinessService.java
 * @Description : BusinessService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.18           최초생성
 *
 * @since 2019.06.18
 * @version 1.0
 */

    @Service("businessService")
    public class BusinessService {

	@Autowired
    private BusinessMapper businessMapper;

	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessSupportBenefitList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessSupportBenefitList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessSupportBenefitListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessSupportBenefitListTotCnt(params);
	}
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessSupportBenefitDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessSupportBenefitDetailList(params);
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessContentPerformList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessContentPerformList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessContentPerformListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessContentPerformListTotCnt(params);
	}	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessIntltProptyList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessIntltProptyList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessIntltProptyListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessIntltProptyListTotCnt(params);
	}		
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업유치,창업현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessAttractList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessAttractList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업유치,창업현황  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessAttractListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessAttractListTotCnt(params);
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설활용실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraResourFaciUseResultList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraResourFaciUseResultList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessInfraResourFaciUseResultListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraResourFaciUseResultListTotCnt(params);
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설활용실적 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraEnterpriseList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraEnterpriseList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessInfraEnterpriseListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraEnterpriseListTotCnt(params);
	}			
	
	/**
	 * 사업찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBussSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectBussSearchList(params);
   }	
	
	/**
	 * 기업찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectEntprSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectEntprSearchList(params);
   }	
	
	/**
	 * 지원사업수혜실적정보 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectJcepBenefitPerformCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectJcepBenefitPerformCnt(params);
	}
	
	/**
	 * 지원사업수혜실적정보 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int benefitPerformSave(List<Map<String,Object>> params,String bussAnncemntNo) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
       
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("memberId").toString());
        	
        	// 수혜사업 조회
        	if(selectJcepBenefitPerformCnt(map) > 0) {
        		// 존재  update or delete
        		updateJcepBenefitPerform(map);
        		
        	}else {// 미존재  insert
        		insertJcepBenefitPerform(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("bussAnncemntNo", bussAnncemntNo);
        delMap.put("memberId", delCheckMemId);
        
        deleteJcepBenefitPerform(delMap);		
		
		return result;
	}	
	
	
	/**
	 * 지원사업수혜실적정보 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepBenefitPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.insertJcepBenefitPerform(params);
	}	
	
	/**
	 * 지원사업수혜실적정보 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepBenefitPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.updateJcepBenefitPerform(params);
	}		
	
	/**
	 * 지원사업수혜실적정보 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepBenefitPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteJcepBenefitPerform(params);
	}			
}
