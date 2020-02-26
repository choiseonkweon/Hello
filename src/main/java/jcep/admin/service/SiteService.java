package jcep.admin.service;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import jcep.admin.dao.SiteMapper;
import jcep.admin.model.SiteVO;


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

@Service("siteService")
public class SiteService {

	@Autowired
    private SiteMapper siteMapper;
	
	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 공지사항 목록
	 * @exception Exception
	 */
	public ArrayList<SiteVO> selectNoticeList(SiteVO params) throws Exception {
		return siteMapper.selectNoticeList(params);
	}
	
	/**
	 * 공지사항 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 공지사항 목록 총 갯수
	 * @exception
	 */
	public int selectNoticeListTotCnt(SiteVO params) throws Exception {
		return siteMapper.selectNoticeListTotCnt(params);
	}
	
	/**
	 * 공지사항 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 공지사항 상세
	 * @exception Exception
	 */
	public SiteVO selectNoticeDetail(SiteVO params) throws Exception {
    	return siteMapper.selectNoticeDetail(params);
    }
	
	/**
	 * 공지사항을 등록한다.
	 * @param params - 수정할 정보가 담긴 SiteVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer noticeInsert(SiteVO params) throws Exception{
		 return siteMapper.noticeInsert(params);
	}

	/**
	 * 공지사항을 수정한다.
	 * @param params - 수정할 정보가 담긴 SiteVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer noticeUpdate(SiteVO params) throws Exception{
		 return siteMapper.noticeUpdate(params);
	}
	
	
	
	/**
	 * 공지사항 파일 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer noticeFileUpload(SiteVO params) throws Exception {
    	return siteMapper.noticeFileUpload(params);
    }

	
	/**
	 * FAQ목록을 조회한다.
	 * @param
	 * @return 
	 * @return 
	 * @return Integer형
	 * @exception Exception
	 */


	public List<Map<String, String>> selectFaqList(SiteVO paramList) {
		return siteMapper.selectFaqList(paramList);
	}

	public Map<String, Object> selectFaqDetail(Map<String, Object> paramList) {
		return siteMapper.selectFaqDetail(paramList);
	}
	
	public Integer selectFaqInsert(Map<String, Object> paramList) {
		return siteMapper.selectFaqInsert(paramList);
	}

	public Integer selectfaqUpdate(Map<String, Object> paramList) {
		return siteMapper.selectfaqUpdate(paramList);
	}


	public int selectFaqListTotCnt(SiteVO paramList) {
		return siteMapper.selectFaqListTotCnt(paramList);
	}

	public Integer faqFileUpload(SiteVO paramList) {
		return siteMapper.faqFileUpload(paramList);
	}

	public List<Map<String, String>> selectFaqListTotal() {
		return siteMapper.selectFaqListTotal();
	}





		
	







	
/*
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
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 *//*
	public ArrayList<FacilityResourceVO> selectResourceList(FacilityResourceVO params) throws Exception {
   	return facilityResourceMapper.selectResourceList(params);
   }
   
	*//**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 *//*
	public int selectResourceListTotCnt(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectResourceListTotCnt(params);
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
	}
	*/
}


