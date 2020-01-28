 package jcep.admin.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.EnterpriseBuyerExpertService;
import jcep.admin.service.MemberService;

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

        		hMap.put("bussAnncemntNo",searchVO.getBussAnncemntNo());		//사업공고번호
        		hMap.put("attchFileNo",searchVO.getBussAnncemntNo()+i);				//첨부파일번호
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
		
		//사업관리 -> 사업수정
		@RequestMapping(value = "/business/businessManagementRegisterUpdateOk.do",  produces="text/plain;charset=utf-8")
		public String businessManagementRegisterUpdateOk(@RequestParam(required=false) Map<String, String> map, MultipartHttpServletRequest multipartRequest) throws Exception {
			int count = (Integer.parseInt(map.get("count")));	//삭제할 파일개수
    		
			for(int i =0; i<count; i++) { //삭제할 파일개수만큼 돌리기
				String attchFileNo =  map.get("fileNumber"+i); // 해당 파일 가져오기
				System.out.println("파일번호"+ attchFileNo);
				int Delete = enterpriseBuyerExpertService.businessManagementRegisterFileDelete(attchFileNo); //파일 삭제 쿼리
				System.out.println("삭제"+i+":" +Delete); 
			}

			int update =  enterpriseBuyerExpertService.businessManagementRegisterUpdateOk(map);//수정된 사항 업데이트
			if(update>0) {//업데이트가 완료되면
	        	String filePath = noticeFilePath;//파일경로 가져오기
	        	List<Map<String, Object>> fileMap = UploadFileUtils.MultiFileUpload(multipartRequest, filePath);//파일 업로드 | 업로드된 파일이름과 파일경로 리스트로 반환
	    		int filelength = enterpriseBuyerExpertService.businessManagementFileLength(map);//마지막 파일번호 +1된 값 가져오기
	        	for(int i =0; i<fileMap.size(); i++) { //업로드된 파일 개수만큼 돌리기
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
	        		filelength++;	//파일번호 증가
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













