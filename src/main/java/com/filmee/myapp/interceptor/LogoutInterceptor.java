package com.filmee.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.filmee.myapp.controller.MainController;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor
public class LogoutInterceptor 
	implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");

		//logout시 기존 주소로 다시 이동할 방법 생각해보기
		
		
		HttpSession session = request.getSession();
		
		//Session scope에서 로그인정보 삭제
		session.removeAttribute(MainController.loginKey);
		log.info(">>>>> LoginKey removed. >>>>>");
		
		// RememberMe 쿠키 삭제
		Cookie rememberMeCookie = 
				WebUtils.getCookie(request, LoginInterceptor.rememberMeKey);
		
		if(rememberMeCookie != null) {
			rememberMeCookie.setMaxAge(0);	
			rememberMeCookie.setPath("/");
			response.addCookie(rememberMeCookie);
			log.info(">>>>> RememberMeCookie removed. >>>>>");
		}//if
		return true;
	}//preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {		
		log.debug("postHandle(request, response, {}, {}) invoked.", handler, modelAndView);
				
		response.sendRedirect("/main");	
	}//postHandle

}//end class
