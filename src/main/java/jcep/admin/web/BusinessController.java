 package jcep.admin.web;

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
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.EnterpriseBuyerExpertService;
import jcep.admin.service.MemberService;

/**
 * @Class Name : BusinessController.java
 * @Description : Business Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.26           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BusinessController {

	@Resource(name = "enterpriseBuyerExpertService")
	protected EnterpriseBuyerExpertService enterpriseBuyerExpertService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="noticeFilePath")
    String noticeFilePath;

	@Resource(name = "memberService")
	protected MemberService memberService;
	

	/**
	 * 사업 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessManagementList" test
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessManagementList.do")
	public ModelAndView businessManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("searchVO_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = enterpriseBuyerExpertService.selectBusinessManagementList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = enterpriseBuyerExpertService.selectBusinessManagementListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/businessManagementList");
		
		return mv;
	}
	
	/**
	 * 사업 등록화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegister.do")
	public ModelAndView businessManagementRegister(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		

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

		commonsVo.setGroupCd("g00023");
		List<MemberVO> bussDeptCd = memberService.selectCommonsList(commonsVo);	//시업부서 세부전문분야분류 코드표
		
		
		
		
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
		
		mv.addObject("bussDeptCd", bussDeptCd);
		
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/businessManagementRegister");
		
		return mv;
	}
	

	/**
	 * 사업 등록화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegisterUpdate.do")
	public ModelAndView businessManagementRegisterUpeate(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpeate_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
		
		
		MemberVO commonsVo = new MemberVO();
		
		commonsVo.setGroupCd("g00023");
		List<MemberVO> bussDeptCd = memberService.selectCommonsList(commonsVo);	//시업부서 세부전문분야분류 코드표
		
		mv.addObject("bussDeptCd",bussDeptCd);
		
		MemberVO detail = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeate(searchVO);
		List<MemberVO> detail1 = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeateFile(searchVO);
		List<MemberVO> detail2 = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeateFile(searchVO);
		System.out.println( "사업부서::" + detail.getBussDeptCd());
		model.addAttribute("detail", detail);
		model.addAttribute("detail1", detail1);
		model.addAttribute("detail2", detail2);
		model.addAttribute("viewType", "modify");
		System.out.println("detail :: " + detail);
		System.out.println("detail1 :: " + detail1);
		System.out.println("detail2 :: " + detail2);
		
		/*List<MemberVO> detail1 = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeateFile(searchVO);
		model.addAttribute("detail", detail1);
		System.out.println("detail :: " + detail1);*/
		
		
		System.out.println("businessManagementRegisterUpeate_2***********************"+searchVO);
		
		mv.setViewName("/view/businessManagementRegister");
		
		return mv;
	}
	

	/**
	 * 사업 등록화면을 수정한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegisterUpdateSave.do")
	public String businessManagementRegisterUpeateSave(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpeateSave_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		String remark = request.getParameter("regark");		
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		searchVO.setRemark(remark);
		System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
		System.out.println("remark :: " + remark);
		
		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterUpeateSave(searchVO);
		// 추후 첨부파일 관련된 내용도 추가 해야 함!!
		
		System.out.println("businessManagementRegisterUpeateSave_2***********************"+searchVO);
		
		return "jsonView";
	}

	/**
	 * 사업 승인상태을 수정한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegisterUpdateButton.do")
	public ModelAndView businessManagementRegisterUpdateButton(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpdateButton_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		String attchFileNo = request.getParameter("attchFileNo");
		String orgFileNm = request.getParameter("orgFileNm");
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		searchVO.setAttchFileNo(attchFileNo);
		searchVO.setOrgFileNm(orgFileNm);
		System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
		System.out.println("attchFileNo :: " + attchFileNo);
		System.out.println("orgFileNm :: " + orgFileNm);
		
		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterUpdateButton(searchVO);
		Integer returnCode1 = enterpriseBuyerExpertService.businessManagementRegisterUpdateInsert(searchVO);
		// 추후 첨부파일 관련된 내용도 추가 해야 함!!
		
		System.out.println("businessManagementRegisterUpdateButton_2***********************"+searchVO);
		
		//mv.setViewName("/db/business/businessManagementRegisterUpdateButton");
		
		return businessManagementList(searchVO, mv, model);
	}

	/**
	 * 사업 승인상태을 수정한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegisterUpdateButton1.do")
	public ModelAndView businessManagementRegisterUpdateButton1(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpdateButton1_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		String attchFileNo = request.getParameter("attchFileNo");
		String orgFileNm = request.getParameter("orgFileNm");
		String remark = request.getParameter("remark");		
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		searchVO.setAttchFileNo(attchFileNo);
		searchVO.setOrgFileNm(orgFileNm);
		searchVO.setRemark(remark);
		System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
		System.out.println("attchFileNo :: " + attchFileNo);
		System.out.println("orgFileNm :: " + orgFileNm);
		System.out.println("remark :: " + remark);
	
		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterUpdateButton1(searchVO);
		Integer returnCode1 = enterpriseBuyerExpertService.businessManagementRegisterUpdateDelete(searchVO);
		
		// 추후 첨부파일 관련된 내용도 추가 해야 함!!
		
		System.out.println("businessManagementRegisterUpdateButton1_2***********************"+searchVO);
		
		//mv.setViewName("/db/business/businessManagementRegisterUpdateButton");
		
		return businessManagementList(searchVO, mv, model);
	}

	/**
	 * 사업 승인상태을 수정한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessManagementRegisterUpdateButton2.do")
	public ModelAndView businessManagementRegisterUpdateButton2(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpdateButton2_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		String attchFileNo = request.getParameter("attchFileNo");
		String orgFileNm = request.getParameter("orgFileNm");
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		searchVO.setAttchFileNo(attchFileNo);
		searchVO.setOrgFileNm(orgFileNm);
		System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
		System.out.println("attchFileNo :: " + attchFileNo);
		System.out.println("orgFileNm :: " + orgFileNm);
		
		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterUpdateButton2(searchVO);
		// 추후 첨부파일 관련된 내용도 추가 해야 함!!
		
		System.out.println("businessManagementRegisterUpdateButton2_2***********************"+searchVO);
		
		//mv.setViewName("/db/business/businessManagementRegisterUpdateButton");
		
		return businessManagementList(searchVO, mv, model);
	}
	
	
	
	/**
	 * 사업 수주 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessOrderStatusList.do")
	public ModelAndView businessOrderStatusList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
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

		/*ArrayList<MemberVO> authList = memberService.selectAuthList(searchVO);
		model.addAttribute("resultList", authList);*/
		
	//	int totCnt = memberService.selectAuthListTotCnt(searchVO);
	//	paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/businessOrderStatusList");
		
		return mv;
	}
	
	/**
	 * 사업 수주 상세 화면을 조회한다.
	 * @param EnterpriseBuyerExpertVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "businessManagementRegister"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessOrderStatusDetail.do")
	public ModelAndView businessOrderStatusDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		mv.setViewName("/view/businessOrderStatusDetail");
		
		return mv;
	}
	

	/**
	 * 사업정보를 등록한다.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberRegister"
	 * @exception Exception
	 */
    /*@RequestMapping("/business/businessManagementRegisterInsert.do")
    public String businessManagementRegisterInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
		System.out.println("businessManagementRegisterInsert_1***********************"+searchVO);

    	String mngId = request.getParameter("mngId");
    	searchVO.setMngId(mngId);
    	System.out.println("mngId :: " + mngId);
    	
   		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterInsert(searchVO);
   		
   		System.out.println("businessManagementRegisterInsert_2***********************"+searchVO);
   		
    	return "jsonView";
    }
    */
    @RequestMapping("/business/businessManagementRegisterInsert.do")
	public ModelAndView businessManagementRegisterInsert(MemberVO searchVO,HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
    	System.out.println("businessManagementRegisterInsert_1***********************"+searchVO);
    	
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
		
		System.out.println("get겟겟겟 :: " + memberVo.getFileCourse());
		System.out.println("org겟겟겟 :: " + memberVo.getOrgFileNm());
		
		String bussCostAmt = String.valueOf("bussCostAmt");
		
		memberVo.setBussAnncemntNo(request.getParameter("bussAnncemntNo"));
		memberVo.setBussAnncemntNm(request.getParameter("bussAnncemntNm"));
		memberVo.setBussFrDt(request.getParameter("bussFrDt"));
		memberVo.setBussToDt(request.getParameter("bussToDt"));
		memberVo.setBussCostAmt(Integer.parseInt(request.getParameter("bussCostAmt")));
		memberVo.setBussDeptCd(request.getParameter("bussDeptCd"));
		memberVo.setOriginalUrl(request.getParameter("originalUrl"));
		memberVo.setBussCont(request.getParameter("bussCont"));
		memberVo.setBussDiviCd(request.getParameter("bussDiviCd"));
		memberVo.setApplicStCd(request.getParameter("applicStCd"));
		memberVo.setMemberId(request.getParameter("memberId")); //로그인한 아이디 가져오기
		memberVo.setApprovalDt(request.getParameter("approvalDt"));
/*		memberVo.setOrgFileNm(request.getParameter("orgFileNm"));
		memberVo.setOrgFileNm(request.getParameter("fileupload"));*/
		memberVo.setRegDt(request.getParameter("regDt"));
		memberVo.setRegId(request.getParameter("regId"));
		
		
		
		//System.out.println(request.getParameter("remark"));
		System.out.println("에이작스");

    	String bussAnncemntNo = request.getParameter("bussAnncemntNo");
    	String bussAnncemntNm = request.getParameter("bussAnncemntNm");
    	searchVO.setBussAnncemntNm(bussAnncemntNm);
    	System.out.println("bussAnncemntNo :: " + bussAnncemntNo);
    	System.out.println("bussAnncemntNm :: " + bussAnncemntNm);
    	
   		Integer returnCode = enterpriseBuyerExpertService.businessManagementRegisterInsert(memberVo);
   		Integer returnCode1 = enterpriseBuyerExpertService.businessManagementRegisterInsertFile(memberVo);
   		Integer returnCode2 = enterpriseBuyerExpertService.businessManagementRegisterInsertApplicStCd(memberVo);
   		
   		System.out.println("businessManagementRegisterInsert_2***********************"+searchVO);

		return mav;
	}
	
    
	
	/**
	 * 사업운영 실적관리 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "benefitsOfSupportProjectsList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/benefitsOfSupportProjectsList.do")
	public ModelAndView benefitsOfSupportProjectsList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("benefitsOfSupportProjectsList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		/*ArrayList<MemberVO> authList = memberService.selectAuthList(searchVO);
		model.addAttribute("resultList", authList);*/
		
	//	int totCnt = memberService.selectAuthListTotCnt(searchVO);
	//	paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("benefitsOfSupportProjectsList_2***********************"+searchVO);
		mv.setViewName("/view/benefitsOfSupportProjectsList");
		
		return mv;
	}
	
	
}













