package com.filmus.myapp.service;

import java.io.UnsupportedEncodingException;
import java.util.Objects;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.filmus.myapp.util.MailUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MailSendServiceImpl 
	implements MailSendService, InitializingBean {

	@Setter(onMethod_=@Autowired)
	private JavaMailSenderImpl mailSender;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mailSender);
	}//afterPropertiesSet
		
	//인증코드 난수 생성
	@Override
	public String getRandomCode(int size) {
		log.debug("getRandomCode({}) invoked.", size);

		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);	// 0~9사이의 난수 생성
			buffer.append(num);
		}//while
		
		String authCode = buffer.toString();
		log.info("authCode : {}", authCode);
		
		return authCode;
	}//getAuthCode

	//인증 메일 발송
	@Override
	public void sendAuthMail(String email, String authCode){
		log.debug("sendAuthMail({}) invoked.", email);
				
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("FilMUS 회원가입 이메일 인증");
			sendMail.setText(
					new StringBuffer()
							.append("<h1>[이메일 인증]</h1>")
							.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				            .append("<a href='http://localhost:8090/main/emailAuthorized?email=")
				            .append(email)
				            .append("&authCode=")
				            .append(authCode)
				            .append("' target='_blenk'>이메일 인증하기</a>")
				            .toString());
            sendMail.setFrom("shawnshhan@gmail.com", "FILMUS");
            sendMail.setTo(email);
            sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}//try-catch
		
	}//sendAuthMail

	//임시 비밀번호 발송
	@Override
	public void sendTempPwMail(String email, String tempPw){
		log.debug("sendTempPwMail({}) invoked.", email);
			
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("FILMUS 임시 비밀번호");
			sendMail.setText(
					new StringBuffer()
							.append("<h1>[임시 비밀번호]</h1>")
							.append("<h3>로그인 후 반드시 비밀번호를 변경하세요.</h3>")
							.append("<h2> 임시 비밀번호 : ")
							.append(tempPw)
							.append("</h2>")
				            .toString());
            sendMail.setFrom("shawnshhan@gmail.com", "FILMUS");
            sendMail.setTo(email);
            sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}//try-catch

	}//sendTempPwMail
		
}//end class