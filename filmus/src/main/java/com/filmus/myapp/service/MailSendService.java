package com.filmus.myapp.service;

public interface MailSendService {
	
	public final int EMAIL= 6;
	public final int TEMP_PW = 8;
	
	public abstract String getRandomCode(int size);
	
	public abstract void sendAuthMail(String email, String authCode);

	public abstract void sendTempPwMail(String email, String tempPw);
	
	}//end interface
