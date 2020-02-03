package jcep.front.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.FacilityResourceService;
import jcep.admin.service.MemberService;
import jcep.front.service.LoginFrontService;
/**
 * @Class Name : MypageFrontController.java
 * @Description : MypageFrontController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.03          최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MypageFrontController {

	@Resource(name = "facilityResourceService")
	protected FacilityResourceService facilityResourceService;

	@Resource(name = "memberService")
	protected MemberService memberService;

	protected JeonnamCommonsController JCController;
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="noticeFilePath")
    String noticeFilePath;

	/**
	 * 온라인 상담신청 현황 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "onlineCounselingStatus"
	 * @exception Exception
	 */
	@RequestMapping(value = "/onlineCounselingStatus.do")
	public ModelAndView onlineCounselingStatus(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		int sessionjoinTypeCd = Integer.parseInt((String) session.getAttribute("joinTypeCd"));
		System.out.println("셀렉트 "+searchVO.getSearchText());
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		String JoinType = null;
		if(sessionjoinTypeCd==000001) {//기업
			JoinType = "1";
			
		}else if(sessionjoinTypeCd==000002) {//전문가
			JoinType = "2";
		}

		List<MemberVO> authList = memberService.selectOnlineCounselingStatus(searchVO);
		model.addAttribute("resultList", authList);

		int totCnt = memberService.selectOnlineCounselingStatusCount(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("JoinType", JoinType);
		mv.addObject("list", authList);
		
		mv.setViewName("/view/frontView/onlineCounselingStatus");
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/onlineCounselingStatusDetail.do")
	public ModelAndView onlineCounselingStatusDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("안녕");
		String memberId = request.getParameter("memberId");
		String onestopSupportNo = request.getParameter("onestopSupportNo");

		searchVO.setMemberId(memberId);
		searchVO.setOnestopSupportNo(onestopSupportNo);
		System.out.println("memberId :: " + memberId);
		System.out.println("onestopSupportNo :: " + onestopSupportNo);

		MemberVO detail = memberService.selectAdviceOnlineStatusManagementDetail(searchVO);
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		hMap.put("memberId", memberId);
		hMap.put("onestopSupportNo", onestopSupportNo);

		hMap.put("attchFileDiviCd", "000001");			
		MemberVO File1 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
		hMap.put("attchFileDiviCd", "000002");
		MemberVO File2 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
		hMap.put("attchFileDiviCd", "000003");
		MemberVO File3 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
		hMap.put("attchFileDiviCd", "000004");
		MemberVO File4 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
		model.addAttribute("File1", File1);
		model.addAttribute("File2", File2);
		model.addAttribute("File3", File3);
		model.addAttribute("File4", File4);
		model.addAttribute("result", detail);
				
		mv.setViewName("/html/onlineCounselingStatusDetail");
		
		return mv;
	}
	
	
	


	/**
	 * 마이페이지 
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/myCompanyInformation.do")
	public ModelAndView myCompanyInformation(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mav, HttpSession session) throws Exception {

		int sessionjoinTypeCd = Integer.parseInt((String) session.getAttribute("joinTypeCd"));
		
		if(sessionjoinTypeCd==000001) {
		
			System.out.println("기업회원입니다.");
			System.out.println("searchVO_1***********************"+searchVO);
			String memberId = (String) session.getAttribute("memberId"); //로그인한 아이디 가져오기

			/*
			 *==============================*
			 ||                                                     ||
			 ||기본정보 불러오기 최선권 20191129 데이터 추가 ||
			 ||                                                     ||
			 *==============================*
			*/
			MemberVO detail = null;
			
			int check = memberService.selectenterpriseDetailCheck(memberId);
			if(check == 1) {
				detail = memberService.selectenterpriseDetail(memberId);
	
		}

		
		/*
		 *==============================*
		 ||                                                     ||
		 ||		코드 불러오기 최선권 20191209 데이터 추가	 ||
		 ||                                                     ||
		 *==============================*
		*/

		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("g00021");
		List<MemberVO> nationVo = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("g00020");
		List<MemberVO> regForm = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("g00019");
		List<MemberVO> propt = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("g00004");
		List<MemberVO> YearCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("g00005");
		List<MemberVO> qtaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("g00002");
		List<MemberVO> largeBussAreaCd = memberService.selectCommonsList(commonsVo);	//대분류코드표
		
		
/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
*/

		mav.addObject("largeBussAreaCd",largeBussAreaCd);
		mav.addObject("YearCd",YearCd);
		mav.addObject("qtaCd",qtaCd);
		mav.addObject("propt",propt);
		mav.addObject("regForm",regForm);
		mav.addObject("nationVo",nationVo);
		mav.addObject("detail", detail);
		System.out.println("searchVO_2***********************"+searchVO);

		mav.setViewName("/view/frontView/myCompanyInformation");
		}else {
			System.out.println("기업회원이 아닙니다.");
			mav.setViewName("/main/main");			
		}
		return mav;
	}


	/**
	 * 시설 사용신청 현황 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "facilitiesResourcesApplicationStatus"
	 * @exception Exception
	 */
	@RequestMapping(value = "/facilitiesResourcesApplicationStatus.do")
	public ModelAndView facilityApplicationManagementList(@ModelAttribute("searchVO") FacilityResourceVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("searchVO_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
		
		
		ArrayList<FacilityResourceVO> facilityApplicateList = facilityResourceService.selectFacilityApplicateList(searchVO);
		model.addAttribute("resultList", facilityApplicateList);
		
		int totCnt = facilityResourceService.selectFacilityApplicateListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/frontView/facilitiesResourcesApplicationStatus");
		
		return mv;
	}

	/*
	 *==============================*
	 ||                                                    ||
	 ||	          진흥원 수혜사업 정보 불러오기 			    ||
	 ||             최선권 20191203                   ||
	 *==============================*
	*/
	@RequestMapping(value = "/myCompanyInformationEnterpriseJcepBuss.do")
	public ModelAndView myCompanyInformationEnterpriseJcepBuss(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		System.out.println("에이작스");
		int check1 = memberService.selectEnterpriseJcepBussCheck(memberId);
		if(check1 > 0) {
			List<MemberVO> detail1 = memberService.selectEnterpriseJcepBussDetail(memberId);	//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", detail1);
			System.out.println("진흥원 수혜 사업 :::" + detail1.toString());
		}

		return mav;
	}

	/*
	 *==============================*
	 ||                                                    ||
	 ||	          지적 재산권 현황  불러오기 			    ||
	 ||             최선권 20191203                   ||
	 *==============================*
	*/
	@RequestMapping(value = "/myCompanyInformationIntltpropty.do")
	public ModelAndView myCompanyInformationIntltpropty(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		System.out.println("에이작스");
		int check2 = memberService.selectEnterpriseInitProptyCheck(memberId);
		if(check2 > 0) {
			List<MemberVO> detail2 = memberService.selectEnterpriseInitProptyDetail(memberId);	//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", detail2);
			System.out.println("지적재산권 정보 불러오기 ");
		}
		return mav;
	}



	/*
	 *==============================*
	 ||                                                    ||
	 ||	          	 직원 정보  불러오기 			    	||
	 ||             최선권 20191203                   ||
	 *==============================*
	 */
	@RequestMapping(value = "/myCompanyInformationemployee.do")
	public ModelAndView myCompanyInformationemployee(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		System.out.println("에이작스");
		int check = memberService.selectEnterpriseEmployeeCheck(memberId);
		List<MemberVO> detail3 = null;
		if(check > 0) {
			detail3 = memberService.selectEnterpriseEmployeeDetail(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", detail3);
			System.out.println(detail3);
		}

		return mav;
	}
	/*
	 *=====================================*
	 * 마이페이지 - 삭제
	 * 최선권
	 * @param session - memberId(로그인된 아이디) 
	 * @param request - 정보
	 * @data 2019-12-05
	 * @return "jsonView"
	 * @exception Exception
	 *=====================================*
	 */
	@RequestMapping(value = "/memberEnterpriseResultDelete.do")
	public ModelAndView memberEnterpriseResultDelete(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		String enterpriseIdx = request.getParameter("enterpriseIdx");
		System.out.println("memberId :::::::::::::" + memberId);
		System.out.println("enterpriseIdx::::::::::::" + enterpriseIdx);
		System.out.println("에이작스");
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		
		hMap.put("memberId",memberId);
		hMap.put("enterpriseIdx",enterpriseIdx);
		int delete = memberService.deletememberEnterpriseResultCheck(hMap);
		System.out.println("Delete 데이터 보기ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+delete);
		int returnCode = 0;
		int a=0;
		if(delete > 0) {
			System.out.println("아 답답해");
			returnCode = memberService.deletememberEnterpriseResult(hMap);		//수혜사업신청이 승인된 List 가져오기
			a=1;
			mav.addObject("a", a);
			System.out.println(a);
		}


		return mav;
	}

	@RequestMapping(value = "/memberemployeeDelete.do")
	public ModelAndView memberemployeeDelete(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		String enterpriseIdx = request.getParameter("enterpriseIdx");
		System.out.println("memberId :::::::::::::" + memberId);
		System.out.println("enterpriseIdx::::::::::::" + enterpriseIdx);
		System.out.println("에이작스");
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		
		hMap.put("memberId",memberId);
		hMap.put("enterpriseIdx",enterpriseIdx);
		int delete = memberService.deleteEnterpriseEmployeeCheck(hMap);
		int returnCode = 0;
		if(delete > 0) {
			returnCode = memberService.deleteEnterpriseEmployeeDetail(hMap);		//수혜사업신청이 승인된 List 가져오기
			int d=1;
			mav.addObject("d", d);
			System.out.println(d);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value = "/membereJecpDelete.do")
	public ModelAndView membereJecpDelete(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = request.getParameter("memberId"); //로그인한 아이디 가져오기
		String enterpriseIdx = request.getParameter("enterpriseIdx");
		System.out.println("memberId :::::::::::::" + memberId);
		System.out.println("enterpriseIdx::::::::::::" + enterpriseIdx);
		System.out.println("에이작스");
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		
		hMap.put("memberId",memberId);
		hMap.put("enterpriseIdx",enterpriseIdx);
		int delete = memberService.deleteJecpCheck(hMap);
		int returnCode = 0;
		if(delete > 0) {
			returnCode = memberService.deleteJecpDetail(hMap);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);
		}
		
		
		return mav;
	}
	/*
	 *=====================================*
	 * 마이페이지 - 기업 사원정보 수정
	 * 	최선권
	 * @param session - memberId(로그인된 아이디) 
	 * @param request - 정보
	 * @param MultipartHttpServletRequest - 파일정보
	 * @data 2019-12-06
	 * @return "jsonView"
	 * @exception Exception
	 *=====================================*
	 */
	@RequestMapping(value = "/memberemployeeUpdate.do")
	public ModelAndView memberemployeeUpdate(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		File path=new File(noticeFilePath);
		if(!path.exists()) {
			path.mkdir();
		}

		Iterator <String> itr = multipartRequest.getFileNames();
		while(itr.hasNext()) {
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			System.out.println(mpf.getOriginalFilename());	
			String fileOriginName = Long.toString(System.currentTimeMillis()) + "_" + mpf.getOriginalFilename();
			File file = new File(path,fileOriginName);
			try {
				mpf.transferTo(file);
				memberVo.setFileCourse(file.getAbsolutePath());					//경로
				memberVo.setOrgFileNm(fileOriginName);							//파일명

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		memberVo.setMemberId(request.getParameter("memberId")); //로그인한 아이디 가져오기
		memberVo.setEnterpriseIdx(request.getParameter("uptotcnt"));
		memberVo.setEntprEmployeeDept(request.getParameter("entprEmployeeDept"));
		memberVo.setEntprEmployeeNm(request.getParameter("entprEmployeeNm"));
		memberVo.setEntprEmployeePosition(request.getParameter("entprEmployeePosition"));
		memberVo.setEntprEmployeeEmail(request.getParameter("entprEmployeeEmail"));
		memberVo.setEntprEmployeePhone(request.getParameter("entprEmployeePhone").replaceAll("-",""));
		memberVo.setRemark(request.getParameter("remark"));


		System.out.println(request.getParameter("remark"));
		System.out.println("에이작스");

		int update = memberService.updateEnterpriseEmployeeCheck(memberVo);
		int returnCode = 0;
		if(update > 0) {
			returnCode = memberService.updateEnterpriseEmployee(memberVo);
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);
		}

		return mav;
	}
	
	@RequestMapping(value = "/memberJecpUpdate.do")
	public ModelAndView memberJecpUpdate(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId(request.getParameter("memberId"));
		memberVo.setEnterpriseIdx(request.getParameter("enterpriseIdx"));
		memberVo.setNtltProptBussNm(request.getParameter("intltProptBussNm"));
		memberVo.setNtltProptPerfNm(request.getParameter("intltProptPerfNm"));
		memberVo.setIntltProptCd(request.getParameter("intltProptCd"));
		memberVo.setRegFormCd(request.getParameter("regFormCd"));
		memberVo.setIntltProptyDt(request.getParameter("intltProptyDt"));
		memberVo.setRegNationCd(request.getParameter("regNationCd"));
		memberVo.setIntltProptRegNo(request.getParameter("intltProptRegNo"));
		memberVo.setRemark(request.getParameter("remark"));
		
		
		System.out.println(request.getParameter("enterpriseIdx"));
		System.out.println(request.getParameter("regNationCd"));
		System.out.println("에이작스");
		
		int update = memberService.updateJecpCheck(memberVo);
		int returnCode = 0;
		if(update > 0) {
			returnCode = memberService.updateJecp(memberVo);
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);
		}
		
		return mav;
	}
	/*
	 * ==============================*
	 ||					  2019 12 11(수정)				 ||
	 ||					기업정보 업데이트 				     ||
	 ||					       최선권 						 ||
	 * ==============================*
	 */
	@RequestMapping(value = "/mypageCompanyUpdate.do")
	public String mypageCompanyUpdate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request, HttpSession session,MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);
		System.out.println("업데이트");
		searchVO.setMemberId(request.getParameter("memberId"));
		System.out.println("memberId:::::" + request.getParameter("memberId"));
		searchVO.setEntprSite(request.getParameter("entprSite"));
		searchVO.setEntprComRegNum(request.getParameter("entprComRegNum"));
		searchVO.setLargeBussAreaCd(request.getParameter("largeBussAreaCd"));
		searchVO.setMediumBussAreaCd(request.getParameter("mediumBussAreaCd"));
		searchVO.setEntprCeo(request.getParameter("entprCeo"));
		searchVO.setEntprCeoEmail(request.getParameter("entprCeoEmail"));
		searchVO.setEntprHeadAddr(request.getParameter("entprHeadAddr"));
		searchVO.setEntprHeadDetailAddr(request.getParameter("entprHeadDetailAddr"));
		searchVO.setEntprHeadTel(request.getParameter("entprHeadTel"));
		searchVO.setEntprBranchAddr(request.getParameter("entprBranchAddr"));
		searchVO.setEntprBranchDetailAddr(request.getParameter("entprBranchDetailAddr"));
		searchVO.setEntprBranchTel(request.getParameter("entprBranchTel"));
		searchVO.setEntprEstDt(request.getParameter("entprEstDt"));
		searchVO.setEntprCapitalAmt(request.getParameter("entprCapitalAmt").replaceAll(",",""));
		System.out.println(searchVO.getEntprCeoEmail());
		int returnCode = memberService.mypageCompanyUpdate(searchVO);
		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		return "jsonView";
	}

	
	/*
	 * ==============================*
	 ||					  2019 12 09					 ||
	 ||					기업성과정보 조회 				     ||
	 ||					       최선권 						 ||
	 * ==============================*
	 */
	@RequestMapping(value = "/myCompanyInformationEnterpriseResult.do")
	public ModelAndView myCompanyInformationresult(MemberVO memberVo, HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		String memberId =request.getParameter("memberId"); 
		//String memberId =(String)session.getAttribute("memberId"); //로그인한 아이디 가져오기
		System.out.println("기업성과정보 조회");//데이터 실행을 안하는데?
		int check = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", detail4);
			System.out.println(detail4);
		}

		return mav;
	}
	/*기업 성과 추가하기*/
	@RequestMapping(value = "/memberenterpriseResultInsert.do")
	public ModelAndView memberenterpriseResultInsert(MemberVO memberVo, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("기업성과정보 추가");
		String memberId = memberVo.getMemberId();
		System.out.println("회원아이디"+memberId);
		memberVo.setMemberId(request.getParameter("memberId"));
		memberVo.setEntprResultYearCd(request.getParameter("entprResultYearCd"));
		memberVo.setEntprResultQtaCd(request.getParameter("entprResultQtaCd"));
		memberVo.setEntprCapitalAmt(request.getParameter("entprCapitalamt").replaceAll(",", ""));
		memberVo.setEntprResultTakeAmt(request.getParameter("entprResultTakeAmt").replaceAll(",",""));
		memberVo.setEntprResultEmpCnt(Integer.parseInt(request.getParameter("entprResultEmpCnt")));

		int returnCode = memberService.mypageEnterpriseResultInsert(memberVo);
		mav.addObject("returnCode",returnCode);
		
		return mav;
	}
	/*기업 성과 수정하기*/
	@RequestMapping(value = "/memberEnterpriseResultUpdate.do")
	public String memberEnterpriseResultUpdate(MemberVO searchVO, ModelAndView mv, HttpServletRequest request, HttpSession session,MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);

		System.out.println("기업성과정보 수정");
		System.out.println(request.getParameter("enterpriseIdx"));
		searchVO.setMemberId(request.getParameter("memberId"));
		searchVO.setEnterpriseIdx(request.getParameter("enterpriseIdx"));
		searchVO.setEntprResultYearCd(request.getParameter("entprResultYearCd"));
		searchVO.setEntprResultQtaCd(request.getParameter("entprResultQtaCd"));
		searchVO.setEntprCapitalAmt(request.getParameter("entprCapitalAmt").replaceAll(",", ""));
		searchVO.setEntprResultTakeAmt(request.getParameter("entprResultTakeAmt").replaceAll(",",""));
		searchVO.setEntprResultEmpCnt(Integer.parseInt(request.getParameter("entprResultEmpCnt")));
		
		int returnCode = memberService.memberEnterpriseResultUpdate(searchVO);
		
		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	/*기업 성과 조회하기 4개*/
	@RequestMapping(value = "/myCompanyInformationEnterpriseResultMin.do")
	public ModelAndView myCompanyInformationresultMin(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String memberId = (String) session.getAttribute("memberId"); //로그인한 아이디 가져오기
		System.out.println("기업성과정보 조회미니");
		int check = memberService.mypageEnterpriseResultCheckMin(memberId);
		List<MemberVO> detail4 = null;
		if(check > 0) {
			detail4 = memberService.mypageEnterpriseResultMin(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", detail4);
			System.out.println(detail4);
		}

		return mav;
	}
	
	/*
	 *==============================*
	 ||                                                    ||
	 ||	          중사업분류코드 정보 불러오기 			    ||
	 ||             최선권 20191211                   ||
	 *==============================*
	 */
	@RequestMapping(value = "/selectOnchange.do")
	public ModelAndView selectOnchange(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String MediumBussAreaCd = request.getParameter("selectBoxData"); 
		System.out.println(MediumBussAreaCd);
		System.out.println("에이작스");
		int check = memberService.selectOnchangeCheck(MediumBussAreaCd);
		if(check > 0) {
			List<MemberVO> data = memberService.selectOnchange(MediumBussAreaCd);	//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", data);
			System.out.println("값 가져오거라" + data.toString());
		}
		
		return mav;
	}

	/*
	 *==============================*
	 ||                                                    ||
	 ||	          세부관심분야코드 정보 불러오기 			||
	 ||             최선권 20191211                   ||
	 *==============================*
	 */
	@RequestMapping(value = "/selectOnchangeexpertDetailIntrtAreCd.do")
	public ModelAndView selectOnchangeexpertDetailIntrtAreCd(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String expertDetailIntrtAreCd = request.getParameter("selectBoxData"); 
		System.out.println(expertDetailIntrtAreCd);
		System.out.println("에이작스");
		int check = memberService.selectOnchangeExpertDetailIntrtAreCdCheck(expertDetailIntrtAreCd);
		if(check > 0) {
			List<MemberVO> data = memberService.selectOnchangeExpertDetailIntrtAreCd(expertDetailIntrtAreCd);	//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data", data);
			System.out.println("값 가져오거라" + data.toString());
		}
		
		return mav;
	}
	
	/**
	 * 마이페이지 -> 나의 전문가정보 (pageing)
	 * @param session memberId(회원아이디),
	 * @param joinTypeCd(회원분류코드)
	 * @return "myExpertInformation"
	 * @exception Exception
	 */
	@RequestMapping(value = "/myExpertInformation.do")
	public ModelAndView myExpertInformation(HttpServletRequest request, HttpSession session, ModelAndView mav) throws Exception {
		/*
		 *==============================*
		 ||                                                    ||
		 ||	           	 전문가 정보 불러오기 			    	||
		 ||              최선권 20191214                  ||
		 *==============================*
		 */
		
		String memberId = (String)session.getAttribute("memberId");
		System.out.println("회원아이디" + memberId);
		System.out.println("전문가 정보불러오기");
		
		MemberVO data = memberService.selectMyExpertInformation(memberId);
		//전문가 정보 및 전문가 수당 지급정보 불러오기
		
		/*
		 *==============================*
		 ||                                                    ||
		 ||	           		코드 불러오기 			    	    ||
		 ||              최선권 20191214                  ||
		 *==============================*
		 */
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("G00012");//대전문분야코드
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00013");//중전문분야코드
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00014");//세부전문분야코드
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00015");//관심분야코드
		List<MemberVO> expertInterestAreaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00016");//세부관심분야코드
		List<MemberVO> expertDetailIntrtAreaCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00017");//산학연관코드
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00044");//최종학력코드
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00018");//은행선택코드
		List<MemberVO> benefitBankCd = memberService.selectCommonsList(commonsVo);
		
		mav.addObject("data", data);
		mav.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mav.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mav.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		mav.addObject("expertInterestAreaCd", expertInterestAreaCd);
		mav.addObject("expertDetailIntrtAreaCd", expertDetailIntrtAreaCd);
		mav.addObject("expertIndsEduCd", expertIndsEduCd);
		mav.addObject("expertFnalEduCd", expertFnalEduCd);
		mav.addObject("benefitBankCd", benefitBankCd);

		mav.setViewName("/view/frontView/myExpertInformation");
		return mav;
	}

	
	@RequestMapping(value = "/mypageExpertUpdate.do")
	public ModelAndView mypageExpertUpdate(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();

		memberVo.setMemberId(request.getParameter("memberId")); //로그인한 아이디 가져오기
		System.out.println("아이디값"+ request.getParameter("memberId"));;
		memberVo.setExpertCareerNum(request.getParameter("expertCareerNum"));
		System.out.println("경력년수:" + request.getParameter("expertCareerNum"));
		memberVo.setLargeSpecialAreaCd(request.getParameter("largeSpecialAreaCd"));
		memberVo.setDetailSpecialAreaCd(request.getParameter("detailSpecialAreaCd"));
		memberVo.setExpertInterestAreaCd(request.getParameter("expertInterestAreaCd"));
		memberVo.setExpertDetailIntrtAreaCd(request.getParameter("expertDetailIntrtAreaCd"));
		memberVo.setExpertIndsEduCd(request.getParameter("expertIndsEduCd"));
		memberVo.setExpertStRegNo(request.getParameter("expertStRegNo"));
		memberVo.setExpertRegNo(request.getParameter("expertRegNo"));
		memberVo.setExpertFinalSchoolNm(request.getParameter("expertFinalSchoolNm"));
		memberVo.setExpertMajorNm(request.getParameter("expertMajorNm"));
		memberVo.setExpertFnalEduCd(request.getParameter("expertFnalEduCd"));
		memberVo.setExpertHeadAddrNm(request.getParameter("expertHeadAddrNm"));
		memberVo.setExpertDptmNm(request.getParameter("expertDptmNm"));
		memberVo.setExpertOffiDutyNm(request.getParameter("expertOffiDutyNm"));
		memberVo.setExpertOffiAddr(request.getParameter("expertOffiAddr"));
		memberVo.setExpertOffiDetailAddr(request.getParameter("expertOffiDetailAddr"));
		memberVo.setExpertHomeAddr(request.getParameter("expertHomeAddr"));
		memberVo.setExpertHomeDetailAddr(request.getParameter("expertHomeDetailAddr"));
		memberVo.setBenefitBankCd(request.getParameter("benefitBankCd"));
		memberVo.setBenefitAccntNo(request.getParameter("benefitAccntNo"));
		memberVo.setBenefitBirthDt(request.getParameter("benefitBirthDt").replaceAll("-", ""));
		memberVo.setExpertOffiTel(request.getParameter("expertOffiTel"));
		memberVo.setExpertOffiFax(request.getParameter("expertOffiFax"));
		memberVo.setBenefitRespsibHpNo(request.getParameter("benefitRespsibHpNo"));
		
		System.out.println(memberVo.getBenefitBirthDt());

//		int update = memberService.mypageExpertUpdateCheck(memberVo);
			System.out.println("업데이트");			
			int returnCode = memberService.mypageExpertUpdate(memberVo);
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);

		return mav;
	}

	
	@RequestMapping(value = "/mypageExpertDeliberateInsert.do")
	public ModelAndView mypageExpertDeliberateInsert(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId(request.getParameter("memberId"));

		memberVo.setExpertDelibrDt(request.getParameter("expertDelibrDt").replaceAll("-", ""));
		memberVo.setExpertDelibrTitle(request.getParameter("expertDelibrTitle"));
		memberVo.setRemark(request.getParameter("remark"));
		System.out.println("업데이트");
		
		int returnCode = memberService.mypageExpertDeliberateInsert(memberVo);
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);
		
		return mav;
	}

	@RequestMapping(value = "/mypageExpertDeliberateList.do")
	public ModelAndView mypageExpertDeliberateList(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId(request.getParameter("memberId"));		
		System.out.println("전문가심의이력정보 가져오기");
		System.out.println();
		List<MemberVO> data = memberService.mypageExpertDeliberateList(memberVo);
		mav.addObject("data", data);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/mypageExpertDeliberateUpdate.do")
	public ModelAndView mypageExpertDeliberateUpdate(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId(request.getParameter("memberId"));
		System.out.println("회원아이디::" + memberVo.getMemberId());
		memberVo.setExpertHistIdx(request.getParameter("expertHistIdx"));
		memberVo.setExpertDelibrDt(request.getParameter("expertDelibrDt").replaceAll("-", ""));
		memberVo.setExpertDelibrTitle(request.getParameter("expertDelibrTitle"));
		memberVo.setRemark(request.getParameter("remark"));
		System.out.println("업데이트");
		
		int returnCode = memberService.mypageExpertDeliberateUpdate(memberVo);
		mav.addObject("returnCode", returnCode);
		System.out.println(returnCode);
		
		return mav;
	}
	
	@RequestMapping(value = "/mypageExpertDeliberateDelete.do")
	public ModelAndView mypageExpertDeliberateDelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId(request.getParameter("memberId"));
		System.out.println("회원아이디::" + memberVo.getMemberId());
		memberVo.setExpertHistIdx(request.getParameter("expertHistIdx"));
		System.out.println("idx::" + request.getParameter("expertHistIdx"));
		System.out.println("삭제");
		
		int returnCode = memberService.mypageExpertDeliberateDelete(memberVo);
		mav.addObject("returnCode", returnCode);
		System.out.println(returnCode);
		
		return mav;
	}
	
	/**
	 * 20191220 최선권
	 * 마이페이지 -> 나의 바이어정보 (pageing)
	 * @param session memberId(회원아이디),
	 * @param joinTypeCd(회원분류코드)
	 * @return "myExpertInformation"
	 * @exception Exception
	 */
	@RequestMapping(value = "/myBuyerInformation.do")
	public ModelAndView myBuyerInformation(HttpServletRequest request, HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("바이어");
		int sessionjoinTypeCd = Integer.parseInt((String) session.getAttribute("joinTypeCd"));
		System.out.println("sessionjoinTypeCd"+sessionjoinTypeCd);
		if(sessionjoinTypeCd==000003) {
			

		/*
		 *==============================*
		 ||                                                    ||
		 ||	           	 바이어 정보 불러오기 			    	||
		 ||              최선권 20191220                  ||
		 *==============================*
		 */
		
		String memberId = (String)session.getAttribute("memberId");
		System.out.println("회원아이디" + memberId);
		System.out.println("바이어 정보불러오기");
		
		MemberVO data = memberService.selectMyBuyerInformation(memberId);

		/*
		 *==============================*
		 ||                                                    ||
		 ||	           		코드 불러오기 			    	    ||
		 ||              최선권 20191220                  ||
		 *==============================*
		 */
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("G00001");//진행사항코드
		List<MemberVO> processCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00012");//진행사항코드
		List<MemberVO> buyerHistSpecCd = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00015");//진행사항코드
		List<MemberVO> buyerBusAreaCd = memberService.selectCommonsList(commonsVo);

		mav.addObject("data", data);
		mav.addObject("processCd", processCd);
		mav.addObject("buyerHistSpecCd", buyerHistSpecCd);
		mav.addObject("buyerBusAreaCd", buyerBusAreaCd);
		mav.setViewName("/view/frontView/myBuyerInformation");
		}else {
			mav.setViewName("/main/main");
		}
		return mav;

	}
	/*
	 *==============================*
	 ||                                                    ||
	 ||	           	 바이어 정보 업데이트 			   	    ||
	 ||              최선권 20191224                  ||
	 *==============================*
	 */
	@RequestMapping(value = "/mypageBuyerUpdate.do")
	public ModelAndView mypageBuyerUpdate(HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemberId((String)session.getAttribute("memberId")); //로그인한 아이디 가져오기
		
		memberVo.setBuyerCeoEmail(request.getParameter("buyerCeoEmail"));
		memberVo.setBuyerHeadTel(request.getParameter("buyerHeadTel"));
		memberVo.setBuyerHeadFax(request.getParameter("buyerHeadFax"));
		memberVo.setBuyerBranchTel(request.getParameter("buyerBranchTel"));
		memberVo.setBuyerBranchFax(request.getParameter("buyerBranchFax"));
		memberVo.setBuyerBusAreaCd(request.getParameter("buyerBusAreaCd"));
		memberVo.setBuyerSite(request.getParameter("buyerSite"));
		memberVo.setBuyerHeadAddr(request.getParameter("buyerHeadAddr"));
		memberVo.setBuyerHeadDetailAddr(request.getParameter("buyerHeadDetailAddr"));
		memberVo.setBuyerBranchAddr(request.getParameter("buyerBranchAddr"));
		memberVo.setBuyerBranchDetailAddr(request.getParameter("buyerBranchDetailAddr"));

		//관리자페이지에서 수정시 추가되는 사항 20191224 최선권
		if(request.getParameter("adminpage")!=null) {
			memberVo.setMemberIdx("관리자페이지에서 업데이트");	//꼭 필요한 내용이니 지우지 마세요 :D
			memberVo.setMemberId(request.getParameter("memberId"));
			memberVo.setBuyerNm(request.getParameter("buyerNm"));
			memberVo.setCompanyNm(request.getParameter("companyNm"));
			memberVo.setBuyerCeo(request.getParameter("buyerCeo"));
			memberVo.setBuyerEstDt(request.getParameter("buyerEstDt"));
			memberVo.setBuyerCapitalAmt(request.getParameter("buyerCapitalAmt").replaceAll(",", ""));
			System.out.println("자본금:" + memberVo.getBuyerCapitalAmt());
		}
		System.out.println("업데이트");
		
		int returnCode = memberService.mypageBuyerUpdate(memberVo);
			mav.addObject("returnCode", returnCode);
			System.out.println(returnCode);
		
		return mav;
	}
	
	/*
	 *==============================*
	 ||                                                    ||
	 ||	           	 바이어 히스토리 저장 			    	||
	 ||              최선권 20191220                  ||
	 *==============================*
	 */
	/*바이어 히스토리 추가하기*/
	@RequestMapping(value = "/mypageBuyerHistInsert.do")
	public ModelAndView mypageBuyerHistInsert(MemberVO memberVo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("회원아이디"+request.getParameter("memberId"));
		memberVo.setMemberId(request.getParameter("memberId"));
		memberVo.setBuyerHistNm(request.getParameter("buyerHistNm"));
		memberVo.setBuyerHistInvt(request.getParameter("buyerHistInvt"));
		memberVo.setBuyerHistSpecCd(request.getParameter("buyerHistSpecCd"));
		memberVo.setBuyerHistDt(request.getParameter("buyerHistDt"));
		memberVo.setBuyerHistContent(request.getParameter("buyerHistContent"));
		memberVo.setProcessCd(request.getParameter("processCd"));
		

		int returnCode = memberService.mypageBuyerHistInsert(memberVo);
		mav.addObject("returnCode",returnCode);
		
		return mav;
	}
	
	/*20191220 최선권 조회*/
	@RequestMapping(value = "/mypageBuyerHistList.do")
	public ModelAndView mypageBuyerHistList(MemberVO memberVo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("조회쿼리문");
		System.out.println("회원아이디:" + memberVo.getMemberId());
		String memberId = request.getParameter("memberId");
		List<MemberVO> data = memberService.mypageBuyerHistList(memberId);
		mav.addObject("data",data);
		
		return mav;
	}
	
	/*히스토리  수정하기*/
	@RequestMapping(value = "/mypageBuyerHistUpdate.do")
	public ModelAndView mypageBuyerHistUpdate(MemberVO memberVo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("회원아이디"+request.getParameter("memberId"));
		memberVo.setMemberId(request.getParameter("memberId"));
		memberVo.setBuyerHistIdx(request.getParameter("buyerHistIdx"));
		memberVo.setBuyerHistNm(request.getParameter("buyerHistNm"));
		memberVo.setBuyerHistInvt(request.getParameter("buyerHistInvt").replaceAll(",",""));
		memberVo.setBuyerHistSpecCd(request.getParameter("buyerHistSpecCd"));
		memberVo.setBuyerHistDt(request.getParameter("buyerHistDt"));
		memberVo.setBuyerHistContent(request.getParameter("buyerHistContent"));
		memberVo.setProcessCd(request.getParameter("processCd"));
		

		int returnCode = memberService.mypageBuyerHistUpdate(memberVo);
		mav.addObject("returnCode",returnCode);
		
		return mav;
	}
	
	/*히스토리  삭제*/
	@RequestMapping(value = "/mypageBuyerHistDelete.do")
	public ModelAndView mypageBuyerHistDelete(MemberVO memberVo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("회원아이디"+request.getParameter("memberId"));
		memberVo.setMemberId(request.getParameter("memberId"));
		memberVo.setBuyerHistIdx(request.getParameter("buyerHistIdx"));
		
		int returnCode = memberService.mypageBuyerHistDelete(memberVo);
		mav.addObject("returnCode",returnCode);
		
		return mav;
	}
}
