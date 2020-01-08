package jcep.front.dao;

import java.util.ArrayList;
import java.util.HashMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jcep.admin.model.MemberVO;
import jcep.front.model.LoginFrontVO;


/**
 * @Class Name : LoginFrontMapper.java
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
public interface LoginFrontMapper {

	/**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<LoginFrontVO> selectLoginList(MemberVO params) throws Exception;
	
	
	/**
	 * 로그인 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public int selectLoginListTotCnt(HashMap<String,String> login) throws Exception;
	

	/**
	 * 로그인 승인를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public String selectLoginListMemberStCd(MemberVO params) throws Exception;
	
	

	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertInsert(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertInsertExpert(MemberVO params) throws Exception;

	
	/**
	 * 전문가 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberEnterpriseInsert(MemberVO params) throws Exception;

	
	/**
	 * 전문가 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertInsertEnterprise(MemberVO params) throws Exception;
	
	/**
	 * 바이어 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberBuyerInsert(MemberVO params) throws Exception;

	
	/**
	 * 바이어 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberBuyerInsertEnterprise(MemberVO params) throws Exception;

	
	
	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertInsert2(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateExpert(MemberVO params) throws Exception;

	
	/**
	 * 전문가 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateInformation(MemberVO params) throws Exception;
	

	/**
	 * 전문가 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateInformation1(MemberVO params) throws Exception;
	

	/**
	 * 기업 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberEnterpriseUpdate(MemberVO params) throws Exception;
	

	/**
	 * 기업 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberEnterpriseUpdateInformation(MemberVO params) throws Exception;

	/**
	 * 바이어 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberBuyerUpdate(MemberVO params) throws Exception;
	

	/**
	 * 바이어 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberBuyerUpdateInformation(MemberVO params) throws Exception;
	
	

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate1(MemberVO params) throws Exception;
	

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate2(MemberVO params) throws Exception;


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer myCompanyInformationUpdate(MemberVO params) throws Exception;
	
	


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test(MemberVO params) throws Exception;
	

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test2(MemberVO params) throws Exception;
	

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test3(MemberVO params) throws Exception;
	
	

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U(MemberVO params) throws Exception;


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U11(MemberVO params) throws Exception;

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U111(MemberVO params) throws Exception;


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectJoinStep03U1(MemberVO params) throws Exception;	
	

	/**
	 * 내기업 정보 > 기업사워정보 추가
	 * @param params - 추가할 정보가 담긴 MemberVO
	 * @return int
	 * @exception Exception
	 */
	public int myCompanyInformationEmployeeInsert(MemberVO searchVo) throws Exception; 

	public int myCompanyInformationJecpInsert(MemberVO searchVo) throws Exception; 

	public MemberVO loginData(HashMap<String, String> login) throws Exception;

}
