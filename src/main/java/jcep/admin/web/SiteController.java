package jcep.admin.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
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
import jcep.admin.dao.SiteMapper;
import jcep.admin.model.MemberVO;
import jcep.admin.model.SiteVO;
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
		
		System.out.println("번호는"+request.getParameter("noticeIdx"));
		
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
		//
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
	
	
	/**
	 * FAQ목록을 조회한다. 
	 * @param
	 * @param model
	 * @param pageSize 
	 * @param searchVO 
	 * @return "faqList"
	 * @exception Exception
	 */
	
	@RequestMapping("/site/faqList.do")
	public ModelAndView faqList(@RequestParam(required=false) Map<String,Object> paramList,Model model, ModelAndView mv,
			String pageSize, String searchText, String searchType,@ModelAttribute("searchVO")SiteVO searchVO) throws Exception {
		
		//미리정의된 페이징 정보 가져오기
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));	//페이지갯수
		searchVO.setPageSize(propertiesService.getInt("pageSize"));	//페이지사이즈
		
		//페이징 처리하기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());		//현재페이지
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());	//페이지갯수
		paginationInfo.setPageSize(searchVO.getPageSize());					//페이지 리스트에 게시되는 페이지 건수	
		
		//다시 searchVo에 담기
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//faqList 에 화면단 결과를 담기 
		//selectFaqList 에서 조회한 결과(list)를 faqList에 넣는거
		//형태는 List로 List안에는 Map 으로 들어가고
		List<Map<String, String>> faqList = siteService.selectFaqList(searchVO);
		
		model.addAttribute("faqList", faqList);

		
		int totCnt = siteService.selectFaqListTotCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		mv.setViewName("/view/faqList");
		
		return mv;
	}
	
	/**
	 * FAQ 글 등록 화면 
	 * @param
	 * @param model
	 * @return "faqReg"
	 * @exception Exception
	 */
	
	@RequestMapping("/site/faqReg.do")
	public ModelAndView faqReg(@ModelAttribute("searchVO") SiteVO searchVO,Model model, ModelAndView mv, HttpServletRequest request) {
		
		model.addAttribute("viewType", "create");
		
		mv.setViewName("/view/faqReg");
		
		return mv;
	}
	
	/**
	 * 공지사항 상제정보를 조회한다.
	 * @param noticeIdx - 수정할 공지사항 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "noticeDetail"
	 * @exception Exception
	 */
	@RequestMapping("/site/faqDetail.do")
	public ModelAndView faqDetail(@RequestParam(required=false) Map<String,Object> paramList, Map<String, Object> faq_idx, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		
		Map<String,Object> detail = siteService.selectFaqDetail(paramList);
		
		mv.addObject("detail", detail);
		
		mv.setViewName("/view/faqReg");
		
		model.addAttribute("viewType", "modify");
		
		System.out.println("번호는"+request.getParameter("faq_idx"));
		
		
		return mv;
	}
	
	/**
	 * FAQ 를 등록한다.
	 * @param paramList1 
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
    @RequestMapping("/site/faqInsert.do")
    public String faqInsert(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("searchVO") SiteVO searchVO, 
    		MultipartHttpServletRequest multipartRequest, @RequestParam(required=false) Map<String,Object> paramList) throws Exception{
    	
   	  	
    	File path=new File(noticeFilePath);		//폴더 경로 생성
		if(!path.exists()) {							//해당 디렉토리가 없을 경우
			path.mkdir();								//디렉토리를 생성
		}
		Iterator <String> itr = multipartRequest.getFileNames(); // 화면에서 받은 파일정보를 its에 생성

		while(itr.hasNext()) {  // 다음 파일이 존재하는지 체크
			MultipartFile mpf = multipartRequest.getFile(itr.next());  //화면에서 받은 파일정보 가져오기
			System.out.println(mpf.getOriginalFilename());	
			String fileOriginName = Long.toString(System.currentTimeMillis()) + "_" + mpf.getOriginalFilename();  // 실제파일명을 만들어주기
			File file = new File(path,fileOriginName);  //File이라는 클래스(설계도)에 file이라는 인스턴스(제품)을 만들어준다.
			try {
				mpf.transferTo(file);  //file 정보대로 파일생성
				searchVO.setFileCourse(file.getAbsolutePath());					//searchVO에 경로 담기
				searchVO.setOrgFileNm(fileOriginName);							//searchVO에 파일명 담기

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
    	
    	paramList.put("fileCourse", searchVO.getFileCourse());
		paramList.put("orgFileNm", searchVO.getOrgFileNm());
		siteService.selectFaqInsert(paramList);
		
    	return "jsonView";
    	
    }
    
	/**
	 * FAQ 글 수정 화면 
	 * @param
	 * @param model
	 * @return "faqReg"
	 * @exception Exception
	 */
    @RequestMapping("/site/faqUpdate.do")
    public String faqUpdate(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, @ModelAttribute("searchVO") SiteVO searchVO,
    		Model model, @RequestParam(required=false) Map<String,Object> paramList){
	
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
				System.out.println("file.getAbsolutePath()=="+file.getAbsolutePath());
				System.out.println("fileOriginName=="+fileOriginName);
				searchVO.setFileCourse(file.getAbsolutePath());					//경로
				searchVO.setOrgFileNm(fileOriginName);							//파일명

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		paramList.put("fileCourse", searchVO.getFileCourse());
		paramList.put("orgFileNm", searchVO.getOrgFileNm());
    	siteService.selectfaqUpdate(paramList);
    	
    	Integer returnCode = siteService.selectfaqUpdate(paramList);
    	return "jsonView";
    }
    
	  
	  @RequestMapping(value = "/site/faqFileDown.do", produces="text/plain;charset=utf-8")
	  public ModelAndView  faqFileDown(@RequestParam(required=false) Map<String, String> map, ModelAndView mv, 
			  HttpServletRequest request, HttpServletResponse response) throws Exception {

		  
//		   요청하는 컨트롤러에서 ModelAndView에 MemberVo에 Data를 담아서 보내고 여기서 꺼내오자.(파일을 읽고 쓸 스트림)
			BufferedInputStream fis = null;
			BufferedOutputStream fos = null;
			
			try {
				String fileName = map.get("orgFileNm");
				
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("UTF-8"),"ISO-8859-1") + ";");
				fis = new BufferedInputStream(new FileInputStream(noticeFilePath+"\\"+fileName));
				
				
				fos = new BufferedOutputStream(response.getOutputStream());

				while (true) {
					int data = fis.read();
					if (data == -1)
						break;
					fos.write(data);
				}

				fos.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}
		  return null;
	  }
	  
	  /**
		 * 파일삭제 
		 * @param
		 * @param model
		 * @return "faqReg"
		 * @exception Exception
		 */
	    @RequestMapping("/site/deleteFile.do")
	    public String deleteFile(HttpServletRequest request, MultipartHttpServletRequest multipartRequest, @ModelAttribute("searchVO") SiteVO searchVO,
	    		Model model, @RequestParam(required=false) Map<String,Object> paramList){
		
			paramList.put("fileCourse", "");
			paramList.put("orgFileNm", "");
	    	siteService.selectfaqUpdate(paramList);
	    	
	    	Integer returnCode = siteService.selectfaqUpdate(paramList);
	    	return "jsonView";
	    }
	    
	    /**
	     * faqList 엑셀 다운로드
	     * @throws IOException 
	     * **/
	    @RequestMapping("site/faqListExcelDown.do")
	    public void faqListExcelDown(HttpServletResponse response,@ModelAttribute("searchVO")SiteVO searchVO) throws IOException{
	    	//faq게시판 목록 조회(한페이지씩 조회)
//	    	List<Map<String, String>> faqList = siteService.selectFaqList(searchVO);
	    	
	    	//전체 테이블 조회
	    	List<Map<String, String>> faqList = siteService.selectFaqListTotal();
	    	
	    	//워크북 생성
	    	Workbook wb = new HSSFWorkbook();
	    	Sheet sheet = wb.createSheet("FAQ");
	    	Row row = null;
	    	Cell cell = null;
	    	int rowNo = 0;
	    	
	    	//테이블 헤더용 스타일
	    	CellStyle headStyle = wb.createCellStyle();
	    	
	    	
	    	//데이터 생성
	    	for(int i=1;i<faqList.size()+1;i++) {
	    		row = sheet.createRow(i);
	    		row.createCell(0).setCellValue(faqList.get(i-1).get("faq_idx"));
	    		row.createCell(1).setCellValue(faqList.get(i-1).get("faq_title"));
	    		row.createCell(2).setCellValue(faqList.get(i-1).get("faq_open_yn"));
	    		row.createCell(3).setCellValue(faqList.get(i-1).get("reg_dt"));
	    	}
	    	
	    	// 컨텐츠 타입과 파일명 지정
	    	response.setContentType("ms-vnd/excel");
	    	response.setHeader("Content-Disposition", "attachment;filename=test.xls");
	    	
	    	//엑셀 출력
	    	wb.write(response.getOutputStream());
//	    	wb.close();
	    	
	    }
	    /**
	     * faqList 엑셀 업로드
	     * @throws IOException 
	     * **/
	    

	    @Autowired
	    private SiteMapper siteMapper;
	    
	    @RequestMapping("site/ExcelUp.do")
	    public void ExcelUp(SiteVO searchVO,MultipartHttpServletRequest request, Model model) throws IOException {
	    	System.out.println("컨트롤러 진입");
	    	
	    	
	    	Map<String, Object> resultMap = new HashMap<String, Object>();
	        List<SiteVO> resultList = new ArrayList<SiteVO>();
	        
	        MultipartFile excelFile =request.getFile("excelFile"); //첨부 된 파일
	        File destdir = new File(noticeFilePath); //디렉토리 가져오기
//	        if(!destdir.exists()){
//	            destdir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
//	        }
	        
	        File destFile = new File(destdir+"\\"+excelFile.getOriginalFilename()); //첨부파일 원래의 이름으로 저장         
	        
	        try{
	            excelFile.transferTo(destFile); //파일 데이터를 지정한 file(destFile)로 저장 
	        }catch(IllegalStateException | IOException e){
	            throw new RuntimeException(e.getMessage(),e);
	        }
	        
	        siteService.excelUpload(destFile);
	        System.out.println("파일은? "+destFile);
	        SiteVO vo = new SiteVO();
			
	        vo.setFileCourse(destFile.getAbsolutePath());

//	        destFile.delete();
	        
	    	//파일을 읽기위해 엑셀파일을 가져온다
	    	FileInputStream fis=new FileInputStream(destFile);
	    	HSSFWorkbook workbook=new HSSFWorkbook(fis);
	    	int rowindex=0;
	    	int columnindex=0;
	    	//시트 수 (첫번째에만 존재하므로 0을 준다)
	    	//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
	    	HSSFSheet sheet=workbook.getSheetAt(0);
	    	//행의 수 (생성된 시트를 이용하여 그 행의 수만큼 돌려서 행을 하나씩 생성)
	    	int rows=sheet.getPhysicalNumberOfRows(); // 한 sheet당  몇개의 row가 있는지 체크
	    	
	    	for(rowindex=0;rowindex<rows;rowindex++){// row=0은 헤더이므로 1부터 시작
	    		System.out.println("첫번째 포문 진입");
	    	    //행을 읽는다
	    	    HSSFRow row=sheet.getRow(rowindex);
	    	    if(row !=null){
	    	    	
	    	        //셀의 수 (생성된 행을 이용하여 그 셀의 수만큼 돌려서 셀을 하나씩 생성)
	    	        int cells=row.getPhysicalNumberOfCells(); // 한 row당  몇개의 cell이 있는지 체크
	    	       
//                    vo.setFaqIdx(vo.getFaqIdx());             
//                    vo.setFaqTitle(vo.getFaqTitle());
//                    vo.setFaqCont(vo.getFaqCont());
//                    vo.setFaqOpenYn(vo.getFaqOpenYn());
//                    vo.setRegDt(vo.getRegDt()); 

	    	        for(columnindex=0;columnindex<cells;columnindex++){
			    		System.out.println("두번째 포문 진입");
	    	            //셀값을 읽는다
	    	            HSSFCell cell=row.getCell(columnindex);
	    	            String value="";

	    	            //셀이 빈값일경우를 위한 널체크
	    	            if(cell==null){
	    	                continue;
	    	            }else{
	    	                //셀타입별로 내용 읽기
	    	                switch (cell.getCellType()){
	    	                case HSSFCell.CELL_TYPE_FORMULA:
	    	                    value=cell.getCellFormula();					// 수식자체를 가져올때
	    	                    break;
	    	                case HSSFCell.CELL_TYPE_NUMERIC:
	    	                    value=cell.getNumericCellValue()+"";   //숫자 타입일때
	    	                    break;
	    	                case HSSFCell.CELL_TYPE_STRING:
	    	                    value=cell.getStringCellValue()+"";
	    	                    break;
	    	                case HSSFCell.CELL_TYPE_BLANK:
	    	                    value=cell.getBooleanCellValue()+"";
	    	                    break;
	    	                case HSSFCell.CELL_TYPE_ERROR:
	    	                    value=cell.getErrorCellValue()+"";
	    	                    break;
	    	                }
	    	            }
	    	            
	    	            System.out.println("각 셀 내용 :"+value);
	    	            
	    	            //담아놨던 value데이터를 셀 순서대로 vo에 set.
	    	            switch(columnindex) {
	    	            case 0 : vo.setFaqIdx(value);
	    	            break;
	    	            case 1 : vo.setFaqTitle(value);
	    	            break;
	    	            case 2 : vo.setFaqCont(value);
	    	            break;
	    	            case 3 : vo.setFaqOpenYn(value);
	    	            break;
	    	            case 4 : vo.setRegDt(value);
	    	            break;
	    	            }
	    	            }
	    	    }
	    	    
	    	    siteMapper.excelUpload(vo);
	    	}
	    }
	    @RequestMapping("site/calendar.do")
	    public ModelAndView Calendar(ModelAndView mv, Model model, HttpServletRequest request) throws IOException {
	    	Calendar cal = Calendar.getInstance();
	    	Calendar bfrCal = Calendar.getInstance();
	    	Calendar nextCal = Calendar.getInstance();
			
	    	int currentYear = cal.get(Calendar.YEAR);
	    	int currentMonth = cal.get(Calendar.MONTH);
	    	int currentDate=cal.get(Calendar.DATE);
	    	
	    	String Year=request.getParameter("year"); 		//나타내고자 하는 날짜, Year변수에 값을 전송 받음
	    	String Month=request.getParameter("month");
	    	String Date=request.getParameter("date");
	    	
	    	int year, month, date;
	    	if(Year == null && Month == null) { //처음 호출할때
	    		year = currentYear;		//현재연도
	    		month = currentMonth;	//현재월로 설정
	    	}else {//나타내고자 하는 날짜를 정수로 변환
	    		year=Integer.parseInt(Year);
	    		month=Integer.parseInt(Month);
	    		if(month<0) {month=11; year=year-1;} //1~12월까지만 범위지정
	    		if(month>11) {month=0; year=year+1;}
	    	}
	    	
	    	cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
	        bfrCal.set(year, month, 1); 
	    	bfrCal.add(month, - 1);
	    	nextCal.set(year, month, 1); 
	        nextCal.add(month, +1);
	       int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	       int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	       int bfrEnd=bfrCal.getActualMaximum(Calendar.DAY_OF_MONTH); //전 달의 끝나는 날
	       int nextStart=nextCal.get(Calendar.DAY_OF_WEEK); //다음 달의 시작하는 요일 
	      
	       Calendar todayCal = Calendar.getInstance();
	       SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
	       SimpleDateFormat msdf = new SimpleDateFormat("M");
	       
	       int today = -1;
	       if(currentYear == year && currentMonth==month) {
	    	   SimpleDateFormat dsdf = new SimpleDateFormat("dd");
	    	   today = Integer.parseInt(dsdf.format(todayCal.getTime()));
	       }
	       
	       int i=0;
	       System.out.println("startDay"+startDay);
	       System.out.println("end"+end);
	       System.out.println("bfrEnd"+bfrEnd);
	       System.out.println("nextStart"+nextStart);
	       
	       request.setAttribute("year", year);
	       request.setAttribute("month", month);
	       request.setAttribute("today", today);
	       request.setAttribute("currentYear", currentYear);
	       request.setAttribute("currentMonth", currentMonth);
	       request.setAttribute("currentDate", currentDate);
	       request.setAttribute("startDay", startDay);
	       request.setAttribute("end", end);
	       request.setAttribute("bfrEnd", bfrEnd);
	       request.setAttribute("nextStart", nextStart);
	       request.setAttribute("i", i);
	       
	       
	       
	       
//	       for(int i=0; i<(startDay-1); i++) { //전달 날짜 출력
//	        out.println("<td style=color:gray>"+ String.valueOf(bfrEnd-(startDay-i-2)) +"</td>");
//	        System.out.println("bfrEnd-(startDay-i-2)"+String.valueOf(bfrEnd-(startDay-i-2)));
//	        	br++;
//	       }
//	      
//	       for(int i=1; i<=end; i++) { //현재 날짜 출력
//	        if((br%7)==0){  //달력에 있는 날과 내 컴퓨터의 로컬 날이 같으면, 배경색을 노랑색으로
//	        	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){
//	        		out.println("<td style='background-color:#FAF58C; color:red; font-weight:bold'>"+i+"</td>");
//	            	}else{
//	       			 	out.println("<td style='color:red; font-weight:bold'>" + i + "</td>");
//	            	}
//	        }else {
//	        	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){
//	        		out.println("<td style='background-color:#FAF58C; font-weight:bold'>"+i+"</td>");
//	        		}else{
//	        			out.println("<td style=font-weight:bold>" + i + "</td>");
//	        	}
//	        }
//	        br++;
//	        if((br%7)==0 && i!=end) {
//	         out.println("</tr><tr height=100>");
//	        }///7h
//	       }
//	       
//	       int nextDate = 1;
//	       while((br++)%7!=0){ //다음달 날짜 출력
//	    	    out.println("<td style=color:gray>"+ String.valueOf(nextDate++) +"</td>");
//	       }
	       
	       mv.setViewName("/view/calendar");
			return mv;
	    }
	    
	    @RequestMapping("site/calendar3.do")
	    public ModelAndView Calendar3(ModelAndView mv) throws IOException {
	    	
	    	mv.setViewName("/view/calendar4");
			
			return mv;
	    }
	    @ResponseBody
	    @RequestMapping("site/calendar4.do")
	    public ModelAndView Calendar4(ModelAndView mv, HttpServletRequest request, 
	    		@RequestParam(required=false) Map<String,Object> paramList) throws IOException {
	    	System.out.println("paramList"+paramList.get("useFrDt"));
	    	List<Map<String, String>> calendar_select = siteService.calendar_select(paramList);
			System.out.println("calendar_select="+calendar_select);
			mv.addObject("schedule", calendar_select);
	    	mv.setViewName("jsonView");
			
			return mv;
	    }
}

	    
	    
