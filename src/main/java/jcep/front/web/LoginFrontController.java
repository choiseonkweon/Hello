package jcep.front.web;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.front.model.LoginFrontVO;
import jcep.front.service.LoginFrontService;

/**
 * @Class Name : LoginController.java
 * @Description : LoginController  Class
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
public class LoginFrontController {

	@Resource(name = "loginFrontService")
	protected LoginFrontService loginFrontService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 로그인 사용 목록을 조회한다. (pageing)
	 * @param loginFrontVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "login"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public ModelAndView loginList(@ModelAttribute("loginFrontVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("loginFrontVO_1***********************"+searchVO);
/*		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<LoginFrontVO> loginList = loginFrontService.selectLoginList(searchVO);
		model.addAttribute("resultList", loginList);*/
		
		mv.setViewName("/view/frontView/login");
		
		return mv;
	}

	/**
	 * 회원 아이디 로그인
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "memberIdChk"
	 * @exception Exception
	 */
	@RequestMapping("/frontView/loginCheck.do")
	public String loginCheck(HttpServletRequest request, Model model, @ModelAttribute ("searchVO") MemberVO searchVO, HttpSession session) throws Exception {
		HashMap<String,String> login = new HashMap<String,String>();
		MemberVO data = null;
		login.put("memberId", request.getParameter("memberId"));
		login.put("memberPw", request.getParameter("memberPw"));
		
		int idCnt = loginFrontService.selectLoginListTotCnt(login);	///아이디가 있나 없나 체크
		System.out.println("  :::::::: " + idCnt);
		if(idCnt > 0) {
			data = loginFrontService.loginData(login);
			if(data!=null) {
				session.setAttribute("memberId", data.getMemberId());	//아이디값 입력
				session.setAttribute("joinTypeCd", data.getJoinTypeCd());	//회원코드 입력				

				model.addAttribute("memberId", data.getMemberId());	//승인상태값 
				model.addAttribute("memberPw", data.getMemberPw());	//승인상태값 
				model.addAttribute("memberStCd", data.getMemberStCd());	//승인상태값 
			}				
		}
		
	
		model.addAttribute("idCnt", idCnt);
		return "jsonView";
	}
	
	/**
	 * 회원 아이디 로그아웃
	 * @author 최선권
	 * @Date 20191129
	 * @param session.getAttribute("memberId")
	 * @return mav(회원아이디)
	 * @exception Exception
	 */
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session.getAttribute("memberId");

		System.out.println(request.getSession().getAttribute("memberId"));

		session.removeAttribute("memberId");

		System.out.println(session.getAttribute("memberId"));

		mav.setViewName("redirect:/main.do");

		return mav;
	}

	
	
}
