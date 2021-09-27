package com.filmus.myapp.domain;

import java.util.Date;

import lombok.Value;

@Value
public class ReviewHeartVO {
	
	private Integer rno;
	private Integer userId;
	private Date insertTs;
	private Date likeCheck;

}//end class
