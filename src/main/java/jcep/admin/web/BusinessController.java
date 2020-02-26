 package jcep.admin.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.BusinessVO;
import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;
import jcep.admin.model.BusinessVO;
import jcep.admin.service.BusinessService;
import jcep.admin.service.EnterpriseBuyerExpertService;
import jcep.admin.service.MemberService;
import net.sf.json.JSONArray;

/**
 * @Class Name : BusinessController.java
 * @Description : Business Controller  Class
 * @Modification Information  test
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
	
	@Resource(name = "businessService")
	protected BusinessService businessService;	
	

	/**
	 * 사업 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessManagementList"
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
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<Map<String,Object>> authList = enterpriseBuyerExpertService.selectBusinessManagementList(searchVO);
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

		MemberVO commonsVo = new MemberVO();
		
		commonsVo.setGroupCd("G00023");
		List<MemberVO> bussDeptCd = memberService.selectCommonsList(commonsVo);	//시업부서 세부전문분야분류 코드표
		
		mv.addObject("bussDeptCd",bussDeptCd);

		mv.setViewName("/view/businessManagementInsert");
		
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
	@RequestMapping("/business/businessManagementDetail.do")
	public ModelAndView businessManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementDetail***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");

		Map<String,Object> detail = enterpriseBuyerExpertService.selectBusinessManagementDetail(bussAnncemntNo);
		List<Map<String,Object>> files = enterpriseBuyerExpertService.selectBusinessManagementDetailFiles(bussAnncemntNo);
		
		mv.addObject("result", detail);		
		mv.addObject("files", files);		
		mv.setViewName("/view/businessManagementDetail");		
		System.out.println("businessManagementDetail***********************"+searchVO);
		return mv;
	}
	
	
	
	@RequestMapping("/business/businessManagementRegisterUpdate.do")
	public ModelAndView businessManagementRegisterUpeate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessManagementRegisterUpeate_1***********************"+searchVO);
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("g00023");
		List<MemberVO> bussDeptCd = memberService.selectCommonsList(commonsVo);	//시업부서 세부전문분야분류 코드표
		
		
//		Map<String,Object> detail = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeate(searchVO);
//		List<Map<String,Object>> detail1 = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeateFile(searchVO);
		
//		mv.addObject("result", detail);		
		mv.addObject("bussDeptCd",bussDeptCd);
		
		System.out.println("businessManagementRegisterUpeate_2***********************"+searchVO);
		mv.setViewName("/view/businessManagementRegister");
		/*		Map<String,Object> detail = enterpriseBuyerExpertService.selectBusinessManagementRegisterUpeate(searchVO);*/
		
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
	

    @RequestMapping("/business/businessManagementRegisterInsert.do")
	public String businessManagementRegisterInsert(MemberVO searchVO,HttpServletRequest request, HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
    	System.out.println("businessManagementRegisterInsert_1***********************"+searchVO);
    	int check = 0;
    	try {
    		check = enterpriseBuyerExpertService.businessManagementRegisterInsert(searchVO);
    	}catch (Exception e) {
			// TODO: handle exception
		}
    	if(check >0) {
        	//멀티파일 insert
        	String filePath = noticeFilePath;
        	List<Map<String, Object>> fileMap = UploadFileUtils.MultiFileUpload(multipartRequest, filePath);
        	for(int i = 0; i<fileMap.size(); i++) {
        		HashMap<String,String> hMap = new HashMap<String,String>();
        		int num = 0000;
        		num = +i;
        		System.out.println("num: " + num);
        		hMap.put("bussAnncemntNo",searchVO.getBussAnncemntNo());		//사업공고번호
        		hMap.put("attchFileNo",searchVO.getBussAnncemntNo()+"000"+i);				//첨부파일번호
        		hMap.put("fileCourse",(String)fileMap.get(i).get("fileCourse"));			//파일경로
        		hMap.put("orgFileNm",(String)fileMap.get(i).get("orgFileNm"));			//파일명
        		int fileInsertcheck = enterpriseBuyerExpertService.businessManagementRegisterInsertFile(hMap);
        		System.out.println(fileInsertcheck);
        		System.out.println("======= "+i+"번째 파일 인서트 완료 =======");
        		System.out.println("파일경로:"+(String)fileMap.get(i).get("fileCourse"));
        		System.out.println("파일명:"+(String)fileMap.get(i).get("orgFileNm"));
        		System.out.println("===============================");
        	}    		
    	}
   		System.out.println("businessManagementRegisterInsert_2***********************"+searchVO);

		return "jsonView";
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
	@ResponseBody
	@RequestMapping(value = "/bussAnncemntApplList.do")
	public ModelAndView bussAnncemntApplList(MemberVO searchVO,HttpServletRequest request) throws Exception {
//    	System.out.println("bussAnncemntApplList***********************"+searchVO);
		ModelAndView mav = new ModelAndView("jsonView");

		String bussAnncemntNo = searchVO.getBussAnncemntNo(); 
    	List<Map<String,String>> data = enterpriseBuyerExpertService.selectBussAnncemntApplList(bussAnncemntNo);
    	mav.addObject("data",data);
    	//   	System.out.println("bussAnncemntApplList***********************"+searchVO);
		return mav;
	}

	@ResponseBody
    @RequestMapping(value="/bussAnncemntApplUpdate.do", produces="text/plain;charset=utf-8")
    public ModelAndView bussAnncemntApplUpdate(@RequestParam(required=false) Map<String, String> map) throws Exception {

		//    	System.out.println("bussAnncemntApplList***********************"+searchVO);
		ModelAndView mav = new ModelAndView("jsonView");
		
		int  returnCode = enterpriseBuyerExpertService.bussAnncemntApplUpdate(map);
		//mav.addObject("data",data);
		//   	System.out.println("bussAnncemntApplList***********************"+searchVO);
		return mav;
	}
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessSupportBenefitList.do")
	public ModelAndView businessSupportBenfiteList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        /* FROM - TO Default */
        Date dt = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
            searchVO.setSearchFromDate(format1.format(dt));
        }
        if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
            searchVO.setSearchToDate(format1.format(dt));
        }        
        

		ArrayList<Map<String,Object>> supportList = businessService.selectBusinessSupportBenefitList(searchVO);
		model.addAttribute("resultList", supportList);
		
		int totCnt = businessService.selectBusinessSupportBenefitListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		mv.setViewName("/view/businessSupportBenefitList");
		
		return mv;
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  등록 및 수정 화면 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessSupportBenefitReg.do")
	public ModelAndView businessSupportBenefitReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		//수정 
		if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
		  	model.addAttribute("resultList", businessService.selectBusinessSupportBenefitDetailList(paramMap));  
		  	
		}
		
		mv.setViewName("/view/businessSupportBenefitReg");
		
		return mv;
	}	
	
	/**
	 * 기업찾기 > 선택한 기업 조회 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussBenefitEntprSelectList.do")
	public String bussBenefitEntprSelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
		if(!membersId.isEmpty() && !("".equals(paramMap.get("bussAnncemntNo")) && paramMap.get("bussAnncemntNo") == null)) {
			BusinessVO searchVO = new BusinessVO();
			
			searchVO.setMembersId(membersId);
			searchVO.setBussAnncemntNo(paramMap.get("bussAnncemntNo").toString());
			
			ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBenefitPerformEntprSelectList(searchVO);
			model.addAttribute("resultList", bussAnncemntList);
		}
		
    	return "jsonView";
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  저장 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/benefitPerformSave.do")
	public String benefitPerformSave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
        ObjectMapper om = new ObjectMapper();
        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);
        String bussAnncemntNo =  om.readValue(om.writeValueAsString(paramList.get("bussAnncemntNo")),String.class);

        businessService.benefitPerformSave(list, bussAnncemntNo);
        
		return "jsonView";
	}		
	
	/**
	 * 기업찾기 - 지원사업수혜실적 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/benefitPerformEntprSearchList.do")
	public ModelAndView benefitPerformEntprSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBenefitPerformEntprSearchList(searchVO);
		model.addAttribute("resultList", bussAnncemntList);
		
		int totCnt = businessService.selectBenefitPerformEntprSearchListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		

		mv.setViewName("/html/benefitEntprSearchPop");
		
    	return mv;
	}			
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적  목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessContentPerformList.do")
	public ModelAndView businessContentPerformList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        /* FROM - TO Default */
        Date dt = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
            searchVO.setSearchFromDate(format1.format(dt));
        }
        if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
            searchVO.setSearchToDate(format1.format(dt));
        }        

		ArrayList<Map<String,Object>> supportList = businessService.selectBusinessContentPerformList(searchVO);
		model.addAttribute("resultList", supportList);
		
		int totCnt = businessService.selectBusinessContentPerformListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		mv.setViewName("/view/businessContentPerformList");
		
		return mv;
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적  등록 및 수정 화면 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessContentPerformReg.do")
	public ModelAndView businessContentPerformReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		//수정 
		if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
		  	model.addAttribute("resultList", businessService.selectBusinessContentPerformDetailList(paramMap));  
		  	MemberVO commonsVo = new MemberVO();
		  	
			//content 구분
			commonsVo.setGroupCd("G00025");
			List<MemberVO> gubunList = memberService.selectCommonsList(commonsVo);		
			model.addAttribute("gubunList", gubunList);		
		  	
		}
		
		mv.setViewName("/view/businessContentPerformReg");
		
		return mv;
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 콘텐츠개발 및 제작지원실적  등록 및 수정 화면 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/contentPerformSave.do")
	public String contentPerformSave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
        ObjectMapper om = new ObjectMapper();
        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);

        businessService.contentPerformSave(list);
        
		return "jsonView";
	}			
	
	
	/**
	 * 기업찾기 - 콘텐츠 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/contentPerformEntprSearchList.do")
	public ModelAndView contentPerformEntprSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectContentPerformEntprSearchList(searchVO);
		model.addAttribute("resultList", bussAnncemntList);
		
		int totCnt = businessService.selectContentPerformEntprSearchListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		

		mv.setViewName("/html/contentEntprSearchPop");
		
    	return mv;
	}		
	
	/**
	 * 기업찾기 > 선택한 기업 조회 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussContentEntprSelectList.do")
	public String bussContentEntprSelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
		if(!membersId.isEmpty() && !("".equals(paramMap.get("bussAnncemntNo")) && paramMap.get("bussAnncemntNo") == null)) {
			BusinessVO searchVO = new BusinessVO();
			
			searchVO.setMembersId(membersId);
			searchVO.setBussAnncemntNo(paramMap.get("bussAnncemntNo").toString());
			
			ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectContentPerformEntprSelectList(searchVO);
			model.addAttribute("resultList", bussAnncemntList);				
				
			MemberVO commonsVo = new MemberVO();
			//content 구분
			commonsVo.setGroupCd("G00025");
			List<MemberVO> gubunList = memberService.selectCommonsList(commonsVo);		
			model.addAttribute("gubunList", gubunList);				
				
			
		}
		
    	return "jsonView";
	}		
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황  목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessIntltProptyList.do")
	public ModelAndView businessIntltProptyList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        /* FROM - TO Default */
        Date dt = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
            searchVO.setSearchFromDate(format1.format(dt));
        }
        if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
            searchVO.setSearchToDate(format1.format(dt));
        }        

		ArrayList<Map<String,Object>> supportList = businessService.selectBusinessIntltProptyList(searchVO);
		model.addAttribute("resultList", supportList);
		
		int totCnt = businessService.selectBusinessIntltProptyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		mv.setViewName("/view/businessIntltProptyList");
		
		return mv;
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황  등록 및 수정 화면 이동 (pageing)
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessIntltProptyReg.do")
	public ModelAndView businessIntltProptyReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		//수정 
		if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
		  	model.addAttribute("resultList", businessService.selectBusinessIntltProptyDetailList(paramMap));  
		  	
		}
		
		mv.setViewName("/view/businessIntltProptyReg");
		
		return mv;
	}	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지적재산권현황 저장  (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/bussIntltProptySave.do")
	public String bussIntltProptySave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
        ObjectMapper om = new ObjectMapper();
        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);

        businessService.bussIntltProptySave(list);
        
		return "jsonView";
	}			
	
	/**
	 * 실적찾기 - 지적재산권현황 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussIntltProptySearchList.do")
	public ModelAndView bussIntltProptySearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectIntltProptySearchList(searchVO);
		model.addAttribute("resultList", bussAnncemntList);
		
		int totCnt = businessService.selectIntltProptySearchListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		

		MemberVO commonsVo = new MemberVO();
		//content 구분
		commonsVo.setGroupCd("G00019");
		List<MemberVO> intltProptCdList = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("intltProptCdList", intltProptCdList);			
		
		mv.setViewName("/html/intltProptySearchPop");
		
    	return mv;
	}		
	
	
	/**
	 * 지적재산권현황 실적찾기 
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussIntltProptySelectList.do")
	public String intltProptySelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
		if(!membersId.isEmpty() && !("".equals(paramMap.get("bussAnncemntNo")) && paramMap.get("bussAnncemntNo") == null)) {
			BusinessVO searchVO = new BusinessVO();
			
			searchVO.setMembersId(membersId);
			searchVO.setBussAnncemntNo(paramMap.get("bussAnncemntNo").toString());
			
			ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectIntltProptySelectList(searchVO);
			model.addAttribute("resultList", bussAnncemntList);
			
		}
		
    	return "jsonView";
	}			
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 지원사업수혜실적  목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/businessAttractList.do")
	public ModelAndView businessAttractList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        /* FROM - TO Default */
        Date dt = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
            searchVO.setSearchFromDate(format1.format(dt));
        }
        if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
            searchVO.setSearchToDate(format1.format(dt));
        }        

		ArrayList<Map<String,Object>> supportList = businessService.selectBusinessAttractList(searchVO);
		model.addAttribute("resultList", supportList);
		
		int totCnt = businessService.selectBusinessAttractListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		mv.setViewName("/view/businessAttractList");
		
		return mv;
	}
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업유치 , 창업  등록 및 수정 화면 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/businessAttractReg.do")
	public ModelAndView businessAttractReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		//수정 
		if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
		  	model.addAttribute("resultList", businessService.selectBusinessAttractDetailList(paramMap));  
		  	
		}
		
		mv.setViewName("/view/businessAttractReg");
		
		return mv;
	}		
	
	
	/**
	 * 사업관리 > 사업운영 실적관리 > 기업지원 > 기업창업 , 유치  등록 및 수정 화면 이동 (pageing)
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/business/bussAttractSave.do")
	public String bussAttractSave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
        ObjectMapper om = new ObjectMapper();
        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);
        String bussAnncemntNo =  om.readValue(om.writeValueAsString(paramList.get("enterpriseIdx")),String.class);

        businessService.bussAttractSave(list, bussAnncemntNo);
        
		return "jsonView";
	}			
	
	/**
	 * 기업찾기 - 기업유치,창업 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussAttractEntprSearchList.do")
	public ModelAndView bussAttractEntprSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        /* FROM - TO Default */
        Date dt = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
            searchVO.setSearchFromDate(format1.format(dt));
        }
        if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
            searchVO.setSearchToDate(format1.format(dt));
        }        
        
		ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussAttractEntprSearchList(searchVO);
		model.addAttribute("resultList", bussAnncemntList);
		
		int totCnt = businessService.selectBussAttractEntprSearchListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		

		MemberVO commonsVo = new MemberVO();
		//content 구분
		commonsVo.setGroupCd("G00002");
		List<MemberVO> largeBussAreaList = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("largeBussAreaList", largeBussAreaList);			
		
		mv.setViewName("/html/attractEntprSearchPop");
		
    	return mv;
	}		
	
	/**
	 * 기업찾기 > 선택한 기업 조회 (pageing)
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussAttractEntprSelectList.do")
	public String bussAttractEntprSelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
		if(!membersId.isEmpty()) {
			BusinessVO searchVO = new BusinessVO();
			
				searchVO.setMembersId(membersId);

				ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussAttractEntprSelectList(searchVO);
				model.addAttribute("resultList", bussAnncemntList);					
		}
		
    	return "jsonView";
	}	
	
	
	/**
	 * 사업찾기 
	 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @param model
	 * @return "businessOrderStatusList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/business/bussSearchList.do")
	public ModelAndView bussSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {	
		
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
		//content 구분
		commonsVo.setGroupCd("G00023");
		List<MemberVO> mngDeptList = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("mngDeptList", mngDeptList);		
		
		ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussSearchList(searchVO);
		model.addAttribute("resultList", bussAnncemntList);
		
		int totCnt = businessService.selectBussSearchListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/html/businessSearchPop");
		
    	return mv;
	}		
	
	
	
	@ResponseBody
	@RequestMapping(value="/bussAnncemntApplDelete.do", produces="text/plain;charset=utf-8")
	public ModelAndView bussAnncemntApplDelete(@RequestParam(required=false) Map<String, String> map) throws Exception {
		
		//    	System.out.println("bussAnncemntApplList***********************"+searchVO);
		ModelAndView mav = new ModelAndView("jsonView");
		
		int  returnCode = enterpriseBuyerExpertService.bussAnncemntApplDelete(map);
		//mav.addObject("data",data);
		//   	System.out.println("bussAnncemntApplList***********************"+searchVO);
		return mav;
	}
	
	  @RequestMapping(value = "/businessManagementDetailFileDownload.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  businessManagementDetailFileDownload(@RequestParam(required=false) Map<String, String> map, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		  	MemberVO memberVo = enterpriseBuyerExpertService.businessManagementDetailFileDownload(map);
		  	//다운로드 할 파일 정보를 불러온다.
		  	mv.addObject("memberVo",memberVo);
		  	mv.addObject("response",response);
			try {
				UploadFileUtils.fileDownload(mv);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  	return null;
	  }
	  
	  @RequestMapping(value = "/businessManagementfileDownload.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  businessManagementfileDownload(@RequestParam(required=false) Map<String, String> map, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		  System.out.println(map.get("attchFileNo"));
		  MemberVO memberVo = enterpriseBuyerExpertService.businessManagementfileDownload(map);
		  //다운로드 할 파일 정보를 불러온다.
		  mv.addObject("memberVo",memberVo);
		  mv.addObject("response",response);
		  try {
			  UploadFileUtils.fileDownload(mv);
		  } catch (Exception e) {
			  // TODO Auto-generated catch block
			  e.printStackTrace();
		  }
		  return null;
	  }

	  //file 미리보기구현
	  @RequestMapping(value = "/businessManagementfileView.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  businessManagementfileView(@RequestParam(required=false) Map<String, String> map, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		  System.out.println(map.get("attchFileNo"));
		  MemberVO memberVo = enterpriseBuyerExpertService.businessManagementfileDownload(map);
		  //미리보기 할 파일 정보를 불러온다. //다운로드와 같은 방식으로 데이터를 불러온다.
		  mv.addObject("memberVo",memberVo);
		  mv.addObject("response",response);
		  try {
			  //UploadFileUtils.fileView(mv);
		  } catch (Exception e) {
			  // TODO Auto-generated catch block
			  e.printStackTrace();
		  }
		  return null;
	  }	  
		@RequestMapping(value = "/business/businessManagementUpdate.do",  produces="text/plain;charset=utf-8")
		public ModelAndView businessManagementUpdate(@RequestParam(required=false) Map<String, String> map) throws Exception {

			String bussAnncemntNo = map.get("bussAnncemntNo");
			ModelAndView mav= new ModelAndView();
			Map<String,Object> result = enterpriseBuyerExpertService.selectBusinessManagementDetail(bussAnncemntNo);
			List<Map<String,Object>> files = enterpriseBuyerExpertService.selectBusinessManagementDetailFiles(bussAnncemntNo);
			
			MemberVO commonsVo = new MemberVO();
			commonsVo.setGroupCd("g00023");
			List<MemberVO> bussDeptCd = memberService.selectCommonsList(commonsVo);	//시업부서 세부전문분야분류 코드표

			mav.addObject("bussDeptCd",bussDeptCd);
			mav.addObject("result",result);
			mav.addObject("files",files);
			mav.setViewName("/view/businessManagementUpdate");
			return mav;
		}
		

		
/*  인프라지원 - 장비,시설  */
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비시설활용실적 목록을 조회한다. (pageing)
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/businessInfraResourFaciUseResultList.do")
		public ModelAndView businessInfraResourFaciUseResultList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

            /* FROM - TO Default */
            Date dt = new Date();
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

            if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
                searchVO.setSearchFromDate(format1.format(dt));
            }
            if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
                searchVO.setSearchToDate(format1.format(dt));
            }

			ArrayList<Map<String,Object>> supportList = businessService.selectBusinessInfraResourFaciUseResultList(searchVO);
			model.addAttribute("resultList", supportList);
			
			int totCnt = businessService.selectBusinessInfraResourFaciUseResultListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			mv.setViewName("/view/businessInfraResourFaciUseResultList");
			
			return mv;
		}		
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비시설활용실적  등록 및 수정 화면 이동 (pageing)
		 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
		 * @param searchVO -  조회조건 정보가 담긴 VO
		 * @param status
		 * @return "facilityRegistrationManagementReg"
		 * @exception Exception
		 */
		@RequestMapping("/business/businessInfraResourFaciUseResultReg.do")
		public ModelAndView businessInfraResourFaciUseResultReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
			//수정 
			if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
			  	model.addAttribute("resultList", businessService.selectBusinessInfraResourFaciUseResultDetailList(paramMap));  
			  	
			}
			
			mv.setViewName("/view/businessInfraResourFaciUseResultReg");
			
			return mv;
		}					


		/**
		 * 장비찾기 조회 (pageing)
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/bussInfraResourFaciSearchList.do")
		public ModelAndView bussInfraResourFaciSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
            /* FROM - TO Default */
            Date dt = new Date();
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

            if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
                searchVO.setSearchFromDate(format1.format(dt));
            }
            if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
                searchVO.setSearchToDate(format1.format(dt));
            }            
            
			ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussInfraResourFaciSearchList(searchVO);
			model.addAttribute("resultList", bussAnncemntList);
			
			int totCnt = businessService.selectBussInfraResourFaciSearchListCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);		

			MemberVO commonsVo = new MemberVO();
			//유형 구분
			commonsVo.setGroupCd("G00007");
			List<MemberVO> codeList = memberService.selectCommonsList(commonsVo);		
			model.addAttribute("codeList", codeList);			
			//장비명 구분
			ArrayList<Map<String,Object>> resourFaciList = businessService.selectResourFaciCodeList(searchVO);		
			model.addAttribute("resourFaciList", resourFaciList);			
			
			mv.setViewName("/html/bussInfraResourFaciSearchPop");
			
	    	return mv;
		}					
		
		/**
		 * 장비시설  선택 
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/bussInfraResourFaciSelectList.do")
		public String bussInfraResourFaciSelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
			if(!membersId.isEmpty()) {
				BusinessVO searchVO = new BusinessVO();
				
				searchVO.setMembersId(membersId);
				
				ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussInfraResourFaciSelectList(searchVO);
				model.addAttribute("resultList", bussAnncemntList);
				
			}
			
	    	return "jsonView";
		}		
		
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비시설 저장 (pageing)
		 * @param searchVO -  조회조건 정보가 담긴 VO
		 * @param status
		 * @return "facilityRegistrationManagementReg"
		 * @exception Exception
		 */
		@RequestMapping("/business/bussInfraResourFaciSave.do")
		public String bussInfraResourFaciSave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
	        ObjectMapper om = new ObjectMapper();
	        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);

	        businessService.bussInfraResourFaciSave(list);
	        
			return "jsonView";
		}				
	
		/*  인프라지원 - 기업입주 */		
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 기업입주  목록을 조회한다. (pageing)
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/businessInfraEnterpriseList.do")
		public ModelAndView businessInfraEnterpriseList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
            /* FROM - TO Default */
            Date dt = new Date();
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

            if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
                searchVO.setSearchFromDate(format1.format(dt));
            }
            if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
                searchVO.setSearchToDate(format1.format(dt));
            }            
            
			ArrayList<Map<String,Object>> supportList = businessService.selectBusinessInfraEnterpriseList(searchVO);
			model.addAttribute("resultList", supportList);
			
			int totCnt = businessService.selectBusinessInfraEnterpriseListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			mv.setViewName("/view/businessInfraEnterpriseList");
			
			return mv;
		}	
		
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 기업입주  등록 및 수정 화면 이동 (pageing)
		 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
		 * @param searchVO -  조회조건 정보가 담긴 VO
		 * @param status
		 * @return "facilityRegistrationManagementReg"
		 * @exception Exception
		 */
		@RequestMapping("/business/businessInfraEnterpriseReg.do")
		public ModelAndView businessInfraEnterpriseReg(@RequestParam(required=false) Map<String, Object> paramMap, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
			//수정 
			if(!("".equals(paramMap.get("enterpriseIdx")) || null == paramMap.get("enterpriseIdx"))) {
			  	model.addAttribute("resultList", businessService.selectBusinessInfraEnterpriseDetailList(paramMap));  
			  	
			}
			
			mv.setViewName("/view/businessInfraEnterpriseReg");
			
			return mv;
		}					


		/**
		 * 장비찾기 조회 (pageing)
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/bussInfraEntprResourFaciSearchList.do")
		public ModelAndView bussInfraEntprResourFaciSearchList(@ModelAttribute("searchVO") BusinessVO searchVO, ModelAndView mv, Model model) throws Exception {
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
            /* FROM - TO Default */
            Date dt = new Date();
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

            if("".equals(searchVO.getSearchFromDate()) || null == searchVO.getSearchFromDate()) {
                searchVO.setSearchFromDate(format1.format(dt));
            }
            if("".equals(searchVO.getSearchToDate()) || null == searchVO.getSearchToDate()) {
                searchVO.setSearchToDate(format1.format(dt));
            }            
            
			ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussInfraEntprResourFaciSearchList(searchVO);
			model.addAttribute("resultList", bussAnncemntList);
			
			int totCnt = businessService.selectBussInfraEntprResourFaciSearchListCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);		

			MemberVO commonsVo = new MemberVO();
			//유형 구분
			commonsVo.setGroupCd("G00007");
			List<MemberVO> codeList = memberService.selectCommonsList(commonsVo);		
			model.addAttribute("codeList", codeList);			
			//장비명 구분
			ArrayList<Map<String,Object>> resourFaciList = businessService.selectResourFaciCodeList(searchVO);		
			model.addAttribute("resourFaciList", resourFaciList);		
			
			mv.setViewName("/html/bussInfraResourFaciSearchPop");
			
	    	return mv;
		}					
		
		/**
		 * 장비시설  선택 
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/business/bussInfraEntprResourFaciSelectList.do")
		public String bussInfraEntprResourFaciSelectList(@RequestParam(value="membersId[]",required=false) List<String> membersId,@RequestParam(required=false) Map<String,Object> paramMap, ModelAndView mv, Model model) throws Exception {
			if(!membersId.isEmpty()) {
				BusinessVO searchVO = new BusinessVO();
				
				searchVO.setMembersId(membersId);
				
				ArrayList<Map<String,Object>> bussAnncemntList = businessService.selectBussInfraEntprResourFaciSelectList(searchVO);
				model.addAttribute("resultList", bussAnncemntList);
				
			}
			
	    	return "jsonView";
		}		
		
		
		/**
		 * 사업관리 > 사업운영 실적관리 > 인프라지원 > 장비시설 저장 (pageing)
		 * @param searchVO -  조회조건 정보가 담긴 VO
		 * @param status
		 * @return "facilityRegistrationManagementReg"
		 * @exception Exception
		 */
		@RequestMapping("/business/bussInfraEntprResourFaciSave.do")
		public String bussInfraEntprResourFaciSave(@RequestParam(required=false) Map<String,List<Map<String,Object>>> paramList, Model model, ModelAndView mv) throws Exception {
	        ObjectMapper om = new ObjectMapper();
	        List<Map<String,Object>> list =  om.readValue(om.writeValueAsString(JSONArray.fromObject(paramList.get("params"))), List.class);

	        businessService.bussInfraEntprResourFaciSave(list);
	        
			return "jsonView";
		}			

		//사업관리 -> 사업수정
		@RequestMapping(value = "/business/businessManagementRegisterUpdateOk.do",  produces="text/plain;charset=utf-8")
		public String businessManagementRegisterUpdateOk(@RequestParam(required=false) Map<String, String> map, MultipartHttpServletRequest multipartRequest) throws Exception {
			int count = (Integer.parseInt(map.get("count")));	//삭제할 파일개수
    		
			for(int i =0; i<count; i++) { //삭제할 파일개수만큼 돌리기
				String attchFileNo =  map.get("fileNumber"+i); // 해당 파일 가져오기
				int Delete = enterpriseBuyerExpertService.businessManagementRegisterFileDelete(attchFileNo); //파일 삭제 쿼리
			}

			int update =  enterpriseBuyerExpertService.businessManagementRegisterUpdateOk(map);//수정된 사항 업데이트
			if(update>0) {//업데이트가 완료되면
	        	String filePath = noticeFilePath;//파일경로 가져오기
	        	List<Map<String, Object>> fileMap = UploadFileUtils.MultiFileUpload(multipartRequest, filePath);//파일 업로드 | 업로드된 파일이름과 파일경로 리스트로 반환
	    		for(int i =0; i<fileMap.size(); i++) { //업로드된 파일 개수만큼 돌리기
		    		String filelength = enterpriseBuyerExpertService.businessManagementFileLength(map);//마지막 파일번호 +1된 값 가져오기
		    		System.out.println("filelength" + filelength);
	    			HashMap<String,String> hMap = new HashMap<String,String>(); 	//객체 선언
	        		hMap.put("bussAnncemntNo",map.get("bussAnncemntNo"));				//사업공고번호
       				hMap.put("attchFileNo",map.get("bussAnncemntNo")+filelength);		//첨부파일번호
       				hMap.put("fileCourse",(String)fileMap.get(i).get("fileCourse"));			//파일경로
	        		hMap.put("orgFileNm",(String)fileMap.get(i).get("orgFileNm"));			//파일명

	        		int fileInsertcheck = enterpriseBuyerExpertService.businessManagementRegisterInsertFile(hMap); //파일 테이블에 인서트
	        		System.out.println(fileInsertcheck);
	        		System.out.println("======= "+i+"번째 파일 인서트 완료 =======");
	        		System.out.println("파일경로:"+(String)fileMap.get(i).get("fileCourse"));
	        		System.out.println("파일명:"+(String)fileMap.get(i).get("orgFileNm"));
	        		System.out.println("===============================");
				}
			}
			return "jsonView";
		}

			//유효성 검사
		  @RequestMapping(value = "/NomberValidateCheck.do", produces="text/plain;charset=utf-8")
		  public ModelAndView  NomberValidateCheck(@RequestParam(required=false) Map<String, String> map, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
				ModelAndView mav = new ModelAndView("jsonView");
			  Integer returnCode = 0;
			  try {
				  returnCode = enterpriseBuyerExpertService.NomberValidateCheck(map);
			  } catch (Exception e) {
				  // TODO Auto-generated catch block
				  e.printStackTrace();
			  }
			  mav.addObject("returnCode",returnCode);
			  System.out.println("returnCode::" + returnCode);
				return mav;
		  }


}
