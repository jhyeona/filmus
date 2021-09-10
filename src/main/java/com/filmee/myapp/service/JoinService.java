package com.filmee.myapp.service;

import com.filmee.myapp.domain.UserDTO;

public interface JoinService {

	public abstract int join(UserDTO dto) throws Exception;
	
	public abstract int checkEmailDuplicated(String email) throws Exception;
	
	public abstract int checkNicknameDuplicated(String nickname) throws Exception;
	
	public abstract boolean isEmailAuthorized(String email, String authCode) throws Exception;
}//end interface
