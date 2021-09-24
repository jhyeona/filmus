package com.filmee.myapp.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.LoginService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {
	//첫 접속시 RemeberMe 쿠키 여부를 확인해 자동로그인하는 인터셉터
	
	@Setter(onMethod_= @Autowired)
	private LoginService service;
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		log.debug("preHandle(request, response, handler) invoked.");

		if(WebUtils.getCookie(request, "JSESSIONID") == null) { //첫 접속의 request에는 JSESSIONID가 없음.
			log.info(">>>>> First Request on this Sesison. >>>>>");
			
			//RememberMe 쿠키 획득
			Cookie rememberMeCookie = 
					WebUtils.getCookie(request, LoginInterceptor.rememberMeKey);
			
			if(rememberMeCookie != null) {	//RememberMe 쿠키가 있으면
				String rememberMe = rememberMeCookie.getValue();
				
				//Session Scope에서 로그인 정보 획득
				HttpSession session = request.getSession();
				UserVO user = this.service.findUserWithCookie(rememberMe);
				
				if(user != null) {	//로그인 정보가 있다면
					//로그인 처리
					session.setAttribute(MainController.loginKey, user);
					log.info(">>>>> LoginKey on SessionScope. >>>>>");
	
					
					String sessionId = session.getId();		//햔재 SessionId 획득
					
					this.service.setUserRememberMe(
							user.getEmail(),
							sessionId,
							new Date(System.currentTimeMillis() + (1000*60*60*24*7))	//유효기간 7일
							);
									
					rememberMeCookie = 
							new Cookie(LoginInterceptor.rememberMeKey, sessionId);//같은 이름의 새로운 쿠키 생성
					
					rememberMeCookie.setMaxAge(60*60*24*7);		//쿠키 유효기간 7일
					rememberMeCookie.setPath("/");				//쿠키 경로 : 모든 경로
					
					response.addCookie(rememberMeCookie);		//응답문서 새로 생성한 쿠키 추가
					log.info(">>>>> RememberMeCookie Renewed. >>>>>");
				}//if(user!=null)
				
			}//if(rememberMeCookie != null) {
			
		}else {
			log.info("not a first request");
		}//if-else
			
		return true;
	}//preHandle
	
}//end class