package jcep.front.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;

/**
 * @Class Name : OnestopFrontController.java
 * @Description : OnestopFrontController  Class
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
public class OnestopFrontController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/*공통함수 컨트롤러*/
	@Autowired
	protected JeonnamCommonsController jonnamCommonsController;
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/onlineApply.do")
	public ModelAndView onlineApply(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		int sessionjoinTypeCd = Integer.parseInt((String) session.getAttribute("joinTypeCd"));
		String memberId = (String)session.getAttribute("memberId");
		MemberVO detail = new MemberVO();
		MemberVO detail1 = new MemberVO();
		int largecode =0;
		String mediumcode = null;
		System.out.println("searchVO_1***********************"+searchVO);
		MemberVO commonsVo = new MemberVO();
		
		/*기업정보 불러오기*/
		if(sessionjoinTypeCd==000001) {
			System.out.println("기업 ㅎ2");

			searchVO.setMemberId(memberId);
			
			detail = memberService.selectOnlineApply(memberId);
			detail1 = memberService.selectOnlineApply1(memberId);

			largecode = Integer.parseInt(detail.getLargeBussAreaCd());
			mediumcode = detail.getMediumBussAreaCd();

			detail.setLargeBussAreaCd(memberService.largecode(largecode));
			detail.setMediumBussAreaCd(memberService.mediumcode(mediumcode));
			
		}
		/*전문가정보 불러오기*/
		if(sessionjoinTypeCd==000002) {
			System.out.println("전문가 ㅎ2");
			searchVO.setMemberId(memberId);
			
/*			detail = memberService.selectOnlineApply(memberId);
			detail1 = memberService.selectOnlineApply1(memberId);
			
			largecode = Integer.parseInt(detail.getLargeBussAreaCd());
			mediumcode = detail.getMediumBussAreaCd();
*/			
		}
		
		/*바이어 정보*/
		if(sessionjoinTypeCd==000003) {
			System.out.println("바이어 ㅎ2");
			searchVO.setMemberId(memberId);
			
/*			detail = memberService.selectOnlineApply(memberId);
			detail1 = memberService.selectOnlineApply1(memberId);
			
			largecode = Integer.parseInt(detail.getLargeBussAreaCd());
			mediumcode = detail.getMediumBussAreaCd();
			
*/		}
		
		
		/*20191121 최선권 공통코드 불러오기 추가시작*/


		
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
		model.addAttribute("viewType", "create");
		System.out.println("detail :: " + detail);
		

		System.out.println("searchVO_2***********************"+searchVO);
		mv.setViewName("/view/frontView/onlineApply");
		
		return mv;
	}
	
}





