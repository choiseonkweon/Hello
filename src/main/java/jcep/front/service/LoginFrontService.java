package jcep.front.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.MemberVO;
import jcep.front.dao.LoginFrontMapper;
import jcep.front.model.LoginFrontVO;

/**
 * @Class Name : LoginFrontService.java
 * @Description : LoginFrontService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.08           최초생성
 *
 * @since 2019.07.08
 * @version 1.0
 */

@Service("loginFrontService")
public class LoginFrontService {
	
	@Autowired
	private LoginFrontMapper loginFrontMapper;
	
	/**
	 * 로그인 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 */
	public ArrayList<LoginFrontVO> selectLoginList(MemberVO params) throws Exception{
		System.out.println("LoginFrontService ::: selectLoginList");
		return loginFrontMapper.selectLoginList(params);
	}

	/**
	 * 로그인 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public int selectLoginListTotCnt(HashMap<String,String> login) throws Exception {
		return loginFrontMapper.selectLoginListTotCnt(login);
	}

	/**
	 * 로그인 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 */
	public String selectLoginListMemberStCd(MemberVO params, HttpSession session) throws Exception {
		System.out.println("LoginFrontService ::: selectLoginListTotCnt");
		
		//Map<String, String> loginDto = new HashMap<>();
		
		//loginDto.put("userId", loginFrontVO.getUserId());
		//loginDto.put("passwd", loginFrontVO.getPasswd());
		//System.out.println("userId :2: " + loginFrontVO.getUserId());
		//System.out.println("passwd :2: " + loginFrontVO.getPasswd());
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberPw", params.getMemberPw());
		
		String memberId = params.getMemberId();
		String memberPw = params.getMemberPw();
		System.out.println("LoginFrontService _ memberId ::: " + memberId);
		System.out.println("LoginFrontService _ memberPw :: " + memberPw);
		
		return loginFrontMapper.selectLoginListMemberStCd(params);
	}
	
	
	

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertInsert(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertInsert(params);
	}


	/**
	 * 회원을 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberInsert(Map<String, Object> params,MultipartHttpServletRequest mRequest) throws Exception{
		Integer returnCode = 0;
		returnCode  =  loginFrontMapper.memberInsert(params);
		if(returnCode > 0) {
			
			if("000001".equals(params.get("joinTypeCd"))) { // 기업
				returnCode  = loginFrontMapper.memberExpertInsertEnterprise(params);	      
				
			}else if("000002".equals(params.get("joinTypeCd"))){ // 전문가
				
				List<Map<String,Object>> fileData = UploadFileUtils.getFileUpload(mRequest,params.get("filePath").toString());

				params.put("fileCourse", fileData.get(0).get("fileCourse").toString());
				params.put("orgFileNm", "/"+ fileData.get(0).get("orgFileNm").toString());				
				
				returnCode = loginFrontMapper.memberExpertInsertExpert(params);
			}else if("000003".equals(params.get("joinTypeCd"))) { // 바이어
				
				returnCode = loginFrontMapper.memberBuyerInsertEnterprise(params);  
			}
		}
		      
		return returnCode;
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdate(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateExpert(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdateExpert(params);
	}
	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateInformation(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdateInformation(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdateInformation1(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdateInformation1(params);
	}
	
	/**
	 * 기업회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberEnterpriseUpdate(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberEnterpriseUpdate(params);
	}

	/**
	 * 기업회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberEnterpriseUpdateInformation(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberEnterpriseUpdateInformation(params);
	}

	/**
	 * 바이어회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberBuyerUpdate(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberBuyerUpdate(params);
	}

	/**
	 * 바이어회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberBuyerUpdateInformation(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberBuyerUpdateInformation(params);
	}
	
	

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate1(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdate1(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberExpertUpdate2(MemberVO params) throws Exception{
		
		return loginFrontMapper.memberExpertUpdate2(params);
	}

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer myCompanyInformationUpdate(MemberVO params) throws Exception{
		
		return loginFrontMapper.myCompanyInformationUpdate(params);
	}
	


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03U(params);
	}

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U11(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03U11(params);
	}

	/**
	 * 내 바이어 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectJoinStep03U111(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03U111(params);
	}
	
	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03Test(params);
	}

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test2(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03Test2(params);
	}

	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public int selectJoinStep03Test3(MemberVO params, HttpSession session) throws Exception{
		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return loginFrontMapper.selectJoinStep03Test3(params);
	}
	
	


	/**
	 * 내 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectJoinStep03U1(MemberVO params) throws Exception{
		
		/*session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);*/
		
		
		return loginFrontMapper.selectJoinStep03U1(params);
	}	

	public int myCompanyInformationEmployeeInsert(MemberVO memberVo) throws Exception{
		return loginFrontMapper.myCompanyInformationEmployeeInsert(memberVo);
	}
	public int myCompanyInformationJecpInsert(MemberVO memberVo) throws Exception{
		return loginFrontMapper.myCompanyInformationJecpInsert(memberVo);
	}
	
	public MemberVO loginData(HashMap<String,String> login) throws Exception{
		return loginFrontMapper.loginData(login);
	}

}






