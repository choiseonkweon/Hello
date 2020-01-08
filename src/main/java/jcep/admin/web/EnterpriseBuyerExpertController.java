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
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.EnterpriseBuyerExpertService;
import jcep.admin.service.MemberService;

/**
 * @Class Name : EnterpriseBuyerExpertController.java
 * @Description : EnterpriseBuyerExpert Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.20           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class EnterpriseBuyerExpertController {

	@Resource(name = "enterpriseBuyerExpertService")
	protected EnterpriseBuyerExpertService enterpriseBuyerExpertService;
	
	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 기업 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "enterpriseInformationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/enterprise/enterpriseInformationManagementList.do")
	public ModelAndView enterpriseInformationManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("enterpriseInformationManagementList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = enterpriseBuyerExpertService.selectEnterPriseInformationList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = enterpriseBuyerExpertService.selectEnterPriseInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("enterpriseInformationManagementList_2***********************"+searchVO);
		mv.setViewName("/view/enterpriseInformationManagementList");
		
		return mv;
	}
	
	/**
	 * 기업 정보 수정화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "enterpriseInformationManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/enterprise/enterpriseInformationManagementRegisterUpdate.do")
	public ModelAndView enterpriseInformationManagementRegisterUpdate(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		System.out.println("enterpriseInformationManagementRegisterUpdate_1***********************"+searchVO);
		
		String memberId = request.getParameter("memberId");
		searchVO.setMemberId(memberId);
		System.out.println("memberId :: " + memberId);
		MemberVO commonsVo = new MemberVO();

		/*20191219 최선권 공통코드 추가*/
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

		MemberVO detail = enterpriseBuyerExpertService.selectEnterpriseInformationManagementRegisterUpdate(searchVO);
		model.addAttribute("detail", detail);
		model.addAttribute("nationVo", nationVo);
		model.addAttribute("regForm", regForm);
		model.addAttribute("propt", propt);
		model.addAttribute("YearCd", YearCd);
		model.addAttribute("qtaCd", qtaCd);
		model.addAttribute("largeBussAreaCd", largeBussAreaCd);
		model.addAttribute("viewType", "modify");
		System.out.println("detail ?? :: " + detail);
		
		System.out.println("enterpriseInformationManagementRegisterUpdate_2***********************"+searchVO);
		
		mv.setViewName("/view/enterpriseInformationManagementRegister");
		
		return mv;
	}

	/**
	 * 기업 정보 등록화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "enterpriseInformationManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/enterprise/enterpriseInformationManagementRegister.do")
	public ModelAndView enterpriseInformationManagementRegister(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/enterpriseInformationManagementRegister");
		
		return mv;
	}
	
	/**
	 * 기업정보를 수정 및 등록 한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/enterprise/enterpriseInformationManagementUpdate.do")
    public String enterpriseInformationManagementUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	
    	System.out.println("buyerUpdate_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	searchVO.setMemberId(memberId);
    	System.out.println("memberId :: " + memberId);
    	
    	enterpriseBuyerExpertService.enterpriseInformationManagementUpdate(searchVO, request);
    	// 20191204 신승원
    	// 추후 업데이트 되는 부분에서 최선권 주임 업로드 관련 작업 다 되면 추가 관련 확인 후 작업 해야 함
    	//enterpriseBuyerExpertService.buyerMemberInsert(searchVO);
    	
    	System.out.println("buyerUpdate_2***********************"+searchVO);
		
    	return "jsonView";
    }

	/**
	 * 기업정보를 등록한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/enterprise/enterpriseInformationManagementInsert.do")
    public String enterpriseInformationManagementInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	
    	System.out.println("buyerInsert_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	searchVO.setMemberId(memberId);
    	System.out.println("memberId :: " + memberId);
    	
    	enterpriseBuyerExpertService.enterpriseInformationManagementInsert(searchVO);
    	// 20191205 
    	// 추후 성과, 사업진행현황, 직원정보 추가 한다.
    	//enterpriseBuyerExpertService.buyerMemberInsert(searchVO);
    	
    	System.out.println("buyerInsert_2***********************"+searchVO);
		
    	return "jsonView";
    }

	
	/**
	 * 전문가 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "expertInformationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/expert/expertInformationManagementList.do")
	public ModelAndView expertInformationManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
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

		ArrayList<MemberVO> authList = memberService.selectAuthList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = memberService.selectAuthListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/expertInformationManagementList");
		
		return mv;
	}
	
	/**
	 * 전문가 상세페이지 조회.
	 * @param searchVO - MemberVO
	 * @param model
	 * @return "expertInformationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/expert/expertInformationManagementDetail.do")
	public ModelAndView expertInformationManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("searchVO_1***********************"+searchVO);
		System.out.println("졸리다.." + searchVO.getMemberId());
		
		MemberVO data = memberService.expertInformationManagementDetail(searchVO);
		List<MemberVO> data1 = memberService.expertDeliberateInformationManagementDetail(searchVO);
		
		model.addAttribute("data", data);
		model.addAttribute("data1", data1);
		
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/expertInformationManagementDetail");
		
		return mv;
	}
	
	/**
	 * 전문가 정보 등록화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "expertInformationManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/expert/expertInformationManagementRegister.do")
	public ModelAndView expertInformationManagementRegister(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mav, HttpServletRequest request) throws Exception {
		System.out.println("memberId " + request.getParameter("memberId"));
		/*
		 *==============================*
		 ||                                                    ||
		 ||	           	 전문가 정보 불러오기 			    	||
		 ||              최선권 20191214                  ||
		 *==============================*
		 */
		
		String memberId = request.getParameter("memberId");
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
		
		mav.setViewName("/view/expertInformationManagementRegister");
		return mav;
	}
	
	/**
	 * 바이어 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "buyerInformationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/buyer/buyerInformationManagementList.do")
	public ModelAndView buyerInformationManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("buyerInformationManagementList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = enterpriseBuyerExpertService.selectBuyerInformationManagementList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = enterpriseBuyerExpertService.selectBuyerInformationManagementListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("buyerInformationManagementList_2***********************"+searchVO);
		
		mv.setViewName("/view/buyerInformationManagementList");
		
		return mv;
	}
	
	/**
	 * 바이어 정보 등록화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "buyerInformationManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/buyer/buyerInformationManagementRegister.do")
	public ModelAndView buyerInformationManagementRegister(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/buyerInformationManagementRegister");
		
		return mv;
	}
	
	/**
	 * 바이어정보를 등록한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/buyer/buyerInsert.do")
    public String buyerInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") EnterpriseBuyerExpertVO searchVO) throws Exception {
    	
    	System.out.println("buyerInsert_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	searchVO.setMemberId(memberId);
    	System.out.println("memberId :: " + memberId);
    	
    	enterpriseBuyerExpertService.buyerInsert(searchVO);
    	enterpriseBuyerExpertService.buyerMemberInsert(searchVO);
    	
    	System.out.println("buyerInsert_2***********************"+searchVO);
		
    	return "jsonView";
    }

	/**
	 * 바이어정보를 수정 및 등록 한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    @RequestMapping("/buyer/buyerUpdate.do")
    public String buyerUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") EnterpriseBuyerExpertVO searchVO) throws Exception {
    	
    	System.out.println("buyerUpdate_1***********************"+searchVO);
    	
    	String memberId = request.getParameter("memberId");
    	searchVO.setMemberId(memberId);
    	System.out.println("memberId :: " + memberId);
    	
    	enterpriseBuyerExpertService.buyerUpdate(searchVO);
    	// 20191204 신승원
    	// 추후 업데이트 되는 부분에서 최선권 주임 업로드 관련 작업 다 되면 추가 관련 확인 후 작업 해야 함
    	//enterpriseBuyerExpertService.buyerMemberInsert(searchVO);
    	
    	System.out.println("buyerUpdate_2***********************"+searchVO);
		
    	return "jsonView";
    }
	

	/**
	 * 바이어 정보 수정화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "buyerInformationManagementRegisterUpdate"
	 * @exception Exception
	 */
	@RequestMapping("/buyer/buyerInformationManagementRegisterUpdate.do")
	public ModelAndView buyerInformationManagementRegisterUpdate(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		System.out.println("buyerInformationManagementRegisterUpdate_1***********************"+searchVO);
		
		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: "+ request.getParameter("memberId"));
		System.out.println("memberId :: "+ searchVO.getMemberId());
		//String buyerNm = request.getParameter("buyerNm");
		searchVO.setMemberId(memberId);
		//searchVO.setBuyerNm(buyerNm);
		System.out.println("memberId :: " + memberId);
		//System.out.println("buyerNm :: " + buyerNm);
		
		try {
			MemberVO detail = enterpriseBuyerExpertService.selectBuyerInformationManagementRegisterUpdate(searchVO);

			MemberVO commonsVo = new MemberVO();

			/*20191219 최선권 공통코드 추가*/
			commonsVo.setGroupCd("G00015");
			List<MemberVO> buyerBusAreaCd = memberService.selectCommonsList(commonsVo);
			commonsVo.setGroupCd("G00001");
			List<MemberVO> processCd = memberService.selectCommonsList(commonsVo);
			commonsVo.setGroupCd("G00012");
			List<MemberVO> buyerHistSpecCd = memberService.selectCommonsList(commonsVo);
			
			
			
			mv.addObject("buyerBusAreaCd", buyerBusAreaCd);
			mv.addObject("processCd", processCd);
			mv.addObject("buyerHistSpecCd", buyerHistSpecCd);
			model.addAttribute("data", detail);
			model.addAttribute("viewType", "modify");
			
			System.out.println("buyerInformationManagementRegisterUpdate_2***********************"+searchVO);
			
			mv.setViewName("/view/buyerInformationManagementRegister");
		}catch (NumberFormatException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return mv;
	}

    
}
