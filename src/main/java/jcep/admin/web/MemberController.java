package jcep.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;

/**
 * @Class Name : MemberController.java
 * @Description : Member Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.07           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MemberController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 회원 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "memberList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/member/memberList.do")
	public ModelAndView memberList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("memberList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> memberList = memberService.selectMemberList(searchVO);
		model.addAttribute("resultList", memberList);
		
		int totCnt = memberService.selectMemberListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("memberListt_2***********************"+searchVO);
		mv.setViewName("/view/memberList");
		
		return mv;
	}



	/**
	 * 기업회원정보 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "memberRegister"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberCreate.do")
	public ModelAndView memberCreate(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {

		String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
		System.out.println("searchVO_2***********************"+searchVO);
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/memberRegister");
		
		return mv;
	}

	/**
	 * 전문가회원정보 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "memberRegister"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberCreate1.do")
	public ModelAndView memberCreate1(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {


		String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
		System.out.println("searchVO_2***********************"+searchVO);
		
		model.addAttribute("viewType", "create1");
		
		mv.setViewName("/view/memberRegister");
		
		return mv;
	}

	/**
	 * 바이어회원정보 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "memberRegister"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberCreate2.do")
	public ModelAndView memberCreate2(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {

		String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
		model.addAttribute("viewType", "create2");
		
		mv.setViewName("/view/memberRegister");
		
		return mv;
	}

	/**
	 * 관리자 정보 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "memberDetailAuth"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberDetailAuth.do")
	public ModelAndView memberDetailAuthCreate(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		
		model.addAttribute("viewType", "create");
		mv.setViewName("/view/memberDetailAuth");
		
		return mv;
	}
	

	
	
	
	/**
	 * 회원 아이디 중복 체크
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberIdChk"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberIdChk.do")
    public String memberIdChk(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    
    	int idCnt = memberService.memberIdChk(searchVO);
    	
    	model.addAttribute("idCnt", idCnt);
    	
		return "jsonView";
    }

	/**
	 * 관리자 아이디 중복 체크
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberIdChk"
	 * @exception Exception
	 */
    @RequestMapping("/member/mngIdChk.do")
    public String mngIdChk(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    
    	int idCnt = memberService.mngIdChk(searchVO);
    	
    	model.addAttribute("idCnt", idCnt);
    	
		return "jsonView";
    }

    
	/**
	 * 회원정보를 등록한다.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberInsert.do")
    public String memberInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv) throws Exception {
    	System.out.println("memberInsert_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	String joinTypeCd = request.getParameter("joinTypeCd");
    	searchVO.setMemberId(memberId);
    	searchVO.setJoinTypeCd(joinTypeCd);
    	System.out.println("memberId :: " + memberId);
    	System.out.println("joinTypeCd ::: " + joinTypeCd);
    	
    	String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
    	
    	if(joinTypeCd.equals("000001")) {
    		System.out.println("joinTypeCd.equals(000001)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeOne = memberService.memberInsertOne(searchVO);
    	}else if(joinTypeCd.equals("000002")){
    		System.out.println("joinTypeCd.equals(000002)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeTwo = memberService.memberInsertTwo(searchVO);
    	}else if(joinTypeCd.equals("000003")) {
    		System.out.println("joinTypeCd.equals(000003)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeThree = memberService.memberInsertThree(searchVO);
    	}else {
    		
    	}
    	
    	System.out.println("memberInsert_2***********************"+searchVO);
    	
		
    	return "jsonView";
    }


	/**
	 * 회원정보를 등록한다.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberInsert1.do")
    public String memberInsert1(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv) throws Exception {
    	System.out.println("memberInsert1_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	String joinTypeCd = request.getParameter("joinTypeCd");
    	searchVO.setMemberId(memberId);
    	searchVO.setJoinTypeCd(joinTypeCd);
    	System.out.println("memberId :: " + memberId);
    	System.out.println("joinTypeCd ::: " + joinTypeCd);
    	
    	String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
    	
    	if(joinTypeCd.equals("000001")) {
    		System.out.println("joinTypeCd.equals(000001)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeOne = memberService.memberInsertOne(searchVO);
    	}else if(joinTypeCd.equals("000002")){
    		System.out.println("joinTypeCd.equals(000002)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeTwo = memberService.memberInsertTwo(searchVO);
    	}else if(joinTypeCd.equals("000003")) {
    		System.out.println("joinTypeCd.equals(000003)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeThree = memberService.memberInsertThree(searchVO);
    	}else {
    		
    	}
    	
    	System.out.println("memberInsert1_2***********************"+searchVO);
		
    	return "jsonView";
    }
    
    

	/**
	 * 회원정보를 등록한다.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberInsert2.do")
    public String memberInsert2(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv) throws Exception {
    	System.out.println("memberInsert2_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	String joinTypeCd = request.getParameter("joinTypeCd");
    	searchVO.setMemberId(memberId);
    	searchVO.setJoinTypeCd(joinTypeCd);
    	System.out.println("memberId :: " + memberId);
    	System.out.println("joinTypeCd ::: " + joinTypeCd);
    	
    	String joinTypeCdNm = request.getParameter("joinTypeCdNm");
		searchVO.setJoinTypeCdNm(joinTypeCdNm);
    	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
    	
    	MemberVO detail = null;
    	

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
		commonsVo.setGroupCd("g00044");
		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
		
		commonsVo.setGroupCd("g00017");
		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
		commonsVo.setGroupCd("g00012");
		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
		commonsVo.setGroupCd("g00013");
		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
		commonsVo.setGroupCd("g00014");
		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표
		
		
		
		
		/*		
		 * ==============================*
		 ||					  									 ||
		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
		 ||					       		 						 ||
		 * ==============================*
		 
		System.out.println("기업성과정보 조회");
		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
		List<MemberVO> detail4 = null;
		if(check2 > 0) {
			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
			mav.addObject("data4", detail4);
		}*/

		mv.addObject("largeBussAreaCd",largeBussAreaCd);
		mv.addObject("YearCd",YearCd);
		mv.addObject("qtaCd",qtaCd);
		mv.addObject("propt",propt);
		mv.addObject("regForm",regForm);
		mv.addObject("nationVo",nationVo);
		mv.addObject("detail", detail);
		mv.addObject("expertFnalEduCd", expertFnalEduCd);
		
		mv.addObject("expertIndsEduCd", expertIndsEduCd);
		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
		
		
    	
    	if(joinTypeCd.equals("000001")) {
    		System.out.println("joinTypeCd.equals(000001)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeOne = memberService.memberInsertOne(searchVO);
    	}else if(joinTypeCd.equals("000002")){
    		System.out.println("joinTypeCd.equals(000002)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeTwo = memberService.memberInsertTwo(searchVO);
    	}else if(joinTypeCd.equals("000003")) {
    		System.out.println("joinTypeCd.equals(000003)");
    		Integer returnCode = memberService.memberInsert(searchVO);
    		Integer returnCodeThree = memberService.memberInsertThree(searchVO);
    	}else {
    		
    	}
    	
    	System.out.println("memberInsert2_2***********************"+searchVO);
		
    	return "jsonView";
    }


    
	/**
	 * 회원정보를 등록한다.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberDetailAuthInsert.do")
    public String memberDetailAuthInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
		System.out.println("memberDetailAuthInsert_1***********************"+searchVO);

    	String mngId = request.getParameter("mngId");
    	searchVO.setMngId(mngId);
    	System.out.println("mngId :: " + mngId);
    	
   		Integer returnCode = memberService.memberDetailAuthInsert(searchVO);
   		
   		System.out.println("memberListt_2***********************"+searchVO);
   		
    	return "jsonView";
    }
    
    
    
	/**
	 * 회원정보 수정화면을 조회한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberDetail.do")
	public ModelAndView memberDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		String memberId = request.getParameter("memberId");
		String joinTypeCd = request.getParameter("joinTypeCd");
		searchVO.setMemberId(memberId);
    	searchVO.setJoinTypeCd(joinTypeCd);
		System.out.println("memberId :: " + memberId);
    	System.out.println("joinTypeCd :: " + joinTypeCd);
		
    	if(joinTypeCd.equals("기업회원"))
    	{
    		String joinTypeCdNm = request.getParameter("joinTypeCd");
    		searchVO.setJoinTypeCdNm(joinTypeCdNm);
        	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
        	
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
    		commonsVo.setGroupCd("g00044");
    		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
    		
    		commonsVo.setGroupCd("g00017");
    		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
    		commonsVo.setGroupCd("g00012");
    		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
    		commonsVo.setGroupCd("g00013");
    		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
    		commonsVo.setGroupCd("g00014");
    		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표

    		
    		/*		
    		 * ==============================*
    		 ||					  									 ||
    		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
    		 ||					       		 						 ||
    		 * ==============================*
    		 
    		System.out.println("기업성과정보 조회");
    		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
    		List<MemberVO> detail4 = null;
    		if(check2 > 0) {
    			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
    			mav.addObject("data4", detail4);
    		}*/

        	//MemberVO detail = null;

			MemberVO detail = memberService.selectMemberDetail(searchVO);

    		mv.addObject("largeBussAreaCd",largeBussAreaCd);
    		mv.addObject("YearCd",YearCd);
    		mv.addObject("qtaCd",qtaCd);
    		mv.addObject("propt",propt);
    		mv.addObject("regForm",regForm);
    		mv.addObject("nationVo",nationVo);
    		mv.addObject("detail", detail);

    		mv.addObject("expertFnalEduCd", expertFnalEduCd);
    		
    		mv.addObject("expertIndsEduCd", expertIndsEduCd);
    		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
    		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
    		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
    		
    		
    		
    		System.out.println("searchVO_2***********************"+searchVO);
    		
    		
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify");
			System.out.println("detail?? :: " + detail);
    	}

    	else if(joinTypeCd.equals("전문가"))
    	{

    		String joinTypeCdNm = request.getParameter("joinTypeCd");
    		searchVO.setJoinTypeCdNm(joinTypeCdNm);
        	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
        	
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
    		commonsVo.setGroupCd("g00044");
    		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
    		
    		commonsVo.setGroupCd("g00017");
    		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
    		commonsVo.setGroupCd("g00012");
    		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
    		commonsVo.setGroupCd("g00013");
    		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
    		commonsVo.setGroupCd("g00014");
    		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표

    		
    		/*		
    		 * ==============================*
    		 ||					  									 ||
    		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
    		 ||					       		 						 ||
    		 * ==============================*
    		 
    		System.out.println("기업성과정보 조회");
    		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
    		List<MemberVO> detail4 = null;
    		if(check2 > 0) {
    			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
    			mav.addObject("data4", detail4);
    		}*/

        	//MemberVO detail = null;
			MemberVO detail = memberService.selectMemberDetail1(searchVO);
			

    		mv.addObject("largeBussAreaCd",largeBussAreaCd);
    		mv.addObject("YearCd",YearCd);
    		mv.addObject("qtaCd",qtaCd);
    		mv.addObject("propt",propt);
    		mv.addObject("regForm",regForm);
    		mv.addObject("nationVo",nationVo);
    		mv.addObject("detail", detail);

    		mv.addObject("expertFnalEduCd", expertFnalEduCd);
    		
    		mv.addObject("expertIndsEduCd", expertIndsEduCd);
    		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
    		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
    		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
    		
    		
			
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify1");
			System.out.println("detail?? :: " + detail);
    	}
    	else if(joinTypeCd.equals("바이어"))
    	{

    		String joinTypeCdNm = request.getParameter("joinTypeCd");
    		searchVO.setJoinTypeCdNm(joinTypeCdNm);
        	System.out.println("joinTypeCdNm :: " + joinTypeCdNm);
        	
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
    		commonsVo.setGroupCd("g00044");
    		List<MemberVO> expertFnalEduCd = memberService.selectCommonsList(commonsVo);	//학력코드표
    		
    		commonsVo.setGroupCd("g00017");
    		List<MemberVO> expertIndsEduCd = memberService.selectCommonsList(commonsVo);	//산학연간코드표
    		commonsVo.setGroupCd("g00012");
    		List<MemberVO> largeSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 대분류 코드표
    		commonsVo.setGroupCd("g00013");
    		List<MemberVO> mediumSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 소분류 코드표
    		commonsVo.setGroupCd("g00014");
    		List<MemberVO> detailSpecialAreaCd = memberService.selectCommonsList(commonsVo);	//전문가 세부전문분야분류 코드표

    		
    		/*		
    		 * ==============================*
    		 ||					  									 ||
    		 ||	  	 기업성과정보 조회 	최선권	20191209	 ||
    		 ||					       		 						 ||
    		 * ==============================*
    		 
    		System.out.println("기업성과정보 조회");
    		int check2 = memberService.mypageEnterpriseResultCheck(memberId);
    		List<MemberVO> detail4 = null;
    		if(check2 > 0) {
    			detail4 = memberService.mypageEnterpriseResult(memberId);		//수혜사업신청이 승인된 List 가져오기
    			mav.addObject("data4", detail4);
    		}*/

        	//MemberVO detail = null;
			MemberVO detail = memberService.selectMemberDetail2(searchVO);
			


    		mv.addObject("largeBussAreaCd",largeBussAreaCd);
    		mv.addObject("YearCd",YearCd);
    		mv.addObject("qtaCd",qtaCd);
    		mv.addObject("propt",propt);
    		mv.addObject("regForm",regForm);
    		mv.addObject("nationVo",nationVo);
    		mv.addObject("detail", detail);

    		mv.addObject("expertFnalEduCd", expertFnalEduCd);
    		
    		mv.addObject("expertIndsEduCd", expertIndsEduCd);
    		mv.addObject("largeSpecialAreaCd", largeSpecialAreaCd);
    		mv.addObject("mediumSpecialAreaCd", mediumSpecialAreaCd);
    		mv.addObject("detailSpecialAreaCd", detailSpecialAreaCd);
    		
    		
			
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify2");
			System.out.println("detail?? :: " + detail);
    	}

		mv.setViewName("/view/memberRegister");		
		return mv;
	}
	
	/**
	 * 회원정보를 수정한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberUpdate.do")
    public String memberUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	
    	String memberId = request.getParameter("memberId");
    	String joinTypeCd = request.getParameter("joinTypeCd");
    	searchVO.setMemberId(memberId);
    	searchVO.setJoinTypeCd(joinTypeCd);
    	System.out.println("memberId :: " + memberId);
    	System.out.println("joinTypeCd ::: " + joinTypeCd);
    	
    	if(joinTypeCd.equals("000001")) {
    		System.out.println("joinTypeCd.equals(기업회원)");
    		Integer returnCode = memberService.memberUpdate(searchVO);
    		Integer returnCodeOne = memberService.memberUpdateOne(searchVO);
    	}else if(joinTypeCd.equals("000002")){
    		System.out.println("joinTypeCd.equals(전문가회원)");
    		Integer returnCode = memberService.memberUpdate(searchVO);
    		Integer returnCode1 = memberService.memberUpdateTwo(searchVO);
    	}else if(joinTypeCd.equals("000003")) {
    		System.out.println("joinTypeCd.equals(바이어회원)");
    		Integer returnCode = memberService.memberUpdate(searchVO);
    		Integer returnCode2 = memberService.memberUpdateThree(searchVO);
    	}else {
    		System.out.println("joinTypeCd.equals(E)");
    		Integer returnCode = memberService.memberUpdate(searchVO);
    	}
    	
		return "jsonView";
    }
    /**
	 * 관리자 정보를 수정한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/member/managerDetailAuthUpdate.do")
    public String managerDetailAuthUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	System.out.println("managerDetailAuthUpdate_1***********************"+searchVO);
    	
    	String mngId = request.getParameter("mngId");
    	//String joinTypeCd = request.getParameter("joinTypeCd");
    	searchVO.setMngId(mngId);
    	System.out.println("mngId :: " + mngId);
    	
    	Integer returnCode = memberService.managerDetailAuthUpdate(searchVO);
    	
    	System.out.println("managerDetailAuthUpdate_2***********************"+searchVO);
		return "jsonView";
    }
    
    
    
	/**
	 * 회원정보를 승인 및 거절한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberList"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberConfirm.do")
    public String memberConfirm(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	
    	String memberId = request.getParameter("memberId");
    	searchVO.setMemberId(memberId);
    	System.out.println("memberId :: " + memberId);
    	
    	memberService.memberConfirm(searchVO);
    	
		return "jsonView";
    }
    
	/**
	 * 권한관리 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "authList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/member/authList.do")
	public ModelAndView authList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("authList_1***********************"+searchVO);
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = memberService.selectManageList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = memberService.selectManageListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		System.out.println("authList_2***********************"+searchVO);

		mv.setViewName("/view/authList");
		
		return mv;
	}

	/**
	 * 관리자정보 수정화면을 조회한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegisterAuthList"
	 * @exception Exception
	 */
	@RequestMapping("/member/memberDetailAuthList.do")
	public ModelAndView memberDetailAuthList(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("memberDetailAuthList_1***********************"+searchVO);
		
		String mngId = request.getParameter("mngId");
		String authTpCd = request.getParameter("authTpCd");
		searchVO.setMngId(mngId);
    	searchVO.setAuthTpCd(authTpCd);
		System.out.println("mngId :: " + mngId);
    	System.out.println("authTpCd :: " + authTpCd);
		
		MemberVO detail = memberService.selectMemberDetailAuthList(searchVO);
		model.addAttribute("detail", detail);
		model.addAttribute("viewType", "modify");
		System.out.println("detail?? :: " + detail);
		
		System.out.println("memberDetailAuthList_2***********************"+searchVO);
		
		mv.setViewName("/view/memberDetailAuth");
		
		return mv;
	}
	
	
		
	/**
	 * 회원 권한을 설정한다.
	 * @param memberidx - 수정할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberList"
	 * @exception Exception
	 */
    @RequestMapping("/member/memberAuthSave.do")
    public String memberAuthSave(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	
    	String memberId = request.getParameter("memberId");
    	String memberIdx = request.getParameter("memberIdx");
    	String mngId = request.getParameter("memberId");
    	String authTpCd = request.getParameter("authTpCd");
    	
    	String authTpCdValue = request.getParameter("authTpCdValue");
    	String authTpCdText = request.getParameter("authTpCdText");
    	
    	String checkRow = searchVO.getCheckRow();
		String checkauthTpCdAuth = searchVO.getAuthTpCd();
		String[] checkRowArray = checkRow.split(",");
		String[] authTpCdAuthArray = checkauthTpCdAuth.split(",");
		MemberVO dataVO = new MemberVO();
		
		if(checkauthTpCdAuth != null) {
			for(int i=0; i <checkauthTpCdAuth.length(); i++) {
				System.out.println("checkauthTpCdAuth[i] :: " + checkauthTpCdAuth);
			}
		}
		
		System.out.println("checkRow :: " + checkRow);
		System.out.println("checkauthTpCdAuth :: " + checkauthTpCdAuth);
		System.out.println("checkRowArray :: " + checkRowArray);
		System.out.println("authTpCdAuthArray :: " + authTpCdAuthArray);
    	
    	searchVO.setMemberIdx(memberIdx);
    	searchVO.setMemberId(memberId);
    	searchVO.setMngId(mngId);
    	searchVO.setAuthTpCd(authTpCd);
    	searchVO.setAuthTpCdValue(authTpCdValue);
    	searchVO.setAuthTpCdText(authTpCdText);
    	
    	System.out.println("memberIdx :: " + memberIdx);
    	System.out.println("memberId :: " + memberId);
    	System.out.println("mngId :: " + mngId);
    	System.out.println("authTpCd ::: " + authTpCd);
    	System.out.println("authTpCdValue ::: " + authTpCdValue);
    	System.out.println("authTpCdText ::: " + authTpCdText);
    	
    	memberService.memberAuthSave(searchVO, request);
    	
		return "jsonView";
    }
}
