
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
import jcep.admin.model.MemberVO;


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
	 * 기업찾기 - 지원사업수혜실적
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBenefitPerformEntprSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectBenefitPerformEntprSearchList(params);
   }	
	
	public int selectBenefitPerformEntprSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBenefitPerformEntprSearchListCnt(params);
   }		
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectBenefitPerformEntprSelectList(BusinessVO params) throws Exception {
		return businessMapper.selectBenefitPerformEntprSelectList(params);
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
	 * idx 채번
	 */
	public String selectBenefitEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectBenefitEnterpriseIdx(params);
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
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectBenefitEnterpriseIdx(searchVO);
       
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("bussAnncemntNo").toString()+map.get("memberId").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}        	
        	// 수혜사업 조회
        	if(selectJcepBenefitPerformCnt(map) > 0) {
        		// 존재  update or delete
        		updateJcepBenefitPerform(map);
        		
        	}else {// 미존재  insert
        		insertJcepBenefitPerform(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("enterpriseIdx", idxMap);
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
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessContentPerformDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessContentPerformDetailList(params);
	}	
	
	
	/**
	 * 기업찾기 - 콘텐츠
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectContentPerformEntprSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectContentPerformEntprSearchList(params);
   }		
	
	public int selectContentPerformEntprSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectContentPerformEntprSearchListCnt(params);
   }		
	
	/**
	 * 기업찾기 - 기업선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectContentPerformEntprSelectList(BusinessVO params) throws Exception {
		return businessMapper.selectContentPerformEntprSelectList(params);
	}	
	
	/**
	 * 콘텐츠개발 및 제작지원실적 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectJcepContentPerformCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectJcepContentPerformCnt(params);
	}
	
	/**
	 * idx 채번
	 */
	public String selectContentEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectContentEnterpriseIdx(params);
   }		
	
	/**
	 * 콘텐츠개발 및 제작지원실적 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int contentPerformSave(List<Map<String,Object>> params) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectContentEnterpriseIdx(searchVO);        
       
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("bussAnncemntNo").toString()+map.get("memberId").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}
        	
        	// 수혜사업 조회
        	if(selectJcepContentPerformCnt(map) > 0) {
        		// 존재  update or delete
        		updateJcepContentPerform(map);
        		
        	}else {// 미존재  insert
        		insertJcepContentPerform(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("memberId", delCheckMemId);
        delMap.put("enterpriseIdx", idxMap);
        
        deleteJcepContentPerform(delMap);		
		
		return result;
	}	
	
	
	/**
	 * 콘텐츠개발 및 제작지원실적 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepContentPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.insertJcepContentPerform(params);
	}	
	
	/**
	 * 콘텐츠개발 및 제작지원실적 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepContentPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.updateJcepContentPerform(params);
	}		
	
	/**
	 * 콘텐츠개발 및 제작지원실적 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepContentPerform(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteJcepContentPerform(params);
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
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessIntltProptyDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessIntltProptyDetailList(params);
	}		
	
	/**
	 * 실적찾기 - 지적재산권현황
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectIntltProptySearchList(BusinessVO params) throws Exception {
		return businessMapper.selectIntltProptySearchList(params);
   }		
	
	public int selectIntltProptySearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectIntltProptySearchListCnt(params);
   }		
	
	/**
	 * 실적선택 - 지적재산권현황
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectIntltProptySelectList(BusinessVO params) throws Exception {
		return businessMapper.selectIntltProptySelectList(params);
	}		
	
	/**
	 * 지적재산권현황 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectJcepIntltProptyCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectJcepIntltProptyCnt(params);
	}
	
	/**
	 * idx 채번
	 */
	public String selectIntltEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectIntltEnterpriseIdx(params);
   }		
	/**
	 * 지적재산권현황 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int bussIntltProptySave(List<Map<String,Object>> params) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
       
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectIntltEnterpriseIdx(searchVO);        
        
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("intltIdx").toString()+map.get("memberId").toString()+map.get("bussAnncemntNo").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}         	
        	// 수혜사업 조회
        	if(selectJcepIntltProptyCnt(map) > 0) {
        		// 존재  update or delete
        		updateJcepIntltPropty(map);
        		
        	}else {// 미존재  insert
        		insertJcepIntltPropty(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("enterpriseIdx", idxMap);
        delMap.put("memberId", delCheckMemId);
        
        deleteJcepIntltPropty(delMap);		
		
		return result;
	}	
	
	
	/**
	 * 지적재산권 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepIntltPropty(Map<String,Object> params) throws Exception{
		 return businessMapper.insertJcepIntltPropty(params);
	}	
	
	/**
	 * 지적재산권 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepIntltPropty(Map<String,Object> params) throws Exception{
		 return businessMapper.updateJcepIntltPropty(params);
	}		
	
	/**
	 * 지적재산권 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepIntltPropty(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteJcepIntltPropty(params);
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
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessAttractDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessAttractDetailList(params);
	}		
	
	/**
	 * 기업찾기 - 기업유치,창업
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBussAttractEntprSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectBussAttractEntprSearchList(params);
   }		
	
	public int selectBussAttractEntprSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBussAttractEntprSearchListCnt(params);
   }		
	
	/**
	 * 기업선택 - 기업유치,창업
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectBussAttractEntprSelectList(BusinessVO params) throws Exception {
		return businessMapper.selectBussAttractEntprSelectList(params);
	}				
	
	
	/**
	 * 기업유치,창업 존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectJcepBussAttractCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectJcepBussAttractCnt(params);
	}	
	/**
	 * 기업유치,창업 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertJcepBussAttract(Map<String,Object> params) throws Exception{
		 return businessMapper.insertJcepBussAttract(params);
	}	
	
	/**
	 * 기업유치,창업 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateJcepBussAttract(Map<String,Object> params) throws Exception{
		 return businessMapper.updateJcepBussAttract(params);
	}		
	
	/**
	 * 기업유치,창업 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteJcepBussAttract(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteJcepBussAttract(params);
	}		
	
	/**
	 * idx 채번
	 */
	public String selectAttractEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectAttractEnterpriseIdx(params);
   }			
	
	/**
	 * 기업유치,창업 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int bussAttractSave(List<Map<String,Object>> params,String enterpriseIdx) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectAttractEnterpriseIdx(searchVO);        
       
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("memberId").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}
        	
        	// 수혜사업 조회
        	if(selectJcepBussAttractCnt(map) > 0) {
        		// 존재  update or delete
        		updateJcepBussAttract(map);
        		
        	}else {// 미존재  insert
        		insertJcepBussAttract(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("enterpriseIdx", enterpriseIdx);
        delMap.put("memberId", delCheckMemId);
        
        deleteJcepBussAttract(delMap);		
		
		return result;
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
	
	public int selectBussSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBussSearchListCnt(params);
	}		
	
	
	
/* 인프라 지원 - 장비 시설 */
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
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraResourFaciUseResultDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessInfraResourFaciUseResultDetailList(params);
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBussInfraResourFaciSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraResourFaciSearchList(params);
   }		
	
	public int selectBussInfraResourFaciSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraResourFaciSearchListCnt(params);
   }		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectBussInfraResourFaciSelectList(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraResourFaciSelectList(params);
	}	
	
	/**
	 * idx 채번
	 */
	public String selectResourceEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectResourceEnterpriseIdx(params);
   }		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int bussInfraResourFaciSave(List<Map<String,Object>> params) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
        
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectResourceEnterpriseIdx(searchVO);
        
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("resourFaciId").toString()+""+map.get("memberId").toString()+""+map.get("appliNo").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}           	
        	// 수혜사업 조회
        	if(selectBussInfraResourFaciCnt(map) > 0) {
        		// 존재  update or delete
        		updateBussInfraResourFaci(map);
        		
        	}else {// 미존재  insert
        		insertBussInfraResourFaci(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("memberId", delCheckMemId);
        delMap.put("enterpriseIdx", idxMap);
        
        deleteBussInfraResourFaci(delMap);		
		
		return result;
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBussInfraResourFaciCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectBussInfraResourFaciCnt(params);
	}	
	
	/**
	 * 기사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertBussInfraResourFaci(Map<String,Object> params) throws Exception{
		 return businessMapper.insertBussInfraResourFaci(params);
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateBussInfraResourFaci(Map<String,Object> params) throws Exception{
		 return businessMapper.updateBussInfraResourFaci(params);
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteBussInfraResourFaci(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteBussInfraResourFaci(params);
	}	
	
/* 인프라지원 - 기업입주 */
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 기업입주 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraEnterpriseList(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraEnterpriseList(params);
   }
   
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 기업입주  목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBusinessInfraEnterpriseListTotCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBusinessInfraEnterpriseListTotCnt(params);
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  상세 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessInfraEnterpriseDetailList(Map<String, Object> params) throws Exception {
		return businessMapper.selectBusinessInfraEnterpriseDetailList(params);
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 찾기
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBussInfraEntprResourFaciSearchList(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraEntprResourFaciSearchList(params);
   }		
	
	public int selectBussInfraEntprResourFaciSearchListCnt(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraEntprResourFaciSearchListCnt(params);
   }		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 선택
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 사업찾기 목록
	 * @exception Exception
	 */	
	public ArrayList<Map<String,Object>> selectBussInfraEntprResourFaciSelectList(BusinessVO params) throws Exception {
		return businessMapper.selectBussInfraEntprResourFaciSelectList(params);
	}	
	
	/**
	 * idx 채번
	 */
	public String selectMoveInEnterpriseIdx(BusinessVO params) throws Exception {
		return businessMapper.selectMoveInEnterpriseIdx(params);
   }			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 저장한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int bussInfraEntprResourFaciSave(List<Map<String,Object>> params) throws Exception {
		int result = 0;
		
        Map<String,Object> delMap = new HashMap<String,Object>();
        ArrayList<String> delCheckMemId = new ArrayList<String>();
        BusinessVO searchVO = new BusinessVO();
        // idx 채번 
        String idxMap = selectMoveInEnterpriseIdx(searchVO); 
        
        int idx = 0;
        for(Map<String,Object> map : params) {
        	delCheckMemId.add(map.get("resourFaciId").toString()+""+map.get("memberId").toString()+""+map.get("appliNo").toString());
        	if("".equals(map.get("enterpriseIdx"))) {
    			map.put("enterpriseIdx", idxMap);
        	}else {
        		idxMap = map.get("enterpriseIdx").toString();
        	}            	
        	// 수혜사업 조회
        	if(selectBussInfraEnterpriseCnt(map) > 0) {
        		// 존재  update or delete
        		updateBussInfraEnterprise(map);
        		
        	}else {// 미존재  insert
        		insertBussInfraEnterprise(map);
        		
        	}
        	idx++;
        	
        }
        delMap.put("memberId", delCheckMemId);
        delMap.put("enterpriseIdx", idxMap);
        
        deleteBussInfraEnterprise(delMap);		
		
		return result;
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적  존재여부 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 지원사업수혜실적 목록 총 갯수
	 * @exception
	 */
	public int selectBussInfraEnterpriseCnt(Map<String,Object> params) throws Exception {
		return businessMapper.selectBussInfraEnterpriseCnt(params);
	}	
	
	/**
	 * 기사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 등록한다.
	 * @param params - 등록 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer insertBussInfraEnterprise(Map<String,Object> params) throws Exception{
		 return businessMapper.insertBussInfraEnterprise(params);
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 수정한다.
	 * @param params - 수정 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer updateBussInfraEnterprise(Map<String,Object> params) throws Exception{
		 return businessMapper.updateBussInfraEnterprise(params);
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비,시설 활용실적 삭제한다.
	 * @param params - 삭제 정보
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer deleteBussInfraEnterprise(Map<String,Object> params) throws Exception{
		 return businessMapper.deleteBussInfraEnterprise(params);
	}
	
	/**
	 * 장비명검색 코드 조회
	 * @return List
	 * @exception Exception
	 */
	
	public  ArrayList<Map<String,Object>> selectResourFaciCodeList(BusinessVO params) throws Exception{
		return businessMapper.selectResourFaciCodeList(params);
	};	
	
}
