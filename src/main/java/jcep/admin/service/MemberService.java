package jcep.admin.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jcep.admin.dao.MemberMapper;
import jcep.admin.model.MemberVO;
import jcep.admin.model.SiteVO;

/**
 * @Class Name : MemberService.java
 * @Description : MemberService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.10           최초생성
 *
 * @since 2019.06.10
 * @version 1.0
 */

@Service("memberService")
public class MemberService {

	@Autowired
    private MemberMapper memberMapper;

	/**
	 * 회원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectMemberList(MemberVO params) throws Exception {
    	return memberMapper.selectMemberList(params);
    }
	
	/**
	 * 기업회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail(MemberVO params) throws Exception {
    	return memberMapper.selectMemberDetail(params);
    }

	/**
	 * 전문가회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail1(MemberVO params) throws Exception {
    	return memberMapper.selectMemberDetail1(params);
    }

	/**
	 * 바이어회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail2(MemberVO params) throws Exception {
    	return memberMapper.selectMemberDetail2(params);
    }

	/**
	 * 관리자 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetailAuthList(MemberVO params) throws Exception {
    	return memberMapper.selectMemberDetailAuthList(params);
    }
	
	
	/**
	 * 회원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectMemberListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectMemberListTotCnt(params);
	}
	
	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdate(MemberVO params) throws Exception{
		 return memberMapper.memberUpdate(params);
	}

	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer managerDetailAuthUpdate(MemberVO params) throws Exception{
		 return memberMapper.managerDetailAuthUpdate(params);
	}
	
	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdateOne(MemberVO params) throws Exception{
		 return memberMapper.memberUpdateOne(params);
	}

	
	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdateTwo(MemberVO params) throws Exception{
		 return memberMapper.memberUpdateTwo(params);
	}

	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdateThree(MemberVO params) throws Exception{
		 return memberMapper.memberUpdateThree(params);
	}

	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdate1(MemberVO params) throws Exception{
		 return memberMapper.memberUpdate1(params);
	}

	/**
	 * 회원정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberUpdate2(MemberVO params) throws Exception{
		 return memberMapper.memberUpdate2(params);
	}
	
	/**
	 * 회원 아이디 중복 체크
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int memberIdChk(MemberVO params) throws Exception {
		return memberMapper.memberIdChk(params);
	}

	/**
	 * 관리자 아이디 중복 체크
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int mngIdChk(MemberVO params) throws Exception {
		return memberMapper.mngIdChk(params);
	}
	
	
	
	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberInsert(MemberVO params) throws Exception{
		 return memberMapper.memberInsert(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberDetailAuthInsert(MemberVO params) throws Exception{
		 return memberMapper.memberDetailAuthInsert(params);
	}
	

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberInsertOne(MemberVO params) throws Exception{
		 return memberMapper.memberInsertOne(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberInsertTwo(MemberVO params) throws Exception{
		 return memberMapper.memberInsertTwo(params);
	}

	/**
	 * 회원정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer memberInsertThree(MemberVO params) throws Exception{
		 return memberMapper.memberInsertThree(params);
	}

	/**
	 * 회원정보를 승인한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public void memberConfirm(MemberVO params) throws Exception{
		String checkRow = params.getCheckRow();
		String[] checkRowArray = checkRow.split(",");
		MemberVO dataVO = new MemberVO();
		
		for(String str : checkRowArray) {
			dataVO.setMemberIdx(str);
			//memberMapper.memberAuthInsert(dataVO);
			memberMapper.memberConfirm(dataVO);
		}
		
	}
	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAuthList(MemberVO params) throws Exception {
    	return memberMapper.selectAuthList(params);
    }
	
	/**
	 * 권한관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAuthListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectAuthListTotCnt(params);
	}

	/**
	 * 기업정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAuthListCompanyInformationList(MemberVO params) throws Exception {
    	return memberMapper.selectAuthListCompanyInformationList(params);
    }
	
	/**
	 * 기업정보 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAuthListCompanyInformationListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectAuthListCompanyInformationListTotCnt(params);
	}


	/**
	 * 문의하기 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectContactUsList(MemberVO params) throws Exception {
    	return memberMapper.selectContactUsList(params);
    }
	
	/**
	 * 문의하기 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectContactUsListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectContactUsListTotCnt(params);
	}

	/**
	 * 문의하기 상세 내용을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectContactUsDetailList(MemberVO params) throws Exception {
    	return memberMapper.selectContactUsDetailList(params);
    }
	
	
	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectNoticeListCompanyInformationList(MemberVO params) throws Exception {
    	return memberMapper.selectNoticeListCompanyInformationList(params);
    }
	
	/**
	 * 공지사항 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectNoticeListCompanyInformationListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectNoticeListCompanyInformationListTotCnt(params);
	}

	/**
	 * 공지사항 패스워드를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public int selectContactUsListPassWd(MemberVO params) throws Exception {
    	return memberMapper.selectContactUsListPassWd(params);
    }

	/**
	 * 문의하기 정보를 등록한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 문의 목록
	 * @exception Exception
	 */
	public Integer contactUsDetailInsert(MemberVO params) throws Exception{
		
		return memberMapper.contactUsDetailInsert(params);
    }
	
	
	
	/**
	 * 회원권한을 설정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public void memberAuthSave(MemberVO params, HttpServletRequest request) throws Exception{
		
		String checkRow = params.getCheckRow();
		String checkauthTpCdAuth = params.getAuthTpCd();
		String[] checkRowArray = checkRow.split(",");
		String[] authTpCdAuthArray = checkauthTpCdAuth.split(",");
		MemberVO dataVO = new MemberVO();
		
		for(String str : checkRowArray) {
			dataVO.setAuthTpCd(authTpCdAuthArray[0]);
			dataVO.setMngId(str);
			memberMapper.memberAuthSave(dataVO);
		}
		
	}
	

	
	
	public int selectCompanyInformationListCheck(MemberVO params, HttpSession session) throws Exception {
		
		session.setAttribute("title", params.getTitle());
		session.setAttribute("field", params.getField());
		String title = params.getTitle();
		String field = params.getField();
		
		System.out.println("MemberService _ title ::: " + title);
		System.out.println("MemberService _ field ::: " + field);
		
		return memberMapper.selectCompanyInformationListCheck(params);
	}

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetail(MemberVO params) throws Exception {
    	return memberMapper.selectAuthListDetail(params);
    }

	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetailPlus(MemberVO params) throws Exception {
    	return memberMapper.selectAuthListDetailPlus(params);
    }

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetailMinus(MemberVO params) throws Exception {
    	return memberMapper.selectAuthListDetailMinus(params);
    }	
	

	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetail(MemberVO params) throws Exception {
    	return memberMapper.selectNoticeDetail(params);
    }

	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetailPlus(MemberVO params) throws Exception {
    	return memberMapper.selectNoticeDetailPlus(params);
    }

	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetailMinus(MemberVO params) throws Exception {
    	return memberMapper.selectNoticeDetailMinus(params);
    }	
	
	
	
	/**
	 * 바이어정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBuyerInformationList(MemberVO params) throws Exception {
    	return memberMapper.selectBuyerInformationList(params);
    }
	
	/**
	 * 바이어정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectBuyerInformationListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectBuyerInformationListTotCnt(params);
	}
	

	/**
	 * 전문가정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectExpertInformationList(MemberVO params) throws Exception {
    	return memberMapper.selectExpertInformationList(params);
    }
	
	/**
	 * 전문가정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectExpertInformationListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectExpertInformationListTotCnt(params);
	}
	

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBusinessAnnouncementList(MemberVO params) throws Exception {
    	return memberMapper.selectBusinessAnnouncementList(params);
    }
	
	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectselectBusinessAnnouncementListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectselectBusinessAnnouncementListTotCnt(params);
	}

	/**
	 * 사업공고정보 디테일 페이지.
	 * @param params - string 형 bussAnncemntNo
	 * @author 최선권
	 * @date 20191117
	 * @return 사업공고 상세페이지 조회
	 * @exception Exception
	 */ 
	public MemberVO selectBusinessDetail(String bussAnncemntNo) throws Exception {
		return memberMapper.selectBusinessDetail(bussAnncemntNo);
    }
	/**
	 * 사업공고에서 디테일페이지를 들어갈때 파일정보 불러온다.
	 * @author 최선권
	 * @Date 20191118
	 * @param params -  String형 bussAnncemntNo
	 * @return MemberVO
	 * @exception Exception
	 */	
	public MemberVO selectBusinessFile(String bussAnncemntNo) throws Exception {
		return memberMapper.selectBusinessFile(bussAnncemntNo);
	}

	/**
	 * 사업신청하기
	 * @param params - 회원정보가 담긴 searchVO
	 * @author 최선권
	 * @date 20191117
	 * @return 사업공고신청하기
	 * @exception Exception
	 */ 
	public int businessDetailInseert(MemberVO params) throws Exception{
		
		return memberMapper.businessDetailInseert(params);
	}

	/**
	 * 기업 정보 파일을 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public int bussFileUpload(MemberVO fileVo) {
		
		return memberMapper.bussFileUpload(fileVo);
	}
	public int bussFileCheck(MemberVO fileVo) throws Exception{
		return memberMapper.bussFileCheck(fileVo);
	}
	public int bussFileUpdate(MemberVO fileVo) throws Exception{
		return memberMapper.bussFileUpdate(fileVo);
	}

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectManageList(MemberVO params) throws Exception {
    	return memberMapper.selectManageList(params);
    }
	
/*	public Integer noticeFileUpload2(MemberVO memberVo) {
		
		return memberMapper.noticeFileUpload2(memberVo);
	}
	public int noticeFileUpdate2(MemberVO memberVo) throws Exception{
		return memberMapper.noticeFileUpdate2(memberVo);
	}*/
	
	/**
	 * 권한관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectManageListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectManageListTotCnt(params);
	}
	/**
	 * 기업 정보를 가져온다.
	 * @author 최선권
	 * @Date 20191118
	 * @param params - Session에담긴 String형 memberId
	 * @return MemberVO
	 * @exception Exception
	 */
	public MemberVO selectenterpriseDetail(String memberId) {
		return memberMapper.selectenterpriseDetail(memberId);
	}
	/**
	 * 내 원스톱 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectOnlineApply(String memberId) throws Exception{

		return memberMapper.selectOnlineApply(memberId);
	}
	

	/**
	 * 원스톱 업무일지을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusBusiness(MemberVO params) throws Exception {
    	return memberMapper.selectAdviceOnlineStatusBusiness(params);
    }

	/**
	 * 원스톱 업무일지를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	//2020-01-13 최선권 파일 업데이트 수정내용: 리턴값 / 파라미터
	public int adviceOnlineStatusBusinessUpdate(HashMap<String,Object> hMap) throws Exception{
		 return memberMapper.adviceOnlineStatusBusinessUpdate(hMap);
	}
	

	
	public int businessDetailCheck(MemberVO memberVo) throws Exception{
		return memberMapper.businessDetailCheck(memberVo);
	}
	
	/**
	 * 시설 사용신청 현황 정보를 조회한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectFacilitiesResourcesApplicationStatus(MemberVO params) throws Exception{
/*		
		session.setAttribute("memberId", params.getMemberId());
		session.setAttribute("memberId1", params.getMemberId1());
		session.setAttribute("memberIdx", params.getMemberIdx());

*/		String memberId = params.getMemberId();
		String memberId1 = params.getMemberId1();
		String memberIdx = params.getMemberIdx();
		System.out.println("selectJoinStep03U _ memberId ::: " + memberId);
		System.out.println("selectJoinStep03U _ memberId1 ::: " + memberId1);
		System.out.println("selectJoinStep03U _ memberIdx :: " + memberIdx);
		
		
		return memberMapper.selectFacilitiesResourcesApplicationStatus(params);
	}


	/**
	 * 온라인 상담신청 현황 정보를 조회한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatus(MemberVO params) throws Exception{
		return memberMapper.selectOnlineCounselingStatus(params);
	}

	/**
	 * 온라인 상담신청 현황 목록 팝업창을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 온라인 상담신청현황 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatusPopup(MemberVO params) throws Exception {
    	return memberMapper.selectOnlineCounselingStatusPopup(params);
    }

	/**
	 * 온라인 상담신청 현황 목록 팝업창을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 온라인 상담신청현황 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatusPopup1(MemberVO params) throws Exception {
    	return memberMapper.selectOnlineCounselingStatusPopup1(params);
    }
	
	
	
	/**
	 * 온라인 상담신청 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectOnlineCounselingStatusCount(MemberVO params) throws Exception {
		return memberMapper.selectOnlineCounselingStatusCount(params);
	}
	/**
	 * CommonsTable 조회
	 * @author 최선권
	 * @Date	20191121
	 * @param params - commonsTable 조회를 위한 commonsVo
	 * @return List
	 * @exception Exception
	 */
	
	public List<MemberVO> selectCommonsList(MemberVO commonsVo) throws Exception{
		return memberMapper.selectCommonsList(commonsVo);
	};

	/**
	 * 온라인상담 현황 관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAdviceOnlineStatusManagementList(MemberVO params) throws Exception {
    	return memberMapper.selectAdviceOnlineStatusManagementList(params);
    }
	
	/**
	 * 온라인상담 현황 관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAdviceOnlineStatusManagementListTotCnt(MemberVO params) throws Exception {
		return memberMapper.selectAdviceOnlineStatusManagementListTotCnt(params);
	}
	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetail(MemberVO params) throws Exception {
    	return memberMapper.selectAdviceOnlineStatusManagementDetail(params);
    }

	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetailMinus(MemberVO params) throws Exception {
    	return memberMapper.selectAdviceOnlineStatusManagementDetailMinus(params);
    }	

	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetailPlus(MemberVO params) throws Exception {
    	return memberMapper.selectAdviceOnlineStatusManagementDetailPlus(params);
    }

	/**
	 * 온라인상담 신청내용를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer adviceOnlineStatusManagementUpdate(HashMap<Object, Object> hMap) throws Exception{
		 return memberMapper.adviceOnlineStatusManagementUpdate(hMap);
	}
	
	/**
	 * 기업 정보를 가져온다.
	 * @author 최선권
	 * @Date 20191129
	 * @param params - Session에담긴 String형 memberId
	 * @return int
	 * @exception Exception
	 */
	public int selectenterpriseDetailCheck(String memberId) throws Exception{
		return memberMapper.selectenterpriseDetailCheck(memberId);
	}	
	
	public List<MemberVO> selectEnterpriseJcepBussDetail(String memberId) throws Exception{
	return memberMapper.selectEnterpriseJcepBussDetail(memberId);
	}

	public int selectEnterpriseJcepBussCheck(String memberId) throws Exception{
		return memberMapper.selectEnterpriseJcepBussCheck(memberId);
	}
	
	public List<MemberVO> selectEnterpriseInitProptyDetail(String memberId) throws Exception{
		return memberMapper.selectEnterpriseInitProptyDetail(memberId);
	}
	
	public int selectEnterpriseInitProptyCheck(String memberId) throws Exception{
		return memberMapper.selectEnterpriseInitProptyCheck(memberId);
	}
	
	
	public List<MemberVO> selectEnterpriseEmployeeDetail(String memberId) throws Exception{
		return memberMapper.selectEnterpriseEmployeeDetail(memberId);
	}
	
	public int selectEnterpriseEmployeeCheck(String memberId) throws Exception{
		return memberMapper.selectEnterpriseEmployeeCheck(memberId);
	}
	
	public int deleteEnterpriseEmployeeCheck(HashMap<String, String> hMap) throws Exception{
		return memberMapper.deleteEnterpriseEmployeeCheck(hMap);
	}

	public int deleteEnterpriseEmployeeDetail(HashMap<String, String> hMap) throws Exception{
		return memberMapper.deleteEnterpriseEmployeeDetail(hMap);
	}

	public int updateEnterpriseEmployeeCheck(MemberVO memberVo)throws Exception{
		return memberMapper.updateEnterpriseEmployeeCheck(memberVo);
	}

	public int updateEnterpriseEmployee(MemberVO memberVo)throws Exception{
		return memberMapper.updateEnterpriseEmployee(memberVo);
	}
	
	public int deleteJecpCheck(HashMap<String, String> hMap)throws Exception{
		return memberMapper.deleteJecpCheck(hMap);
	}
	
	public int deleteJecpDetail(HashMap<String, String> hMap)throws Exception{
		return memberMapper.deleteJecpDetail(hMap);
	}
	
	public int updateJecpCheck(MemberVO memberVo)throws Exception{
		return memberMapper.updateJecpCheck(memberVo);
	}

	public int updateJecp(MemberVO memberVo)throws Exception{
		return memberMapper.updateJecp(memberVo);
	}
	
	public int mypageCompanyUpdate(MemberVO memberVo) throws Exception{
		return memberMapper.mypageCompanyUpdate(memberVo);
	}
	
	public int mypageEnterpriseResultCheck(String memberId) throws Exception{
		return memberMapper.mypageEnterpriseResultCheck(memberId);
	}
	
	public List<MemberVO> mypageEnterpriseResult(String memberId) throws Exception{
		return memberMapper.mypageEnterpriseResult(memberId);
	}
	
	
	public int deletememberEnterpriseResultCheck(HashMap<String, String> hMap) throws Exception{
		return memberMapper.deletememberEnterpriseResultCheck(hMap);
	}
	
	public int deletememberEnterpriseResult(HashMap<String, String> hMap) throws Exception{
		return memberMapper.deletememberEnterpriseResult(hMap);
	}
	
	
	public int mypageEnterpriseResultInsert(MemberVO memberVo) throws Exception{
		return memberMapper.mypageEnterpriseResultInsert(memberVo);
	}
	
	public int memberEnterpriseResultUpdate(MemberVO searchVo) throws Exception{
		return memberMapper.memberEnterpriseResultUpdate(searchVo);
	}
	
	public int mypageEnterpriseResultCheckMin(String memberId) throws Exception{
		return memberMapper.mypageEnterpriseResultCheckMin(memberId);
	}
	
	public List<MemberVO> mypageEnterpriseResultMin(String memberId) throws Exception{
		return memberMapper.mypageEnterpriseResultMin(memberId);
	}
	
	public int selectOnchangeCheck(String MediumBussAreaCd) throws Exception{
		return memberMapper.selectOnchangeCheck(MediumBussAreaCd);
	}
	
	public List<MemberVO> selectOnchange(String MediumBussAreaCd) throws Exception{
		return memberMapper.selectOnchange(MediumBussAreaCd);
	}
	
	public String selectLargeBussAreaCd(String MediumBussAreaCd) throws Exception{
		return memberMapper.selectLargeBussAreaCd(MediumBussAreaCd);
	}

	public String selectLargeBussAreaCd2(HashMap<String, Object> hMap) throws Exception{
		return memberMapper.selectLargeBussAreaCd2(hMap);
	}
	
	public String largecode(int largecode) throws Exception{
		return memberMapper.largecode(largecode);
	}
	
	public String mediumcode(String mediumcode) throws Exception{
		return memberMapper.mediumcode(mediumcode);
	}
	public MemberVO selectOnlineApply1(String memberId) throws Exception{
		
		return memberMapper.selectOnlineApply1(memberId);
	}
	
	
	public MemberVO selectMyExpertInformation(String memberId)throws Exception{
		return memberMapper.selectMyExpertInformation(memberId);
	}
	
	public int selectOnchangeExpertDetailIntrtAreCdCheck(String expertDetailIntrtAreCd)throws Exception{
		return memberMapper.selectOnchangeexpertDetailIntrtAreCdCheck(expertDetailIntrtAreCd);
	}
	
	public List<MemberVO> selectOnchangeExpertDetailIntrtAreCd(String expertDetailIntrtAreCd)throws Exception{
		return memberMapper.selectOnchangeExpertDetailIntrtAreCd(expertDetailIntrtAreCd);
	}
	
	public int mypageExpertUpdateCheck(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertUpdateCheck(memberVo);
	}
	
	public int mypageExpertUpdate(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertUpdate(memberVo);
	}
	
	public int mypageExpertDeliberateInsert(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertDeliberateInsert(memberVo);
	}
	
	public List<MemberVO> mypageExpertDeliberateList(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertDeliberateList(memberVo);
	}
	
	public int mypageExpertDeliberateUpdate(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertDeliberateUpdate(memberVo);
	}

	public int mypageExpertDeliberateDelete(MemberVO memberVo)throws Exception{
		return memberMapper.mypageExpertDeliberateDelete(memberVo);
	}

	public MemberVO selectMyBuyerInformation(String memberId)throws Exception{
		return memberMapper.selectMyBuyerInformation(memberId);
	}
	
	
	public int mypageBuyerHistInsert(MemberVO memberVo)throws Exception{
		return memberMapper.mypageBuyerHistInsert(memberVo);
	}
	public int mypageBuyerHistUpdate(MemberVO memberVo)throws Exception{
		return memberMapper.mypageBuyerHistUpdate(memberVo);
	}
	
	public List<MemberVO> mypageBuyerHistList(String memberId)throws Exception{
		return memberMapper.mypageBuyerHistList(memberId);
	}

	public int mypageBuyerHistDelete(MemberVO memberVo)throws Exception{
		return memberMapper.mypageBuyerHistDelete(memberVo);
	}
	
	public int mypageBuyerUpdate(MemberVO memberVo)throws Exception{
		return memberMapper.mypageBuyerUpdate(memberVo);
	}
	
	public MemberVO expertInformationManagementDetail(MemberVO memberVo)throws Exception{
		return memberMapper.expertInformationManagementDetail(memberVo);
	}

	public List<MemberVO> expertDeliberateInformationManagementDetail(MemberVO memberVo)throws Exception{
		return memberMapper.expertDeliberateInformationManagementDetail(memberVo);
	}
	
	public void noticeFileDownload(ModelAndView mav) throws Exception{
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		HttpServletResponse response=(HttpServletResponse) map.get("response");	
		
		String fileNum=request.getParameter("fileNum");
		
		MemberVO memberVo = memberMapper.noticeFileDownload(fileNum);
		
		BufferedInputStream fis = null;
		BufferedOutputStream fos = null;
		
		try {
			int index = memberVo.getOrgFileNm().indexOf("_") + 1;
			String dbName = memberVo.getOrgFileNm().substring(index);
			
			String fileName = new String(dbName.getBytes("UTF-8"), "ISO-8859-1");
			
			response.setContentType("application/octet-stream");
			//response.setContentLength((int) boardDto.getFileSize());
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
			
			fis = new BufferedInputStream(new FileInputStream(memberVo.getFileCourse()));
			fos = new BufferedOutputStream(response.getOutputStream());
			
			while(true) {
				int data = fis.read();
				if(data == -1) break;
				fos.write(data);
			}
			
			fos.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public int onestopfileUpload(MemberVO searchVO) throws Exception{
		return memberMapper.onestopfileUpload(searchVO);
	}
	
	public List<MemberVO> proMemberId(int joinTypeCd) throws Exception{
		return memberMapper.proMemberId(joinTypeCd);		
	}
	
	public int adviceOnlineStatusBusinessInsert(HashMap<String,Object> hMap)throws Exception{
		return memberMapper.adviceOnlineStatusBusinessInsert(hMap);		
	}
	public int adviceOnlineStatusBusinessUpdateCheck(HashMap<String,Object> hMap)throws Exception{
		return memberMapper.adviceOnlineStatusBusinessUpdateCheck(hMap);		
	}
	
	public MemberVO selectAdviceOnlineStatusBusinessFile(HashMap<String,String> hMap)throws Exception{
		return memberMapper.selectAdviceOnlineStatusBusinessFile(hMap);		
	}
	public MemberVO adviceOnlineStatusBusinessfileDownload(String attchFileNo)throws Exception{
		return memberMapper.adviceOnlineStatusBusinessfileDownload(attchFileNo);		
	}
	
	public MemberVO adviceOnlineStatusManagementDetailfileDownload(String onestopSupportNo)throws Exception{
		return memberMapper.adviceOnlineStatusManagementDetailfileDownload(onestopSupportNo);		
	}
	
	public ArrayList<Map<String,Object>> selectadviceOnlineStatusEntprList(MemberVO params)throws Exception{
		return memberMapper.selectadviceOnlineStatusEntprList(params);		
	}

	public int selectadviceOnlineStatusEntprListCnt(MemberVO params)throws Exception{
		return memberMapper.selectadviceOnlineStatusEntprListCnt(params);		
	}
	public int adviceOnlineStatusMagagementInsertOk(Map<String,String> params)throws Exception{
		return memberMapper.adviceOnlineStatusMagagementInsertOk(params);		
	}

	public String onestopSupportNoSelect(Map<String,String> params)throws Exception{
		return memberMapper.onestopSupportNoSelect(params);		
	}
	public int onestopArearCdInsert(Map<String,String> map)throws Exception{
		return memberMapper.onestopArearCdInsert(map);		
	}
	
	public int onestopBussLogInsertOk(Map<String,String> params)throws Exception{
		return memberMapper.onestopBussLogInsertOk(params);		
	}
	public List<Map<String,Object>> SelectExpertList(HashMap<String,Object> hMap)throws Exception{
		return memberMapper.SelectExpertList(hMap);		
	}
	public List<Map<String,Object>> selectClassNmList(HashMap<String,Object> hMap)throws Exception{
		return memberMapper.selectClassNmList(hMap);		
	}
public int ExpertEvaluInsertOk(HashMap<String,Object> hMap)throws Exception{
		HashMap<String,Object> slectEvaluTable = new HashMap<String,Object>();
		List<Map<String,Object>> slectClassTable = (List<Map<String, Object>>) hMap.get("selectClassCd");
		List<Map<String,Object>> expertDeliberate =  (List<Map<String, Object>>) hMap.get("list");
		HashMap<String,Object> addEvalu = new HashMap<String,Object>();
		HashMap<String,Object> addEvalu2 = new HashMap<String,Object>();

		

		//추출번호(Pk)
		int result =0;
		int insertOk = 0;
		String selectNo =memberMapper.SelectSearchSelectNo(result); //여기서 PK값을 조회해서 없으면 0번 있으면 1 실행완료.
		//값은 i0000임
		for(int i=0;i<expertDeliberate.size();i++) {//안에 들어있는 값을 꺼내와서 insert해야하는데
			addEvalu.put("selectNo", selectNo);
			addEvalu.put("evaluationDt", hMap.get("evaluationDt"));
			addEvalu.put("selectTitle", hMap.get("selectTitle"));
			addEvalu.put("memberId",expertDeliberate.get(i).get("memberId"));
			addEvalu.put("expertNm",expertDeliberate.get(i).get("expertNm"));
			addEvalu.put("attendYn",expertDeliberate.get(i).get("attendYn"));
			addEvalu.put("remark",expertDeliberate.get(i).get("remark"));
			
			
			//평가위원 추출 상세정보 저장
			insertOk = memberMapper.insertEvaluDtl(addEvalu);
			if(expertDeliberate.get(i).get("attendYn").equals("Y")){
				//전문가 심의이력 정보 저장
				insertOk = memberMapper.insertEvalu(addEvalu);
			}
		}
		//평가원 추출정보 저장
		slectEvaluTable.put("selectNo", selectNo);
		slectEvaluTable.put("selectTitle", hMap.get("selectTitle"));
		slectEvaluTable.put("evaluationDt", hMap.get("evaluationDt"));
		slectEvaluTable.put("evaluationCnt", hMap.get("evaluationCnt"));

		insertOk = memberMapper.SelectSlectEvaluInsert(slectEvaluTable);

		//평가위원 분류정보 저장
		for(int i=0;i<slectClassTable.size();i++) {
			addEvalu2.put("selectNo", selectNo);
			addEvalu2.put("selectClassCd", slectClassTable.get(i));
			insertOk = memberMapper.SelectSelectClassCdInsert(addEvalu2);
		}
		return result;
	}

	public List<HashMap<String,String>> selectClassNm(String param)throws Exception{
		return memberMapper.selectClassNm(param);		
}

	public HashMap<String,String> selectEvaluInformationManagementDetail(String param)throws Exception{
		return memberMapper.selectEvaluInformationManagementDetail(param);		
	}
	public List<HashMap<String,String>> selectEvaluInformationManagementDetailList(String param)throws Exception{
		return memberMapper.selectEvaluInformationManagementDetailList(param);		
	}
	
	public List<HashMap<String,String>> SelectadviceAreaCd(String param)throws Exception{
		return memberMapper.SelectadviceAreaCd(param);		
	}

	
}
