package jcep.admin.web;

import java.awt.Container;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;
import jcep.admin.model.SiteVO;
import jcep.admin.service.MemberService;
import jcep.admin.service.SiteService;

/**
 * @Class Name : SiteController.java
 * @Description : Site Controller  Class
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
public class SiteController {

	@Resource(name = "siteService")
	protected SiteService siteService;

	@Resource(name="noticeFilePath")
    String noticeFilePath;
	

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/site/noticeList.do")
	public ModelAndView noticeList(@ModelAttribute("searchVO") SiteVO searchVO, ModelAndView mv, Model model) throws Exception {
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

		ArrayList<SiteVO> noticeList = siteService.selectNoticeList(searchVO);
		model.addAttribute("resultList", noticeList);
		
		int totCnt = siteService.selectNoticeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/view/noticeList");
		
		return mv;
	}
	
	/**
	 * 공지사항 수정화면을 조회한다.
	 * @param noticeIdx - 수정할 공지사항 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "noticeDetail"
	 * @exception Exception
	 */
	@RequestMapping("/site/noticeDetail.do")
	public ModelAndView noticeDetail(@ModelAttribute("searchVO") SiteVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		String noticeIdx = request.getParameter("noticeIdx");
		searchVO.setNoticeIdx(noticeIdx);
		
		SiteVO detail = siteService.selectNoticeDetail(searchVO);
		model.addAttribute("detail", detail);
		model.addAttribute("viewType", "modify");
		
		mv.setViewName("/view/noticeReg");
		
		return mv;
	}
	
	/**
	 * 공지사항 등록화면을 조회한다.
	 * @param SiteVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "noticeReg"
	 * @exception Exception
	 */
	@RequestMapping("/site/noticeReg.do")
	public ModelAndView noticeReg(@ModelAttribute("searchVO") SiteVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/noticeReg");
		
		return mv;
	}
	
	/**
	 * 공지사항을 등록한다.
	 * @param SiteVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "noticeInsert"
	 * @exception Exception
	 */
    @RequestMapping("/site/noticeInsert.do")
    public String noticeInsert(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, Model model, @ModelAttribute("searchVO") SiteVO searchVO) throws Exception {
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
				searchVO.setFileCourse(file.getAbsolutePath());					//경로
				searchVO.setOrgFileNm(fileOriginName);							//파일명

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("파일경로: "+ searchVO.getFileCourse());
		System.out.println("파일이름: "+ searchVO.getOrgFileNm());
    	searchVO.setNoticeTitle(request.getParameter("noticeTitle"));
    	searchVO.setNoticeOpenYn(request.getParameter("noticeOpenYn"));
    	searchVO.setNoticeImptYn(request.getParameter("noticeImptYn"));
    	searchVO.setNoticeCont(request.getParameter("noticeCont"));
    	System.out.println("라디오버튼: "+searchVO.getNoticeImptYn());
    	System.out.println("내용: "+searchVO.getNoticeCont());
    	Integer returnCode = siteService.noticeInsert(searchVO);
		
    	return "jsonView";
    }
    
	
	/**
	 * 공지사항을 수정한다.
	 * @param SiteVO - 등록 조건 정보가 담긴 VO
	 * @param model
	 * @return "noticeUpdate"
	 * @exception Exception
	 */
    @RequestMapping("/site/noticeUpdate.do")
    public String noticeUpdate(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, Model model, @ModelAttribute("searchVO") SiteVO searchVO) throws Exception {
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
				searchVO.setFileCourse(file.getAbsolutePath());					//경로
				searchVO.setOrgFileNm(fileOriginName);							//파일명

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("파일경로: "+ searchVO.getFileCourse());
		System.out.println("파일이름: "+ searchVO.getOrgFileNm());
    	searchVO.setNoticeTitle(request.getParameter("noticeTitle"));
    	searchVO.setNoticeOpenYn(request.getParameter("noticeOpenYn"));
    	searchVO.setNoticeImptYn(request.getParameter("noticeImptYn"));
    	searchVO.setNoticeCont(request.getParameter("noticeCont"));
    	searchVO.setNoticeIdx(request.getParameter("noticeIdx"));
    	System.out.println("noticeIdx :: " + request.getParameter("noticeIdx"));
    	System.out.println("라디오버튼: "+searchVO.getNoticeImptYn());
    	System.out.println("내용: "+searchVO.getNoticeCont());    	
    	
    	Integer returnCode = siteService.noticeUpdate(searchVO);
		
    	return "jsonView";
    }    
	
    @ResponseBody
    @PostMapping(value="/site/noticeFileUpload.do", produces="text/plain;charset=utf-8")
    public ResponseEntity<String> noticeFileUpload(HttpServletResponse response, Model model, SiteVO vo, @RequestParam("noticeFiles") MultipartFile noticeFiles) throws Exception {		
		
		String returnCode = "100";
		
		noticeFiles = vo.getNoticeFiles();
		
		String uploadedFileName = UploadFileUtils.imageFileUpload(noticeFilePath, noticeFiles.getOriginalFilename(), noticeFiles.getBytes());	        
		
		vo.setNoticeFile("/noticeFile"+uploadedFileName);
		siteService.noticeFileUpload(vo);
		
        return new ResponseEntity<String>(returnCode, HttpStatus.OK);
    }
    
	/**
	 * 팝업 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "popupList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/site/popupList.do")
	public ModelAndView popupList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
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
		
		//int totCnt = memberService.selectAuthListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/popupList");
		
		return mv;
	}
	
	/**
	 * 팝업 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "popupReg"
	 * @exception Exception
	 */
	@RequestMapping("/site/popupReg.do")
	public ModelAndView popupReg(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/popupReg");
		
		return mv;
	}
	
	/**
	 * 접속로그 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "accessLogList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/site/accessLogList.do")
	public ModelAndView accessLogList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
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
		
		//int totCnt = memberService.selectAuthListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/accessLogList"); 
		
		return mv;
	}
	
	/*
    @RequestMapping("/site/noticeInsert.do")
    public String noticeInsert(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, Model model, @ModelAttribute("searchVO") SiteVO searchVO) throws Exception {
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
				searchVO.setFileCourse(file.getAbsolutePath());					//경로
				searchVO.setOrgFileNm(fileOriginName);							//파일명

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("파일경로: "+ searchVO.getFileCourse());
		System.out.println("파일이름: "+ searchVO.getOrgFileNm());
		
		
		Integer returnCode =0;
		if(no==1) {
	    	searchVO.setNoticeTitle(request.getParameter("noticeTitle"));
	    	searchVO.setNoticeOpenYn(request.getParameter("noticeOpenYn"));
	    	searchVO.setNoticeImptYn(request.getParameter("noticeImptYn"));
	    	searchVO.setNoticeCont(request.getParameter("noticeCont"));
	    	returnCode = siteService.onestopfileUpload(searchVO);			
		}
    	searchVO.setNoticeTitle(request.getParameter("noticeTitle"));
    	searchVO.setNoticeOpenYn(request.getParameter("noticeOpenYn"));
    	searchVO.setNoticeImptYn(request.getParameter("noticeImptYn"));
    	searchVO.setNoticeCont(request.getParameter("noticeCont"));
    	System.out.println("라디오버튼: "+searchVO.getNoticeImptYn());
    	System.out.println("내용: "+searchVO.getNoticeCont());
    	Integer returnCode = siteService.noticeInsert(searchVO);
		
    	return "jsonView";
    }*/
}
