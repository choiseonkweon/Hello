package jcep.front.web;

import java.io.File;
import java.io.FileInputStream;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.front.model.FacilityResourceFrontVO;
import jcep.front.service.FacilityResourceFrontService;

/**
 * @Class Name : FacilityResourceFrontController.java
 * @Description : FacilityResourceFrontController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.03          최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */
/*공통함수 컨트롤러*/
@Controller
public class FacilityResourceFrontController {

	@Resource(name = "facilityResourceFrontService")
	protected FacilityResourceFrontService facilityResourceFrontService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Autowired
	MappingJackson2JsonView jsonView;
	@ Autowired
	protected JeonnamCommonsController jeonnamCommonsController;
	@Resource(name="noticeFilePath")
    String noticeFilePath;
	

	/**
	 * 시설신청 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceFrontVO
	 * @param model
	 * @return "facilityUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/facilityUseList.do")
	public ModelAndView facilityUseList(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<FacilityResourceFrontVO> facilityUseList = facilityResourceFrontService.selectFacilityUseList(searchVO);
		model.addAttribute("resultList", facilityUseList);
		
		int totCnt = facilityResourceFrontService.selectFacilityUseListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/view/frontView/facilityUseList");
		
		return mv;
	}
	
	/**
	 * 시설정보 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceFrontVO
	 * @param model
	 * @return "facilityUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/front/facilityUseList2.do")
	public String facilityList(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		ArrayList<FacilityResourceFrontVO> facilityUseList = facilityResourceFrontService.selectFacilityUseList(searchVO);
		model.addAttribute("resultList", facilityUseList);
		
		return "jsonView";
	}	
	
	
	/**
	 * 시설정보 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceFrontVO
	 * @param model
	 * @return "facilityUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/front/resourFacilityApplInsert.do")
	public String resourFacilityApplInsert(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model , HttpSession session) throws Exception {
		
		searchVO.setMemberId((String) session.getAttribute("memberId"));
		
		Integer  facilityUseList = facilityResourceFrontService.resourFacilityApplInsert(searchVO);
		model.addAttribute("resultList", facilityUseList);
		
		return "jsonView";
	}	
	
	/**
	 * 자원 사용 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "resourceUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/resourceUseList.do")
	public ModelAndView resourceUseList(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model) throws Exception {
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

		ArrayList<FacilityResourceFrontVO> resourceUseList = facilityResourceFrontService.selectResourceUseList(searchVO);
		model.addAttribute("resultList", resourceUseList);
		
		int totCnt = facilityResourceFrontService.selectResourceUseListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/view/frontView/resourceUseList");
		
		return mv;
	}
	
	
	/**
	 * 시설정보 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceFrontVO
	 * @param model
	 * @return "facilityUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/front/resourceFacilityCalendarList.do")
	public String resourceFacilityCalendarList(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		ArrayList<FacilityResourceFrontVO> calendarList = facilityResourceFrontService.selectResourceFacilityCalendarList(searchVO);
		model.addAttribute("resultList", calendarList);
		
		return "jsonView";
	}	

	/**
	 * 시설신청 & 자원신청 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 FacilityResourceFrontVO
	 * @param model
	 * @return "facilityUseList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/front/resourceUseList2.do")
	public String resourceUseList2(@ModelAttribute("searchVO") FacilityResourceFrontVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		ArrayList<FacilityResourceFrontVO> resourceUseList = facilityResourceFrontService.selectResourceUseList(searchVO);
		model.addAttribute("resultList", resourceUseList);
		
		return "jsonView";
	}		
	
	
	/**
	 * 시설관리 지침을 다운로드 한다.
	 * @param model
	 * @return "download"
	 * @exception Exception
	 */
	@RequestMapping(value = "/download.do")
	public ModelAndView download(ModelAndView mv, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition","attachment;filename=facility.hwp");

	    //File file = new File("F:\\eGovFrameDev-3.8.0-64bit\\workspace\\JCEP_SYSTEM\\src\\main\\webapp\\down\\facility.hwp");
	    File file = new File("/root/apache-tomcat-9.0.10/webapps/JCEP_SYSTEM/down/facility.hwp");
	    
	    FileInputStream fileIn = new FileInputStream(file);
	    ServletOutputStream out = response.getOutputStream();
	     
	    byte[] outputByte = new byte[4096];
	    
	    while(fileIn.read(outputByte, 0, 4096) != -1)
	    {
	    	out.write(outputByte, 0, 4096);
	    }
	    
	    fileIn.close();
	    out.flush();
	    out.close();

		return mv;
	}
	
	/**
	 * 온라인 지원 정보를 신청한다.
	 * @author 최선권
	 * @Date 20191129
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/onlineInsert.do")
	public ModelAndView onlineInsert(MultipartHttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO, HttpSession session ) throws Exception {
		System.out.println("onlineInsert_1***********************"+searchVO);

		MultipartFile file = request.getFile("file");
		ModelAndView mv = new ModelAndView();

		String fileName = file.getOriginalFilename();
		
		searchVO.setMemberId((String)session.getAttribute("memberId"));	
		System.out.println("memberId");
		
		if(fileName=="") {
			System.out.println("파일 진입 완료");
			mv.addObject("file", file);
			MemberVO fileDetil = jeonnamCommonsController.FileUpload(mv);
			searchVO.setFileCourse(fileDetil.getFileCourse());					//경로
			searchVO.setOrgFileNm(fileDetil.getOrgFileNm());					//파일명
		}
		int returnCode = facilityResourceFrontService.onlineInsert(searchVO);
		
		mv.addObject("returnCode", returnCode);
		mv.setViewName("/view/frontView/onlineInsertOk");

		System.out.println("onlineInsert_2***********************"+searchVO);
		
		return mv;
	}

}



