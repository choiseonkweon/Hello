package jcep.admin.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;
import jcep.front.web.JeonnamCommonsController;

/**
 * @Class Name : OnestopSupportController.java
 * @Description : OnestopSupport Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.14           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class OnestopSupportController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/*공통함수 컨트롤러*/
	@Autowired
	protected JeonnamCommonsController jonnamCommonsController;
	
	/*파일경로*/
  @Resource(name="noticeFilePath")
    String noticeFilePath;
	
	/**
	 * 자문컨설팅 현황 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "adviceConsultingStatusManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/oneStop/adviceConsultingStatusManagementList.do")
	public ModelAndView adviceConsultingStatusManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
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
		mv.setViewName("/view/adviceConsultingStatusManagementList");
		
		return mv;
	}
	
	/**
	 * 자문컨설팅 현황 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/oneStop/adviceConsultingStatusManagementReg.do")
	public ModelAndView adviceConsultingStatusManagementReg(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		mv.setViewName("/view/adviceConsultingStatusManagementReg");
		
		return mv;
	}
	
			
		/**
		 * 온라인 현황 목록을 조회한다. (pageing)
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "adviceConsultingStatusManagementList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusManagementList.do")
		public ModelAndView adviceOnlineStatusManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());			
			
			ArrayList<MemberVO> memberList = memberService.selectAdviceOnlineStatusManagementList(searchVO);
			model.addAttribute("resultList", memberList);
			
			int totCnt = memberService.selectAdviceOnlineStatusManagementListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);		
			model.addAttribute("paginationInfo", paginationInfo);
			mv.setViewName("/view/adviceOnlineStatusManagementList");
			
			return mv;
		}	
		
		
		/**
		 * 온라인상담 현황 관리을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "noticeList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusManagementDetail.do")
		public ModelAndView adviceOnlineStatusManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
			MemberVO commonsVo = new MemberVO();
			
			String memberId = request.getParameter("memberId");
			String onestopSupportNo = request.getParameter("onestopSupportNo");
			searchVO.setMemberId(memberId);
			searchVO.setOnestopSupportNo(onestopSupportNo);
			System.out.println("memberId :: " + memberId);
			System.out.println("onestopSupportNo :: " + onestopSupportNo);
            
			MemberVO detail = memberService.selectAdviceOnlineStatusManagementDetail(searchVO);
			MemberVO detail1 = memberService.selectOnlineApply1(memberId);

			String  groupCd =  "G00029";//자문 신청분야 그룹코드
			commonsVo.setGroupCd(groupCd);
			List<MemberVO> advicePlaceCdList = jonnamCommonsController.commonsCd(commonsVo); //리스트로 불러오자.
			
			groupCd =  "G00030";//자문 신청분야 그룹코드		
			commonsVo.setGroupCd(groupCd);
			List<MemberVO>  adviceAreaCdList= jonnamCommonsController.commonsCd(commonsVo); //리스트로 불러오자.
			
			model.addAttribute("advicePlaceCdList", advicePlaceCdList);
			model.addAttribute("adviceAreaCdList", adviceAreaCdList);
			/*20191121 최선권 공통코드 불러오기 추가종료*/
			
			model.addAttribute("detail", detail);
			model.addAttribute("detail1", detail1);
			mv.setViewName("/view/adviceOnlineStatusManagementDetail");

			 
			return mv;
		}
		
		/**
		 * 원스톱 업무일지을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "noticeList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusBusiness.do")
		public ModelAndView adviceOnlineStatusBusiness(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
			System.out.println("searchVO_1***********************"+searchVO);
			String memberId = request.getParameter("memberId");
			String onestopSupportNo = request.getParameter("onestopSupportNo");
			searchVO.setMemberId(memberId);
			searchVO.setOnestopSupportNo(onestopSupportNo);
			System.out.println("memberId :: " + memberId);
			System.out.println("onestopSupportNo :: " + onestopSupportNo);
			
			model.addAttribute("memberId", memberId);
			model.addAttribute("onestopSupportNo", onestopSupportNo);
			
			MemberVO detail = memberService.selectAdviceOnlineStatusBusiness(searchVO);
			model.addAttribute("detail", detail);
			
			System.out.println("detail?? :: " + detail);
			
			
			mv.setViewName("/view/adviceOnlineStatusBusiness");
			
			return mv;
		}
		
		/**
		 * 원스톱 업무일지 수정한다.
		 * @param memberidx - 수정할 회원 idx
		 * @param searchVO - 목록 조회조건 정보가 담긴 VO
		 * @param model
		 * @return "memberRegister"
		 * @exception Exception
		 */
	    @RequestMapping("/oneStop/adviceOnlineStatusBusinessUpdate.do")
	    public String adviceOnlineStatusBusinessUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
	    	
	    	String memberId = request.getParameter("memberId");	    	
	    	searchVO.setMemberId(memberId);	    
	    	System.out.println("memberId :: " + memberId);
	    
	    	Integer returnCode = memberService.adviceOnlineStatusBusinessUpdate(searchVO);	    
	    	
			return "jsonView";
	    }
	    

		/**
		 * 원스톱 업무일지 파일을 추가한다.
		 * @param memberidx - 수정할 회원 idx
		 * @param searchVO - 목록 조회조건 정보가 담긴 VO
		 * @param model
		 * @return "memberRegister"
		 * @exception Exception
		 */
	    // 20200102 원스톱업무일지 파일업로드 추가
	    @RequestMapping("/oneStop/adviceOnlineStatusBussLogFileUpload.do")
	    public String adviceOnlineStatusBussLogFileUpload(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO, MultipartHttpServletRequest multipartRequest) throws Exception {
	    	
	    	String memberId = request.getParameter("memberId");	    
	    	String onestopSupportNo = request.getParameter("onestopSupportNo");
	    	int no = Integer.parseInt(request.getParameter("no"));

	    	searchVO.setMemberId(memberId);	    
	    	searchVO.setMemberId(onestopSupportNo);	    
	    	System.out.println("memberId :: " + memberId);
	    	
	    	
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
	              searchVO.setFileCourse(file.getAbsolutePath());               //경로
	              searchVO.setOrgFileNm(fileOriginName);                     //파일명

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
	            returnCode = memberService.onestopfileUpload(searchVO);         
	        }
	    
	    	//Integer returnCode = memberService.adviceOnlineStatusBusinessUpdate(searchVO);
	    	
			return "jsonView";
	    }
	    
	    
		
		/**
		 * 온라인상담 신청내용 수정한다.
		 * @param memberidx - 수정할 회원 idx
		 * @param searchVO - 목록 조회조건 정보가 담긴 VO
		 * @param model
		 * @return "memberRegister"
		 * @exception Exception
		 */
	    @RequestMapping("/oneStop/adviceOnlineStatusManagementUpdate.do")
	    public String adviceOnlineStatusManagementUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
	    	
	    	String memberId = request.getParameter("memberId");	
	    	String onestopSupportNo = request.getParameter("onestopSupportNo");	    	
	    	searchVO.setMemberId(memberId);	    	
	    	searchVO.setOnestopSupportNo(onestopSupportNo);	    
	    	System.out.println("memberId :: " + memberId);
	    	System.out.println("onestopSupportNo :: " + onestopSupportNo);
	    
	    	Integer returnCode = memberService.adviceOnlineStatusManagementUpdate(searchVO);	    
	    	
			return "jsonView";
	    }

	   /*온라인상담 현황 관리 이전글 다음글 수정*/
	  @RequestMapping(value = "/adviceOnlineStatusManagementDetailpaging.do")
	  public ModelAndView adviceOnlineStatusManagementDetailpaging(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request) throws Exception {
	     System.out.println("adviceOnlineStatusManagementDetailpaging***********************"+searchVO);
	     searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	     searchVO.setPageSize(propertiesService.getInt("pageSize"));
	     
	     PaginationInfo paginationInfo = new PaginationInfo();
	     paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	     paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	     paginationInfo.setPageSize(searchVO.getPageSize());
	     
	     searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	     searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	     searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	      System.out.println("memberId::" + request.getParameter("memberId"));

	     String memberId = request.getParameter("memberId");  
	     String noticeTitle = request.getParameter("noticeTitle");
	     String noticeIdx = request.getParameter("noticeIdx");
	     int pageNum = Integer.parseInt(request.getParameter("pageNum"));         //넘어온 번호값 저장
	     searchVO.setMemberId(memberId);
	     searchVO.setNoticeTitle(noticeTitle);
	     searchVO.setNoticeIdx(noticeIdx);
	     searchVO.setPageNum(pageNum);
	     
	     System.out.println("memberId :  " + memberId);
	     System.out.println("noticeTitle :  " + noticeTitle);
	     System.out.println("noticeIdx :  " + noticeIdx);
	     System.out.println("pageNum :  " + pageNum);
	     
	     MemberVO detail = memberService.selectNoticeDetail(searchVO);         //해당페이지의 정보
	     MemberVO detail1 = memberService.selectNoticeDetailPlus(searchVO);      //다음글에 대한 정보
	     MemberVO detail2 = memberService.selectNoticeDetailMinus(searchVO);   //이전글에 대한 정보
	  
	     mv.addObject("paginationInfo", paginationInfo);
	     mv.addObject("viewType", "modify");
	     mv.addObject("detail", detail);
	     mv.addObject("detail1", detail1);
	     mv.addObject("detail2", detail2);
	     mv.addObject("pageNum", pageNum);

	     System.out.println("detail :: " + detail);
	     
	     mv.setViewName("/view/adviceOnlineStatusManagementDetailpaging");      
	     System.out.println("adviceOnlineStatusManagementDetailpaging***********************"+searchVO);
	     
	     return mv;
	  }
	
}
