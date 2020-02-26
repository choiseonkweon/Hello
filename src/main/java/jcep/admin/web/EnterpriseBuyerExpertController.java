package jcep.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hslf.util.SystemTimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.EnterpriseBuyerExpertService;
import jcep.admin.service.MemberService;
import net.sf.json.JSONArray;
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
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		MemberVO commonsVo = new MemberVO();

		/*20191219 최선권 공통코드 추가*/
		commonsVo.setGroupCd("G00002");
		List<MemberVO> largeBussAreaCd = memberService.selectCommonsList(commonsVo);

		ArrayList<MemberVO> authList = enterpriseBuyerExpertService.selectEnterPriseInformationList(searchVO);
		
		int totCnt = enterpriseBuyerExpertService.selectEnterPriseInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("largeBussAreaCd", largeBussAreaCd);
		model.addAttribute("resultList", authList);

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
	@RequestMapping("/enterprise/enterpriseInformationManagementDetail.do")
	public ModelAndView enterpriseInformationManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		int limit = 3;
		String memberId = request.getParameter("memberId");
		searchVO.setLimit(limit);
		searchVO.setMemberId(memberId);
		//기본정보
		HashMap<String,String> detail = enterpriseBuyerExpertService.enterpriseInformationManagementDetail(memberId);
		//성과관리
		List<HashMap<String,String>> list1 = enterpriseBuyerExpertService.enterpriseInformationManagementResultList(searchVO);
		//진흥원 수혜사업
		List<HashMap<String,String>> list2 = enterpriseBuyerExpertService.enterpriseInformationManagementAnncemntApplList(searchVO);
		//지적재산권 현황
		List<HashMap<String,String>> list3 = enterpriseBuyerExpertService.enterpriseInformationManagementProptyList(searchVO);
		//기업사원 정보
		List<HashMap<String,String>> list4 = enterpriseBuyerExpertService.enterpriseInformationManagementEmployeeList(searchVO);
		
		model.addAttribute("detail", detail);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		
		mv.setViewName("/view/enterpriseInformationManagementDetail");
		
		return mv;
	}

	/**
	 * 사업찾기 
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/enterprise/goEntprSubSearchList.do")
	public ModelAndView goEntprSubSearchList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {	
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		searchVO.setLimit(100);
		int totCnt =0;
		String data = searchVO.getSearchType();
		System.out.println("data :" + data);
		System.out.println("memberId :" + searchVO.getMemberId());
		List<HashMap<String,String>> list =  new ArrayList<HashMap<String, String>>();
		if(data.equals("result")) {		//성과관리
			System.out.println("성과관리");
			list = enterpriseBuyerExpertService.enterpriseInformationManagementResultList(searchVO);
			totCnt = enterpriseBuyerExpertService.enterpriseInformationManagementResultListCnt(searchVO);			
		}else if(data.equals("propty")) {//진흥원 수혜사업
			list = enterpriseBuyerExpertService.enterpriseInformationManagementAnncemntApplList(searchVO);
			totCnt = enterpriseBuyerExpertService.enterpriseInformationManagementResultListCnt(searchVO);			
		}else if(data.equals("jecp")) {//지적재산권 현황
			list = enterpriseBuyerExpertService.enterpriseInformationManagementProptyList(searchVO);
			totCnt = enterpriseBuyerExpertService.enterpriseInformationManagementResultListCnt(searchVO);			
		}else if(data.equals("employee")) {//기업사원 정보
			list = enterpriseBuyerExpertService.enterpriseInformationManagementEmployeeList(searchVO);
			totCnt = enterpriseBuyerExpertService.enterpriseInformationManagementResultListCnt(searchVO);			
		}
		System.out.println(list.toString());
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", list);
		model.addAttribute("data", data);
		
		mv.setViewName("/html/goEntprSubSearchPop");
		
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
    public ModelAndView enterpriseInformationManagementUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
    	ModelAndView mav = new ModelAndView();
		MemberVO commonsVo = new MemberVO();

		int limit = 3;
		String memberId = request.getParameter("memberId");
		searchVO.setLimit(limit);
		searchVO.setMemberId(memberId);

		HashMap<String,String> detail = enterpriseBuyerExpertService.enterpriseInformationManagementDetail(memberId);		//기본정보
		List<HashMap<String,String>> list1 = enterpriseBuyerExpertService.enterpriseInformationManagementResultList(searchVO);		//성과관리
		List<HashMap<String,String>> list2 = enterpriseBuyerExpertService.enterpriseInformationManagementAnncemntApplList(searchVO);		//진흥원 수혜사업
		List<HashMap<String,String>> list3 = enterpriseBuyerExpertService.enterpriseInformationManagementProptyList(searchVO);		//지적재산권 현황
		List<HashMap<String,String>> list4 = enterpriseBuyerExpertService.enterpriseInformationManagementEmployeeList(searchVO);		//기업사원 정보


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
		
		commonsVo.setGroupCd("G00048");
		List<MemberVO> telNum = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00049");
		List<MemberVO> totNum = memberService.selectCommonsList(commonsVo);
		commonsVo.setGroupCd("G00050");
		List<MemberVO> hpNum = memberService.selectCommonsList(commonsVo);

		mav.addObject("list",detail);
		mav.addObject("nationVo",nationVo);
		mav.addObject("regForm",regForm);
		mav.addObject("propt",propt);
		mav.addObject("propt",propt);
		mav.addObject("YearCd",YearCd);
		mav.addObject("qtaCd",qtaCd);
		mav.addObject("largeBussAreaCd",largeBussAreaCd);
		mav.addObject("telNum",telNum);
		mav.addObject("totNum",totNum);
		mav.addObject("hpNum",hpNum);
		mav.addObject("list1",list1);
		mav.addObject("list2",list2);
		mav.addObject("list3",list3);
		mav.addObject("list4",list4);
		mav.setViewName("/view/enterpriseInformationManagementUpdate");
    	return mav;
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
	
	  /*
    ┌**************************************┐
	|**************평가위원 추출**************** |
    └**************************************┘
   */	
  
	@RequestMapping(value = "/evalu/evaluInformationManagementList.do")
	public ModelAndView evaluInformationManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mav) throws Exception {
		
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

		
		List<Map<String,String>> list = enterpriseBuyerExpertService.selectEvaluList(searchVO);
		mav.addObject("list", list);
		
		int totCnt = enterpriseBuyerExpertService.selectEvaluListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		mav.addObject("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mav.setViewName("/view/evaluInformationManagementList");
		
		return mav;
	}

	  @RequestMapping(value = "/evalu/evaluInformationManagementInsert.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  evaluInformationManagementInsert(@RequestParam(required=false) Map<String, String> map) throws Exception {		
		  ModelAndView mav = new ModelAndView();

		  MemberVO commonsVo = new MemberVO();

			/*20191219 최선권 공통코드 추가*/
			commonsVo.setGroupCd("G00022");
			List<MemberVO> selectClassCd = memberService.selectCommonsList(commonsVo);

			mav.addObject("selectClassCd",selectClassCd);
			mav.setViewName("/view/evaluInformationManagementInsert");
		
		return mav;
	}
	  @RequestMapping(value = "/evalu/selectExpertList.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  SelectExpertList(@RequestParam(value="selectClassCd[]") List<String> selectClassCd, @RequestParam(value="evaluationCnt") int evaluationCnt) throws Exception {
		  ModelAndView mav = new ModelAndView();
		  HashMap<String,Object> hMap = new HashMap<String,Object>();
		  hMap.put("selectClassCd", selectClassCd);
		  hMap.put("evaluationCnt", evaluationCnt);
		  List<Map<String,Object>>expertList = memberService.SelectExpertList(hMap);
		  List<Map<String,Object>>selectClassNm = memberService.selectClassNmList(hMap);		  


		  mav.addObject("expert",expertList);
		  mav.addObject("selectClassNm",selectClassNm);
		  mav.setViewName("/html/ExpertEvaluList");
		  return mav;
	  }

		@RequestMapping("/evalu/ExpertEvaluInsertOk.do")
		public String ExpertEvaluInsertOk(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList) throws Exception {
	        ObjectMapper om = new ObjectMapper();
	        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);
	        String selectTitle =  om.readValue(om.writeValueAsString(paramList.get("selectTitle")),String.class);
	        String evaluationDt =  om.readValue(om.writeValueAsString(paramList.get("evaluationDt")),String.class);
	        String evaluationCnt =  om.readValue(om.writeValueAsString(paramList.get("evaluationCnt")),String.class);
	        List<Map<String,Object>> selectClassCd =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("selectClassCd"))),List.class);
	        HashMap<String,Object> map = new HashMap<String,Object>();
	        map.put("list",list);	//list형식
	        map.put("selectClassCd",selectClassCd);//list형식;
	        map.put("selectTitle",selectTitle);
	        map.put("evaluationDt",evaluationDt);
	        map.put("evaluationCnt",evaluationCnt);
	        
	        memberService.ExpertEvaluInsertOk(map);
	        
			return "jsonView";
		}	
		
		
		@RequestMapping("evalu/evaluInformationManagementDetail.do")
		public ModelAndView evaluInformationManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mav) throws Exception {
			String param = searchVO.getSelectNo();
			System.out.println("하잇"+param);
			HashMap<String,String> result = memberService.selectEvaluInformationManagementDetail(param);
			List<HashMap<String,String>> selectClassNm = memberService.selectClassNm(param);
			List<HashMap<String,String>> slectEvaluDtlList = memberService.selectEvaluInformationManagementDetailList(param);

			  for(int i=0;i<selectClassNm.size();i++) {
				  System.out.println(selectClassNm.get(i));
			  }
			  for(int i=0;i<slectEvaluDtlList.size();i++) {
				  System.out.println(slectEvaluDtlList.get(i));
			  }
			System.out.println(result.toString());
			
			mav.addObject("result",result);
			mav.addObject("selectClassNm",selectClassNm);
			mav.addObject("slectEvaluDtlList",slectEvaluDtlList);
			mav.setViewName("/view/evaluInformationManagementDetail");
			return mav;
		}


		// 엑셀 다운로드
		@RequestMapping("/evalu/ExpertEvaluExcelDownload.do")
		public ModelAndView  ExpertEvaluExcelDownload(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, HttpServletRequest request, HttpServletResponse response) throws Exception {
		    ModelAndView mav = new ModelAndView("excelView");

			ObjectMapper om = new ObjectMapper();
	        List<Map<String,String>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);
	        String selectTitle =  om.readValue(om.writeValueAsString(paramList.get("selectTitle")),String.class);
	        String evaluationDt =  om.readValue(om.writeValueAsString(paramList.get("evaluationDt")),String.class);
	        String evaluationCnt =  om.readValue(om.writeValueAsString(paramList.get("evaluationCnt")),String.class);
	        List<Map<String,String>> selectClassCd =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("selectClassCd"))),List.class);

			Map<String , Object> dataMap = new HashMap<String , Object>();


		    String filename = "evaluExpertMemberList_"+System.currentTimeMillis();
		    String[] columnArr = {"번호", "전문가 명", "참석여부", "비고"};

			dataMap.put("list", list);		
			dataMap.put("filename", filename);		
		    dataMap.put("columnArr", columnArr);
		    dataMap.put("sheetNm", "게시물 목록");    
		    mav.addObject("dataMap", dataMap);
	        return mav;//여기서 mav를 타면 
		}		
}
