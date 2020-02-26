package jcep.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;


/**
 * @Class Name : EnterpriseBuyerExpertMapper.java
 * @Description : 기업정보관리에 대한 데이터처리 매퍼 클래스
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.21           최초생성
 *
 * @since 2019.06.21
 * @version 1.0
 */

@Mapper
public interface EnterpriseBuyerExpertMapper {
	
	/**
	 * 바이어정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerInsert(EnterpriseBuyerExpertVO params) throws Exception;
	
	/**
	 * 바이어 멤버 정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerMemberInsert(EnterpriseBuyerExpertVO params) throws Exception;

	
	
	/**
	 * 바이어 히스토리 정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */

	/**
	 * 바이어 멤버 정보를 수정한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerUpdate(EnterpriseBuyerExpertVO params) throws Exception;
	

	
	
	/**
	 * 바이어 히스토리 정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	
	
	
	public void buyerInsertHist(EnterpriseBuyerExpertVO params) throws Exception;

	
	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 *//*
	public ArrayList<FacilityResourceVO> selectFacilityList(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 시설 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 *//*
	public int selectFacilityListTotCnt(FacilityResourceVO params) throws Exception;
	
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
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 *//*
	public ArrayList<FacilityResourceVO> selectResourceList(FacilityResourceVO params) throws Exception;
	
	*//**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 *//*
	public int selectResourceListTotCnt(FacilityResourceVO params) throws Exception;
	
	
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

	/**
	 * 기업 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public HashMap<String,String> enterpriseInformationManagementDetail(String params) throws Exception;
	/**
	 * 성과관리 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public List<HashMap<String,String>> enterpriseInformationManagementResultList(MemberVO params) throws Exception ;
	/**
	 *  진흥원 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public List<HashMap<String,String>> enterpriseInformationManagementAnncemntApplList(MemberVO params) throws Exception ;
	/**
	 * 지적재산권 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public List<HashMap<String,String>> enterpriseInformationManagementProptyList(MemberVO params) throws Exception ;
	/**
	 * 기업사원 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public List<HashMap<String,String>> enterpriseInformationManagementEmployeeList(MemberVO params) throws Exception ;
	/*
	 * 성과관리 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public int enterpriseInformationManagementResultListCnt(MemberVO params) throws Exception ;
	/**
	 *  진흥원 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public int enterpriseInformationManagementAnncemntApplListCnt(MemberVO params) throws Exception ;
	/**
	 * 지적재산권 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public int enterpriseInformationManagementProptyListCnt(MemberVO params) throws Exception ;
	/**
	 * 기업사원 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 기업상세정보
	 * @exception Exception
	 */
	public int enterpriseInformationManagementEmployeeListCnt(MemberVO params) throws Exception ;
	
	
	/**
	 * 기업 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectEnterpriseInformationManagementRegisterUpdateHist(MemberVO params) throws Exception;


	/**
	 * 기업 정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void enterpriseInformationManagementInsert(MemberVO params) throws Exception;
	

	/**
	 * 기업 멤버 정보를 수정 등록 한다.
	 * @param params - 등록할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void enterpriseInformationManagementUpdate(MemberVO params) throws Exception;
	

	
	/**
	 * 바이어 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectBuyerInformationManagementRegisterUpdate(MemberVO params) throws Exception;

	/**
	 * 바이어 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectBuyerInformationManagementRegisterUpdateHist(MemberVO params) throws Exception;
	
	

	/**
	 * 기업 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectEnterPriseInformationList(MemberVO params) throws Exception;
	
	/**
	 * 기업 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectEnterPriseInformationListTotCnt(MemberVO params) throws Exception;

	/**
	 * 바이어 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBuyerInformationManagementList(MemberVO params) throws Exception;
	
	/**
	 * 바이어 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectBuyerInformationManagementListTotCnt(MemberVO params) throws Exception;


	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessManagementList(MemberVO params) throws Exception;

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectBusinessManagementListTotCnt(MemberVO params) throws Exception;


	/**
	 * 관리자 사업관리 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectBusinessManagementRegisterUpeate(MemberVO params) throws Exception;
	

	/**
	 * 관리자 사업관리 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public List<MemberVO> selectBusinessManagementRegisterUpeateFile(MemberVO params) throws Exception;
	
	
	

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpeateSave(MemberVO params) throws Exception;

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton(MemberVO params) throws Exception;


	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateInsert(MemberVO params) throws Exception;
	
	
	
	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton1(MemberVO params) throws Exception;
	
	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateDelete(MemberVO params) throws Exception;

	
	
	
	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton2(MemberVO params) throws Exception;
	
	
	

	/**
	 * 관리자 사업관리 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterInsert(MemberVO params) throws Exception;

	




	/**
	 * 관리자 사업관리 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterInsertApplicStCd(MemberVO params) throws Exception;
	
	public int businessManagementRegisterInsertFile(HashMap<String,String> hMap)throws Exception;
	
	public Map<String,Object> selectBusinessManagementDetail(String parmas)throws Exception;

	public List<Map<String,Object>> selectBusinessManagementDetailFiles(String parmas)throws Exception;

	public List<Map<String,String>> selectBussAnncemntApplList(String parmas)throws Exception;
	
	public int bussAnncemntApplUpdate(Map<String,String> params)throws Exception;

	public int bussAnncemntApplDelete(Map<String,String> params)throws Exception;

	public MemberVO businessManagementDetailFileDownload(Map<String,String> params)throws Exception;

	public MemberVO businessManagementfileDownload(Map<String,String> params)throws Exception;
	
	public int businessManagementRegisterFileDelete(String params)throws Exception;
	
	public int businessManagementRegisterUpdateOk(Map<String,String> hMap)throws Exception;

	public String businessManagementFileLength(Map<String,String> hMap)throws Exception;

	public int NomberValidateCheck(Map<String,String> hMap)throws Exception;

	public List<Map<String,String>> selectEvaluList(MemberVO params)throws Exception;

	public int selectEvaluListTotCnt(MemberVO params)throws Exception;
}
