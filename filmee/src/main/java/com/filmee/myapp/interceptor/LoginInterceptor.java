package com.filmee.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class LoginInterceptor
	implements HandlerInterceptor{
	
	public static final String rememberMeKey = "__REMEMBER_ME__"; 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");

		//Session Scope에서 기존 로그인 정보 획득
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);	
		
		//기존 로그인 정보가 있다면 삭제
		if(user != null) {			
			session.removeAttribute(MainController.loginKey);
			
			log.info(">>>>> LoginKey removed. >>>>>");
		}//if
	
		return true;
	}//preHandle
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("postHandle(request, response, handler, {}) invoked.", modelAndView);
		
		//MainController의 loginPost에서 Model에 추가해둔 로그인 정보 획득
		UserVO user = (UserVO)modelAndView.getModelMap().get(MainController.loginKey);
		
		HttpSession session = request.getSession();

		if(user == null) {		//Model에 로그인 정보가 없다면
			response.sendRedirect("/main/loginNoInfo");
			
		} else if( !user.getAuthCode().equals("authorized") ) {	//이메일 인증을 하지 않은 유저가 로그인을 시도했다면
			response.sendRedirect("/main/loginUnauthorized");
			
		} else {		//	이메일 인증까지 마친 유저가 로그인을 시도했다면
			session.setAttribute(MainController.loginKey, user);	//로그인 정보가 있다면 Session Scope에 추가
			log.info(">>>>> LoginKey on SessionScope. >>>>>");
			
			//자동로그인 체크했으면 RememberMe 쿠키 생성 후 응답문서에 추가
			if(request.getParameter("rememberMe") != null){		
				Cookie rememberMeCookie = 
					new Cookie(LoginInterceptor.rememberMeKey, session.getId());
				
				rememberMeCookie.setMaxAge(60*60*24*7);		//쿠키 유효기간 7일
				rememberMeCookie.setPath("/");				//쿠키 경로 : 모든 경로
				
				response.addCookie(rememberMeCookie);		//응답문서에 쿠키 추가
				log.info(">>>>> RememberMeCookie added in Response. >>>>>");
			}//if (rememberMe on)
			
			//Session Scope에서 기존 URI 획득 (로그인이 필요한 URI로 요청이 들어와 AuthInterceptor를 거친 경우)
			String originalRequestURI = (String)session.getAttribute(AuthInterceptor.requestURIKey);
			
			if(originalRequestURI != null) {  //기존 URI가 있었다면 쿼리스트링까지 획득
				String originalQueryString = (String)session.getAttribute(AuthInterceptor.queryStringKey);
				
				response.sendRedirect(
							originalRequestURI +
							(originalQueryString != null && !"".equals(originalQueryString) ?
									"?"+originalQueryString : "")
							);										//쿼리 스트링이 null이나 공백이 아니라면 URI+QueryString으로 Redirect
					log.info(">>>>> Redirected to OriginalURI.");
					
			}else {	//기존 URI가 없었다면 main으로 Redirect	(로그인 버튼으로 직접 요청이 들어온 경우)
				response.sendRedirect("/main");
				
			}//if-else
	
		}//if- elseIf -else
		
		//Session Scope에 등록된 기존 URI 및 QueryString 삭제
		session.removeAttribute(AuthInterceptor.requestURIKey);
		session.removeAttribute(AuthInterceptor.queryStringKey);
		
//		if (user != null) {
//			
//			if( !user.getAuthCode().equals("authorized") ) { 	//이메일 인증을 안했다면 로그인 실패
//				response.sendRedirect("/main/login/unauthorized");
//			}
//			
//			HttpSession session = request.getSession();
//			session.setAttribute(MainController.loginKey, user);	//model에 로그인 정보가 있다면 Session Scope에 추가
//			log.info(">>>>> LoginKey on SessionScope. >>>>>");
//			
//			if(request.getParameter("rememberMe") != null){		//RememberMe on이었으면 쿠키를 응답문서에 추가
//				Cookie rememberMeCookie = 
//						new Cookie(LoginInterceptor.rememberMeKey, session.getId());
//				
//				rememberMeCookie.setMaxAge(60*60*24*7);
//				rememberMeCookie.setPath("/");
//				
//				response.addCookie(rememberMeCookie);
//				log.info(">>>>> RememberMeCookie added in Response. >>>>>");
//			}//if (rememberMe on)
//			
//			
//			if(session.getAttribute(AuthInterceptor.requestURIKey) != null){	
//				String originalRequestURI = (String)session.getAttribute(AuthInterceptor.requestURIKey);
//				String originalQueryString = (String)session.getAttribute(AuthInterceptor.queryStringKey);
//				
//				if(originalRequestURI != null) {	//기존 URI가 있다면 Redirect
//					
//					response.sendRedirect(
//							originalRequestURI +
//							(originalQueryString != null && !"".equals(originalQueryString) ?
//									"?"+originalQueryString : "")
//							);
//					log.info(">>>>> Redirected to OriginalURI.");
//				}//if
//				
//				session.removeAttribute(AuthInterceptor.requestURIKey);
//				session.removeAttribute(AuthInterceptor.queryStringKey);
//				
//			} else {	//기존 URI가 없다면 일단 메인으로 Redirect
//				response.sendRedirect("/main");	//일단 로그인 성공하면 메인으로. 근데 기존에 있던 곳으로 돌아가야하지 않을까?
//												//authInterceptor에서 넘어왔다면 url바꿔서 보낼 수 있는데 만약 어딘가에서 로그인을 눌러 들어온거라면
//												//loginInterceptor preHandle에서 새롭게 url을 받을 시 auth에서 넘어온 것과 부딪힐듯				
//			}//if(originalURL != null) - else
//			
//		}else {
//			response.sendRedirect("/main/login/noInfo");
//		}// if(user!=null) - else
		
	}//postHandle


}//end class
