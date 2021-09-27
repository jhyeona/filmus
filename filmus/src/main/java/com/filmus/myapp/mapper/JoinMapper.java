package com.filmus.myapp.mapper;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.UserDTO;

public interface JoinMapper {

	public abstract int insertUser(UserDTO dto) throws Exception;
	
	public abstract int countUsersWithEmail(String email)throws Exception;
	
	public abstract int countUsersWithNickname(String nickname)throws Exception;
		
	public abstract int updateAuthCodeAuthorized(@Param("email")String email, @Param("authCode")String authCode)throws Exception;
	
	public abstract int updateUserAsDeleted(Integer userId) throws Exception;
	
	
}//end interface