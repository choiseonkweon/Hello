package jcep.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter { 
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
	
		System.out.println("Interceptor : PreHandle");

		// Session userid check 
		HttpSession session = request.getSession();
		System.out.println("memberIdCheck:::::::" + session.getAttribute("memberId"));
			Object memberId = session.getAttribute("memberId");
//		boolean memberIdCheck = (boolean) session.getAttribute("memberIdCheck");
		System.out.println("MemberID::::::::" + memberId);
		// Login false 
		
		if(memberId==null) {
			System.out.println("Interceptor : Session Check Fail"); 
			
			// login 로 이동 
			response.sendRedirect("login.do"); 
			return false;
		}
		// Login true 
		else { 
		System.out.println("Interceptor : Session Check true"); 
		return true;
		
		}
	} 

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }    
}
		

