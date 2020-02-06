package jcep.front.web;

import java.io.File;
import java.io.FileInputStream;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Multipart;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.log4j.lf5.viewer.configure.MRUFileManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;
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
public class JoinStepController {

	@Resource(name = "loginFrontService")
	protected LoginFrontService loginFrontService;
	
	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Autowired
	JeonnamCommonsController jeonnamCommonsController;
	
	/**
	 * 회원가입 사용 목록을 조회한다. (pageing)
	 * @param loginFrontVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "login"
	 * @exception Exception
	 */
	
	/**
	 * 회원가입 - 가입유형Step
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep01.do")
	public ModelAndView joinStep01(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		mv.setViewName("/view/frontView/joinStep01");
		
		return mv;
	}

	/**
	 * 회원가입 - 전문가-약관동의Step 
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep02.do")
	public ModelAndView joinStep02(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		mv.setViewName("/view/frontView/joinStep02");
		
		return mv;
	}

	/**
	 * 회원가입 - 기업-약관동의Step 
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep021.do")
	public ModelAndView joinStep021(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		mv.setViewName("/view/frontView/joinStep021");
		
		return mv;
	}

	/**
	 * 회원가입 - 기업-정보입력Step 
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep022.do")
	public ModelAndView joinStep022(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		mv.setViewName("/view/frontView/joinStep022");
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep03.do")
	public ModelAndView joinStep03(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		
		//전문분야 - 대분류 
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("G00012");
		List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("areaList" ,areaList);

		// 통합전화 코드
		commonsVo.setGroupCd("G00048");
		List<MemberVO> totTelNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("totTelNoList" ,totTelNoList);
		// 전화 코드
		commonsVo.setGroupCd("G00049");
		List<MemberVO> telNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("telNoList" ,telNoList);
		// 휴대전화 코드
		commonsVo.setGroupCd("G00050");
		List<MemberVO> hpNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("hpNoList" ,hpNoList);
		
		// 산학연관 코드
		commonsVo.setGroupCd("G00017");
		List<MemberVO> exIndsEduCdList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("exIndsEduCdList" ,exIndsEduCdList);		
	
		model.addAttribute("resultList" ,searchVO);
		
		mv.setViewName("/view/frontView/joinStep03");
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep031.do")
	public ModelAndView joinStep031(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		//사업분야 - 대분류 
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("G00002");
		List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("areaList" ,areaList);
		// 통합전화 코드
		commonsVo.setGroupCd("G00048");
		List<MemberVO> totTelNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("totTelNoList" ,totTelNoList);
		// 전화 코드
		commonsVo.setGroupCd("G00049");
		List<MemberVO> telNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("telNoList" ,telNoList);
		// 휴대전화 코드
		commonsVo.setGroupCd("G00050");
		List<MemberVO> hpNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("hpNoList" ,hpNoList);
		
		model.addAttribute("resultList" ,searchVO);

		mv.setViewName("/view/frontView/joinStep031");
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep032.do")
	public ModelAndView joinStep032(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		//사업분야 - 대분류 
		MemberVO commonsVo = new MemberVO();
		commonsVo.setGroupCd("G00002");
		List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("areaList" ,areaList);
		
		// 통합전화 코드
		commonsVo.setGroupCd("G00048");
		List<MemberVO> totTelNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("totTelNoList" ,totTelNoList);
		// 전화 코드
		commonsVo.setGroupCd("G00049");
		List<MemberVO> telNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("telNoList" ,telNoList);
		// 휴대전화 코드
		commonsVo.setGroupCd("G00050");
		List<MemberVO> hpNoList = memberService.selectCommonsList(commonsVo);
		model.addAttribute("hpNoList" ,hpNoList);		
		
		model.addAttribute("resultList" ,searchVO);
		
		mv.setViewName("/view/frontView/joinStep032");
		
		return mv;
	}

	
	/**
	 * 회원가입- 가입완료
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep04.do")
	public ModelAndView joinStep04(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {

		mv.setViewName("/view/frontView/joinStep04");
		
		return mv;
	}	

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep036.do")
	public ModelAndView joinStep036(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		/*System.out.println("joinStep03_1***********************"+searchVO);
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
		
		//int totCnt = memberService.selectAuthListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("viewType", "create");
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("joinStep03_2***********************"+searchVO);
		mv.setViewName("/view/frontView/joinStep03");*/
		
		return mv;
	}

	
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep03Detail.do")
	public ModelAndView joinStep03U(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("joinStep03_U132323***********************"+searchVO);
		
		String memberId = (String) session.getAttribute("memberId");
		String memberId1 = (String) session.getAttribute("memberId");
		String memberIdx = (String) session.getAttribute("memberId");
		String largeSpecialAreaCd = request.getParameter("largeSpecialAreaCd");
		searchVO.setMemberId(memberId);
		searchVO.setMemberId1(memberId1);
		searchVO.setMemberIdx(memberIdx);
		searchVO.setLargeSpecialAreaCd(largeSpecialAreaCd);
		
		System.out.println("memberId :: " + memberId);
		System.out.println("memberId1 :: " + memberId1);
		System.out.println("memberIdx :: " + memberIdx);
		System.out.println("largeSpecialAreaCd :: " + largeSpecialAreaCd);

		int idCnt = loginFrontService.selectJoinStep03Test(searchVO, session);
		request.setAttribute("idCnt", idCnt);
		System.out.println("idCnt :: " + idCnt);
		
		int idCnt2 = loginFrontService.selectJoinStep03Test2(searchVO, session);
		request.setAttribute("idCnt2", idCnt2);
		System.out.println("idCnt2 :: " + idCnt2);

		int idCnt3 = loginFrontService.selectJoinStep03Test3(searchVO, session);
		request.setAttribute("idCnt3", idCnt3);
		System.out.println("idCnt3 :: " + idCnt3);
		
		if(idCnt==1) {

			MemberVO commonsVo = new MemberVO();
			commonsVo.setGroupCd("g00028");
			List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
			mv.addObject("areaList ", areaList );
			model.addAttribute("areaList" ,areaList);
			
			System.out.println("areaList :: " + areaList);

			MemberVO detail = loginFrontService.selectJoinStep03U(searchVO, session);
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify");
			System.out.println("detail :: " + detail);
			mv.setViewName("/view/frontView/joinStep03");
		}
		else if(idCnt2 == 1) {

			MemberVO commonsVo = new MemberVO();
			commonsVo.setGroupCd("g00028");
			List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
			mv.addObject("areaList ", areaList );
			model.addAttribute("areaList" ,areaList);
			
			System.out.println("areaList :: " + areaList);

			MemberVO detail = loginFrontService.selectJoinStep03U11(searchVO, session);
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify");
			System.out.println("detail :: " + detail);
			mv.setViewName("/view/frontView/joinStep031");
		}
		else if(idCnt3 == 1) {

			MemberVO commonsVo = new MemberVO();
			commonsVo.setGroupCd("g00028");
			List<MemberVO> areaList = memberService.selectCommonsList(commonsVo);
			mv.addObject("areaList ", areaList );
			model.addAttribute("areaList" ,areaList);
			
			System.out.println("areaList :: " + areaList);

			MemberVO detail = loginFrontService.selectJoinStep03U111(searchVO, session);
			model.addAttribute("detail", detail);
			model.addAttribute("viewType", "modify");
			System.out.println("detail :: " + detail);
			mv.setViewName("/view/frontView/joinStep032");
		}

		
		

		System.out.println("joinStep03_U2323232***********************"+searchVO);
		
		return mv;
	}


	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/myCompanyInformationList.do")
	public ModelAndView myCompanyInformationList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("myCompanyInformationList_1***********************"+searchVO);
		
		String memberId = request.getParameter("memberId");
		String memberId1 = request.getParameter("memberId1");
		String memberIdx = request.getParameter("memberIdx");
		searchVO.setMemberId(memberId);
		searchVO.setMemberId1(memberId1);
		searchVO.setMemberIdx(memberIdx);
		
		System.out.println("memberId :: " + memberId);
		System.out.println("memberId1 :: " + memberId1);
		System.out.println("memberIdx :: " + memberIdx);

		MemberVO detail = loginFrontService.selectJoinStep03U(searchVO, session);
		model.addAttribute("detail", detail);
		ArrayList<MemberVO> detail1 = loginFrontService.selectJoinStep03U1(searchVO);		
		model.addAttribute("detail1", detail1);
		
		//model.addAttribute("viewType", "modify");
		System.out.println("detail :: " + detail);
		System.out.println("detail1 :: " + detail1);
		
		mv.setViewName("/view/frontView/myCompanyInformation");

		System.out.println("myCompanyInformationList_2***********************"+searchVO);
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/joinStep03Detail12.do")
	public ModelAndView joinStep03U12(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("joinStep03_U1***********************"+searchVO);
		
		//String memberId = request.getParameter("memberId");
		//String memberId1 = request.getParameter("memberId1");
		//searchVO.setMemberId(memberId);
		//searchVO.setMemberId1(memberId1);
		//searchVO.setMemberId(memberId);
		//searchVO.setMemberId1(memberId1);
		//System.out.println("memberId :: " + memberId);
		//System.out.println("memberId1 :: " + memberId1);
		
		MemberVO detail = loginFrontService.selectJoinStep03U(searchVO, session);
		model.addAttribute("detail", detail);
		model.addAttribute("viewType", "modify");
		System.out.println("detail :: " + detail);
		
		mv.setViewName("/view/frontView/joinStep03");

		System.out.println("joinStep03_U2***********************"+searchVO);
		
		return mv;
	}

	/**
	 * 회원 정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberInsert.do", produces="text/plain;charset=utf-8")
	public String memberInsert(HttpServletRequest request, Model model,MultipartHttpServletRequest mRequest,@RequestParam(required=false) Map<String, Object> paramMap) throws Exception {
		paramMap.put("filePath", noticeFilePath);
		Integer returnCode = loginFrontService.memberInsert(paramMap,mRequest);
		
		return "jsonView";
	}


	
	
	/**
	 * 회원 정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberExpertUpdate.do")
	public String memberExpertUpdate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.memberExpertUpdate(searchVO);
		
		Integer returnCode1 = loginFrontService.memberExpertUpdateExpert(searchVO);
		
		//Integer returnCode1 = loginFrontService.memberExpertUpdateInformation(searchVO);
	
		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	/**
	 * 전문가 정보를 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberExpertUpdateInformation.do")
	public String memberExpertUpdateInformation(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.memberExpertUpdateInformation1(searchVO);
		
		Integer returnCode1 = loginFrontService.memberExpertUpdateInformation(searchVO);
	
		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
		
	

	/**
	 * 기업 정보를 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberEnterpriseUpdate.do")
	public String memberEnterpriseUpdate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("memberEnterpriseUpdate_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.memberEnterpriseUpdate(searchVO);
		Integer returnCode1 = loginFrontService.memberEnterpriseUpdateInformation(searchVO);
	
		System.out.println("memberExpertUpdate1_2***********************"+searchVO);
		
		return "jsonView";
	}

	/**
	 * 바이어 정보를 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberBuyerUpdate.do")
	public String memberBuyerUpdate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("memberBuyerUpdate_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.memberBuyerUpdate(searchVO);
		Integer returnCode1 = loginFrontService.memberBuyerUpdateInformation(searchVO);
	
		System.out.println("memberBuyerUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	
	/**
	 * 회원 정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "joinStep03"
	 * @exception Exception
	 */
	@RequestMapping(value = "/memberExpertUpdate2.do")
	public String memberExpertUpdate2(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("memberExpertUpdate2_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.memberExpertUpdate2(searchVO);
	
		System.out.println("memberExpertUpdate2_2***********************"+searchVO);
		
		return "jsonView";
	}

	/**
	 * 내 기업 정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "myCompanyInformationList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/myCompanyInformationUpdate.do")
	public String myCompanyInformationUpdate(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("myCompanyInformationUpdate_1***********************"+searchVO);

		String memberId = request.getParameter("memberId");
		System.out.println("memberId :: " + memberId);
		
		Integer returnCode = loginFrontService.myCompanyInformationUpdate(searchVO);
	
		System.out.println("myCompanyInformationUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
/*	@RequestMapping(value = "/joinStep032.do")
	public ModelAndView joinStep032(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("joinStep032_1***********************"+searchVO);
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
		
		//int totCnt = memberService.selectAuthListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("joinStep032_2***********************"+searchVO);
		mv.setViewName("/view/frontView/joinStep032");
		
		return mv;
	}
	*/
	@Resource(name="noticeFilePath")
    String noticeFilePath;

	@RequestMapping(value = "/memberemployeeInfomation.do")
	public String memberemployeeInfomation(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request, HttpSession session,MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);

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
		
		searchVO.setMemberId(request.getParameter("memberId"));
		searchVO.setEntprEmployeeNm(request.getParameter("entprEmployeeNm"));
		searchVO.setEntprEmployeeDept(request.getParameter("entprEmployeeDept"));
		searchVO.setEntprEmployeePosition(request.getParameter("entprEmployeePosition"));
		searchVO.setEntprEmployeeEmail(request.getParameter("entprEmployeeEmail"));
		searchVO.setEntprEmployeePhone(request.getParameter("entprEmployeePhone"));
		searchVO.setRemark(request.getParameter("remark"));

		System.out.println("******************aaa***********************");
		System.out.println(request.getParameter("entprEmployeeNm"));
		int returnCode = loginFrontService.myCompanyInformationEmployeeInsert(searchVO);
	



		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}

	
	@RequestMapping(value = "/memberJecpInsert.do")
	public String memberJecpInsert(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request, HttpSession session,MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("memberExpertUpdate_1***********************"+searchVO);
		
		searchVO.setMemberId(request.getParameter("memberId"));
		searchVO.setNtltProptBussNm(request.getParameter("intltProptBussNm"));
		searchVO.setNtltProptPerfNm(request.getParameter("intltProptPerfNm"));
		searchVO.setIntltProptCd(request.getParameter("intltProptCd"));
		searchVO.setRegFormCd(request.getParameter("regFormCd"));
		searchVO.setRegNationCd(request.getParameter("regNationCd"));
		searchVO.setIntltProptyDt(request.getParameter("intltProptyDt"));
		searchVO.setIntltProptRegNo(request.getParameter("intltProptRegNo"));
		searchVO.setRemark(request.getParameter("remark"));
		
		System.out.println("******************aaa***********************");
		System.out.println(request.getParameter("intltProptBussNm"));
		int returnCode = loginFrontService.myCompanyInformationJecpInsert(searchVO);

		System.out.println("memberExpertUpdate_2***********************"+searchVO);
		
		return "jsonView";
	}
	
	
	
}
