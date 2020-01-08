package jcep.front.web;

import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.iap.Response;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;

/**
 * @Class Name : CustomerFrontController.java
 * @Description : CustomerFrontController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.03          최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class CustomerFrontController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
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
	@RequestMapping(value = "/noticeList.do")
	public ModelAndView noticeList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("companyInformationList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<MemberVO> authList = memberService.selectNoticeListCompanyInformationList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = memberService.selectNoticeListCompanyInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
//		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("companyInformationList_2***********************"+searchVO);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("resultList", authList);
		mv.setViewName("/view/frontView/noticeList");
		
		return mv;
	}
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/noticeDetail.do")
	public ModelAndView noticeDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("noticeDetail_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		String sno = request.getParameter("sno");
		String title = request.getParameter("title");
		String snominus = request.getParameter("snominus");
		String snoplus = request.getParameter("snoplus");
		
		String noticeIdx = request.getParameter("noticeIdx");
		String noticeTitle = request.getParameter("noticeTitle");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int pageNumMinus = pageNum-1;
		int pageNumPlus = pageNum+1;
		searchVO.setNoticeIdx(noticeIdx);
		searchVO.setNoticeTitle(noticeTitle);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("noticeTitle :  " + noticeTitle);
		System.out.println("pageNum :  " + pageNum);

		searchVO.setSno(sno);
		searchVO.setTitle(title);
		
		searchVO.setSnominus(snominus);
		searchVO.setSnoplus(snoplus);
		
		System.out.println("sno :: " + sno);
		System.out.println("sno-1 :: " + snominus);
		System.out.println("sno+1 :: " + snoplus);
		System.out.println("title :: " + title);
		
		MemberVO detail = memberService.selectNoticeDetail(searchVO);
		MemberVO detail1 = memberService.selectNoticeDetailPlus(searchVO);
		MemberVO detail2 = memberService.selectNoticeDetailMinus(searchVO);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("detail", detail);  
		model.addAttribute("detail1", detail1);  
		model.addAttribute("detail2", detail2);  
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("sno", sno);
		model.addAttribute("title", title);
		model.addAttribute("snoplus", sno);
		model.addAttribute("snominus", sno);
		

		System.out.println("pageNum :: " + pageNum);
		System.out.println("pageNum+1 :: " + pageNum++);
		System.out.println("pageNum-1 :: " + pageNum +-1);
		System.out.println("detail1 :: " + detail1);
		System.out.println("detail2 :: " + detail2);

		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("noticeDetail_2***********************"+searchVO);
		mv.setViewName("/view/frontView/noticeDetail");
		
		return mv;
	}

//  20191121 신승원 이전글 다음글 수정
  @RequestMapping(value = "/noticeDetailpaging.do")
  public ModelAndView noticeDetailpaging(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request) throws Exception {
     System.out.println("companyInformationDetailpaging***********************"+searchVO);
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
//     20191114 최선권 추가
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
     
     mv.setViewName("/view/frontView/noticeDetail");      
     System.out.println("companyInformationDetailpaging***********************"+searchVO);
     
     return mv;
  }
	
	
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/faqList.do")
	public ModelAndView faqList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("faqList_1***********************"+searchVO);
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
		System.out.println("faqList_2***********************"+searchVO);
		mv.setViewName("/view/frontView/faqList");
		
		return mv;
	}
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/contactUsList.do")
	public ModelAndView contactUsList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("contactUsList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<MemberVO> authList = memberService.selectContactUsList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = memberService.selectContactUsListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("contactUsList_2***********************"+searchVO);
		mv.setViewName("/view/frontView/contactUsList");
		
		return mv;
	}

	/**
	 * 공지사항 패스워드 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "contactUsListPassWd"
	 * @exception Exception
	 */
	@RequestMapping(value = "/contactUsListPassWd.do")
	public String contactUsListPassWd(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("contactUsListPassWd_1***********************"+searchVO);

		searchVO.setQuestionIdx(request.getParameter("questionIdx"));
		searchVO.setQuestionTitle(request.getParameter("questionTitle"));
		searchVO.setQuestionPw(request.getParameter("questionPw"));
		
		System.out.println("questionIdx :: pw" + searchVO.getQuestionIdx() );
		System.out.println("questionTitle ::  pw" + searchVO.getQuestionTitle() );
		System.out.println("questionPw ::  pw" + searchVO.getQuestionPw() );
		
		String questionIdx = searchVO.getQuestionIdx();
		String questionTitle = searchVO.getQuestionTitle();
		String questionPw = searchVO.getQuestionPw();

		System.out.println("questionIdx :: " + questionIdx);
		System.out.println("questionTitle :: " + questionTitle);
		System.out.println("questionPw :: " + questionPw);

		int totcnt = memberService.selectContactUsListPassWd(searchVO);
		
		model.addAttribute("insertFrm", totcnt);
		model.addAttribute("viewType", "modify"); 
		
		mv.addObject("request", request);
		mv.addObject("searchVO", searchVO);
		mv.addObject("questionIdx", questionIdx);
		mv.addObject("questionTitle", questionTitle);
		mv.addObject("questionPw", questionPw);
		mv.addObject("insertFrm", totcnt);
		
		System.out.println("questionIdx :: " + questionIdx);
		System.out.println("questionTitle :: " + questionTitle);
		System.out.println("questionPw :: " + questionPw);


		//System.out.println("pageNum :: " + pageNum);
		//System.out.println("pageNum+1 :: " + pageNum++);
		//System.out.println("pageNum-1 :: " + pageNum +-1);
		
		System.out.println("contactUsListPassWd_2***********************"+searchVO);
		
		mv.setViewName("jsonView");
		
		return "jsonView";
	}
	

	/**
	 * 문의하기 화면을 나타 낸다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "contactUsDetailAuth"
	 * @exception Exception
	 */
	@RequestMapping("/contactUsDetailAuth.do")
	public ModelAndView contactUsDetailAuth(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("contactUsDetailAuth_1***********************"+searchVO);
		
		String mngId = request.getParameter("mngId");
		String authTpCd = request.getParameter("authTpCd");
		searchVO.setMngId(mngId);
    	searchVO.setAuthTpCd(authTpCd);
		System.out.println("mngId :: " + mngId);
    	System.out.println("authTpCd :: " + authTpCd);
		
		//MemberVO detail = memberService.selectMemberDetailAuthList(searchVO);
		//model.addAttribute("detail", detail);
		model.addAttribute("viewType", "create");
		//System.out.println("detail?? :: " + detail);
		
		System.out.println("contactUsDetailAuth_2***********************"+searchVO);
		
		mv.setViewName("/view/frontView/contactUsDetailAuth");
		
		return mv;
	}
	

	/**
	 * 문의하기 정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "contactUsList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/contactUsDetailInsert.do")
	public String contactUsDetailInsert(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
		System.out.println("contactUsDetailInsert_1***********************"+searchVO);
		
		Integer returnCode = memberService.contactUsDetailInsert(searchVO);
	
		System.out.println("contactUsDetailInsert_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	
	
	/**
	 * 문의하기 내용을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "contactUsDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "/contactUsDetail.do")
	public ModelAndView contactUsDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("contactUsDetail_1***********************"+searchVO);
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
		
		searchVO.setQuestionIdx(request.getParameter("questionIdx"));
		searchVO.setQuestionTitle(request.getParameter("questionTitle"));
		searchVO.setQuestionPw(request.getParameter("questionPw"));
		searchVO.setWriteNm(request.getParameter("writeNm"));
		searchVO.setTotcnt(request.getParameter("totcnt"));
		
		System.out.println("questionIdx :: contactUsDetail" + searchVO.getQuestionIdx() );
		System.out.println("questionTitle :: contactUsDetail" + searchVO.getQuestionTitle() );
		System.out.println("questionPw :: contactUsDetail" + searchVO.getQuestionPw() );
		System.out.println("writeNm :: contactUsDetail" + searchVO.getWriteNm() );
		System.out.println("totcnt :: " + searchVO.getTotcnt() );
		
		String questionIdx = searchVO.getQuestionIdx();
		String questionTitle = searchVO.getQuestionTitle();
		String questionPw = searchVO.getQuestionPw();
		String writeNm = searchVO.getWriteNm();
		//String totcnt = searchVO.getTotcnt();

		System.out.println("questionIdx :: contactUsDetail1" + questionIdx);
		System.out.println("questionTitle :: contactUsDetail1" + questionTitle);
		System.out.println("questionPw :: contactUsDetail1" + questionPw);
		System.out.println("writeNm :: contactUsDetail1" + writeNm);
		//System.out.println("totcnt :: " + totcnt);

		int totcnt = memberService.selectContactUsListPassWd(searchVO);
		
		model.addAttribute("insertFrm", totcnt);
		//model.addAttribute("viewType", "modify"); 
		
		mv.addObject("request", request);
		mv.addObject("searchVO", searchVO);
		mv.addObject("questionIdx", questionIdx);
		mv.addObject("questionTitle", questionTitle);
		mv.addObject("questionPw", questionPw);
		mv.addObject("writeNm", writeNm);
		mv.addObject("insertFrm", totcnt);
		
		System.out.println("questionIdx :: contactUsDetail2" + questionIdx);
		System.out.println("questionTitle :: contactUsDetail2" + questionTitle);
		System.out.println("questionPw :: contactUsDetail2" + questionPw);
		System.out.println("writeNm :: contactUsDetail2" + writeNm);
		System.out.println("totcnt :: contactUsDetail2" + totcnt);

		if(totcnt == 1) {
			//MemberVO 
			System.out.println("totcnt == 1 :: contactUsDetail3 ");
			MemberVO detail = memberService.selectContactUsDetailList(searchVO);
			mv.addObject("viewType", "modify");
			mv.addObject("detail", detail);
			
			mv.setViewName("/view/frontView/contactUsDetail");
			return mv;
		}
		else {
			//mv.setViewName("/view/frontView/contactUsList");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('패스워드를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<MemberVO> authList = memberService.selectContactUsList(searchVO);
			model.addAttribute("resultList", authList);
			
			int totCnt = memberService.selectContactUsListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			System.out.println("contactUsList_2***********************"+searchVO);
			mv.setViewName("/view/frontView/contactUsList");
			
			return mv;
		}
		
		//model.addAttribute("paginationInfo", paginationInfo);
		//System.out.println("contactUsDetail_2***********************"+searchVO);
		//mv.setViewName("/view/frontView/contactUsDetail");
		
		
		//return mv;
		
		//return mv;
		
	}
}
