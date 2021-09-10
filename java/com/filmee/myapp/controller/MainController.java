package com.filmee.myapp.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.JoinService;
import com.filmee.myapp.service.LoginService;
import com.filmee.myapp.service.MailSendService;
import com.filmee.myapp.util.HashUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@RequestMapping("/main/")
@Controller
public class MainController {
	
	@Setter(onMethod_=@Autowired)
	private LoginService loginService;
	
	@Setter(onMethod_=@Autowired)
	private JoinService joinService;
	
	@Setter(onMethod_=@Autowired)
	private HashUtils hashUtils;
	
	@Setter(onMethod_=@Autowired)
	private MailSendService mailService;
	
	public static final String loginKey = "__LOGIN__";
	
	//View-Controller : main, logout, forgotPw
	
	//====== 로그인 관련 ======
	
	//비로그인 상태에서 로그인 상태에서만 접근 가능한 요청을 보낼 시 AuthInterceptor에서 Redirect
	@GetMapping("loginRequired")
	public String loginRequired(RedirectAttributes rttrs) {
		log.debug("login(rttrs) invoked.");
		
		rttrs.addFlashAttribute("message", "login_required");	
		
		return "redirect:/main"; // 메인으로 Redirect 후 loginModal 띄움
	}//login
	
	//login modal에서 sign in 버튼 클릭 시 
	@PostMapping("loginPost")
	public void loginPost(UserDTO dto, Model model, HttpSession session, RedirectAttributes rttrs) throws Exception {
		log.debug("loginPost({}, model, {}) invoked.", dto, session);
			
		UserVO user = this.loginService.login(dto);		//회원 정보 확인
		
		if(user != null) {
			model.addAttribute(MainController.loginKey, user);	//로그인 정보를 Model에 추가
			
			if(dto.isRememberMe()) {	//자동로그인 체크 했으면 DB에 쿠키정보 저장
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );	//유효기간 7일
				
				//DB에 sessionId(RememberMe 쿠키의 값)와 유효기간(RememberMe 쿠키의 유효기간) 저장
				this.loginService.setUserRememberMe(email, rememberCookie, rememberAge);	
			}//if(dto.isRememberMe())
			
		}//if(user != null)

		//LoginInterceptor의 postHandle 메서드에서 이후 로직 처리(로그인 정보 SessionScope에 추가, RememberMe 쿠키 생성 및 전송)
		
	}//loginPost
	
	//LoginInterceptor에서 Model에 추가된 로그인 정보를 못찾았을 시 Redirect
	@GetMapping("loginNoInfo")
	public String loginNoInfo(RedirectAttributes rttrs) {
		log.debug("loginNoInfo({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "no_info");
	
		return "redirect:/main";	//메인으로 Redirect 후 메세지와 함께 loginModal 띄움
	}//loginNoInfo
	
	//LoginInterceptor에서 Model 추가된 로그인 정보가 이메일 인증을 안했을 시 Redirect 
	@GetMapping("loginUnauthorized")
	public String loginUnauthorized(RedirectAttributes rttrs) {
		log.debug("loginUnauthorized({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "email_unauthorized");
		
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움
	}//loginUnauthorized

	//====== 회원가입 관련 ======
	
	//header.jsp의 join modal에서 이메일 중복검사 시
	@ResponseBody
	@GetMapping("checkEmail")
	public Integer checkEmail(String email) throws Exception {
		log.debug("checkEmail({}) invoked.", email);
		
		int result = this.joinService.checkEmailDuplicated(email);
		log.info("result : {}", result);
		
		return result;
	}//checkEmail
	
	//header.jsp의 join modal에서 닉네임 중복검사 시
	@ResponseBody
	@GetMapping("checkNickname")
	public Integer checkNickname(String nickname) throws Exception {
		log.debug("checkNickname({}) invoked.", nickname);
		
		int result = this.joinService.checkNicknameDuplicated(nickname);
		log.info("result : {}", result);
		
		return result;
	}//checkNickname
	
	//join modal에서 sign up 버튼 클릭 시 
	@PostMapping("joinPost")
	public String joinPost(UserDTO dto, RedirectAttributes rttrs) throws Exception{
		log.debug("joinPost({}, rttrs, model) invoked.", dto);
				
		if( this.joinService.join(dto) == 1) {	// 정상 회원가입 처리됐다면
			rttrs.addFlashAttribute("message", "just_joinned");
		} else {								// 정상 회원가입에 실패했다면
			rttrs.addFlashAttribute("message", "join_failed");
		}//if-else
		
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움
	}//joinPost
	
	//인증 이메일에서 인증하기를 눌렀을 시
	@GetMapping("emailAuthorized")
	public String emailAuthorized(String email, String authCode, RedirectAttributes rttrs) throws Exception {
		log.debug("emailAuthroized({}, {}) invoked.", email, authCode);
		
		if(this.joinService.isEmailAuthorized(email, authCode)) {	//DB에 저장된 유저의 인증키와 일치하면
			rttrs.addFlashAttribute("message", "join_complete");
		} else {													//유저의 인증키와 일치하지 않으면
			rttrs.addFlashAttribute("message", "email_unauthroized");
		}//if-else	
		
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움
	}//emailAuthroized
		
}//end class


