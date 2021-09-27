package com.filmus.myapp.domain;

import lombok.Data;

@Data
public class UserDTO {

	private String email;
	private String password;
	private String nickname;
	
	private boolean rememberMe;
	
	private String salt;
	private String authCode;
	
	private String userid;
	
}//end class