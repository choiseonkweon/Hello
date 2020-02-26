package jcep.admin.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcep.admin.dao.EnterpriseBuyerExpertMapper;
import jcep.admin.dao.FacilityResourceMapper;
import jcep.admin.model.EnterpriseBuyerExpertVO;
import jcep.admin.model.FacilityResourceVO;
import jcep.admin.model.MemberVO;

/**
 * @Class Name : EnterpriseBuyerExpertService.java
 * @Description : EnterpriseBuyerExpertService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.21           최초생성
 *
 * @since 2019.06.21
 * @version 1.0
 */

@Service("enterpriseBuyerExpertService")
public class EnterpriseBuyerExpertService {

	@Autowired
    private EnterpriseBuyerExpertMapper enterpriseBuyerExpertMapper;
	
	/**
	 * 바이어정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerInsert(EnterpriseBuyerExpertVO params) throws Exception{
		
		enterpriseBuyerExpertMapper.buyerInsert(params);
		
		HttpServletRequest request = new HttpServletRequest() {
			
			@Override
			public AsyncContext startAsync(ServletRequest arg0, ServletResponse arg1) throws IllegalStateException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public AsyncContext startAsync() throws IllegalStateException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void setAttribute(String arg0, Object arg1) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeAttribute(String arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isSecure() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isAsyncSupported() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isAsyncStarted() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public ServletContext getServletContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getServerPort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getServerName() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getScheme() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public RequestDispatcher getRequestDispatcher(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getRemotePort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getRemoteHost() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRemoteAddr() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRealPath(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public BufferedReader getReader() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getProtocol() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String[] getParameterValues(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getParameterNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Map<String, String[]> getParameterMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getParameter(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<Locale> getLocales() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Locale getLocale() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getLocalPort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getLocalName() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getLocalAddr() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public ServletInputStream getInputStream() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public DispatcherType getDispatcherType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getContentType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getContentLengthLong() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public int getContentLength() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getCharacterEncoding() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getAttributeNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public AsyncContext getAsyncContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public <T extends HttpUpgradeHandler> T upgrade(Class<T> arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public void logout() throws ServletException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void login(String arg0, String arg1) throws ServletException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isUserInRole(String arg0) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdValid() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromUrl() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromURL() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromCookie() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public Principal getUserPrincipal() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSession getSession(boolean arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSession getSession() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getServletPath() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRequestedSessionId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public StringBuffer getRequestURL() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRequestURI() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRemoteUser() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getQueryString() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getPathTranslated() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getPathInfo() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Collection<Part> getParts() throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Part getPart(String arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getMethod() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getIntHeader(String arg0) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Enumeration<String> getHeaders(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getHeaderNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getHeader(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getDateHeader(String arg0) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Cookie[] getCookies() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getContextPath() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getAuthType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String changeSessionId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean authenticate(HttpServletResponse arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return false;
			}
		};
		
		
		EnterpriseBuyerExpertVO dataVO = new EnterpriseBuyerExpertVO();

		String memberId = request.getParameter("memberId");
		dataVO.setMemberId(memberId);
		System.out.println("memberId :: " + memberId);
		
		if(params.getBuyerHistNm() !=null) {
			for (int i = 0; i < params.getBuyerHistNm().length; i++) {
				if(params.getBuyerHistNm().length > i){
					dataVO.setBuyerHistNmData(params.getBuyerHistNm()[i].toString());
				}
				if(params.getBuyerHistInvt().length > i){
					dataVO.setBuyerHistInvtData(params.getBuyerHistInvt()[i].toString());
				}
				if(params.getBuyerHistSpec().length > i){
					dataVO.setBuyerHistSpecData(params.getBuyerHistSpec()[i].toString());
				}
				if(params.getBuyerHistDt().length > i){
					dataVO.setBuyerHistDtData(params.getBuyerHistDt()[i].toString());
				}
				if(params.getBuyerHistContent().length > i){
					dataVO.setBuyerHistContentData(params.getBuyerHistContent()[i].toString());
				}
				if(params.getBuyerHistPro().length > i){
					dataVO.setBuyerHistProData(params.getBuyerHistPro()[i].toString());
				}
				enterpriseBuyerExpertMapper.buyerInsertHist(dataVO);
				
			}
		}
	}

	
	/**
	 * 기업정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void enterpriseInformationManagementUpdate(MemberVO params, HttpServletRequest request) throws Exception{
		

		enterpriseBuyerExpertMapper.enterpriseInformationManagementUpdate(params);
		
		EnterpriseBuyerExpertVO dataVO = new EnterpriseBuyerExpertVO();

		String memberId = request.getParameter("memberId");
		dataVO.setMemberId(memberId);
		System.out.println("memberId :: " + memberId);
		
		// 20191204 신승원
    	// 추후 업데이트 되는 부분에서 최선권 주임 업로드 관련 작업 다 되면 추가 관련 확인 후 작업 해야 함
		/*if(params.getBuyerHistNm() !=null) {
			for (int i = 0; i < params.getBuyerHistNm().length; i++) {
				if(params.getBuyerHistNm().length > i){
					dataVO.setBuyerHistNmData(params.getBuyerHistNm()[i].toString());
				}
				if(params.getBuyerHistInvt().length > i){
					dataVO.setBuyerHistInvtData(params.getBuyerHistInvt()[i].toString());
				}
				if(params.getBuyerHistSpec().length > i){
					dataVO.setBuyerHistSpecData(params.getBuyerHistSpec()[i].toString());
				}
				if(params.getBuyerHistDt().length > i){
					dataVO.setBuyerHistDtData(params.getBuyerHistDt()[i].toString());
				}
				if(params.getBuyerHistContent().length > i){
					dataVO.setBuyerHistContentData(params.getBuyerHistContent()[i].toString());
				}
				if(params.getBuyerHistPro().length > i){
					dataVO.setBuyerHistProData(params.getBuyerHistPro()[i].toString());
				}
				enterpriseBuyerExpertMapper.buyerInsertHist(dataVO);
			}
		}*/
	}
	
	
	
	/**
	 * 바이어정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerUpdate(EnterpriseBuyerExpertVO params) throws Exception{
		
		HttpServletRequest request = new HttpServletRequest() {
			
			@Override
			public AsyncContext startAsync(ServletRequest arg0, ServletResponse arg1) throws IllegalStateException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public AsyncContext startAsync() throws IllegalStateException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void setAttribute(String arg0, Object arg1) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeAttribute(String arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isSecure() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isAsyncSupported() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isAsyncStarted() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public ServletContext getServletContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getServerPort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getServerName() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getScheme() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public RequestDispatcher getRequestDispatcher(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getRemotePort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getRemoteHost() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRemoteAddr() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRealPath(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public BufferedReader getReader() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getProtocol() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String[] getParameterValues(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getParameterNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Map<String, String[]> getParameterMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getParameter(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<Locale> getLocales() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Locale getLocale() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getLocalPort() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getLocalName() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getLocalAddr() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public ServletInputStream getInputStream() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public DispatcherType getDispatcherType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getContentType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getContentLengthLong() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public int getContentLength() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getCharacterEncoding() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getAttributeNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public AsyncContext getAsyncContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public <T extends HttpUpgradeHandler> T upgrade(Class<T> arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public void logout() throws ServletException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void login(String arg0, String arg1) throws ServletException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isUserInRole(String arg0) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdValid() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromUrl() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromURL() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean isRequestedSessionIdFromCookie() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public Principal getUserPrincipal() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSession getSession(boolean arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSession getSession() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getServletPath() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRequestedSessionId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public StringBuffer getRequestURL() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRequestURI() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getRemoteUser() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getQueryString() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getPathTranslated() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getPathInfo() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Collection<Part> getParts() throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Part getPart(String arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getMethod() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getIntHeader(String arg0) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Enumeration<String> getHeaders(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Enumeration<String> getHeaderNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getHeader(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getDateHeader(String arg0) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Cookie[] getCookies() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getContextPath() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getAuthType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String changeSessionId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean authenticate(HttpServletResponse arg0) throws IOException, ServletException {
				// TODO Auto-generated method stub
				return false;
			}
		};
		
		
		enterpriseBuyerExpertMapper.buyerUpdate(params);
		
		EnterpriseBuyerExpertVO dataVO = new EnterpriseBuyerExpertVO();

		String memberId = request.getParameter("memberId");
		dataVO.setMemberId(memberId);
		System.out.println("memberId :: " + memberId);
		
		// 20191204 신승원
    	// 추후 업데이트 되는 부분에서 최선권 주임 업로드 관련 작업 다 되면 추가 관련 확인 후 작업 해야 함
		/*if(params.getBuyerHistNm() !=null) {
			for (int i = 0; i < params.getBuyerHistNm().length; i++) {
				if(params.getBuyerHistNm().length > i){
					dataVO.setBuyerHistNmData(params.getBuyerHistNm()[i].toString());
				}
				if(params.getBuyerHistInvt().length > i){
					dataVO.setBuyerHistInvtData(params.getBuyerHistInvt()[i].toString());
				}
				if(params.getBuyerHistSpec().length > i){
					dataVO.setBuyerHistSpecData(params.getBuyerHistSpec()[i].toString());
				}
				if(params.getBuyerHistDt().length > i){
					dataVO.setBuyerHistDtData(params.getBuyerHistDt()[i].toString());
				}
				if(params.getBuyerHistContent().length > i){
					dataVO.setBuyerHistContentData(params.getBuyerHistContent()[i].toString());
				}
				if(params.getBuyerHistPro().length > i){
					dataVO.setBuyerHistProData(params.getBuyerHistPro()[i].toString());
				}
				enterpriseBuyerExpertMapper.buyerInsertHist(dataVO);
			}
		}*/
	}
	
	/**
	 * 바이어 멤버 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void buyerMemberInsert(EnterpriseBuyerExpertVO params) throws Exception{
		
		enterpriseBuyerExpertMapper.buyerMemberInsert(params);
		
	}


/*	*//**
	 * 시설 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록
	 * @exception Exception
	 *//*
	public ArrayList<EnterpriseBuyerExpertVO> selectFacilityList(FacilityResourceVO params) throws Exception {
   	return facilityResourceMapper.selectFacilityList(params);
   }
   
	*//**
	 * 시설 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 시설 목록 총 갯수
	 * @exception
	 *//*
	public int selectFacilityListTotCnt(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectFacilityListTotCnt(params);
	}
	
	
	*//**
	 * 시설 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer facilityImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.facilityImageUpload(params);
    }
	
	*//**
	 * 자원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록
	 * @exception Exception
	 *//*
	public ArrayList<FacilityResourceVO> selectResourceList(FacilityResourceVO params) throws Exception {
   	return facilityResourceMapper.selectResourceList(params);
   }
   
	*//**
	 * 자원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 자원 목록 총 갯수
	 * @exception
	 *//*
	public int selectResourceListTotCnt(FacilityResourceVO params) throws Exception {
		return facilityResourceMapper.selectResourceListTotCnt(params);
	}
	
	*//**
	 * 자원정보를 등록한다.
	 * @param params - 등록할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceInsert(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.resourceInsert(params);
	}
	
	*//**
	 * 자원 이미지 업로드
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 *//*
	public Integer resourceImageUpload(FacilityResourceVO params) throws Exception {
    	return facilityResourceMapper.resourceImageUpload(params);
    }
	
	*//**
	 * 자원정보를 삭제한다.
	 * @param params - 삭제할 정보가 담긴 FacilityResourceVO
	 * @return Integer형
	 * @exception Exception
	 *//*
	public Integer resourceDelete(FacilityResourceVO params) throws Exception{
		 return facilityResourceMapper.resourceDelete(params);
	}
	*/

	/**
	 * 기업 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public HashMap<String,String> enterpriseInformationManagementDetail(String params) throws Exception {
    	return enterpriseBuyerExpertMapper.enterpriseInformationManagementDetail(params);
    }
	public List<HashMap<String,String>> enterpriseInformationManagementResultList(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementResultList(params);
	}
	public List<HashMap<String,String>> enterpriseInformationManagementAnncemntApplList(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementAnncemntApplList(params);
	}
	public List<HashMap<String,String>> enterpriseInformationManagementProptyList(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementProptyList(params);
	}
	public List<HashMap<String,String>> enterpriseInformationManagementEmployeeList(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementEmployeeList(params);
	}
	public int enterpriseInformationManagementResultListCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementResultListCnt(params);
	}
	public int enterpriseInformationManagementAnncemntApplListcCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementAnncemntApplListCnt(params);
	}
	public int enterpriseInformationManagementProptyListCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementProptyListCnt(params);
	}
	public int enterpriseInformationManagementEmployeeListCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.enterpriseInformationManagementEmployeeListCnt(params);
	}

	/**
	 * 기업 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectEnterpriseInformationManagementRegisterUpdateHist(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectEnterpriseInformationManagementRegisterUpdateHist(params);
    }

	/**
	 * 기업 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 EnterpriseBuyerExpertVO
	 * @return Integer형
	 * @exception Exception
	 */
	public void enterpriseInformationManagementInsert(MemberVO params) throws Exception{
		
		enterpriseBuyerExpertMapper.enterpriseInformationManagementInsert(params);
		
	}

	/**
	 * 바이어 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectBuyerInformationManagementRegisterUpdate(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBuyerInformationManagementRegisterUpdate(params);
    }

	/**
	 * 바이어 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectBuyerInformationManagementRegisterUpdateHist(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBuyerInformationManagementRegisterUpdateHist(params);
    }
	
	
	
	

	/**
	 * 기업 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectEnterPriseInformationList(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectEnterPriseInformationList(params);
    }

	/**
	 * 기업 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectEnterPriseInformationListTotCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.selectEnterPriseInformationListTotCnt(params);
	}
	

	/**
	 * 바이어 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBuyerInformationManagementList(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBuyerInformationManagementList(params);
    }

	/**
	 * 바이어 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectBuyerInformationManagementListTotCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.selectBuyerInformationManagementListTotCnt(params);
	}	
	

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<Map<String,Object>> selectBusinessManagementList(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBusinessManagementList(params);
    }
	
	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectBusinessManagementListTotCnt(MemberVO params) throws Exception {
		return enterpriseBuyerExpertMapper.selectBusinessManagementListTotCnt(params);
	}

	/**
	 * 관리자 사업관리 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectBusinessManagementRegisterUpeate(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBusinessManagementRegisterUpeate(params);
    }

	/**
	 * 관리자 사업관리 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public List<MemberVO> selectBusinessManagementRegisterUpeateFile(MemberVO params) throws Exception {
    	return enterpriseBuyerExpertMapper.selectBusinessManagementRegisterUpeateFile(params);
    }
	
	


	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpeateSave(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpeateSave(params);
	}
	

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateButton(params);
	}

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateInsert(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateInsert(params);
	}
	
	

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton1(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateButton1(params);
	}

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateDelete(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateDelete(params);
	}
	
	

	/**
	 * 관리자 사업관리 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterUpdateButton2(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateButton2(params);
	}
	
	
	
	/**
	 * 관리자 사업관리 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterInsert(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterInsert(params);
	}
	


	/**
	 * 관리자 사업관리 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public Integer businessManagementRegisterInsertApplicStCd(MemberVO params) throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterInsertApplicStCd(params);
	}
	
	public int businessManagementRegisterInsertFile(HashMap<String,String> hMap)throws Exception{
		 return enterpriseBuyerExpertMapper.businessManagementRegisterInsertFile(hMap);
	}
	
	public Map<String,Object> selectBusinessManagementDetail(String parmas)throws Exception{
		return enterpriseBuyerExpertMapper.selectBusinessManagementDetail(parmas);
	}
	public List<Map<String,Object>> selectBusinessManagementDetailFiles(String parmas)throws Exception{
		return enterpriseBuyerExpertMapper.selectBusinessManagementDetailFiles(parmas);
	}
	
	public List<Map<String,String>> selectBussAnncemntApplList(String parmas)throws Exception{
		return enterpriseBuyerExpertMapper.selectBussAnncemntApplList(parmas);
	}
	
	public int bussAnncemntApplUpdate(Map<String,String> params)throws Exception{
		return enterpriseBuyerExpertMapper.bussAnncemntApplUpdate(params);
	}
	
	public int bussAnncemntApplDelete(Map<String,String> params)throws Exception{
		return enterpriseBuyerExpertMapper.bussAnncemntApplDelete(params);
	}
	
	public MemberVO businessManagementDetailFileDownload(Map<String,String> params)throws Exception{
		return enterpriseBuyerExpertMapper.businessManagementDetailFileDownload(params);
	}
	
	public MemberVO businessManagementfileDownload(Map<String,String> params)throws Exception{
		return enterpriseBuyerExpertMapper.businessManagementfileDownload(params);
	}
	
	public int businessManagementRegisterFileDelete(String params)throws Exception{
		return enterpriseBuyerExpertMapper.businessManagementRegisterFileDelete(params);
	}

	public int businessManagementRegisterUpdateOk(Map<String,String> hMap)throws Exception{
		return enterpriseBuyerExpertMapper.businessManagementRegisterUpdateOk(hMap);
	}

	public String businessManagementFileLength(Map<String,String> hMap)throws Exception{
		return enterpriseBuyerExpertMapper.businessManagementFileLength(hMap);
	}
	
	public int NomberValidateCheck(Map<String,String> hMap)throws Exception{
		return enterpriseBuyerExpertMapper.NomberValidateCheck(hMap);
	}
	
	
	
	/*평가위원 추출*/
	public List<Map<String,String>> selectEvaluList(MemberVO params)throws Exception{
		return enterpriseBuyerExpertMapper.selectEvaluList(params);
	}
	public int selectEvaluListTotCnt(MemberVO params)throws Exception{
		return enterpriseBuyerExpertMapper.selectEvaluListTotCnt(params);
	}
}












