package jcep.admin.web;

import java.awt.Container;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.FacilityResourceService;
import jcep.admin.service.MemberService;

/**
 * @Class Name : FacilityResourceController.java
 * @Description : FacilityResource Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.13           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class FacilityResourceController {

	@Resource(name = "facilityResourceService")
	protected FacilityResourceService facilityResourceService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "memberService")
	protected MemberService memberService;	
	
	/**
	 * 시설 등록 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceVO
	 * @param model
	 * @return "facilityRegistrationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/facility/facilityRegistrationManagementList.do")
	public ModelAndView facilityRegistrationManagementList(@ModelAttribute("searchVO") FacilityResourceVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		// 관리부서 코드 조회
		MemberVO commonsVo = new MemberVO();

		commonsVo.setGroupCd("G00006");
		List<MemberVO> mngDeptCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("mngDeptCd", mngDeptCd);
		
        //시설관리 리스트 조회
		ArrayList<FacilityResourceVO> facilityList = facilityResourceService.selectFacilityList(searchVO);
		model.addAttribute("resultList", facilityList);
		
		int totCnt = facilityResourceService.selectFacilityListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		mv.setViewName("/view/facilityRegistrationManagementList");
		
		return mv;
	}
	
	/**
	 * 시설 등록화면을 조회한다.
	 * @param FacilityResourceFrontVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/facility/facilityRegistrationManagementReg.do")
	public ModelAndView facilityRegistrationManagementReg(@ModelAttribute("searchVO") FacilityResourceVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {

		MemberVO commonsVo = new MemberVO();
		
		//시설 관리부서코드 조회
		commonsVo.setGroupCd("G00006");
		List<MemberVO> mngDeptCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("mngDeptCd", mngDeptCd);		
		
		// 시설 상태코드 
		commonsVo.setGroupCd("G00008");
		List<MemberVO> facilityStCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("facilityStCd", facilityStCd);	
		
		//시설 기능코드 
		commonsVo.setGroupCd("G00007");
		List<MemberVO> facilityFuncCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("facilityFuncCd", facilityFuncCd);	
		
		//수정 
		if(!("".equals(searchVO.getFacilityId()) || null == searchVO.getFacilityId())) {
		  	model.addAttribute("facilityDetailResult", facilityResourceService.selectFacilityDetailList(searchVO));	
		}
		
		mv.setViewName("/view/facilityRegistrationManagementReg");
		
		return mv;
	}
	
	/**
	 * 시설정보를 등록한다.
	 * @param facilityId - 등록할 시설 Id
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "facilityInsert"
	 * @exception Exception
	 */
    @RequestMapping("/facility/facilityInsert.do")
    public String facilityInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO,@RequestParam("facilityImgFile") MultipartFile facilityImgFile) throws Exception {
    	
    	Integer returnCode = facilityResourceService.facilityInsert(searchVO,facilityImgFile);
		
    	return "jsonView";
    }
    
    @Resource(name="facilityImgPath")
    String facilityImgPath;
	
    @ResponseBody
    @PostMapping(value="/facility/facilityImgUpload.do", produces="text/plain;charset=utf-8")
    public ResponseEntity<String> facilityImgUpload(HttpServletResponse response, Model model, FacilityResourceVO vo, @RequestParam("facilityImgFile") MultipartFile facilityImgFile) throws Exception {		
		
		String returnCode = "100";
		
		facilityImgFile = vo.getFacilityImgFile();
		
		Toolkit toolKit = Toolkit.getDefaultToolkit();
		MediaTracker mtracker = new MediaTracker(new Container());
		Image image = toolKit.createImage(facilityImgFile.getBytes());
		
		mtracker.addImage(image, 1);
		mtracker.waitForID(1);
		
		System.out.println("이미지 가로 사이즈 : " + image.getWidth(null));
		System.out.println("이미지 세로 사이즈 : " + image.getHeight(null));
		
		String uploadedFileName = UploadFileUtils.imageFileUpload(facilityImgPath, facilityImgFile.getOriginalFilename(), facilityImgFile.getBytes());	        
		String uploadFileName = facilityImgFile.getOriginalFilename();
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("uploadedFileName : " + uploadedFileName);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		vo.setFacilityImg(facilityImgPath+uploadedFileName);
		facilityResourceService.facilityImageUpload(vo);
		
        return new ResponseEntity<String>(returnCode, HttpStatus.OK);
    }
    
	/**
	 * 시설 신청 목록을 조회한다. (pageing)
	 * @param FacilityResourceFrontVO - 조회할 정보가 담긴 VO
	 * @param model
	 * @return "facilityApplicationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/facility/facilityApplicationManagementList.do")
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
		mv.setViewName("/view/facilityApplicationManagementList");
		
		return mv;
	}
	
	/**
	 * 자원 등록 목록을 조회한다. (pageing)
	 * @param FacilityResourceFrontVO - 조회할 정보가 담긴 VO
	 * @param model
	 * @return "resourceRegistrationManagement"
	 * @exception Exception
	 */
	@RequestMapping(value = "/resource/resourceRegistrationManagementList.do")
	public ModelAndView resourceRegistrationManagementList(@ModelAttribute("searchVO") FacilityResourceVO searchVO, ModelAndView mv, Model model) throws Exception {
		
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

		// 관리부서 코드 조회
		commonsVo.setGroupCd("G00010");
		List<MemberVO> mngDeptCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("mngDeptCd", mngDeptCd);		
        // 자원 상태 코드        
		commonsVo.setGroupCd("G00011");
		List<MemberVO> resourceStCd = memberService.selectCommonsList(commonsVo);		
		model.addAttribute("resourceStCd", resourceStCd);				
		
		
		ArrayList<FacilityResourceVO> resourceList = facilityResourceService.selectResourceList(searchVO);
		model.addAttribute("resultList", resourceList);
		
		int totCnt = facilityResourceService.selectResourceListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/view/resourceRegistrationManagementList");
		
		return mv;
	}
	
	/**
	 * 자원 등록화면을 조회한다.
	 * @param FacilityResourceVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "resourceRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/resource/resourceRegistrationManagementReg.do")
	public String resourceRegistrationManagementReg(@ModelAttribute("searchVO") FacilityResourceVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {

		if(!("".equals(searchVO.getResourceId()) || null == searchVO.getResourceId())) {
		  	model.addAttribute("resourceDetailResult", facilityResourceService.selectResourceDetailList(searchVO));	
		}
		
		
		return "jsonView";
	}	
	
	/**
	 * 자원 정보를 등록한다.
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "resourceInsert"
	 * @exception Exception
	 */
    @RequestMapping("/resource/resourceSave.do")
    public String resourceSave(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {
    	System.out.println(searchVO.getResourceSt());
    	if(("".equals(searchVO.getResourceId()) || null == searchVO.getResourceId())) {
    		Integer returnCode = facilityResourceService.resourceInsert(searchVO);
    	}else{
    		Integer returnCode = facilityResourceService.resourceUpdate(searchVO);
    		
    		
    	}
		
    	return "jsonView";
    }
    
	@Resource(name="resourceImgPath")
    String resourceImgPath;
	
    @ResponseBody
    @PostMapping(value="/resource/resourceImgUpload.do", produces="text/plain;charset=utf-8")
    public ResponseEntity<String> resourceImgUpload(HttpServletResponse response, Model model, FacilityResourceVO vo, @RequestParam("resourceImgFile") MultipartFile resourceImgFile) throws Exception {		
		
		String returnCode = "100";
		
		resourceImgFile = vo.getResourceImgFile();
		
		Toolkit toolKit = Toolkit.getDefaultToolkit();
		MediaTracker mtracker = new MediaTracker(new Container());
		Image image = toolKit.createImage(resourceImgFile.getBytes());
		
		mtracker.addImage(image, 1);
		mtracker.waitForID(1);
		
		System.out.println("이미지 가로 사이즈 : " + image.getWidth(null));
		System.out.println("이미지 세로 사이즈 : " + image.getHeight(null));
		
		String uploadedFileName = UploadFileUtils.imageFileUpload(resourceImgPath, resourceImgFile.getOriginalFilename(), resourceImgFile.getBytes());	        
		String uploadFileName = resourceImgFile.getOriginalFilename();
		
		vo.setResourceImg("/resourceImg"+uploadedFileName);
		facilityResourceService.resourceImageUpload(vo);
		
        return new ResponseEntity<String>(returnCode, HttpStatus.OK);
    }
    
	/**
	 * 자원 정보를 삭제한다.
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "resourceDelete"
	 * @exception resourceDelete
	 */
    @RequestMapping("/resource/resourceDelete.do")
    public String resourceDelete(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {

    	String path = searchVO.getResourceImg();
    	
	    //File file = new File("F:/eGovFrameDev-3.8.0-64bit"+path);	
		File file = new File("/root/apache-tomcat-9.0.10/webapps/JCEP_SYSTEM/upload"+path);	
		
		if(file.exists()){
			file.delete();			
		}
		Integer returnCode = facilityResourceService.resourceDelete(searchVO);
		
    	return "jsonView";
    }
    
	/**
	 * 자원 신청 목록을 조회한다. (pageing)
	 * @param FacilityResourceFrontVO - 조회할 정보가 담긴 VO
	 * @param model
	 * @return "facilityApplicationManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/resource/resourceApplicationManagementList.do")
	public ModelAndView resourceApplicationManagementList(@ModelAttribute("searchVO") FacilityResourceVO searchVO, ModelAndView mv, Model model) throws Exception {
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

		ArrayList<FacilityResourceVO> resourceApplicateList = facilityResourceService.selectResourceApplicateList(searchVO);
		model.addAttribute("resultList", resourceApplicateList);
		
		int totCnt = facilityResourceService.selectResourceApplicateListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/resourceApplicationManagementList");
		
		return mv;
	}
	
	/**
	 * 자원 정보를 등록한다.
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "resourceInsert"
	 * @exception Exception
	 */
    @RequestMapping("/facility/resourcFacilityApplicUpdate.do")
    public String resourcFacilityApplicUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {

    		Integer returnCode = facilityResourceService.resourcFacilityApplicUpdate(searchVO);
		
    	return "jsonView";
    }	
    
    @RequestMapping("/facility/resourceFacilityApplicDelete.do")
    public String resourceFacilityApplicDelete(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {

    		Integer returnCode = facilityResourceService.resourceFacilityApplicDelete(searchVO);
		
    	return "jsonView";
    }	    
    
	/**
	 * 자원 정보를 등록한다.
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "resourceInsert"
	 * @exception Exception
	 */
    @RequestMapping("/facility/facilityApplicDetail.do")
    public String facilityApplicDetail(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {

    	model.addAttribute("resultList", facilityResourceService.selectFacilityApplicateDetailList(searchVO));	
		
    	return "jsonView";
    }	    
    
	/**
	 * 자원 정보를 등록한다.
	 * @param FacilityResourceFrontVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "resourceInsert"
	 * @exception Exception
	 */
    @RequestMapping("/resource/resourceApplicDetail.do")
    public String resourceApplicDetail(HttpServletRequest request, Model model, @ModelAttribute("searchVO") FacilityResourceVO searchVO) throws Exception {

    	model.addAttribute("resultList", facilityResourceService.selectResourceApplicateDetailList(searchVO));	
		
    	return "jsonView";
    }	        
}
