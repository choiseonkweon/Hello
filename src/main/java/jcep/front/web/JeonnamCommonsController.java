package jcep.front.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;
import jcep.front.model.FacilityResourceFrontVO;
import jcep.front.service.LoginFrontService;

/**
 * @Class Name : JeonnamCommonsController.java
 * @Description : JeonnamCommonsController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.11.20          최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class JeonnamCommonsController {

	@Resource(name = "memberService")
	protected MemberService memberService;

	@Resource(name = "loginFrontService")
	protected LoginFrontService loginFrontService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	private static final Logger logger = LoggerFactory.getLogger(BusinessAnnouncementController.class);
	
	private final String PATH = "C:/JCEP_SYSTEM/JCEP_SYSTEM/src/main/webapp/WEB-INF/upload/";

	@Autowired
	MappingJackson2JsonView jsonView;
	
	@Resource(name="noticeFilePath")
    String noticeFilePath;

	/**
	 * 파일 업로드 함수
	 * @author 최선권
	 * @Date 20191121
	 * @param ModelAndView - request.getFile("인풋파일네임");
	 * @return memberVo - 불러온 insertController로 fileName, path가 MemberVo에 담겨져서 반환.
	 * @exception Exception
	 */
    public MemberVO FileUpload (ModelAndView mv) throws Exception {
    	Map<String, Object> map = mv.getModelMap();
		MultipartFile upFile = (MultipartFile) map.get("file");
		System.out.println("UpFile::::" + upFile);
		// MultiPartFile로 파일 받아오기

		logger.debug(">>>>>>>>>>> fileUpload start");
		String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
		System.out.println("fileName:::" + fileName);
		//파일명 (인서트 시간 + "_" + 파일본명)

		logger.debug(">>>>>>>>>>> request : "+upFile.toString());
		MemberVO fileVo = new MemberVO();
		File path=new File(noticeFilePath);
		//일반저장소
		path.mkdir();
	    	
		if(path.exists() && path.isDirectory()){			
			File file=new File(path, fileName);
			try {
				upFile.transferTo(file);
				fileVo.setFileCourse(file.getAbsolutePath());					//경로
				fileVo.setOrgFileNm(fileName);										//파일명
					logger.debug(">>>>>>>>>>> originFileName : " + fileName);

			}catch (Exception e) {
				e.printStackTrace();
			}	
		}	
		return fileVo;
	}	
    
	/**
	 * 공통코드 함수
	 * @author 최선권
	 * @Date 20191122
	 * @param MemberVO - 공통코드를 조회할 데이터를 MemberVO 담아서 가져온다.
	 * @return List<memberVo> - 조회된 내용을 List로 담아 반환
	 * @exception Exception
	 */
    public List<MemberVO> commonsCd(MemberVO commonsVo) throws Exception{
    	   	List<MemberVO> commonsList= memberService.selectCommonsList(commonsVo);	
    	return commonsList;
    }
    
    
	@RequestMapping(value="/fileDownload.do", method=RequestMethod.GET)
	public ModelAndView fileBoardDownLoad(HttpServletRequest request, HttpServletResponse response){		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		try {
			memberService.fileDownload(mav);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	} 
}
