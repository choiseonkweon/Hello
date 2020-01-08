package jcep.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcep.admin.dao.FacilityResourceMapper;
import jcep.admin.model.FacilityResourceVO;

/**
 * @Class Name : FacilityResourceService.java
 * @Description : FacilityResourceService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.18           최초생성
 *
 * @since 2019.06.18
 * @version 1.0
 */

@Service("facilityResourceService")
public class FacilityResourceService {

	@Autowired
    private FacilityResourceMapper facilityResourceMapper;

	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceVO> selectFacilityList(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectFacilityList(params);
   }
   
	/**
	 * 시설 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 */
	public int selectFacilityListTotCnt(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectFacilityListTotCnt(params);
	}
	
	/**
	 * 시설정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer facilityInsert(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.facilityInsert(params);
	}
	
	/**
	 * 시설 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public Integer facilityImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.facilityImageUpload(params);
    }
	
	/**
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 */
	public ArrayList<FacilityResourceVO> selectResourceList(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectResourceList(params);
   }
   
	/**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public int selectResourceListTotCnt(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectResourceListTotCnt(params);
	}
	
	/**
	 * 자원정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer resourceInsert(FacilityResourceVO params) throws Exception{
		return facilityResourceMapper.resourceInsert(params);
	}
	
	/**
	 * 자원 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public Integer resourceImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.resourceImageUpload(params);
    }
	
	/**
	 * 자원정보를 삭제한다.
	 * @param params - 삭제할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer resourceDelete(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.resourceDelete(params);
	}
	
}
