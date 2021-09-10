package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class ActivityVO {

	private Integer userid;
	private Integer follower;
	private String nickname;
	private String nicknameFollower;
	private String content;
	private String type;
	private Integer code;
	private Timestamp insertTs;
	private String title;
	private String nicknameGuestbook;
	
} //end class
